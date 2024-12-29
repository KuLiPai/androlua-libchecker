activity.setTheme(R.style.Theme_ReOpenLua_Material3)

import "androidx.appcompat.app.AppCompatActivity"
import "androidx.appcompat.app.AppCompatDelegate"
夜间模式=AppCompatDelegate.getDefaultNightMode()

if Build.VERSION.SDK_INT >= 21 then
  window = activity.getWindow()
  window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
  window.setStatusBarColor(Color.TRANSPARENT);
  window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
  window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
 else
  window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
  window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
end


--异形屏横屏适配
pcall(function()
  lp = activity.getWindow().getAttributes();
  lp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
end)