{ LinearLayout;
  backgroundColor=backgroundc;
  orientation="vertical";
  gravity="center",
  layout_height="fill";
  layout_width="fill";

  {FrameLayout,
    layout_width="fill",
    layout_height="fill",
    {LinearLayout,
      id="qxempty",
      Visibility=8,
      layout_height="fill";
      layout_width="fill";
      orientation="vertical";
      {ImageView,
        layout_width="fill",
        layout_marginTop="88dp",
        layout_height="137dp",
        --scaleType="centerCrop",
        layout_gravity="center",
        imageDrawable=loadsvg("empty",cc.c.grey,true),
      },
      {TextView,
        layout_marginTop="8dp",
        layout_gravity="center",
        textSize="24sp",
        textColor=cc.c.on_background,
        text="空列表",
      },
    },

    {RecyclerView,
      id="qxrec",
      layout_width="fill",
      layout_height="fill",
      -- BackgroundColor=backgroundc,
    }
  }
}