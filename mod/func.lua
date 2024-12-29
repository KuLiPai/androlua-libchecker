
function getNavigationHeight()
  resourceId = 0;
  rid = activity.getResources().getIdentifier("config_showNavigationBar", "bool", "android");
  if (rid ~= 0) then
    resourceId = activity.getResources().getIdentifier("navigation_bar_height", "dimen", "android");
    return activity.getResources().getDimensionPixelSize(resourceId);
   else
    return 0;
  end
end

function 颜色渐变(id,color,...)
  time=200
  str="cardBackgroundColor"
  if ...==nil then
   elseif type(...)=="string" then
    str=...
   elseif type(...)=="number" then
    time=...
  end
  ObjectAnimator.ofInt(id,str,color)
  .setInterpolator(DecelerateInterpolator())--动画插值器
  .setDuration(time)--动画时间
  .setRepeatCount(0.5)--动画循环
  .setRepeatMode(Animation.REVERSE)--循环模式
  .setEvaluator(ArgbEvaluator())
  .start()--动画开始
end

function 软件信息(pack)
  import "android.net.Uri"
  import "android.content.Intent"
  import "android.provider.Settings"
  intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
  intent.setData(Uri.parse("package:"..pack));
  activity.startActivityForResult(intent, 100);
end

function GetAppInfo(包名)
  import "android.content.pm.PackageManager"
  local pm = activity.getPackageManager();
  local 图标 = pm.getApplicationInfo(tostring(包名),0)
  local 图标 = 图标.loadIcon(pm);
  local pkg = activity.getPackageManager().getPackageInfo(包名, 0);
  local 应用名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())
  local 版本号 = activity.getPackageManager().getPackageInfo(包名, 0).versionName
  local 版本= activity.getPackageManager().getPackageInfo(包名, 0).versionCode
  local 最后更新时间 = activity.getPackageManager().getPackageInfo(包名, 0).lastUpdateTime
  local cal = Calendar.getInstance();
  cal.setTimeInMillis(最后更新时间);
  local 最后更新时间 = cal.getTime().toLocaleString()
  return 包名,版本号,最后更新时间,图标,应用名称,版本
end

function dp2px(n)
  return n*activity.resources.displayMetrics.scaledDensity+.5
end

function shell(cmd,fun)
  function shellfun(s)
    fun(s)
  end
  thread(function(cmd,shellfun)
    p=io.popen(string.format('%s',cmd))
    s=p:read("*a")
    p:close()
    call("shellfun",s)
  end,cmd,shellfun)
end


function customTabsActionButton(builder)
  local Intent = import "android.content.Intent"
  local PendingIntent = import "android.app.PendingIntent"
  local BitmapFactory = import "android.graphics.BitmapFactory"
  local loadbitmap = require "loadbitmap"
  for i=1,3 do
    local actionIntent = Intent(Intent.ACTION_VIEW)
    local pi = PendingIntent.getActivity(activity.getApplicationContext(), 0, actionIntent, 0)
    local path=activity.getLoader().getImagesDir("add")
    builder.setActionButton(loadbitmap(path), "增加"..i.."个图标项目", pi, true)
  end
end
function customTabsMenuItem(builder)
  local Intent = import "android.content.Intent"
  local PendingIntent = import "android.app.PendingIntent"
  for i=1,3 do
    local menuIntent = Intent(Intent.ACTION_VIEW)
    local pi = PendingIntent.getActivity(activity.getApplicationContext(), 0, menuIntent, 0)
    builder.addMenuItem("增加"..i.."个菜单项目", pi)
  end
end
function customTabsColor(builder,color)
  local CustomTabColorSchemeParams = import "androidx.browser.customtabs.CustomTabColorSchemeParams"
  local Color = import "android.graphics.Color"
  local defaultColors = CustomTabColorSchemeParams.Builder()
  .setToolbarColor(Color.parseColor(color))
  .build()
  builder.setDefaultColorSchemeParams(defaultColors)
end
function openExtUrl(extURL)
  local CustomTabsIntent = import "androidx.browser.customtabs.CustomTabsIntent"
  local Uri = import "android.net.Uri"
  builder=CustomTabsIntent.Builder()
  --显示网站名称
  builder.setShowTitle(true)
  --添加图标按钮
  --customTabsActionButton(builder)
  --添加菜单按钮
  -- customTabsMenuItem(builder)
  --设置颜色
  customTabsColor(builder,"#"..string.format("%#x",surfaceVar):sub(3,-1):gsub("^ffffffffff",""))
  customTabsIntent=builder.build()
  customTabsIntent.launchUrl(activity, Uri.parse(extURL))
end


function 状态栏高度()
  if Build.VERSION.SDK_INT >= 19 then
    resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android")
    return activity.getResources().getDimensionPixelSize(resourceId)
   else
    return 0
  end
end
function 波(id,lx,color)
  xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="圆" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="方" then
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
    end
  end,function(e)end)
end

function loadsvgstr(str,颜色)
  local tp颜色=颜色 or 0xff00000
  local 读取=str
  local svg=读取:gsub("颜色","#"..string.format("%#x",tp颜色):sub(3,-1):gsub("^ffffffffff",""))
  --写文件
  --io.open("/storage/emulated/0/360/a.svg","w"):write(svg):close()
  return PictureDrawable(SVG.getFromString(svg).renderToPicture())
end


function loadsvg(str,颜色,模式a)
  local 模式b=模式a or false
  
  local tp颜色=颜色 or cc.c.primary
  local 读取=io.open(activity.getLuaDir("res/"..str..".svg")):read("*a")
  local svg=读取:gsub("颜色","#"..string.format("%#x",tp颜色):sub(3,-1):gsub("^ffffffffff",""))
  if 模式b then
    for c in string.gmatch(svg,"%d+px") do
     nb=svg:gsub(c,tostring(dp2px(tonumber(c:match("%d+")))))
    end
    svg=nb
  end
  --写文件
  --io.open("/storage/emulated/0/360/a.svg","w"):write(svg):close()
  return PictureDrawable(SVG.getFromString(svg).renderToPicture())
end