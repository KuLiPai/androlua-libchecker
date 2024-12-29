require "import"
--作者:苦小怕
--模仿LibChecker
--此软件开源
--遵守Apache-2.0 license协议


import "mod._"

activity.contentView=loadlayout{
  CoordinatorLayout;
  layout_width=-1;
  layout_height=-1;
  {
    AppBarLayout,
    layout_width="fill",
    layout_height="130dp",
    {
      CollapsingToolbarLayout,
      layout_width="fill",
      layout_height="fill",
      layout_scrollFlags="scroll|exitUtilCollapsed|snap",
      title="LibChecker",
      -- scrimAnimationDuration="500",
      --contentScrim=ColorDrawable(0),
      -- scrimVisibleHeightTrigger="130dp",
      --contentScrim=ColorDrawable(surfaceVar),
      --statusBarScrim=ColorDrawable(surfaceVar),
      --background=ColorDrawable(backgroundc),
      --expandedTitleColor="#FFFFFF",
      --collapsedTitleTextColor="#FFFFFF",
      --展开 和 收起 时的标题颜色
      {
        MaterialToolbar,
        layout_marginTop=状态栏高度(),
        id="toolbar",
        layout_collapseMode="pin",
        layout_width="fill",
        layout_height="56dp",
      },
    },
  },
  {
    NestedScrollView,
    id="nested",
    layout_width="fill",
    layout_height="fill",
    layout_behavior="@string/appbar_scrolling_view_behavior",
    fillViewport="true",
    backgroundColor=backgroundc,
    {
      LinearLayout,
      id="content",
      layout_width="fill",
      layout_height="fill",
      orientation=0,
      {
        ViewPager;
        id="vpg";
        layout_width="fill",
        layout_height="fill",
        pages={
          "pages/one";--页面1
          "pages/two";--页面2
          "pages/three";--页面3
        };
      },
    };
  },
  {
    BottomNavigationView,
    fitsSystemWindows="true",
    id="bottombar",
    layout_gravity="bottom",
    layout_width="fill",
    layout_height="wrap",
    --ItemRippleColor=ColorStateList.valueOf(0),
  },
}
activity.getSupportActionBar().hide()

--按钮效果


local bottombarBehavior=luajava.bindClass"com.google.android.material.behavior.HideBottomViewOnScrollBehavior"
bottombar.layoutParams.setBehavior(bottombarBehavior())
bottombar.setLabelVisibilityMode(0)--设置tab样式
--设置底栏项目
bottombar.menu.add(0,0,0,"应用")--参数分别对应groupid homeid order name
bottombar.menu.add(0,1,1,"快照")
bottombar.menu.add(0,2,2,"设置")
--设置底栏图标
bottombar.menu.findItem(0).setIcon(loadsvg("app",cc.c.on_background,true))--这里findItem取的是home id
bottombar.menu.findItem(1).setIcon(loadsvg("snapshot",cc.c.on_background,true))
bottombar.menu.findItem(2).setIcon(loadsvg("set",cc.c.on_background,true))



--记录滑动的页数
pagesss=tonumber(activity.getSharedData("pages"))
if pagesss then
  vpg.setCurrentItem(pagesss)
  bottombar.getMenu().getItem(pagesss).setChecked(true)
end


bottombar.setOnNavigationItemSelectedListener(BottomNavigationView.OnNavigationItemSelectedListener{
  onNavigationItemSelected = function(item)
    vpg.setCurrentItem(item.getItemId())
    return true
end})

vpg.setOnPageChangeListener(ViewPager.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    if c==0 then
      if a==0 then


        if menu.findItem(2) then
          menu.removeItem(2)
        end
        if menu.findItem(1) then
         else
          menu.add(1,1,1,"更多").setIcon(loadsvg("more",cc.c.on_background,true)).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))
        end
        if menu.findItem(0) then
         else
          menu.add(0,0,0,"搜索").setIcon(R.drawable.abc_ic_search_api_material).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))
        end

        activity.setSharedData("pages","0")
       elseif a==1 then


        if menu.findItem(1) then
          menu.removeItem(1)
        end

        if menu.findItem(2) then
         else
          menu.add(2,2,2,"保存").setIcon(loadsvg("save",cc.c.on_background,true)).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))
        end
        if menu.findItem(0) then

          menu.removeItem(0)
        end

        activity.setSharedData("pages","1")
       elseif a==2 then


        if menu.findItem(2) then
          menu.removeItem(2)
        end
        if menu.findItem(1) then
          menu.removeItem(1)
        end
        if menu.findItem(0) then
          menu.removeItem(0)
        end
        activity.setSharedData("pages","2")
      end
    end
  end,
  onPageSelected=function(v)
    bottombar.getMenu().getItem(v).setChecked(true)
  end
})



