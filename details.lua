require "import"
import "mod._"


import "com.androlua.LuaDiffRecyclerAdapter"

if night then
  cc.c.grey=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral50)
  cc.c.blue=0xFF1565C0
 else
  cc.c.grey=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral90)
  cc.c.blue=0xFFBBDEFB
end


function newbsd(dialog_layout)
  local mBottomSheetDialog=BottomSheetDialog(this)--,R.style.Theme_Material3_DayNight_BottomSheetDialog)
  mBottomSheetDialog
  .setContentView(loadlayout(dialog_layout))
  --  .show()
  if Build.VERSION.SDK_INT >= 21 then
    window = mBottomSheetDialog.getWindow()
    window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
    window.setStatusBarColor(Color.TRANSPARENT);
    window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
    window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
   else
    window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
    window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
  end
  return mBottomSheetDialog
end

function showbsd(标题,svg,内容,类型)
  内容=内容 or ""
  cc.c.xbt=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral_variant50)--小白条



  abc=
  {
    NestedScrollView,
    layout_width="fill",
    layout_height="fill",
    {
      LinearLayout,
      layout_height="fill",
      layout_width="fill",
      orientation=1,
      {MaterialCardView,
        MaxCardElevation=1,
        strokeWidth=0,
        cardElevation=1,
        strokeColor=0,
        layout_marginTop="12dp",
        layout_width="36dp",
        layout_height="4dp",
        layout_gravity="center",
        --cardBackgroundColor=,
        cardBackgroundColor=cc.c.xbt,
      },
      {MaterialTextView,
        layout_marginTop="12dp",
        layout_gravity="center",
        textSize="24sp",
        textColor=cc.c.on_background,
        text=标题,
      },

      {MaterialCardView,
        layout_width="52dp",
        layout_height="52dp",
        layout_gravity="center",
        strokeColor=cc.c.xbt,
        cardBackgroundColor=0,
        strokeWidth="1.2dp",
        Elevation=0,
        shapeAppearanceModel=ShapeAppearanceModel.builder()
        .setAllCornerSizes(RelativeCornerSize(0.5))
        .build(),
        {ImageView,
          imageDrawable=loadsvg(svg,nil,true),
          layout_width="28dp",
          layout_height="28dp",
          layout_gravity="center",
        },
      },
      {MaterialTextView,
        layout_marginTop="4dp",
        layout_marginLeft="12dp",
        layout_marginRight="12dp",
        layout_gravity="center",
        textSize="14sp",
        id="内容文字",
        textStyle="bold",
        text=内容,
      },

      {FrameLayout,
        layout_width="fill",
        layout_height="fill",

        {
          LinearLayout,
          layout_height="fill",
          layout_width="fill",
          orientation=1,
          {MaterialCardView,

            Visibility=8,
            id="名称卡片",
            layout_marginTop="16dp",

            layout_marginLeft="18dp",
            layout_marginRight="18dp",
            layout_width="fill",
            layout_height="wrap",
            layout_gravity="center",
            strokeColor=cc.c.xbt,
            cardBackgroundColor=0,
            strokeWidth="1dp",
            Elevation=0,
            radius="12dp",
            {LinearLayout,
              layout_margin="8dp",
              layout_width="fill",
              layout_height="fill",
              {ImageView,
                imageDrawable=loadsvg("label",cc.c.on_background,true),
                layout_width="25dp",
                layout_height="25dp",
                layout_gravity="center",
              },
              {MaterialTextView,
                layout_marginLeft="8dp",
                layout_gravity="center",
                textSize="14sp",
                textStyle="bold",
                textColor=cc.c.on_background,
                id="名称",
                textIsSelectable=true;
              },
            },
          },


          {MaterialCardView,
            Visibility=8,
            id="作者卡片",
            layout_marginTop="8dp",
            layout_marginLeft="18dp",
            layout_marginRight="18dp",
            layout_width="fill",
            layout_height="wrap",
            layout_gravity="center",
            strokeColor=cc.c.xbt,
            cardBackgroundColor=0,
            strokeWidth="1dp",
            Elevation=0,
            radius="12dp",
            {LinearLayout,
              layout_margin="8dp",
              layout_width="fill",
              layout_height="fill",
              {ImageView,
                imageDrawable=loadsvg("people",cc.c.on_background,true),
                layout_width="25dp",
                layout_height="25dp",
                layout_gravity="center",
              },
              {MaterialTextView,
                layout_marginLeft="8dp",
                layout_gravity="center",
                textSize="14sp",
                textStyle="bold",
                textColor=cc.c.on_background,
                id="作者",
                textIsSelectable=true;
              },
            },
          },



          {MaterialCardView,
            Visibility=8,
            id="仓库卡片",
            layout_marginTop="8dp",
            layout_marginLeft="18dp",
            layout_marginRight="18dp",
            layout_width="fill",
            layout_height="wrap",
            layout_gravity="center",
            strokeColor=cc.c.xbt,
            cardBackgroundColor=0,
            strokeWidth="1dp",
            Elevation=0,
            radius="12dp",
            {LinearLayout,
              layout_margin="8dp",
              layout_width="fill",
              layout_height="fill",
              {ImageView,
                imageDrawable=loadsvg("github",cc.c.on_background,true),
                layout_width="25dp",
                layout_height="25dp",

                layout_gravity="center",
              },
              {MaterialTextView,
                layout_marginLeft="8dp",
                layout_gravity="center",
                textSize="14sp",
                textIsSelectable=true;
                textStyle="bold",
                textColor=cc.c.on_background,
                id="仓库",
              },
            },
          },

          {MaterialCardView,
            Visibility=8,
            id="描述卡片",
            layout_marginTop="8dp",
            layout_marginLeft="18dp",
            layout_marginRight="18dp",
            layout_width="fill",
            layout_height="wrap",
            layout_gravity="center",
            strokeColor=cc.c.xbt,
            cardBackgroundColor=0,
            strokeWidth="1dp",
            Elevation=0,
            radius="12dp",
            {LinearLayout,
              layout_margin="8dp",
              layout_width="fill",
              layout_height="fill",
              {ImageView,
                imageDrawable=loadsvg("file",cc.c.on_background,true),
                layout_width="25dp",
                layout_height="25dp",
                layout_gravity="center",
              },
              {MaterialTextView,
                layout_marginLeft="8dp",
                layout_gravity="center",
                textSize="14sp",
                textColor=cc.c.on_background,
                id="描述",
                textIsSelectable=true;
              },
            },
          },

          {MaterialCardView,
            Visibility=8,
            id="链接卡片",
            layout_marginTop="8dp",
            layout_marginLeft="18dp",
            layout_marginRight="18dp",
            layout_width="fill",
            layout_height="wrap",
            layout_gravity="center",
            strokeColor=cc.c.xbt,
            cardBackgroundColor=0,
            strokeWidth="1dp",
            Elevation=0,
            radius="12dp",
            {LinearLayout,
              layout_margin="8dp",
              layout_width="fill",
              layout_height="fill",
              {ImageView,
                imageDrawable=loadsvg("url",cc.c.on_background,true),
                layout_width="25dp",
                layout_height="25dp",
                layout_gravity="center",
              },
              {MaterialTextView,
                layout_marginLeft="8dp",
                layout_gravity="center",
                textSize="14sp",
                textColor=cc.c.primary,
                id="链接",
                textIsSelectable=true;
              },
            },
          },
        },
        {LinearLayout,
          layout_width="fill",
          layout_height="fill",
          Orientation=1,

          {LottieAnimationView,
            Visibility=8,
            layout_gravity="center",
            id="mark",
            layout_width="256dp",
            layout_height="256dp",
          },
          {MaterialTextView,
            Visibility=8,
            textSize="20sp",
            id="未找到",
            text="未找到",
            layout_gravity="center",
          },
        },
      },

      {Space,
        layout_height="24dp",
      },
    }
  }

  import "android.net.Uri"
  n=newbsd(abc).show()
  if activity.getWidth()>activity.getHeight() then
    n.getBehavior().setState(3)
   else
    n.getBehavior().setState(4)
  end
  --print(activity.getLuaDir("label/libs/native/").."/"..内容..".json")
  if File(activity.getLuaDir("label/libs/"..类型.."/").."/"..内容..".json").exists()
    task(1,function()
      名称卡片.Visibility=0
      作者卡片.Visibility=0
      仓库卡片.Visibility=0
      描述卡片.Visibility=0
      链接卡片.Visibility=0
      local json数据=io.open(activity.getLuaDir("label/libs/"..类型.."/").."/"..内容..".json"):read("*a")
      cjson=require "cjson"
      local 数据表=cjson.decode(json数据)
      名称.text=数据表["label"]
      作者.text=数据表["team"]
      仓库内容=""
      for k,v in pairs(数据表["contributors"]) do
        if k==#数据表["contributors"] then
          仓库内容=仓库内容..v
         else
          仓库内容=仓库内容..v..","
        end
      end
      仓库.text=仓库内容
      描述.text=数据表["description"]
      链接.text=数据表["relativeUrl"]

    end)

   else
    mark.Visibility=0
    未找到.Visibility=0
    mark.setAnimationFromJson(io.open(activity.getLuaDir("res/lib_detail_rocket.json")):read("*a"))
    mark.setSpeed(1)
    mark.loop(true)
    mark.resumeAnimation()
  end
  链接.getPaint().setFlags(Paint.UNDERLINE_TEXT_FLAG)
  链接.onClick=function()
    openExtUrl(链接.text)
  end
  if 内容 =="" then
    内容文字.Visibility=8
  end


