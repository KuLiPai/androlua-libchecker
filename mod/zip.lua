local zip,zipr,zipw,zips={},{},{},{}
local Arrays=luajava.bindClass "java.util.Arrays"
local String=luajava.bindClass "java.lang.String"
local ZipFile=luajava.bindClass "java.util.zip.ZipFile"
local ZipEntry=luajava.bindClass "java.util.zip.ZipEntry"
local FileOutputStream=luajava.bindClass "java.io.FileOutputStream"
local FileInputStream=luajava.bindClass "java.io.FileInputStream"
local ZipOutputStream=luajava.bindClass "java.util.zip.ZipOutputStream"

function zip.open(path,mode)
  local self={}
  setmetatable(self,self)
  self.path=path
  if mode=="w"
    self.__index=zipw
    self.zos=ZipOutputStream(FileOutputStream(path))
   else
    self.__index=zipr
    self.__len=zipr.size
    self.zf=ZipFile(path)
  end
  return self
end

function zipw:new(name)
  self.e=ZipEntry(name)
  self.zos.putNextEntry(self.e)
  return self
end

function zipw:write(name,data)
  if !data
    name,data=data,name
  end
  if !name
    assert(self.e,'zip::请创建文件再写入！')
   else
    self:new(name)
  end

  if type(data)=="string"
    local s=String(data)
    data=s.getBytes()
    luajava.clear(s)
  end
  self.zos.write(data)
  if name
    self:save()
  end
  return self
end

function zipw:save()
  self.e=nil
  self.zos.closeEntry()
  return self
end

function zipw:put(name,path)
  if !path
    name,path=path,name
  end

  if type(path)=="string"
    if io.isdir(path)
      assert(name,'zip::追加模式不支持文件夹！')
      assert(!self.e,'zip::追加模式不支持文件夹！')
      for k,v ipairs(io.ls(path))
        self:put(
        string.format('%s/%s',(name:gsub('/$','')),v),
        string.format('%s/%s',(path:gsub('/$','')),v))
      end
      return self
    end
  end

  if name
    assert(!self.e,'zip::追加模式不可指定输出路径！')
    self:new(name)
  end

  local is
  if type(path)=="string"
    is=FileInputStream(path)
   elseif type(path)=="table"
    path:init()
    is=path.is
   else
    is=path
  end

  local b=byte[4096]

  while true
    local n=is.read(b)
    when n==-1 break
    self.zos.write(b,0,n)
  end
  if type(path)=="string"
    is.close()
  end
  when name self:save()
  luajava.clear(b)
  luajava.clear(is)
  return self
end

function zipw:flush()
  self.zos.flush()
  return self
end

function zipw:close()
  self.zos.close()
  luajava.clear(self.zos)
  return self
end

function zipr:size(p)
  if type(p)=="string"
    local f=self:load(p)
    local i=f:size()
    f:close()
    return i
  end
  return self.zf.size()
end

function zipr:load(path)
  local obj={}
  setmetatable(obj,obj)
  obj.__index=zips
  obj.__len=zips.size
  obj.zf=self.zf
  if type(path)=="string"
    obj.ze=self.zf.getEntry(path)
   else
    obj.ze=path
  end

  if !obj.ze
    return
  end

  obj.path=obj.ze.getName()
  local p=string.format('zipfile: %s',obj.path)
  obj.__tostring=lambda:p

  return obj
end

function zipr:time(p,...)
  local f=self:load(p)
  local v=f:time(...)
  f:close()
  return v
end

function zipr:name(p,...)
  local f=self:load(p)
  local v=f:name(...)
  f:close()
  return v
end

function zipr:read(p,...)
  local f=self:load(p)
  local v=f:read(...)
  f:close()
  return v
end

function zipr:readBytes(p,...)
  local f=self:load(p)
  local v=f:readBytes(...)
  f:close()
  return v
end

function zipr:out(p,...)
  local f=self:load(p)
  local v=f:out(...)
  f:close()
  return v
end

function zipr:list()
  local t={}
  local e=self.zf.entries()
  while e.hasMoreElements()
    t[#t+1]=self:load(e.nextElement())
  end
  return t
end

function zipr:each()
  local e=self.zf.entries()
  return lambda if e.hasMoreElements()
    local v=self:load(e.nextElement())
    return v.path,v
  end
end

function zipr:close()
  self.zf.close()
  luajava.clear(self.zf)
  return self
end

function zips:init()
  if !self.is
    self.is=self.zf.getInputStream(self.ze)
  end
  return self
end

function zips:size()
  if self.is
    return self.is.available()
  end
  return self.ze.getSize()
end

function zips:time()
  return self.ze.getTime()
end

function zips:name()
  return self.path
end

function zips:read(b)
  self:init()
  local _
  if !b
    b=byte[self.is.available()]
   elseif type(b)=='number'
    b=byte[b]
   else
    return self.is.read(b)
  end
  self.is.read(b)
  local _=String(b)
  local s=tostring(_)
  luajava.clear(_)
  luajava.clear(b)
  return s
end

function zips:out(path)
  self:init()

  local fos=FileOutputStream(path)
  local b=byte[4096]
  while true
    local n=self.is.read(b)
    when n==-1 break
    fos.write(b,0,n)
  end
  fos.close()
  luajava.clear(fos)
  luajava.clear(b)
  return self
end

function zips:readBytes(b)
  self:init()
  return self.is.read(b)
end

function zips:skip(n)
  self:init()
  self.is.skip(n)
  return self
end

function zips:reset()
  self:init()
  self.is.close()
  luajava.clear(self.is)
  self.is=self.zf.getInputStream(self.ze)
  return self
end

function zips:flush()
  self:init()
  self.is.flush()
end

function zips:close()
  if self.is
    self.is.close()
    luajava.clear(self.is)
  end
  luajava.clear(self.ze)
end

return zip