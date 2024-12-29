
DynamicColors.applyIfAvailable(this)


function isNightMode()
  local configuration = activity.getResources().getConfiguration();
  return configuration.uiMode+1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode-1==configuration.UI_MODE_NIGHT_YES or configuration.uiMode==configuration.UI_MODE_NIGHT_YES
end
if isNightMode() then
   night=true
else
   night=false
end
--注意是系统

local themeUtil=LuaThemeUtil(this)
MDC_R=luajava.bindClass"com.google.android.material.R"
surfaceColor=themeUtil.getAnyColor(MDC_R.attr.colorSurface)
--更多颜色分类 请查阅Material.io官方文档
backgroundc=themeUtil.getAnyColor(android.R.attr.colorBackground)
surfaceVar=themeUtil.getAnyColor(MDC_R.attr.colorSurfaceVariant)
--[[titleColor=themeUtil.getTitleTextc()
primaryc=themeUtil.getPrimaryc()
primarycVar=themeUtil.getAnyColor(MDC_R.attr.colorPrimaryVariant)]]


local 颜色d={
"m3_sys_color_dynamic_dark_background",
"m3_sys_color_dynamic_dark_inverse_on_surface",
"m3_sys_color_dynamic_dark_inverse_primary",
"m3_sys_color_dynamic_dark_inverse_surface",
"m3_sys_color_dynamic_dark_on_background",
"m3_sys_color_dynamic_dark_on_primary",
"m3_sys_color_dynamic_dark_on_primary_container",
"m3_sys_color_dynamic_dark_on_secondary",
"m3_sys_color_dynamic_dark_on_secondary_container",
"m3_sys_color_dynamic_dark_on_surface",
"m3_sys_color_dynamic_dark_on_surface_variant",
"m3_sys_color_dynamic_dark_on_tertiary",
"m3_sys_color_dynamic_dark_on_tertiary_container",
"m3_sys_color_dynamic_dark_outline",
"m3_sys_color_dynamic_dark_primary",
"m3_sys_color_dynamic_dark_primary_container",
"m3_sys_color_dynamic_dark_secondary",
"m3_sys_color_dynamic_dark_secondary_container",
"m3_sys_color_dynamic_dark_surface",
"m3_sys_color_dynamic_dark_surface_variant",
"m3_sys_color_dynamic_dark_tertiary",
"m3_sys_color_dynamic_dark_tertiary_container",
}

local 颜色l={"m3_sys_color_dynamic_light_background",
"m3_sys_color_dynamic_light_inverse_on_surface",
"m3_sys_color_dynamic_light_inverse_primary",
"m3_sys_color_dynamic_light_inverse_surface",
"m3_sys_color_dynamic_light_on_background",
"m3_sys_color_dynamic_light_on_primary",
"m3_sys_color_dynamic_light_on_primary_container",
"m3_sys_color_dynamic_light_on_secondary",
"m3_sys_color_dynamic_light_on_secondary_container",
"m3_sys_color_dynamic_light_on_surface",
"m3_sys_color_dynamic_light_on_surface_variant",
"m3_sys_color_dynamic_light_on_tertiary",
"m3_sys_color_dynamic_light_on_tertiary_container",
"m3_sys_color_dynamic_light_outline",
"m3_sys_color_dynamic_light_primary",
"m3_sys_color_dynamic_light_primary_container",
"m3_sys_color_dynamic_light_secondary",
"m3_sys_color_dynamic_light_secondary_container",
"m3_sys_color_dynamic_light_surface",
"m3_sys_color_dynamic_light_surface_variant",
"m3_sys_color_dynamic_light_tertiary",
"m3_sys_color_dynamic_light_tertiary_container",
}



错误色d={
"m3_sys_color_dark_error",
"m3_sys_color_dark_error_container",
"m3_sys_color_dark_on_error",
"m3_sys_color_dark_on_error_container",
}

错误色l={
"m3_sys_color_light_error",
"m3_sys_color_light_error_container",
"m3_sys_color_light_on_error",
"m3_sys_color_light_on_error_container",

}

cc={c={}}

if night then
for k,v in pairs(错误色d) do
_ENV["cc"][v:gsub("m3_sys_color_dark_","")]=_ENV["MDC_R"]["color"][v]
_ENV["cc"]["c"][v:gsub("m3_sys_color_dark_","")]=activity.getColor(_ENV["MDC_R"]["color"][v])
end
else
for k,v in pairs(错误色l) do
_ENV["cc"][v:gsub("m3_sys_color_light_","")]=_ENV["MDC_R"]["color"][v]
_ENV["cc"]["c"][v:gsub("m3_sys_color_light_","")]=activity.getColor(_ENV["MDC_R"]["color"][v])
end
end


if Build.VERSION.SDK_INT <31 then
-- 默认颜色
if night then

--错误色
for k,v in pairs(错误色d) do
_ENV["cc"][v:gsub("m3_sys_color_dark_","")]=_ENV["MDC_R"]["color"][v]
end

for k,v in pairs(颜色d) do
_ENV["cc"][v:gsub("m3_sys_color_dynamic_dark_","")]=_ENV["MDC_R"]["color"][v:gsub("dynamic_","")]

_ENV["cc"]["c"][v:gsub("m3_sys_color_dynamic_dark_","")]=activity.getColor(_ENV["MDC_R"]["color"][v:gsub("dynamic_","")])
end

else
for k,v in pairs(颜色l) do
_ENV["cc"][v:gsub("m3_sys_color_dynamic_light_","")]=_ENV["MDC_R"]["color"][v:gsub("dynamic_","")]

_ENV["cc"]["c"][v:gsub("m3_sys_color_dynamic_light_","")]=activity.getColor(_ENV["MDC_R"]["color"][v:gsub("dynamic_","")])
end
end
else
-- 动态颜色
if night then
for k,v in pairs(颜色d) do
_ENV["cc"][v:gsub("m3_sys_color_dynamic_dark_","")]=_ENV["MDC_R"]["color"][v]

_ENV["cc"]["c"][v:gsub("m3_sys_color_dynamic_dark_","")]=activity.getColor(_ENV["MDC_R"]["color"][v])
end
else
for k,v in pairs(颜色l) do
_ENV["cc"][v:gsub("m3_sys_color_dynamic_light_","")]=_ENV["MDC_R"]["color"][v]

_ENV["cc"]["c"][v:gsub("m3_sys_color_dynamic_light_","")]=activity.getColor(_ENV["MDC_R"]["color"][v])
end
end
end




typedValue = TypedValue()
activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, typedValue, true)


local window = activity.getWindow()
window.setStatusBarColor(surfaceVar)
window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
window.setNavigationBarColor(surfaceVar)
if night then
window.getDecorView().setSystemUiVisibility( View.SYSTEM_UI_FLAG_LAYOUT_STABLE )--|View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
else
window.getDecorView().setSystemUiVisibility( View.SYSTEM_UI_FLAG_LAYOUT_STABLE |View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
end