end





layout={
  CoordinatorLayout,
  layout_width="fill",
  layout_height="fill",
  {
    AppBarLayout,
    id="appbar",
    layout_width="fill",
    layout_height="250dp",
    TargetElevation="0",
    {
      CollapsingToolbarLayout,
      contentScrim=ColorDrawable(backgroundc),
      expandedTitleMarginStart="7%w",
      layout_width=-1;
      layout_height=-1;
      layout_scrollFlags=3;
      backgroundColor=backgroundc;
      id="标题栏",
      title="",

      {
        MaterialToolbar,
        layout_marginTop=状态栏高度(),
        id="toolbar",
        layout_width="fill",
        layout_height="60dp",
        title="",
      },
      {MaterialCardView,
        layout_gravity="center",
        layout_width="fill",
        layout_height="wrap",
        strokeColor=0,
        strokeWidth="0",
        Elevation=0,
        id="父布局",
        cardBackgroundColor=0,
        {LinearLayout,
          Orientation=1,
          layout_width="fill",
          layout_height="fill",
          {LinearLayout,
            layout_marginLeft="24dp",
            Orientation=0,
            layout_width="fill",
            layout_height="fill",
            {ImageView,
              layout_marginTop="24dp",
              layout_marginBottom="24dp",
              layout_marginLeft="8dp",
              layout_width="54dp",
              layout_height="54dp",
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
              {ChipGroup,
                layout_marginRight="16dp",
                ChipSpacingVertical="1dp",
                ChipSpacingHorizontal=0,
                layout_width="fill",
                layout_height="wrap",
                id="bitcard",
              },

            },
          },
          {LinearLayout,
            layout_marginLeft="16dp",
            id="attr",
            layout_width="fill",
            layout_height="fill",
            layoutTransition=LayoutTransition()
            .enableTransitionType(LayoutTransition.CHANGING)
            .setDuration(LayoutTransition.CHANGE_APPEARING,300)
            .setDuration(LayoutTransition.CHANGE_DISAPPEARING,300),
          },
        }
      }
    },
  },
  {LinearLayout,
    layout_width="fill",
    layout_height="fill",
    layout_behavior="@string/appbar_scrolling_view_behavior";
    Orientation=1,
    {TabLayout,
      layout_width="fill",
      TabIndicatorFullWidth=false,
      id="tab",
      TabMode=2,
      backgroundColor=backgroundc,
      Elevation="0dp",
    },
    {LinearLayout,
      backgroundColor=backgroundc,
      layout_width="fill",
      layout_height="48dp",
      Elevation="2dp",
      {MaterialTextView,
        layout_marginLeft="16dp",
        textSize="14sp",
        layout_gravity="center",
        text="项数:",
      },

      {MaterialTextView,
        layout_marginLeft="16dp",
        textSize="16sp",
        textColor=cc.c.on_background,
        id="numbers",
        textStyle="bold",
        layout_gravity="center",
        text="0",
      },
      {ImageView,
        id="reorder",
        layout_gravity="center",
        layout_marginLeft="16dp",
        layout_width="24dp",
        layout_height="24dp",
        imageDrawable=loadsvg("reorder",cc.c.on_background,true)
      },
    },
    {
      ViewPager,
      id="vp",
      layout_width="fill",
      layout_height="fill",
      pages={
        "layout/ysk",
        "layout/fw",
        "layout/hd",
        "layout/gbjsq",
        "layout/nrtgq",
        "layout/qx",
        "layout/ysj",
      },
    },
  },
}