menu=toolbar.menu
menu.add(0,0,0,"搜索").setIcon(R.drawable.abc_ic_search_api_material).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))
menu.add(1,1,1,"更多").setIcon(loadsvg("more",cc.c.on_background,true)).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))

--[[menu.setOptionalIconsVisible(true)
toolbar.layoutParams.collapseMode=1
activity.supportActionBar=toolbar
activity.supportActionBar.displayHomeAsUpEnabled=false
activity.supportActionBar=nil
toolbar.onMenuItemClick=function(item)
  if item.title=="搜索" then

   elseif item.title=="更多" then

   elseif item.title=="Pie" then

  end
end]]

--======页面1=======

function 软件信息(pack)
  import "android.net.Uri"
  import "android.content.Intent"
  import "android.provider.Settings"
  intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
  intent.setData(Uri.parse("package:"..pack));
  activity.startActivityForResult(intent, 100);
end
import "android.content.pm.PackageManager"
pm = activity.getPackageManager();
function GetAppInfo(包名)
  local 图标 = pm.getApplicationInfo(tostring(包名),0)
  local 图标 = 图标.loadIcon(pm);
  local pkg = activity.getPackageManager().getPackageInfo(包名, 0);
  local 应用名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())
  local 版本号 = activity.getPackageManager().getPackageInfo(包名, 0).versionName
  local 版本= activity.getPackageManager().getPackageInfo(包名, 0).versionCode
  return 包名,版本号,图标,应用名称,版本
end







item={MaterialCardView,
  layout_width="fill",
  layout_height="wrap",
  strokeColor=0,
  strokeWidth="0",
  Elevation=0,
  id="父布局",
  cardBackgroundColor=背景色,
  {LinearLayout,
    Orientation=0,
    layout_width="fill",
    layout_height="fill",
    {ImageView,
      layout_marginTop="24dp",
      layout_marginBottom="24dp",
      layout_marginLeft="8dp",
      layout_width="42dp",
      layout_height="42dp",
      id="icon",
    },
    {LinearLayout,
      layout_marginTop="0dp",
      layout_marginLeft="12dp",
      Orientation=1,
      layout_width="fill",
      layout_height="fill",
      {MaterialTextView,
        textSize="18sp",
        id="name",
        textColor=cc.c.on_background,
      },
      {MaterialTextView,
        textColor=cc.c.on_background,
        textSize="14sp",
        id="packname",
      },
      {MaterialTextView,
        textSize="13sp",
        id="version",
      },
      {LinearLayout,
        layout_width="fill",
        layout_height="fill",
        {MaterialCardView,
          layout_gravity="top",
          id="bitcard",
          layout_height="12dp",
          layout_width="24dp",
          cardBackgroundColor=cc.c.on_background,
          radius="2dp",
          Elevation=0,
          strokeColor=0,
          strokeWidth="0",
          {MaterialTextView,
            textSize="6.6sp",
            id="Bit",
            textStyle="bold",
            layout_gravity="center",
            text="64 BIT",
            textColor=cc.c.background,
          },
        },
        {MaterialTextView,
          layout_marginTop="-3.3dp",
          layout_marginLeft="4dp",
          textColor=cc.c.on_background,
          layout_gravity="top",
          textSize="12sp",
          textStyle="bold",
          id="arm",
          text="",
        },
      },
    },
  }
}




