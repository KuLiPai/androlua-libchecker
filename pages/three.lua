 {
        LinearLayout,
        layout_width="fill",
        layout_height="fill",
        Orientation=1,
               {TextView,
          layout_marginTop="24dp",
          layout_marginBottom="8dp",
        textColor=深色,
          text="常规",
          textSize="14sp",
          layout_marginLeft="24dp",

        },
        {LinearLayout,
          layout_width="fill",
          layout_height="80dp",
          id="夜间模式",
          -- backgroundColor=0x66457649496,
          {ImageView,
           -- imageDrawable=loadsvg(),
            layout_width="32dp",
            layout_height="32dp",
            layout_gravity="center",
            layout_marginLeft="24dp",
            layout_marginRight="16dp",
          },
          {LinearLayout,
            layout_gravity="center",
            layout_width="wrap",
            layout_height="wrap",
            Orientation=1,
        {TextView,
           text="夜间模式",
          textSize="15sp",
            
      },
        {TextView,
          text="关闭",
       id="夜间模式状态",
   },
  },



{LinearLayout,
          layout_width="fill",
          layout_height="fill",
          Orientation=0,
          
          gravity="right",
{MaterialSwitch,
id="夜间开关",
layout_gravity="center",
layout_marginRight="16dp",
},
        
 },
 }
 

}