activity.setContentView(loadlayout(layout))
activity.getSupportActionBar().hide()

tab.setupWithViewPager(vp)
tabTable={"原生库","服务","活动","广播接收器","内容提供器","权限","元数据"}
for i=1, #tabTable do
  tab.getTabAt(i-1).setText(tabTable[i])
end





hdlabel=import "label.hd"
fwlabel=import "label.fw"
gbjsqlabel=import "label.gbjsq"
nrtgqlabel=import "label.nrtgq"
ysklabel=import "label.ysk"
qxlabel=import "label.qx"

function 适配器(recl,lll)

  local apps=lll

  local rec=_ENV[recl.."rec"]
  local item=import("item."..recl)
  if type(lll)~="table" then
    apps=load("return "..lll)()
  end
  _ENV[recl.."adp"]=LuaDiffRecyclerAdapter(LuaDiffRecyclerAdapter.LuaInterface {
    getItemViewType=function()
      return int(0)
    end,
    onCreateViewHolder=function(parent,type)
      local tag={}
      local view=loadlayout(item,tag,parent.class)
      view.tag=tag
      return view
    end,
    areContentsTheSame=function(old,new)
      return old.name==new.name
    end,
    areItemsTheSame=function(old,new)
      return old.name==new.name
    end,
    onBindViewHolder=function(holder,position)
      local view=holder.itemView.tag
      if recl=="ysk" then
        view.size.Text=tostring(apps[position+1]["sizes"])
      end
      if recl~="ysj" then
        view.name.Text=apps[position+1]["name"]
       else
        view.key.Text=apps[position+1]["key"]
        view.value.Text=apps[position+1]["value"]
      end

      if recl=="qx" then
        local names=view.name.text-- apps[position+1]["name"]
        if apps[position+1]["pers"] then
          view.per.Visibility=0
        end
        if qxlabel[names] then
          view.name.Visibility=8
          view.yes.Visibility=0
          view.namel.text=names
          view.translate.text=qxlabel[names]
        end
      end

      if recl=="ysk" or recl =="hd" or recl=="fw" or recl=="gbjsq" or recl=="nrtgq" then
        local names=view.name.text-- apps[position+1]["name"]

        if _ENV[recl.."label"][names] then
          view.label.Visibility=0
          view.labeltext.text=_ENV[recl.."label"][names][1]
          view.labelimage.imageDrawable=loadsvg(_ENV[recl.."label"][names][2],nil,true)
          view.父布局.onClick=function()
            showbsd("库详情",_ENV[recl.."label"][names][2],apps[position+1]["name"],recl)
          end
         elseif names:find("^com.huawei") then
          view.label.Visibility=0
          view.labeltext.text="HUAWEI"
          view.labelimage.imageDrawable=loadsvg("huawei",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","huawei",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.tencent") then
          view.label.Visibility=0
          view.labeltext.text="Tencent"
          view.labelimage.imageDrawable=loadsvg("Tencent",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","Tencent",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.google.android.datatransport") or names:find("^com.google.firebase") then
          view.label.Visibility=0
          view.labeltext.text="Firebase"
          view.labelimage.imageDrawable=loadsvg("firebase",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","firebase",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.androlua") then
          view.label.Visibility=0
          view.labeltext.text="AndroLua"
          view.labelimage.imageDrawable=loadsvg("lua",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","lua",apps[position+1]["name"],recl)
          end

         elseif names:find("^com.google.android.gms") then
          view.label.Visibility=0
          view.labeltext.text="Google"
          view.labelimage.imageDrawable=loadsvg("Google",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","Google",apps[position+1]["name"],recl)
          end

         else
          view.label.Visibility=8
          view.父布局.onClick=function()
            showbsd("库详情","SDK",apps[position+1]["name"],recl)
          end
        end
      end
    end
  })






  --[[  =LuaCustRecyclerAdapter(AdapterCreator({
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
      local names= apps[position+1]["name"]
      if recl=="ysk" then

        view.size.Text=tostring(apps[position+1]["sizes"])
      end
      if recl~="ysj" then
        view.name.Text=apps[position+1]["name"]
       else
        view.key.Text=apps[position+1]["key"]
        view.value.Text=apps[position+1]["value"]
      end

      if recl=="qx" then
        if apps[position+1]["pers"] then
          view.per.Visibility=0
        end
        if qxlabel[names] then
          view.name.Visibility=8
          view.yes.Visibility=0
          view.namel.text=names
          view.translate.text=qxlabel[names]
        end
      end

      if recl=="ysk" or recl =="hd" or recl=="fw" or recl=="gbjsq" or recl=="nrtgq" then


        if _ENV[recl.."label"][names] then
          view.label.Visibility=0
          view.labeltext.text=_ENV[recl.."label"][names][1]
          view.labelimage.imageDrawable=loadsvg(_ENV[recl.."label"][names][2],nil,true)
          view.父布局.onClick=function()
            showbsd("库详情",_ENV[recl.."label"][names][2],apps[position+1]["name"],recl)
          end
         elseif names:find("^com.huawei") then
          view.label.Visibility=0
          view.labeltext.text="HUAWEI"
          view.labelimage.imageDrawable=loadsvg("huawei",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","huawei",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.tencent") then
          view.label.Visibility=0
          view.labeltext.text="Tencent"
          view.labelimage.imageDrawable=loadsvg("Tencent",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","Tencent",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.google.android.datatransport") or names:find("^com.google.firebase") then
          view.label.Visibility=0
          view.labeltext.text="Firebase"
          view.labelimage.imageDrawable=loadsvg("firebase",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","firebase",apps[position+1]["name"],recl)
          end
         elseif names:find("^com.androlua") then
          view.label.Visibility=0
          view.labeltext.text="AndroLua"
          view.labelimage.imageDrawable=loadsvg("lua",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","lua",apps[position+1]["name"],recl)
          end

         elseif names:find("^com.google.android.gms") then
          view.label.Visibility=0
          view.labeltext.text="Google"
          view.labelimage.imageDrawable=loadsvg("Google",nil,true)
          view.父布局.onClick=function()
            showbsd("库详情","Google",apps[position+1]["name"],recl)
          end

         else
          view.label.Visibility=8
          view.父布局.onClick=function()
            showbsd("库详情","SDK",apps[position+1]["name"],recl)
          end
        end
      end
    end,
  }))
]]
  rec.setAdapter(_ENV[recl.."adp"])
  rec.setLayoutManager(LinearLayoutManager(this))
  _ENV[recl.."adp"].submitList(apps)

  if #lll==0 then
    _ENV[recl.."empty"].Visibility=0
   else
    _ENV[recl.."empty"].Visibility=8
  end
end


function 超级排序(a表,名字)

  table.clear(_ENV[a表])
  pcall(load("_a表=".._ENV["__"..a表]))
  for k,v in pairs(_a表) do
    if _ENV[名字.."label"][v.name] then
      table.insert(_ENV[a表],1,v)
     else
      table.insert(_ENV[a表],v)
    end
  end

  _ENV[名字.."adp"].submitList(_ENV[a表])
end
function 乱序(a表,名字)
  --table.clear(_ENV[a表])
  table.sort(_ENV[a表],function(a,b)
    if utf8.len(a.name)<utf8.len(b.name) then
      大小=utf8.len(a.name)
     else
      大小=utf8.len(b.name)
    end
    -- print(大小)
    for i=1,大小 do
      if utf8.byte(utf8.sub(a.name,i,i))==utf8.byte(utf8.sub(b.name,i,i)) then
       else
        return utf8.byte(utf8.sub(a.name,i,i))<utf8.byte(utf8.sub(b.name,i,i))
      end
    end
    return utf8.len(a.name)<utf8.len(b.name)
  end)
  _ENV[名字.."adp"].submitList(_ENV[a表])
end
排序=false
reorder.onClick=function()
  pp=vp.getCurrentItem()
  local 排表={
    ["原生库"]="ysk",
    ["服务列表"]="fw",
    ["活动列表"]="hd",
    ["广播接收器列表"]="gbjsq",
    ["内容提供器列表"]="nrtgq",
  }
  function 乱乱(s,l)
    if s=="原生库" and #原生库==0 then
     else
      乱序(s,l)
    end
    task(100,function()
      for k,v in pairs(排表) do
        if k~=s then
          if k=="原生库" and #原生库==0 then
           else
            乱序(k,v)
          end
        end
      end
    end)
  end
  function 超超(s,l)
    if s=="原生库" and #原生库==0 then
     else
      超级排序(s,l)
    end
    task(100,function()
      for k,v in pairs(排表) do
        if k~=s then
          if k=="原生库" and #原生库==0 then
           else
            超级排序(k,v)
          end
        end
      end
    end)
  end
  if 排序 then
    排序=false
    if pp==0 then
      乱乱("原生库","ysk")
     elseif pp==1
      乱乱("服务列表","fw")
     elseif pp==2
      乱乱("活动列表","hd")
     elseif pp==3
      乱乱("广播接收器列表","gbjsq")
     elseif pp==4
      乱乱("内容提供器列表","nrtgq")
    end
   else
    排序=true
    if pp==0 then
      超超("原生库","ysk")
     elseif pp==1
      超超("服务列表","fw")
     elseif pp==2
      超超("活动列表","hd")
     elseif pp==3
      超超("广播接收器列表","gbjsq")
     elseif pp==4
      超超("内容提供器列表","nrtgq")
    end
  end
end
波({reorder},"圆",0x44444444)

function 加attr(svg,名称,介绍)

  if svg:find("%.png") then
    attr.addView(loadlayout(
    {LinearLayout,
      {MaterialCardView,
        id="卡片",
        Elevation=0,
        strokeColor=0,
        strokeWidth="0",
        layout_marginLeft="6dp",
        CardElevation=0,
        layout_height="36dp",
        layout_width="36dp",
        cardBackgroundColor=0x11111111,
        radius="36dp",
        {ImageView,
          src="res/"..svg,
          layout_gravity="center",
          layout_height="22dp",
          scaleType="centerCrop",
          layout_width="22dp",
        },
      },
    }
    ))


   else
    attr.addView(loadlayout(
    {LinearLayout,
      {MaterialCardView,
        id="卡片",
        Elevation=0,
        strokeColor=0,
        strokeWidth="0",
        layout_marginLeft="6dp",
        CardElevation=0,
        layout_height="36dp",
        layout_width="36dp",
        cardBackgroundColor=0x11111111,
        radius="36dp",
        {ImageView,
          imageDrawable=loadsvg(svg,nil,true),
          layout_gravity="center",
          layout_height="22dp",
          scaleType="centerCrop",
          layout_width="22dp",
        },
      },
    }
    ))


  end
  卡片.onClick=function()
    dia= MaterialAlertDialogBuilder(this)
    .setTitle(名称)
    .setMessage(介绍)
    .setPositiveButton("确定",function()
    end)
    .show()
    childView=dia.window.decorView
    childView.getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).Visibility=0
    if svg:find("%.png") then
      childView.getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).setImageBitmap(loadbitmap("res/"..svg))
     else
      childView.getChildAt(0).getChildAt(1).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).getChildAt(0).imageDrawable=loadsvg(svg,nil,true)
    end
    --[[    if svg:find("%.png") then
      childView.getChildAt(0).getChildAt(0).addView(loadlayout(
      {LinearLayout,
        layout_width="36dp",
        {
          ImageView,
          src=svg,
          layout_height="24dp",
          scaleType="centerCrop",
          layout_width="24dp",
        }
      }),0)
     else
      childView.getChildAt(0).getChildAt(0).addView(loadlayout(
      {LinearLayout,
        layout_width="36dp",
        {
          ImageView,
          imageDrawable=loadsvg(svg,nil,true),
          layout_height="24dp",
          scaleType="centerCrop",
          layout_width="24dp",
        }
      }),0)
    end]]

  end
end


bit表={}
function 加bit(aaa,bbb)
  table.insert(bit表,{tostring(aaa),bbb})
end
function showbit()
  for k,v in pairs(bit表) do
    if #bit表==1 then
      bitcard.addView(loadlayout(
      {LinearLayout,
        {MaterialCardView,
          layout_height="12dp",
          Elevation=0,
          strokeColor=0,
          strokeWidth="0",
          layout_width="24dp",
          cardBackgroundColor=cc.c.on_background,
          radius="2dp",
          {MaterialTextView,
            textSize="6.6sp",
            id="Bit",
            textStyle="bold",
            layout_gravity="center",
            text=v[1].." BIT",
            textColor=cc.c.background,
          },
        },
        {MaterialTextView,
          layout_marginTop="-3.3dp",
          layout_marginLeft="2dp",
          layout_gravity="top",
          textSize="12sp",
          textStyle="bold",
          id="arm",
          text=v[2],
        }
      }
      ))
     else
      if k==#bit表 then
        bitcard.addView(loadlayout(
        {LinearLayout,
          {MaterialCardView,
            layout_height="12dp",
            Elevation=0,
            strokeColor=0,
            strokeWidth="0",
            layout_width="24dp",
            cardBackgroundColor=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral60),
            radius="2dp",
            {MaterialTextView,
              textSize="6.6sp",
              id="Bit",
              textStyle="bold",
              layout_gravity="center",
              text=v[1].." BIT",
              textColor=cc.c.background,
            },
          },
          {MaterialTextView,
            layout_marginTop="-3.3dp",
            layout_marginLeft="2dp",
            layout_gravity="top",
            textSize="12sp",
            textColor=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral60),
            textStyle="bold",
            id="arm",
            text=v[2],
          }
        }
        ))
        arm.getPaint().setFlags(Paint.STRIKE_THRU_TEXT_FLAG)
       elseif k==1 then
        bitcard.addView(loadlayout(
        {LinearLayout,
          {MaterialCardView,
            layout_height="12dp",
            Elevation=0,
            strokeColor=0,
            strokeWidth="0",
            layout_width="24dp",
            cardBackgroundColor=cc.c.on_background,
            radius="2dp",
            {MaterialTextView,
              textSize="6.6sp",
              id="Bit",

              textStyle="bold",
              layout_gravity="center",
              text=v[1].." BIT",
              textColor=cc.c.background,
            },
          },
          {MaterialTextView,
            layout_marginTop="-3.3dp",
            layout_marginLeft="2dp",
            layout_gravity="top",
            textSize="12sp",
            textStyle="bold",
            id="arm",
            text=v[2]..", ",
          }
        }
        ))
       else
        bitcard.addView(loadlayout(
        {LinearLayout,
          {MaterialCardView,
            layout_height="12dp",
            Elevation=0,
            strokeColor=0,
            strokeWidth="0",
            layout_width="24dp",
            cardBackgroundColor=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral60),
            radius="2dp",
            {MaterialTextView,
              textSize="6.6sp",
              id="Bit",
              textStyle="bold",
              layout_gravity="center",
              text=v[1].." BIT",
              textColor=cc.c.background,
            },
          },
          {MaterialTextView,
            layout_marginTop="-3.3dp",
            layout_marginLeft="2dp",
            layout_gravity="top",
            textSize="12sp",
            textStyle="bold",
            textColor=activity.getColor(MDC_R.color.m3_ref_palette_dynamic_neutral60),
            id="arm",
            text=v[2]..", ",
          }
        }
        ))
        arm.getPaint().setFlags(Paint.STRIKE_THRU_TEXT_FLAG)
      end
    end
  end
