{
  LinearLayout,
  id="父布局",
  Orientation=1,
  layout_width="fill",
  layout_height="wrap",
  {LinearLayout,
    layout_width="fill",
    layout_height="wrap",
   
    {LinearLayout,
    paddingTop="4dp",
    paddingBottom="4dp",
    layout_weight=1,
      Orientation=1,
      layout_width="wrap",
      layout_height="fill",
    {MaterialTextView,
      layout_width="wrap",
      layout_height="wrap",
      textSize="14sp",
      layout_marginLeft="12dp",
      layout_marginRight="12dp",
      id="name",
      textColor=cc.c.on_background,
      textStyle="bold",
    },
    {MaterialTextView,
    layout_marginLeft="12dp",
      layout_marginRight="12dp",
      textSize="12sp",
      id="size",
    },
    },
    {LinearLayout,
      Orientation=0,
      layout_width="wrap",
      layout_height="fill",
    {MaterialCardView,
    strokeColor=0,
        strokeWidth="0",
    layout_marginTop="4dp",
    layout_marginBottom="4dp",
      Visibility=8,

      id="label", 
     layout_gravity="center",
      layout_marginRight="16dp",
      --layout_margin="4dp",
      layout_width="wrap",
      layout_height="32dp",
      CardElevation="3",
      radius="8dp",
      {LinearLayout,
      layout_gravity="center",
      layout_width="fill",
      
      {ImageView,
      id="labelimage",
      layout_width="18dp",
      layout_height="18dp",
      layout_gravity="center",
      layout_marginLeft="8dp",
      },
      {MaterialTextView,
        layout_marginLeft="4dp",
        layout_marginRight="12dp",
        layout_gravity="center",
        textSize="14sp",
        id="labeltext",
        textColor=cc.c.on_background,
      },
    },
    },
    },
  },
}
