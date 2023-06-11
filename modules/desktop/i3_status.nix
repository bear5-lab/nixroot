{ config, lib, pkgs, ... }:

{
environment.etc."i3/statusbar.toml" = {
  text = ''
    [theme]
    theme = "slick"
    
    [icons]
    icons = "awesome6"
   
    [[block]]
    block = "disk_space"
    path = "/home"
    interval = 20
    info_type = "available"
    alert_unit = "GB"
    warning = 20.0
    alert = 10.0
    format = " $icon $available "
    format_alt = " $icon $available / $total "

    [[block]]
    block = "memory"
    format = " $icon $mem_used_percents.eng(w:1) "
    format_alt = " $icon_swap $swap_free.eng(w:3,u:B,p:M)/$swap_total.eng(w:3,u:B,p:M)($swap_used_percents.eng(w:2)) "
    interval = 30
    warning_mem = 70
    critical_mem = 90
  

    [[block]]
    block = "cpu"
    interval = 1

    [[block]]
    block = "battery"
    interval = 10
    format = "$icon $percentage"

    [[block]]
    block = "sound"
          
    [[block]]
    block = "time"
    interval = 60
    format = "$icon $timestamp.datetime()"
    '';
};
}