end



全局包名=activity.getSharedData("包名")

安装包路径=tostring(File(this.getPackageManager().getApplicationInfo(全局包名, 0).sourceDir))
havelib=false



--[[


armv8=false
armv7=false
armabi=false
x86=false
x64=false
if ziptable:find("zipfile: lib/arm64%-v8a")
  armv8=true
  加bit(64,"arm64-v8a,")
end
if ziptable:find("zipfile: lib/armeabi%-v7a")
  加bit(32,"armeabi-v7a,")
  armv7=true
end
if ziptable:find("zipfile: lib/armeabi")
  加bit(32,"armeabi,")
  armabi=true
end
if ziptable:find("zipfile: lib/x86")
  加bit(32,"x86,")
  x86=true
end
if ziptable:find("zipfile: lib/x86_64")
  加bit(64,"x86_64,")
  x64=true
end
if ziptable:find("zipfile: kotlin/")
  加attr("kotlin.png")
end

if ziptable:find("zipfile: META%-INF/MANIFEST.MF")
  if zr:read('META-INF/MANIFEST.MF'):find("Created%-By: Android Gradle") then
    加attr("gradle")
  end
end
if ziptable:find("zipfile: assets/main.lua")
  加attr("lua")
end
if ziptable:find("zipfile: assets/pages/main/main.lua")
  加attr("fa.png")
end
]]