function 架构(packname)
  if File(tostring(File(this.getPackageManager().getApplicationInfo(packname, 0).sourceDir).getParent()).."/lib/").exists() then

    if File(tostring(File(this.getPackageManager().getApplicationInfo(packname, 0).sourceDir).getParent()).."/lib/arm64/").exists() then
      return 64,true
     else
      return 32,true
    end
   else
    return 64,false
  end
end


function 适配器(lll)

  apps=lll()
  adp=LuaCustRecyclerAdapter(AdapterCreator({
    getItemCount=function()
      return #apps
    end,
    onCreateViewHolder=function(parent,viewType)
      local views={}
      holder1=LuaCustRecyclerHolder(loadlayout(item,views))
      holder1.view.setTag(views)
      return holder1
    end,
    onBindViewHolder=function(holder,position)



      view=holder.view.getTag()

      --  包名,版本号,图标,应用名称,版本=GetAppInfo(apps[position+1]["packageName"])


      view.name.text=apps[position+1]["app_name"]
      view.packname.text=apps[position+1]["packageName"]
      view.version.text=apps[position+1]["versionName"].." ("..tostring(apps[position+1]["versionCode"])..")"
      view.icon.ImageDrawable=apps[position+1]["app_icon"]


      local bited,ok=架构(apps[position+1]["packageName"])
      if bited==64 then
        view.Bit.text="64 BIT"
        if ok then
          view.arm.text=""
         else
          view.arm.text="无原生库"
        end
       else
        view.Bit.text="32 BIT"
      end



      view.父布局.onClick=function(v)
        activity.setSharedData("包名",v.getChildAt(0).getChildAt(1).getChildAt(1).text)

        activity.newActivity("details")
      end
    end,
  }))
  apprec.setAdapter(adp)
  apprec.setLayoutManager(GridLayoutManager(this,1))




  --调用函数获取列表

  --[[  local adapter=LuaRecyclerAdapter(activity,apps,item)
  adapter.setAdapterInterface(LuaRecyclerAdapter.AdapterInterface{
    onBindViewHolder=function(viewHolder,index)
      view=viewHolder.tag
      包名,版本号,最后更新时间,图标,应用名称,版本=GetAppInfo(apps[index+1]["packageName"])
      view.name.Text=应用名称
      view.packname.Text=包名
      view.version.Text=版本号.." ("..tostring(版本)..")"
      view.icon.ImageDrawable=图标


      local bited,ok=架构(apps[index+1]["packageName"])
      if bited==64 then
        view.Bit.text="64 BIT"
        if ok then
         else
          view.arm.text="无原生库"
        end
       else
        view.Bit.text="32 BIT"
      end



      view.父布局.onClick=function(v)
        activity.setSharedData("包名",v.getChildAt(0).getChildAt(1).getChildAt(1).text)

        activity.startFusionActivity("details")
      end

    end
  })
  apprec.adapter=adapter]]
end