import "android.content.pm.PackageManager"
import "android.text.format.Formatter"

function isxp(packageName)
  return pcall(function()
    if this.getPackageManager().getApplicationInfo(packageName, PackageManager.GET_META_DATA).metaData.get("xposedmodule") == true then
     else
      error()
    end
  end)
end

function isgoogleplay(packageName)
  return pcall(function()
    if this.getPackageManager().getApplicationInfo(packageName, PackageManager.GET_META_DATA).metaData.get("com.android.stamp.source") == "https://play.google.com/store" then
     else
      error()
    end
  end)
end

if isxp(全局包名) then
  加attr("xposed","Xposed 模块",[[Xposed 是一个模块框架，可以在不接触任何 APK 的情况下更改系统和应用程序的行为。这很棒，因为这意味着模块可以在不同版本甚至 ROM 上工作而无需任何更改。]])
end
if isgoogleplay(全局包名) then
  加attr("play","Play App Signing",[[借助 Play 应用签名，Google 可以为您管理和保护您应用的签名密钥，并使用它对从您的 app bundle 生成的优化分发 APK 进行签名。Play App Signing 将您的应用签名密钥存储在 Google 的安全基础架构中，并提供升级选项以提高安全性。]])
end




--主要函数|传入包名|返回架构列表[]string和原生库{名字，大小}
function libs(packname)
  if File(tostring(File(this
    .getPackageManager()
    .getApplicationInfo(packname, 0)
    .sourceDir)
    .getParent()).."/lib/").exists() then
    local archlist=luajava.astable(
    File(tostring(File(this
    .getPackageManager()
    .getApplicationInfo(packname, 0)
    .sourceDir)
    .getParent()).."/lib/").list())
    local arch={}--架构信息
    for k,v in pairs(archlist) do
      table.insert(arch,tostring(v))
      libfile=luajava.astable(
      File(tostring(File(this
      .getPackageManager()
      .getApplicationInfo(packname, 0)
      .sourceDir)
      .getParent()).."/lib/"..tostring(v).."/").list())
    end
    local lib={}--库
    for _,v pairs(libfile) do
      libsize=File(tostring(File(this
      .getPackageManager()
      .getApplicationInfo(packname, 0)
      .sourceDir)
      .getParent()).."/lib/"..arch[1].."/"..tostring(v)).length()
      table.insert(lib,{name=tostring(v),sizes="("..Formatter.formatFileSize(activity,libsize)..")"})
    end
    return arch,lib
   else
    无原生库=true
    加bit(64,"无原生库")
    return {},{}
  end

end


--======原生库
无原生库=false
架构,原生库=libs(全局包名)

local 标题=""
for _,v pairs(架构) do
  标题=标题..","..v
end
--标题栏.title=标题栏.title..标题
__原生库=dump(原生库)


适配器("ysk",原生库)




function 显示extract()
  extract.Visibility=0
end

task(100,function()
  线程=thread(function(安装包路径,原生库,无原生库,night)
    require "import"
    import "android.content.pm.PackageManager"
    import "android.text.format.Formatter"
    import "mod.zip"
    zr=zip.open(安装包路径,'r')--以读取模式打开zip
    ziptable=dump(zr:list())

    armv8=false
    armv7=false
    armabi=false
    x86=false
    x64=false
    if ziptable:find("zipfile: lib/arm64%-v8a")
      armv8=true
      call("加bit",64,"arm64-v8a")
    end
    if ziptable:find("zipfile: lib/armeabi%-v7a")
      call("加bit",32,"armeabi-v7a")
      armv7=true
    end
    if ziptable:find("zipfile: lib/armeabi")
      call("加bit",32,"armeabi")
      armabi=true
    end
    if ziptable:find("zipfile: lib/x86_64")
      call("加bit",64,"x86_64")
      x64=true
    end
    if ziptable:find("zipfile: lib/x86")
      call("加bit",32,"x86")
      x86=true
    end

    if ziptable:find("zipfile: kotlin/")
      call("加attr","kotlin.png","Kotlin",[[Kotlin 是一种在 Java 虚拟机上运行的静态类型编程语言。虽然与 Java 语法并不兼容，但在 JVM 环境中 Kotlin 被设计成可以和 Java 代码相互运作，并可以重复使用如 Java 集合框架等的现有 Java 引用的函数库。]])
    end
    call("showbit")
    if ziptable:find("zipfile: META%-INF/MANIFEST.MF")
      if zr:read('META-INF/MANIFEST.MF'):find("Created%-By: Android Gradle") then
        if night then
          call("加attr","gradlenight","Gradle",[[Android Studio 构建系统以 Gradle 为基础，并且 Android Gradle 插件添加了几项专用于构建 Android 应用的功能。虽然 Android 插件通常会与 Android Studio 的更新步调保持一致，但插件（以及 Gradle 系统的其余部分）可独立于 Android Studio 运行并单独更新。]])
         else

          call("加attr","gradle","Gradle",[[Android Studio 构建系统以 Gradle 为基础，并且 Android Gradle 插件添加了几项专用于构建 Android 应用的功能。虽然 Android 插件通常会与 Android Studio 的更新步调保持一致，但插件（以及 Gradle 系统的其余部分）可独立于 Android Studio 运行并单独更新。]])
        end
      end
    end
    if ziptable:find("zipfile: assets/main.lua")
      call("加attr","lua","Androlua","使用 Androlua 构建的应用，由于 lua 是解释型语言，可以很好在的手机等设备上调试，快速开发应用。")
    end
    if ziptable:find("zipfile: assets/pages/main/main.lua")
      call("加attr","fa.png","FusionApp2",[[使用寒歌的 FusionApp2 构建应用，使用 Lua 语言，AndroLua 的框架，可以快速构建网页应用等应用。]])
    end


    function ziplib(str)
      local libs={}
      for v,k zr:each()--遍历zip文件 k为文件名称 v为zipfile对象
        if tostring(v):find("lib/"..str) then
          table.insert(libs,{name=tostring(v):gsub("lib/"..str.."/",""),sizes="("..Formatter.formatFileSize(activity,tonumber(zr:size(v)))..")"})
        end
      end
      return libs
    end

    function reppp(...)
      return ...
    end

    if not 无原生库 and #原生库==0 then
      call("显示extract")
      if armv8 then
        call("适配器","ysk",dump(ziplib("arm64%-v8a")))
       elseif armv7 then
        call("适配器","ysk",dump(ziplib("armeabi%-v7a")))
       elseif armabi then
        call("适配器","ysk",dump(ziplib("armeabi")))
       elseif x86 then
        call("适配器","ysk",dump(ziplib("x86")))
       elseif x64 then
        call("适配器","ysk",dump(ziplib("x86_64")))
      end
    end


  end,安装包路径,原生库,无原生库,night)
end)
------==服务