task(100,function()
  thread(function()
    require "import"
    import "android.content.pm.PackageManager"
    import "android.content.pm.ApplicationInfo"
    import "android.net.Uri"
    import "android.provider.DocumentsContract"
    import "androidx.documentfile.provider.DocumentFile"
    local packageMgr = activity.PackageManager
    local packages = packageMgr.getInstalledPackages(0)
    local data = {}
    local count = 0

    -- 遍历应用列表
    while count ~= #packages do
      local packageInfo = packages[count]
      local packageName = packageInfo.packageName
      local appInfo = packageInfo.applicationInfo

      -- 排除列表中的系统应用
      if (appInfo.flags & ApplicationInfo.FLAG_SYSTEM) <= 0 then
        local uid = appInfo.uid
        local label = appInfo.loadLabel(packageMgr)
        local icon = appInfo.loadIcon(packageMgr)
        local versionName = packageInfo.versionName
        local versionCode= packageInfo.versionCode
        --[[
        local 安装包路径=tostring(File(this.getPackageManager().getApplicationInfo(packageName, 0).sourceDir))
      if ok then
        local zr=zip.open(安装包路径,'r')--以读取模式打开zip
        ziptable=dump(zr:list())
        armv8=false
        armv7=false
        armabi=false
        x86=false
        x64=false
        if ziptable:find("zipfile: lib/arm64%-v8a")
          armv8=true
        end
        if ziptable:find("zipfile: lib/armeabi%-v7a")
          armv7=true
        end
        if ziptable:find("zipfile: lib/armeabi")
          armabi=true
        end
        if ziptable:find("zipfile: lib/x86")
          x86=true
        end
        if ziptable:find("zipfile: lib/x86_64")
          x64=true
        end

        if armv8 then
      --    view.arm.text="arm64-v8a"
         else
          if x64 then
        --    view.arm.text="x86_64"
           else
            if armv7 then
        --      view.arm.text="armeabi-v7a"
             else
              if armabi then
       --         view.arm.text="armabi"
               else
      --          view.arm.text="x86"
              end
            end
          end
        end
      end
]]






        table.insert(data, #data + 1,
        {app_icon = icon,
          app_name = label,
          uid = uid,
          packageName = packageName,
          versionName=versionName,
          versionCode=versionCode,

        })
      end

      count = count + 1
    end

    --排序
    table.sort(data,function(a,b)
      if utf8.len(a.app_name)<utf8.len(b.app_name) then
        大小=utf8.len(a.app_name)
       else
        大小=utf8.len(b.app_name)
      end
      for i=1,大小 do
        if utf8.byte(utf8.sub(a.app_name,i,i))==utf8.byte(utf8.sub(b.app_name,i,i)) then
         else
          return utf8.byte(utf8.sub(a.app_name,i,i))<utf8.byte(utf8.sub(b.app_name,i,i))
        end
      end
      return utf8.len(a.app_name)<utf8.len(b.app_name)
    end)

    --返回一个列表
    function abcd()
      return data
    end

    call("适配器",abcd)
  end)

end)

mark.setAnimationFromJson(io.open(activity.getLuaDir("res/lib_reference_winter.json")):read("*a"))
mark.setSpeed(1)
mark.loop(true)
mark.resumeAnimation()




底栏展开状态=true
apprec.addOnScrollListener(RecyclerView.OnScrollListener({
  onScrolled=function(v,s,j)
    if j>0 and 底栏展开状态 then
      底栏展开状态=false
      bottombar.layoutParams.getBehavior().slideDown(bottombar)
    end
    if j<0 and not 底栏展开状态 then
      底栏展开状态=true
      bottombar.layoutParams.getBehavior().slideUp(bottombar)
    end
  end
}))

夜间开关.setOnCheckedChangeListener{
  onCheckedChanged=function(v,b)
    if b then
      task(100,function()
        AppCompatDelegate.setDefaultNightMode(2);
      end)
     else
      task(100,function()
        AppCompatDelegate.setDefaultNightMode(1);
      end)
    end
  end
}




--fast
function initFastScroll(...)
  for _,view in pairs{...} do
    view.newFastScrollDelegate=FastScrollDelegate.Builder(view)
    --.width(10).height(30)
    .thumbNormalColor(cc.c.primary)
    .thumbPressedColor(cc.c.primary)
    --.thumbDrawable(drawable)
    .dynamicHeight(true)--设置thumb动态高度，为false则高度固定
    .build()
    .initIndicatorPopup(IndicatorPopup.Builder(view.delegate)
    .indicatorPopupColor(cc.c.primary)
    .indicatorPopupSize(72)
    .indicatorTextSize(20)
    .indicatorMarginRight(24)
    .indicatorPopupAnimationStyle(android.R.style.Animation_Toast)
    .build())
    .setOnFastScrollListener{
      onFastScrolled=function(view,delegate,touchDeltaY,viewScrollDeltaY,scrollPercent)
        delegate.indicatorText=("%.0f%%"):format(scrollPercent*100)
      end
    }
  end
end
initFastScroll(apprec)



function setWindowSize()
  --主要逻辑
  if activity.getWidth()>activity.getHeight() then
    --横屏情况
    apprec.setLayoutManager(GridLayoutManager(this,2))
   else
    --竖屏情况
    apprec.setLayoutManager(GridLayoutManager(this,1))
  end
end

--屏幕方向判断
function onConfigurationChanged()
  --监听窗口属性改变，调用setWindowSize()
  setWindowSize()
end
--初始化判断屏幕方向
setWindowSize()