function 获取服务(包名)
  packageManager = activity.getPackageManager()
  packageInfo = packageManager.getPackageInfo(包名,PackageManager.GET_SERVICES);
  services = packageInfo.services;
  if services==nil then
    return {}
   else
    return luajava.astable(services)
  end
end

--获取qq的服务
包名="com.tencent.mobileqq"
服务列表={}
for k,v in pairs(获取服务(全局包名)) do
  table.insert(服务列表,{name=tostring(v):match(" (.-)}"):gsub(全局包名,"")})
end

__服务列表=dump(服务列表)

适配器("fw",服务列表)




--============活动



function 获取活动(包名)
  packageManager = activity.getPackageManager()
  packageInfo = packageManager.getPackageInfo(包名,PackageManager.GET_ACTIVITIES);
  activities = packageInfo.activities;

  if activities==nil then

    return {}
   else
    return luajava.astable(activities)
  end
end

--获取qq的活动
包名="com.tencent.mobileqq"
活动列表={}
for k,v in pairs(获取活动(全局包名)) do
  table.insert(活动列表,{name=tostring(v):match(" (.-)}"):gsub(全局包名,"")})
end

__活动列表=dump(活动列表)

适配器("hd",活动列表)

--=====广播接收器




function 获取广播接收器(包名)
  packageManager = activity.getPackageManager()
  packageInfo = packageManager.getPackageInfo(包名,PackageManager.GET_RECEIVERS);
  receivers = packageInfo.receivers
  if receivers==nil then
    return {}
   else
    return luajava.astable(receivers)
  end
end

包名="com.tencent.mobileqq"
广播接收器列表={}
for k,v in pairs(获取广播接收器(全局包名)) do
  table.insert(广播接收器列表,{name=tostring(v):match(" (.-)}"):gsub(全局包名,"")})
end

__广播接收器列表=dump(广播接收器列表)

适配器("gbjsq",广播接收器列表)



--=====内容提供器
function 获取内容提供器(包名)
  packageManager = activity.getPackageManager()
  packageInfo = packageManager.getPackageInfo(包名,PackageManager.GET_PROVIDERS);
  providers = packageInfo.providers
  if providers==nil then
    return {}
   else
    return luajava.astable(providers)
  end
end


内容提供器列表={}
for k,v in pairs(获取内容提供器(全局包名)) do
  table.insert(内容提供器列表,{name=tostring(v):match("className=(.-)}"):gsub(全局包名,"")})
end


__内容提供器列表=dump(内容提供器列表)
适配器("nrtgq",内容提供器列表)

--========权限
function 获取权限(包名)
  local 元数据={}
  packageManager = activity.getPackageManager()
  packageInfo = packageManager.getPackageInfo(包名, PackageManager.GET_ACTIVITIES | PackageManager.GET_META_DATA)
  permisions = packageManager.getPackageInfo(包名, PackageManager.GET_PERMISSIONS).requestedPermissions
  if permisions==nil then

    return {}
   else
    return luajava.astable((permisions))
  end
end

--获取qq的权限
权限=获取权限(全局包名)
local 包名=全局包名
local 权限列表={}
for _,v in pairs(权限) do
  pm = activity.getPackageManager();
  permission = (PackageManager.PERMISSION_GRANTED == pm.checkPermission(v, 包名));
  if permission then
    table.insert(权限列表,{name=v,pers=false})
   else
    table.insert(权限列表,{name=v,pers=true})
  end
end

适配器("qx",权限列表)


--===元数据
--主要函数，返回table
function 获取元数据(包名)
  local 元数据={}
  import "android.content.pm.PackageManager"
  appInfo = this.getPackageManager().getApplicationInfo(包名, PackageManager.GET_META_DATA);
  if appInfo.metaData==nil then
    return {}
   else
    for i=0,appInfo.metaData.size()-1 do
      keySet = ArrayList(appInfo.metaData.keySet()).get(i)
      table.insert(元数据,{key=tostring(keySet),value=tostring(appInfo.metaData.get(keySet))})
    end
    return 元数据
  end
end


--获取qq的元数据
适配器("ysj",获取元数据(全局包名))


numbers.text=tostring(#原生库)

vp.setOnPageChangeListener(ViewPager.OnPageChangeListener{
  onPageSelected=function(v)
    if v==0 then
      numbers.text=tostring(#原生库)
     elseif v==1 then
      numbers.text=tostring(#服务列表)
     elseif v==2 then

      numbers.text=tostring(#活动列表)

     elseif v==3 then

      numbers.text=tostring(#广播接收器列表)

     elseif v==4 then

      numbers.text=tostring(#内容提供器列表)
     elseif v==5 then

      --
      numbers.text=tostring(#权限列表)

     elseif v==6 then

      numbers.text=tostring(#获取元数据(全局包名))
    end
end})



包名,版本号,最后更新时间,图标,应用名称,版本=GetAppInfo(全局包名)
name.Text=应用名称
packname.Text=包名
version.Text=版本号.." ("..tostring(版本)..")"
icon.ImageDrawable=图标

myY=dp2px(92)
appbar.addOnOffsetChangedListener{
  onOffsetChanged=function(v,m)

    --垂直方向偏移量
    offset = Math.abs(m);

    父布局.setY(myY+offset/2)
    --最大偏移距离
    scrollRange = appbar.getTotalScrollRange();
    if offset==scrollRange then
      标题栏.title=应用名称
      父布局.Visibility=8
     else
      父布局.Visibility=0
      标题栏.title=""
    end
  end
}



toolbar.layoutParams.collapseMode=1
menu=toolbar.menu
menu.add(0,0,0,"搜索").setIcon(R.drawable.abc_ic_search_api_material).setShowAsAction(1).setIconTintList(ColorStateList.valueOf(cc.c.on_background))
toolbar.setNavigationIcon(MDC_R.drawable.abc_ic_ab_back_material)
toolbar.setNavigationOnClickListener{
  onClick=function()
    activity.finish()

  end
}
--[[menu.setOptionalIconsVisible(true)
toolbar.layoutParams.collapseMode=1
activity.supportActionBar=toolbar
activity.supportActionBar.displayHomeAsUpEnabled=true

activity.supportActionBar=nil
toolbar.onMenuItemClick=function(item)
  if item.title=="搜索" then


  end
end
]]




function onDestroy()
  线程=nil
  local System = luajava.bindClass "java.lang.System"
  System.gc()
  --   System.runFinalization()
  --   collectgarbage("collect")
end