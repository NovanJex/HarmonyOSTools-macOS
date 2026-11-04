#!/bin/bash
# 鸿蒙EMUI工具箱 (macOS 移植版 - 版本 2022.08.06)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# 自动赋予执行权限并移除 macOS Gatekeeper 隔离属性（避免弹窗拦截 adb）
chmod +x "$SCRIPT_DIR/adb" "$SCRIPT_DIR"/*.command 2>/dev/null
xattr -cr "$SCRIPT_DIR" 2>/dev/null

ADB="$SCRIPT_DIR/adb"
adb() { "$ADB" "$@"; }
pause_key() { echo ""; read -n 1 -s -r -p "请按任意键继续. . . "; echo ""; }
resize_win() { printf '\e[8;%d;%dt' "$2" "$1"; }
shopt -s nocasematch
shopt -s nullglob

printf '\e]0;B站搜“一只靓仔琦” 更多好玩等你发现（版本2022.08.06持续更新）      互助Q群110555071、576797547\a'

STATE="Begain"
while true; do
case "$STATE" in
    Begain)
        rm -f "result.txt"
        rm -f "result_translat.txt"
        rm -f "系统后台白名单.txt"
        clear
        resize_win 97 35
        echo "  "
        echo "                                    鸿蒙EMUI工具箱-首页"
        echo "                全是花课余时间一点点肝出来的，如果您方便，请求您给我一点激励~      "
        echo " ==============================================================================================="
        echo ""
        echo " ================连接不上可阅读文件夹内的【遇到问题请看.txt】，查找解决办法======================"
        echo ""
        echo "  **     **                                                               *****         ****"
        echo "  **     **                                                             ***   ***     **   ***"
        echo "  **     **    *****     * **                                          **       **   **"
        echo "  *********   **   **    ***    ********     ****   **      **    **  **         **  **"
        echo "  *********  **     **   **   *** **** ***  *    *  ******   **  **   **         **    **"
        echo "  **     **  **    ***   **   **   **   ** *      * **   **   ****     **       **        **"
        echo "  **     **   **   ****  **   **   **   **  *    *  **   **    **       ***   ***   ***    **"
        echo "  **     **    ****   ** **   **   **   **   ****   **   **   **          *****       ******"
        echo "                                                            **        "
        echo "                                                                      **********"
        echo "                                                                      **********     TOOLSBOX"
        echo " "
        echo " ==============================================================================================="
        echo " ==============================================================================================="
        echo ""
        echo ""
        echo "                                     【小白连接步骤】"
        echo "==============         1、开启开发者选项：设置-关于手机-连续点击版本号            ==============="
        echo "==============         2、打开USB调试：设置-系统和更新-开发者选项-usb调试         ==============="
        echo "==============         3、数据线将手机连接电脑（必须是支持数据传输的线）          ==============="
        echo "==============         4、拉下通知栏，将  “仅充电”  改为  “传输文件”          ==============="
        echo "==============         5、弹出“是否允许USB调试”点击确定（不可或缺）             ==============="
        echo "==============         6、不弹授权大概是驱动问题，安装华为（荣耀）手机助手连接  =========="
        echo ""
        echo ""
        echo "===============================连接成功后会自动开启主菜单======================================="
        adb wait-for-device
        echo "=======================分割线====================" >> "操作记录.txt"
        echo "以下是您本次操作记录，如不需要，您可删除，记录会无限叠加" >> "操作记录.txt"
        echo "" >> "操作记录.txt"
        echo "" >> "操作记录.txt"
        STATE="STARTS"; continue
        ;;
    STARTS)
        clear
        resize_win 97 35
        echo "  "
        echo "                                       鸿蒙工具箱-主菜单"
        echo "                 全是花课余时间一点点肝出来的，如果可以，请求您给我一点鼓励~      "
        echo " ==============================================================================================="
        echo " 【代码】       【项目】                                         【备注】                                                                                               "
        echo "    1           智慧搜索                                =下拉搜索：误触+广告"
        echo "    2           智慧语音                                =后台占运存特大"
        echo "    3           智慧识屏                                =双指按屏扫文字"
        echo "    4           智慧建议                                =桌面的智慧卡片"
        echo "    5           智慧助手-今天                           =关闭也占用运存"
        echo "    6           华为音乐                                =打开慢且占用高"
        echo "    7           服务中心                                =上滑的卡片中心"
        echo "    8           华为钱包                                =不用NFC建议删"
        echo "    9            天际通                                 =买无卡流量用的"
        echo "    10          冗余服务                                =无用服务/推广，执行后有说明"
        echo "    11          谷歌服务                                =不依赖/憎恨谷歌可删（不建议）"
        echo "    12         快应用中心                               =类似小程序中心"
        echo "    13          运动健康                                =运动健康及插件"
        echo "    14       巅峰性能模式（-14开启，+14关闭）          =游戏更稳，全局高刷，日常建议关"
        echo "                                                      荣耀9麒麟960：飞车王者更稳"
        echo " "
        echo "    20         系统禁更（-20禁更，+20恢复）             =禁止系统催更新"
        echo " "
        echo "   【使用举例】：代码前输 -卸载 ， 输 +装回，例如 -1 卸载智慧搜索， +1 装回智慧搜索"
        echo " ==============================================================================================="
        echo "  【模式跳转】 任何时候、位置输入都可跳转！"
        echo "           m1    主菜单"
        echo "           m2    定制模式                               （开放更多系统软件功能） "
        echo "           m3    监视模式                               （查看系统、软件等信息）"
        echo "           m4    动画模式                               （无极调节三种动画速度）"
        echo "           m5    功能模式                               （系统参数和控制的功能）"
        echo "           m6    瘦身模式                               （暴力清理软件的缓存等）"
        echo "           help  帮助模式                               （不明白的地方可以查看）          "
        echo "==============================================================================================="
        echo ""
        read -r -p "输入后回车(-是卸载，+是装回）:" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  执行了：   $choice" >> "操作记录.txt"
        if [[ "$choice" == "+1" ]]; then STATE="1a"; continue; fi
        if [[ "$choice" == "+2" ]]; then STATE="2a"; continue; fi
        if [[ "$choice" == "+3" ]]; then STATE="3a"; continue; fi
        if [[ "$choice" == "+4" ]]; then STATE="4a"; continue; fi
        if [[ "$choice" == "+5" ]]; then STATE="5a"; continue; fi
        if [[ "$choice" == "+6" ]]; then STATE="6a"; continue; fi
        if [[ "$choice" == "+7" ]]; then STATE="7a"; continue; fi
        if [[ "$choice" == "+8" ]]; then STATE="8a"; continue; fi
        if [[ "$choice" == "+9" ]]; then STATE="9a"; continue; fi
        if [[ "$choice" == "+10" ]]; then STATE="10a"; continue; fi
        if [[ "$choice" == "+11" ]]; then STATE="11a"; continue; fi
        if [[ "$choice" == "+12" ]]; then STATE="12a"; continue; fi
        if [[ "$choice" == "+13" ]]; then STATE="13a"; continue; fi
        if [[ "$choice" == "+14" ]]; then STATE="14a"; continue; fi
        if [[ "$choice" == "+20" ]]; then STATE="20a"; continue; fi
        if [[ "$choice" == "-1" ]]; then STATE="1"; continue; fi
        if [[ "$choice" == "-2" ]]; then STATE="2"; continue; fi
        if [[ "$choice" == "-3" ]]; then STATE="3"; continue; fi
        if [[ "$choice" == "-4" ]]; then STATE="4"; continue; fi
        if [[ "$choice" == "-5" ]]; then STATE="5"; continue; fi
        if [[ "$choice" == "-6" ]]; then STATE="6"; continue; fi
        if [[ "$choice" == "-7" ]]; then STATE="7"; continue; fi
        if [[ "$choice" == "-8" ]]; then STATE="8"; continue; fi
        if [[ "$choice" == "-9" ]]; then STATE="9"; continue; fi
        if [[ "$choice" == "-10" ]]; then STATE="10"; continue; fi
        if [[ "$choice" == "-11" ]]; then STATE="11"; continue; fi
        if [[ "$choice" == "-12" ]]; then STATE="12"; continue; fi
        if [[ "$choice" == "-13" ]]; then STATE="13"; continue; fi
        if [[ "$choice" == "-14" ]]; then STATE="14"; continue; fi
        if [[ "$choice" == "-20" ]]; then STATE="20"; continue; fi
        STATE="STARTS"; continue
        ;;
    STARTS2)
        clear
        resize_win 97 34
        echo "  "
        echo "                      重要项目可能关联其它功能或有风险，根据情况慎重删减   "
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo "==============================================================================================="
        echo " 【定制模式】                                                                                                   "
        echo "      01   华为分享                017   应用商店              033   HiCar智行"
        echo "      02   华为浏览器              018   息屏显示              034   华为智慧引擎"
        echo "      03   HMS core                019   相机                  035   云空间"
        echo "      04   紧急信息                020   畅连                  036   服务/ 我的华为"
        echo "      05   游戏空间                021   讯飞语音引擎          037   华为视频"
        echo "      06   工作资料设置            022   查找手机              038   华为阅读"
        echo "      07   html查看器              023   彩信服务              039   k歌特效"
        echo "      08   百度输入法              024   杂志锁屏              040   工程菜单"
        echo "      09   隐私空间                025   备份                  041   进入基于9.1的鸿蒙专项"
        echo "      010  悬浮球                  026   主题                  042   拨号广告（顺便恢复5G开关）"
        echo "      011  滚动截屏                027   智能检测              043   旅行助手"
        echo "      012  sim卡应用               028   计算器                044   天气"
        echo "      013  悬浮导航                029   个人紧急信息          "
        echo "      014  花瓣剪辑                030   智慧视觉（扫一扫）         "
        echo "      015  多屏协同                031   时 钟           "
        echo "      016  备忘录                  032   打印服务              "
        echo "           "
        echo "      000   还原您所有的操作                                   999  引导我进行安全的精简"
        echo " "
        echo "                       "
        echo "   【代码举例】：-01 执行卸载【华为分享】，+01 装回【华为分享】"
        echo "                 代码000和999不需要带 + 或 - 号"
        echo "==============================================================================================="
        echo ""
        read -r -p "输入后回车(-是卸载，+是装回）:" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  执行了：   $choice" >> "操作记录.txt"
        if [[ "$choice" == "000" ]]; then STATE="000"; continue; fi
        if [[ "$choice" == "+01" ]]; then STATE="01a"; continue; fi
        if [[ "$choice" == "+02" ]]; then STATE="02a"; continue; fi
        if [[ "$choice" == "+03" ]]; then STATE="03a"; continue; fi
        if [[ "$choice" == "+04" ]]; then STATE="04a"; continue; fi
        if [[ "$choice" == "+05" ]]; then STATE="05a"; continue; fi
        if [[ "$choice" == "+06" ]]; then STATE="06a"; continue; fi
        if [[ "$choice" == "+07" ]]; then STATE="07a"; continue; fi
        if [[ "$choice" == "+08" ]]; then STATE="08a"; continue; fi
        if [[ "$choice" == "+09" ]]; then STATE="09a"; continue; fi
        if [[ "$choice" == "+010" ]]; then STATE="010a"; continue; fi
        if [[ "$choice" == "+011" ]]; then STATE="011a"; continue; fi
        if [[ "$choice" == "+012" ]]; then STATE="012a"; continue; fi
        if [[ "$choice" == "+013" ]]; then STATE="013a"; continue; fi
        if [[ "$choice" == "+014" ]]; then STATE="014a"; continue; fi
        if [[ "$choice" == "+015" ]]; then STATE="015a"; continue; fi
        if [[ "$choice" == "+016" ]]; then STATE="016a"; continue; fi
        if [[ "$choice" == "+017" ]]; then STATE="017a"; continue; fi
        if [[ "$choice" == "+018" ]]; then STATE="018a"; continue; fi
        if [[ "$choice" == "+019" ]]; then STATE="019a"; continue; fi
        if [[ "$choice" == "+020" ]]; then STATE="020a"; continue; fi
        if [[ "$choice" == "+021" ]]; then STATE="021a"; continue; fi
        if [[ "$choice" == "+022" ]]; then STATE="022a"; continue; fi
        if [[ "$choice" == "+023" ]]; then STATE="023a"; continue; fi
        if [[ "$choice" == "+024" ]]; then STATE="024a"; continue; fi
        if [[ "$choice" == "+025" ]]; then STATE="025a"; continue; fi
        if [[ "$choice" == "+026" ]]; then STATE="026a"; continue; fi
        if [[ "$choice" == "+027" ]]; then STATE="027a"; continue; fi
        if [[ "$choice" == "+028" ]]; then STATE="028a"; continue; fi
        if [[ "$choice" == "+029" ]]; then STATE="029a"; continue; fi
        if [[ "$choice" == "+030" ]]; then STATE="030a"; continue; fi
        if [[ "$choice" == "+031" ]]; then STATE="031a"; continue; fi
        if [[ "$choice" == "+032" ]]; then STATE="032a"; continue; fi
        if [[ "$choice" == "+033" ]]; then STATE="033a"; continue; fi
        if [[ "$choice" == "+034" ]]; then STATE="034a"; continue; fi
        if [[ "$choice" == "+035" ]]; then STATE="035a"; continue; fi
        if [[ "$choice" == "+036" ]]; then STATE="036a"; continue; fi
        if [[ "$choice" == "+037" ]]; then STATE="037a"; continue; fi
        if [[ "$choice" == "+038" ]]; then STATE="038a"; continue; fi
        if [[ "$choice" == "+039" ]]; then STATE="039a"; continue; fi
        if [[ "$choice" == "+040" ]]; then STATE="040a"; continue; fi
        if [[ "$choice" == "+041" ]]; then STATE="041a"; continue; fi
        if [[ "$choice" == "+042" ]]; then STATE="042a"; continue; fi
        if [[ "$choice" == "+043" ]]; then STATE="043a"; continue; fi
        if [[ "$choice" == "+044" ]]; then STATE="044a"; continue; fi
        if [[ "$choice" == "+999" ]]; then STATE="999a"; continue; fi
        if [[ "$choice" == "-01" ]]; then STATE="01"; continue; fi
        if [[ "$choice" == "-02" ]]; then STATE="02"; continue; fi
        if [[ "$choice" == "-03" ]]; then STATE="03"; continue; fi
        if [[ "$choice" == "-04" ]]; then STATE="04"; continue; fi
        if [[ "$choice" == "-05" ]]; then STATE="05"; continue; fi
        if [[ "$choice" == "-06" ]]; then STATE="06"; continue; fi
        if [[ "$choice" == "-07" ]]; then STATE="07"; continue; fi
        if [[ "$choice" == "-08" ]]; then STATE="08"; continue; fi
        if [[ "$choice" == "-09" ]]; then STATE="09"; continue; fi
        if [[ "$choice" == "-010" ]]; then STATE="010"; continue; fi
        if [[ "$choice" == "-011" ]]; then STATE="011"; continue; fi
        if [[ "$choice" == "-012" ]]; then STATE="012"; continue; fi
        if [[ "$choice" == "-013" ]]; then STATE="013"; continue; fi
        if [[ "$choice" == "-014" ]]; then STATE="014"; continue; fi
        if [[ "$choice" == "-015" ]]; then STATE="015"; continue; fi
        if [[ "$choice" == "-016" ]]; then STATE="016"; continue; fi
        if [[ "$choice" == "-017" ]]; then STATE="017"; continue; fi
        if [[ "$choice" == "-018" ]]; then STATE="018"; continue; fi
        if [[ "$choice" == "-019" ]]; then STATE="019"; continue; fi
        if [[ "$choice" == "-020" ]]; then STATE="020"; continue; fi
        if [[ "$choice" == "-021" ]]; then STATE="021"; continue; fi
        if [[ "$choice" == "-022" ]]; then STATE="022"; continue; fi
        if [[ "$choice" == "-023" ]]; then STATE="023"; continue; fi
        if [[ "$choice" == "-024" ]]; then STATE="024"; continue; fi
        if [[ "$choice" == "-025" ]]; then STATE="025"; continue; fi
        if [[ "$choice" == "-026" ]]; then STATE="026"; continue; fi
        if [[ "$choice" == "-027" ]]; then STATE="027"; continue; fi
        if [[ "$choice" == "-028" ]]; then STATE="028"; continue; fi
        if [[ "$choice" == "-029" ]]; then STATE="029"; continue; fi
        if [[ "$choice" == "-030" ]]; then STATE="030"; continue; fi
        if [[ "$choice" == "-031" ]]; then STATE="031"; continue; fi
        if [[ "$choice" == "-032" ]]; then STATE="032"; continue; fi
        if [[ "$choice" == "-033" ]]; then STATE="033"; continue; fi
        if [[ "$choice" == "-034" ]]; then STATE="034"; continue; fi
        if [[ "$choice" == "-035" ]]; then STATE="035"; continue; fi
        if [[ "$choice" == "-036" ]]; then STATE="036"; continue; fi
        if [[ "$choice" == "-037" ]]; then STATE="037"; continue; fi
        if [[ "$choice" == "-038" ]]; then STATE="038"; continue; fi
        if [[ "$choice" == "-039" ]]; then STATE="039"; continue; fi
        if [[ "$choice" == "-040" ]]; then STATE="040"; continue; fi
        if [[ "$choice" == "-041" ]]; then STATE="041"; continue; fi
        if [[ "$choice" == "-042" ]]; then STATE="042"; continue; fi
        if [[ "$choice" == "-043" ]]; then STATE="043"; continue; fi
        if [[ "$choice" == "-044" ]]; then STATE="044"; continue; fi
        if [[ "$choice" == "999" ]]; then STATE="999"; continue; fi
        STATE="STARTS2"; continue
        ;;
    STARTS3)
        clear
        resize_win 97 34
        echo "  "
        echo "                            以下是常见问题的一些解释：  "
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo "==============================================================================================="
        echo " 【帮助模式】                                                                                                  "
        echo " 1、提示error:device not found是因为手机usb调试没连接成功，请检查连接"
        echo " 2、提示Failure [not installed for 0]是因为手机未安装此包名的APP，请忽略"
        echo " 3、手机ROM中本就没有的，无法通过工具装回，只能装回原本就有的app"
        echo " 4、代码-14提升游戏帧率带来的副作用：游戏耗电增加，可随时使用+14命令关闭"
        echo " 5、强调：负号是卸载和开启的意思，加号是安装和关闭，不必怀疑，就是这样"
        echo " 6、本工具使用的是adb接口，不会造成损坏，但您要谨防数据丢失以及未知的意外"
        echo " 7、提示“服务启动失败”是因为你把相关服务卸载了，重启后过段时间就不提醒了，如果还提醒就装回相关服务  "
        echo " 8、弹“服务启动失败”据说可以通过先卸载其它，最后再卸载【服务中心】来避免"
        echo "  "
        echo "        【连接方法】1、开启开发者选项：设置-关于手机-连续点击版本号  "
        echo "                    2、打开usb调试：设置-系统和更新-开发者选项-usb调试"
        echo "                    3、用数据线将手机连接电脑"
        echo "                    4、下拉状态栏，“仅充电”改为“传输文件”"
        echo "                    5、弹出“是否允许USB调试”点击确定                  "
        echo " "
        echo " 建议：使用完毕后请重启一次手机"
        echo "==============================================================================================="
        echo ""
        read -r -p "输代码再回车:" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        STATE="STARTS3"; continue
        ;;
    STARTS6)
        clear
        resize_win 97 34
        echo "  "
        echo "                                 功能模式：控制及参数功能  "
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo "==============================================================================================="
        echo " 【功能模式】                                                                                                  "
        echo "             G1      重启到RECOVERY界面"
        echo "             G2      无极修改亮屏时间               （可修改省电模式的亮屏时间）"
        echo "             G3      查询已连接的ADB设备            （便于管理模拟器）"
        echo "             G4      查看AOSP版本号"
        echo "             G5      切换无线ADB连接                （可作拓展屏，协同，调试等多种玩法）"
        echo "             G6      断开所有ADB设备"
        echo "             G7      把软件降级安装                 （保留数据）             "
        echo "             G8      状态栏图标精简"
        echo "             G9      手动输入包名安装/卸载 app"
        echo "             G10     手动输入包名禁用/解禁 app"
        echo "             G11     自动安装工具箱文件夹内所有apk   （可用于管理安卓子系统）"
        echo "             G12     强制固定屏幕刷新率         "
        echo "             G13     不杀后台模式                   （实验性功能）"
        echo "             G14     修改后台白名单"
        echo "            "
        echo "           新功能正在逐步建设中，均为个人测试后推出，敬请期待。。。。"
        echo " "
        echo "==============================================================================================="
        echo ""
        read -r -p "输代码再回车:" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  执行了：   $choice" >> "操作记录.txt"
        if [[ "$choice" == "g1" ]]; then STATE="g1"; continue; fi
        if [[ "$choice" == "g2" ]]; then STATE="g2"; continue; fi
        if [[ "$choice" == "g3" ]]; then STATE="g3"; continue; fi
        if [[ "$choice" == "g4" ]]; then STATE="g4"; continue; fi
        if [[ "$choice" == "g5" ]]; then STATE="g5"; continue; fi
        if [[ "$choice" == "g6" ]]; then STATE="g6"; continue; fi
        if [[ "$choice" == "g7" ]]; then STATE="g7"; continue; fi
        if [[ "$choice" == "g8" ]]; then STATE="g8"; continue; fi
        if [[ "$choice" == "g9" ]]; then STATE="g9"; continue; fi
        if [[ "$choice" == "g10" ]]; then STATE="g10"; continue; fi
        if [[ "$choice" == "g11" ]]; then STATE="g11"; continue; fi
        if [[ "$choice" == "g12" ]]; then STATE="g12"; continue; fi
        if [[ "$choice" == "g13" ]]; then STATE="g13"; continue; fi
        if [[ "$choice" == "g14" ]]; then STATE="g14"; continue; fi
        STATE="STARTS6"; continue
        ;;
    STARTS4)
        clear
        resize_win 97 34
        echo "  "
        echo "                              【监视模式】查看当前手机性能信息  "
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo "==============================================================================================="
        echo "             j1            查看 综合运行情况 "
        echo "             j2            查看 系统内存情况"
        echo "             j3            查看 系统软件包名"
        echo "             j4            查看 用户软件包名"
        echo "             j5            查看 所有软件包名"
        echo "             j6            查看 微信    内存占用情况"
        echo "             j7            查看 QQ      内存占用情况"
        echo "             j8            查看 支付宝  内存占用情况"
        echo "             j9            查看 TIM     内存占用情况"
        echo "             j10           手动输入包名查看占用情况"
        echo ""
        echo ""
        echo " "
        echo "  "
        echo "   "
        echo " "
        echo "==============================================================================================="
        echo ""
        echo "  【模式跳转】任何时候/位置输入都可跳转！"
        echo "           m1    主菜单                                 help  帮助模式    "
        echo "           m2    定制模式                               m4   动画模式"
        echo "           m3    监视模式                               m5    功能模式"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  执行了：   $choice" >> "操作记录.txt"
        if [[ "$choice" == "j1" ]]; then STATE="j1"; continue; fi
        if [[ "$choice" == "j2" ]]; then STATE="j2"; continue; fi
        if [[ "$choice" == "j3" ]]; then STATE="j3"; continue; fi
        if [[ "$choice" == "j4" ]]; then STATE="j4"; continue; fi
        if [[ "$choice" == "j5" ]]; then STATE="j5"; continue; fi
        if [[ "$choice" == "j6" ]]; then STATE="j6"; continue; fi
        if [[ "$choice" == "j7" ]]; then STATE="j7"; continue; fi
        if [[ "$choice" == "j8" ]]; then STATE="j8"; continue; fi
        if [[ "$choice" == "j9" ]]; then STATE="j9"; continue; fi
        if [[ "$choice" == "j10" ]]; then STATE="j10"; continue; fi
        STATE="STARTS4"; continue
        ;;
    1)
        clear
        adb shell pm uninstall --user 0 com.huawei.search
        adb shell pm uninstall --user 0 com.huawei.searchservice
        echo ""
        echo ""
        echo ""
        echo ""
        echo "   使用完鸿蒙工具箱后记得重启一次"
        echo "   重启后就没有下滑回弹的效果了"
        echo ""
        pause_key
        STATE="STARTS"; continue
        ;;
    1a)
        clear
        adb shell pm install-existing --user 0 com.huawei.search
        pause_key
        STATE="STARTS"; continue
        ;;
    2)
        clear
        adb shell pm uninstall --user 0 com.huawei.vassistant
        pause_key
        STATE="STARTS"; continue
        ;;
    2a)
        clear
        adb shell pm install-existing --user 0 com.huawei.vassistant
        pause_key
        STATE="STARTS"; continue
        ;;
    3)
        clear
        adb shell pm uninstall --user 0 com.huawei.hitouch
        adb shell pm uninstall --user 0 com.huawei.hiaction
        adb shell pm uninstall --user 0 com.huawei.contentsensor
        pause_key
        STATE="STARTS"; continue
        ;;
    3a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hitouch
        adb shell pm install-existing --user 0 com.huawei.hiaction
        adb shell pm install-existing --user 0 com.huawei.contentsensor
        pause_key
        STATE="STARTS"; continue
        ;;
    4)
        clear
        adb shell pm uninstall --user 0 com.huawei.ohos.suggestion
        pause_key
        STATE="STARTS"; continue
        ;;
    4a)
        clear
        adb shell pm install-existing --user 0 com.huawei.ohos.suggestion
        pause_key
        STATE="STARTS"; continue
        ;;
    5)
        clear
        adb shell pm uninstall --user 0 com.huawei.intelligent
        pause_key
        STATE="STARTS"; continue
        ;;
    5a)
        clear
        adb shell pm install-existing --user 0 com.huawei.intelligent
        pause_key
        STATE="STARTS"; continue
        ;;
    6)
        clear
        adb shell pm uninstall --user 0 com.android.mediacenter
        adb shell pm uninstall --user 0 com.huawei.music
        pause_key
        STATE="STARTS"; continue
        ;;
    6a)
        clear
        adb shell pm install-existing --user 0 com.android.mediacenter
        adb shell pm install-existing --user 0 com.huawei.music
        echo "                 "
        echo ""
        echo ""
        echo ""
        echo ""
        echo "                   建议您使用 QQ音乐简洁版 替代它"
        echo "                   网易云用户推荐旧版的网易云音乐"
        echo "                   不喜欢联网播放器可自行安装本地播放器"
        pause_key
        STATE="STARTS"; continue
        ;;
    7)
        clear
        adb shell pm uninstall --user 0 com.huawei.ohos.famanager
        echo " 请最后卸载服务中心，据说这样能够避免弹出“服务请求失败”"
        echo " 如您还需要卸载其它，请您先使用+7命令安装回服务中心"
        pause_key
        STATE="STARTS"; continue
        ;;
    7a)
        clear
        adb shell pm install-existing --user 0 com.huawei.ohos.famanager
        pause_key
        STATE="STARTS"; continue
        ;;
    8)
        clear
        adb shell pm uninstall --user 0 com.huawei.wallet
        pause_key
        STATE="STARTS"; continue
        ;;
    8a)
        clear
        adb shell pm install-existing --user 0 com.huawei.wallet
        pause_key
        STATE="STARTS"; continue
        ;;
    9)
        clear
        adb shell pm uninstall --user 0 com.huawei.hiskytone
        adb shell pm uninstall --user 0 com.huawei.skytone
        pause_key
        STATE="STARTS"; continue
        ;;
    9a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hiskytone
        adb shell pm install-existing --user 0 com.huawei.skytone
        pause_key
        STATE="STARTS"; continue
        ;;
    10)
        clear
        sleep 1
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项1/7"
        echo ""
        echo " 您是否需要以下项目？"
        echo "【sim卡应用】      不是sim卡管理，早年运营商要求加的功能"
        echo "【精品推荐】       桌面文件夹内推荐应用的毒瘤玩意"
        echo "【用户体验计划】   卡顿大户"
        echo "【小区广播】       安卓早期遗留"
        echo "【地理围栏服务】   用于管理地理禁区的，注意是你被管理"
        echo "【tips】          早年安卓2.3推出的桌面提醒小机器人服务"
        echo "【谷歌备份传输】   与框架和服务无关"
        echo "【智能建议服务】： 现在被智慧建议代替了，但服务依然留在手机里"
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.android.stk; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hifolder; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.bd; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hiview; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hiviewtunnel; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.android.UEInfoCheck; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.android.cellbroadcastreceiver; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.spaceservice; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.tips; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.google.android.backuptransport; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.pengine; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项2/7"
        echo "  "
        echo " 您是否需要【无障碍服务】功能？"
        echo "【无障碍服务】：残障人士以听代视的服务，卸载影响跳过广告的app"
        echo " 一指禅不依赖此服务，也可用一指禅跳过广告"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.google.android.marvin.talkback; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项3/7"
        echo ""
        echo " 您是否需要【AR引擎】功能？"
        echo "【AR引擎及相关插件】大多AR软件自带AR组件，但如果您依赖华为【AR测量】功能，您可以保留"
        echo " 此AR引擎会在后台缓存，即使您不运行它"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.vrservice; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.arengine.service; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项4/7"
        echo ""
        echo " 您是否需要【骨声纹插件】？"
        echo "【骨声纹插件】"
        echo "   若您购买了有骨声纹功能的华为产品，建议您保留"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.bonevoiceui; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项5/7"
        echo ""
        echo " 您是否需要【RCS服务】？"
        echo "【RCS服务】"
        echo "   早年中国移动推出的移动数字短信，给移动用户发短信用流量，资费0.01元"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.rcsserviceapplication; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项6/7"
        echo ""
        echo " 您是否需要【取词服务】？"
        echo "【取词服务】"
        echo "   智慧识屏的插件，如果你不用智慧识屏可以卸载"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.contentsensor; fi
        clear
        echo ""
        echo ""
        echo "【冗余服务】---自选项7/7"
        echo ""
        echo " 您是否需要【动态壁纸程序】？"
        echo "【动态壁纸程序】"
        echo "   可能影响到一镜到底，没有已经到底的机型可以卸载"
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.android.dreams.basic; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.android.dreams.phototable; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.livewallpaper.paradise; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.livewallpaper.mountaincloud; fi
        STATE="STARTS"; continue
        ;;
    10a)
        clear
        adb shell pm install-existing --user 0 com.huawei.vrservice
        adb shell pm install-existing --user 0 com.huawei.arengine.service
        adb shell pm install-existing --user 0 com.google.android.marvin.talkback
        adb shell pm install-existing --user 0 com.huawei.contentsensor
        adb shell pm install-existing --user 0 com.android.cellbroadcastreceiver
        adb shell pm install-existing --user 0 com.huawei.searchservice
        adb shell pm install-existing --user 0 com.huawei.spaceservice
        adb shell pm install-existing --user 0 com.huawei.rcsserviceapplication
        adb shell pm install-existing --user 0 com.huawei.bonevoiceui
        adb shell pm install-existing --user 0 com.huawei.tips
        adb shell pm install-existing --user 0 com.huawei.livewallpaper.paradise
        adb shell pm install-existing --user 0 com.huawei.livewallpaper.mountaincloud
        adb shell pm install-existing --user 0 com.huawei.pengine
        adb shell pm install-existing --user 0 com.huawei.securityserver
        adb shell pm install-existing --user 0 com.android.dreams.basic
        adb shell pm install-existing --user 0 com.android.dreams.phototable
        adb shell pm install-existing --user 0 com.android.stk
        adb shell pm install-existing --user 0 com.google.android.backuptransport
        adb shell pm install-existing --user 0 com.huawei.bd
        adb shell pm install-existing --user 0 com.huawei.hiview
        adb shell pm install-existing --user 0 com.huawei.hiviewtunnel
        adb shell pm install-existing --user 0 com.huawei.android.UEInfoCheck
        adb shell pm install-existing --user 0 com.huawei.hwdetectrepair
        echo "================================================================="
        echo ""
        echo ""
        echo "        已完成"
        echo ""
        echo ""
        echo "=================================================================="
        pause_key
        STATE="STARTS"; continue
        ;;
    11)
        clear
        adb shell pm disable-user com.google.android.gms
        adb shell pm disable-user com.google.android.gsf
        adb shell pm disable-user com.android.vending
        adb shell pm disable-user com.google.android.onetimeinitializer
        adb shell pm disable-user com.google.android.partnersetup
        adb shell pm disable-user com.google.android.marvin.talkback
        adb shell pm disable-user com.android.ext.services
        adb shell pm disable-user com.google.android.backuptransport
        adb shell pm disable-user com.google.android.gsf.login
        adb shell pm disable-user com.google.android.printservice.recommendation
        adb shell pm disable-user com.google.android.feedback
        adb shell pm disable-user com.google.android.syncadapters.calendar
        adb shell pm disable-user com.google.android.syncadapters.contacts
        adb shell pm disable-user com.google.android.gsf.login
        pause_key
        STATE="STARTS"; continue
        ;;
    11a)
        clear
        adb shell pm enable com.google.android.gms
        adb shell pm enable com.google.android.gsf
        adb shell pm enable com.android.vending
        adb shell pm enable com.google.android.onetimeinitializer
        adb shell pm enable com.google.android.partnersetup
        adb shell pm enable com.google.android.marvin.talkback
        adb shell pm enable com.android.ext.services
        adb shell pm enable com.google.android.backuptransport
        adb shell pm enable com.google.android.gsf.login
        adb shell pm enable com.google.android.printservice.recommendation
        adb shell pm enable com.google.android.feedback
        adb shell pm enable com.google.android.syncadapters.calendar
        adb shell pm enable com.google.android.syncadapters.contacts
        adb shell pm enable com.google.android.gsf.login
        pause_key
        STATE="STARTS"; continue
        ;;
    12)
        clear
        adb shell pm uninstall --user 0 com.huawei.fastapp
        pause_key
        STATE="STARTS"; continue
        ;;
    12a)
        clear
        adb shell pm install-existing --user 0 com.huawei.fastapp
        pause_key
        STATE="STARTS"; continue
        ;;
    13)
        clear
        adb shell pm uninstall --user 0 com.huawei.health
        adb shell pm uninstall --user 0 com.huawei.ohos.health
        echo "运动健康不是系统应用，若您想要恢复，需要自行到应用市场下载"
        pause_key
        STATE="STARTS"; continue
        ;;
    13a)
        clear
        adb shell pm install-existing --user 0 com.huawei.health
        adb shell pm install-existing --user 0 com.huawei.ohos.health
        pause_key
        STATE="STARTS"; continue
        ;;
    14)
        clear
        echo "  "
        echo "》》》》》》》》》》》》》请务必详细阅读以下内容《《《《《《《《《《《《《《《《《"
        echo "据说能够用巅峰性能模式卡出全局120高刷，具体方法自行去酷安搜一下"
        echo "早先我是为了打游戏才弄的这个模式的，处理器越差提升越明显，但是记得做好散热"
        echo "游戏前务必打开【游戏加速】和手机的【性能模式】，原神帧率和稳定性提升明显"
        echo "如您第一次开启，不想调试效果，直接全部解除就行"
        echo ""
        echo "使用后若卡顿掉帧及耗电高，使用+14恢复并重启即可"
        echo ""
        sleep 5
        echo ""
        echo "为方便调试，现在提供更精细化的操作，Y是/N否："
        echo " "
        echo " 【功耗管理】就是powergenie，解除后能拉满手机功耗"
        echo " 【后台唤醒】就是iaware，解除后不杀主动后台"
        echo " 【HWAPS】  解除后不降分辨率"
        echo " 以上描述仅是一般经验，具体以效果为准，您可自行组合调试合适的效果"
        echo " "
        echo " "
        echo " "
        read -r -p "是否解除功耗管理？（Y/N）:" choice1
        if [[ "$choice1" == "y" ]]; then echo " 已解除功耗管理" >> "操作记录.txt"; fi
        if [[ "$choice1" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.powergenie; fi
        read -r -p "是否解除后台管理？（Y/N）:" choice2
        if [[ "$choice2" == "y" ]]; then echo " 已解除后台管理" >> "操作记录.txt"; fi
        if [[ "$choice2" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.iaware; fi
        read -r -p "是否解除HWAPS？（Y/N）:" choice3
        if [[ "$choice3" == "y" ]]; then echo " 已解除HWAPS" >> "操作记录.txt"; fi
        if [[ "$choice3" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.android.hwaps; fi
        echo " "
        echo " "
        echo "    此链接是荣耀9启用后的效果视频【b站链接】"
        echo "  https://www.bilibili.com/video/BV1aS4y1d7c8?spm_id_from=333.999.0.0"
        echo "    选择后按ctrl+V复制，粘贴至浏览器地址即可观看"
        echo " "
        pause_key
        STATE="STARTS"; continue
        ;;
    14a)
        clear
        echo " "
        adb shell pm install-existing --user 0 com.huawei.powergenie
        adb shell pm install-existing --user 0 com.huawei.iaware
        adb shell pm install-existing --user 0 com.huawei.android.hwaps
        clear
        echo " 已关闭"
        pause_key
        STATE="STARTS"; continue
        ;;
    20)
        clear
        adb shell pm disable-user com.huawei.android.hwouc
        pause_key
        STATE="STARTS"; continue
        ;;
    20a)
        clear
        adb shell pm enable com.huawei.android.hwouc
        echo "完成恢复，请您重启"
        pause_key
        STATE="STARTS"; continue
        ;;
    000)
        clear
        echo "进行中，稍等。。。"
        echo "进度1%......."
        adb shell pm install-existing --user 0 com.huawei.search
        adb shell pm install-existing --user 0 com.huawei.vassistant
        adb shell pm install-existing --user 0 com.huawei.hitouch
        adb shell pm install-existing --user 0 com.huawei.hiaction
        adb shell pm install-existing --user 0 com.android.documentsui
        adb shell pm install-existing --user 0 com.huawei.contentsensor
        adb shell pm install-existing --user 0 com.huawei.ohos.suggestion
        adb shell pm install-existing --user 0 com.huawei.intelligent
        adb shell pm install-existing --user 0 com.android.mediacenter
        adb shell pm install-existing --user 0 com.huawei.music
        adb shell pm install-existing --user 0 com.huawei.ohos.famanager
        adb shell pm install-existing --user 0 com.huawei.wallet
        adb shell pm install-existing --user 0 com.huawei.hiskytone
        adb shell pm install-existing --user 0 com.huawei.skytone
        adb shell pm install-existing --user 0 com.huawei.vrservice
        adb shell pm install-existing --user 0 com.huawei.arengine.service
        adb shell pm install-existing --user 0 com.google.android.marvin.talkback
        adb shell pm install-existing --user 0 com.huawei.contentsensor
        adb shell pm install-existing --user 0 com.android.cellbroadcastreceiver
        adb shell pm install-existing --user 0 com.huawei.searchservice
        adb shell pm install-existing --user 0 com.huawei.spaceservice
        adb shell pm install-existing --user 0 com.huawei.rcsserviceapplication
        adb shell pm install-existing --user 0 com.huawei.bonevoiceui
        adb shell pm install-existing --user 0 com.huawei.tips
        adb shell pm install-existing --user 0 com.huawei.livewallpaper.paradise
        adb shell pm install-existing --user 0 com.huawei.livewallpaper.mountaincloud
        adb shell pm install-existing --user 0 com.huawei.pengine
        adb shell pm install-existing --user 0 com.huawei.securityserver
        adb shell pm install-existing --user 0 com.android.dreams.basic
        adb shell pm install-existing --user 0 com.android.dreams.phototable
        adb shell pm install-existing --user 0 com.android.stk
        adb shell pm install-existing --user 0 com.google.android.backuptransport
        adb shell pm install-existing --user 0 com.huawei.bd
        adb shell pm install-existing --user 0 com.huawei.hwdetectrepair
        adb shell pm enable com.google.android.gms
        adb shell pm enable com.google.android.gsf
        adb shell pm enable com.android.vending
        adb shell pm enable com.google.android.onetimeinitializer
        adb shell pm enable com.google.android.partnersetup
        adb shell pm enable com.google.android.marvin.talkback
        adb shell pm enable com.android.ext.services
        adb shell pm enable com.google.android.backuptransport
        adb shell pm enable com.google.android.gsf.login
        adb shell pm enable com.google.android.printservice.recommendation
        adb shell pm enable com.google.android.feedback
        adb shell pm enable com.google.android.syncadapters.calendar
        adb shell pm enable com.google.android.syncadapters.contacts
        adb shell pm enable com.google.android.gsf.login
        adb shell pm enable com.huawei.android.hwouc
        adb shell pm install-existing --user 0 com.huawei.powergenie
        adb shell pm install-existing --user 0 com.huawei.iaware
        adb shell pm install-existing --user 0 com.huawei.android.hwaps
        adb shell pm install-existing --user 0 com.huawei.health
        adb shell pm install-existing --user 0 com.huawei.ohos.health
        adb shell pm install-existing --user 0 com.huawei.fastapp
        adb shell pm install-existing --user 0 com.huawei.android.instantshare
        adb shell pm install-existing --user 0 com.huawei.pcassistant
        adb shell pm install-existing --user 0 com.huawei.browser
        adb shell pm install-existing --user 0 com.huawei.hwid
        echo "进度8%......."
        adb shell pm install-existing --user 0 com.android.emergency
        adb shell pm install-existing --user 0 com.huawei.gameassistant
        adb shell pm install-existing --user 0 com.android.managedprovisioning
        adb shell pm install-existing --user 0 com.android.htmlviewer
        echo "进度22%......."
        adb shell pm install-existing --user 0 com.baidu.input_huawei
        adb shell pm install-existing --user 0 com.huawei.secime
        adb shell pm install-existing --user 0 com.huawei.privatespace
        adb shell pm install-existing --user 0 com.huawei.motionservice
        adb shell pm install-existing --user 0 com.huawei.HwMultiScreenShot
        adb shell pm install-existing --user 0 com.huawei.dsdscardmanager
        adb shell pm install-existing --user 0 com.huawei.android.FloatTasks
        echo "进度45%......."
        adb shell pm install-existing --user 0 com.huawei.videoeditor
        adb shell pm install-existing --user 0 com.huawei.controlcenter
        adb shell pm install-existing --user 0 com.example.android.notepad
        adb shell pm install-existing --user 0 com.huawei.appmarket
        adb shell pm install-existing --user 0 com.huawei.aod
        adb shell pm install-existing --user 0 com.huawei.camera
        adb shell pm install-existing --user 0 com.huawei.meetime
        echo "进度65%......."
        adb shell pm install-existing --user 0 com.huawei.hwvoipservice
        adb shell pm install-existing --user 0 com.sohu.sohuvideo.emplayer
        adb shell pm install-existing --user 0 com.iflytek.speechsuite
        adb shell pm install-existing --user 0 com.huawei.android.findmyphone
        adb shell pm install-existing --user 0 com.android.mms.service
        adb shell pm install-existing --user 0 com.huawei.magazine
        adb shell pm install-existing --user 0 com.huawei.localBackup
        echo "进度83%......."
        adb shell pm install-existing --user 0 com.huawei.android.thememanager
        adb shell pm install-existing --user 0 com.huawei.hwdetectrepair
        adb shell pm install-existing --user 0 com.android.calculator2
        adb shell pm install-existing --user 0 com.android.emergency
        adb shell pm install-existing --user 0 com.android.location.fused
        adb shell pm install-existing --user 0 com.android.deskclock
        adb shell pm install-existing --user 0 com.huawei.printservice
        adb shell pm install-existing --user 0 com.android.printspooler
        adb shell pm install-existing --user 0 com.huawei.hicar
        adb shell pm install-existing --user 0 com.huawei.hiai
        adb shell pm install-existing --user 0 com.huawei.hidisk
        adb shell pm install-existing --user 0 com.huawei.hicloud
        adb shell pm install-existing --user 0 com.huawei.phoneservice
        adb shell pm install-existing --user 0 com.huawei.himovie
        adb shell pm install-existing --user 0 com.huawei.hwireader
        adb shell pm install-existing --user 0 com.huawei.hwreader.al
        echo "进度93%......."
        adb shell pm install-existing --user 0 com.huawei.android.projectmenu
        adb shell pm install-existing --user 0 com.huawei.android.karaoke
        adb shell pm install-existing --user 0 com.android.keyguard
        adb shell pm install-existing --user 0 com.huawei.suggestion
        adb shell pm install-existing --user 0 com.huawei.ohos.search
        adb shell pm install-existing --user 0 com.huawei.bd
        adb shell pm install-existing --user 0 com.huawei.hiview
        adb shell pm install-existing --user 0 com.huawei.hiviewtunnel
        adb shell pm install-existing --user 0 com.huawei.android.UEInfoCheck
        adb shell pm install-existing --user 0 com.huawei.android.karaoke
        adb shell pm install-existing --user 0 com.huawei.android.projectmenu
        adb shell pm install-existing --user 0 com.google.android.backuptransport
        adb shell pm install-existing --user 0 com.android.apps.tag
        adb shell pm install-existing --user 0 com.android.wallpaper.livepicker
        adb shell pm install-existing --user 0 package:com.android.vending
        adb shell pm install-existing --user 0 com.huawei.recsys
        adb shell pm install-existing --user 0 com.huawei.android.FloatTasks
        adb shell pm install-existing --user 0 com.android.internal.display.cutout.emulation.narrow
        adb shell pm install-existing --user 0 com.android.htmlviewer
        adb shell pm install-existing --user 0 com.huawei.iaware
        adb shell pm install-existing --user 0 com.android.stk
        adb shell pm install-existing --user 0 com.android.carrierconfig
        adb shell pm install-existing --user 0 com.huawei.scenepack
        adb shell pm install-existing --user 0 com.huawei.android.totemweather
        adb shell pm install-existing --user 0 com.huawei.himovie.partner1
        adb shell pm install-existing --user 0 com.huawei.himovie.partner2
        adb shell pm install-existing --user 0 com.tencent.qqlivehuawei
        adb shell settings put secure icon_blacklist null
        adb shell settings put global window_animation_scale 1
        adb shell settings put global transition_animation_scale 1
        adb shell settings put global animator_duration_scale 1
        echo " "
        echo "进度100%......."
        echo "]]]]]]]]]]]]]]]]]]]]]]]]已完成]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]"
        echo ""
        clear
        echo " 现在您卸载或禁用过的所有项目都装回去了"
        echo " 状态栏图标已还原为默认"
        echo " 动画速度均设置为默认"
        echo ""
        echo ""
        echo ""
        echo " "
        echo " 请您立即重启"
        sleep 5
        echo ""
        STATE="STARTS2"; continue
        ;;
    01)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.instantshare
        adb shell pm uninstall --user 0 com.huawei.pcassistant
        pause_key
        STATE="STARTS2"; continue
        ;;
    02)
        clear
        adb shell pm uninstall --user 0 com.huawei.browser
        adb shell pm uninstall --user 0 com.android.browser
        pause_key
        STATE="STARTS2"; continue
        ;;
    03)
        clear
        adb shell pm uninstall --user 0 com.huawei.hwid
        pause_key
        STATE="STARTS2"; continue
        ;;
    04)
        clear
        adb shell pm uninstall --user 0 com.android.emergency
        pause_key
        STATE="STARTS2"; continue
        ;;
    05)
        clear
        adb shell pm uninstall --user 0 com.huawei.gameassistant
        pause_key
        STATE="STARTS2"; continue
        ;;
    06)
        clear
        adb shell pm uninstall --user 0 com.android.managedprovisioning
        pause_key
        STATE="STARTS2"; continue
        ;;
    07)
        clear
        adb shell pm uninstall --user 0 com.android.htmlviewer
        pause_key
        STATE="STARTS2"; continue
        ;;
    08)
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo " --------------------------------务必仔细阅读--------------------------------"
        echo ""
        echo " 据反馈，需要先关闭安全输入法输入密码，否则卸载后不会弹出输入法"
        echo ""
        echo " 因此请您在设置中将 【输入密码时，启用安全输入键盘】 关闭,  然后继续执行卸载"
        echo ""
        echo " 不同机型不同情况，希望您谨慎考虑卸载自带输入法，【【小白不建议操作】】"
        echo ""
        echo " 【无法解锁补救措施】"
        echo " 在卸载前备份数据！！或提前开启仅充电模式下连接ADB!"
        echo " 外接键盘解锁！"
        echo ""
        echo ""
        echo ""
        echo ""
        echo "输入y卸载，输入n跳过"
        read -r -p "输入后回车:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.baidu.input_huawei; fi
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.secime; fi
        pause_key
        STATE="STARTS2"; continue
        ;;
    09)
        clear
        adb shell pm uninstall --user 0 com.huawei.privatespace
        pause_key
        STATE="STARTS2"; continue
        ;;
    010)
        clear
        adb shell pm uninstall --user 0 com.huawei.motionservice
        echo ""
        echo "       "
        echo "        可能影响到智慧感知、隔空操作、注视不息屏，有这些功能的机子不建议删"
        echo "                       "
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "        感谢B站网友  Beastars-鱼狗   给大家分享的经验："
        echo "                       \"up我找到了，悬浮球这个把辅助功能里的快捷启动及手势中的手势选项给删除了\""
        echo "        感谢B站网友  詹姆斯邦德马    给大家分享的经验："
        echo "                        \"如果把悬浮球卸载了，那么智慧感知这个功能也就消失了，它俩可能是关联的\""
        pause_key
        STATE="STARTS2"; continue
        ;;
    011)
        clear
        adb shell pm uninstall --user 0 com.huawei.HwMultiScreenShot
        pause_key
        STATE="STARTS2"; continue
        ;;
    012)
        clear
        adb shell pm uninstall --user 0 com.android.stk
        pause_key
        STATE="STARTS2"; continue
        ;;
    013)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.FloatTasks
        pause_key
        STATE="STARTS2"; continue
        ;;
    014)
        clear
        adb shell pm uninstall --user 0 com.huawei.videoeditor
        pause_key
        STATE="STARTS2"; continue
        ;;
    015)
        clear
        adb shell pm uninstall --user 0 com.huawei.controlcenter
        pause_key
        STATE="STARTS2"; continue
        ;;
    016)
        clear
        adb shell pm uninstall --user 0 com.example.android.notepad
        pause_key
        STATE="STARTS2"; continue
        ;;
    017)
        clear
        adb shell pm uninstall --user 0 com.huawei.appmarket
        pause_key
        STATE="STARTS2"; continue
        ;;
    018)
        clear
        adb shell pm uninstall --user 0 com.huawei.aod
        pause_key
        STATE="STARTS2"; continue
        ;;
    019)
        clear
        adb shell pm uninstall --user 0 com.huawei.camera
        pause_key
        STATE="STARTS2"; continue
        ;;
    020)
        clear
        adb shell pm uninstall --user 0 com.huawei.meetime
        adb shell pm uninstall --user 0 com.huawei.hwvoipservice
        pause_key
        STATE="STARTS2"; continue
        ;;
    021)
        clear
        adb shell pm uninstall --user 0 com.sohu.sohuvideo.emplayer
        adb shell pm uninstall --user 0 com.iflytek.speechsuite
        pause_key
        STATE="STARTS2"; continue
        ;;
    022)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.findmyphone
        pause_key
        STATE="STARTS2"; continue
        ;;
    023)
        clear
        adb shell pm uninstall --user 0 com.android.mms.service
        pause_key
        STATE="STARTS2"; continue
        ;;
    024)
        clear
        adb shell pm uninstall --user 0 com.huawei.magazine
        pause_key
        STATE="STARTS2"; continue
        ;;
    025)
        clear
        adb shell pm uninstall --user 0 com.huawei.localBackup
        pause_key
        STATE="STARTS2"; continue
        ;;
    026)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.thememanager
        pause_key
        STATE="STARTS2"; continue
        ;;
    027)
        clear
        adb shell pm uninstall --user 0 com.huawei.hwdetectrepair
        pause_key
        STATE="STARTS2"; continue
        ;;
    028)
        clear
        adb shell pm uninstall --user 0 com.android.calculator2
        pause_key
        STATE="STARTS2"; continue
        ;;
    029)
        clear
        adb shell pm uninstall --user 0 com.android.emergency
        pause_key
        STATE="STARTS2"; continue
        ;;
    030)
        clear
        adb shell pm uninstall --user 0 com.huawei.scanner
        echo " 已释放【扫一扫】相机插件,也叫【智慧视觉】"
        echo " 扫码功能建议使用华为浏览器或其它，打开相机的功耗较大"
        pause_key
        STATE="STARTS2"; continue
        ;;
    031)
        clear
        adb shell pm uninstall --user 0 com.android.deskclock
        pause_key
        STATE="STARTS2"; continue
        ;;
    032)
        clear
        adb shell pm uninstall --user 0 com.huawei.printservice
        adb shell pm uninstall --user 0 com.android.printspooler
        pause_key
        STATE="STARTS2"; continue
        ;;
    033)
        clear
        adb shell pm uninstall --user 0 com.huawei.hicar
        pause_key
        STATE="STARTS2"; continue
        ;;
    034)
        clear
        adb shell pm uninstall --user 0 com.huawei.hiai
        pause_key
        STATE="STARTS2"; continue
        ;;
    035)
        clear
        echo "云空间可能删不掉，被系统保护"
        echo "文件管理可能会一同被卸载"
        adb shell pm uninstall --user 0 com.huawei.hidisk
        adb shell pm uninstall --user 0 com.huawei.hicloud
        pause_key
        STATE="STARTS2"; continue
        ;;
    036)
        clear
        adb shell pm uninstall --user 0 com.huawei.phoneservice
        pause_key
        STATE="STARTS2"; continue
        ;;
    037)
        clear
        adb shell pm uninstall --user 0 com.huawei.himovie
        adb shell pm uninstall --user 0 com.huawei.himovie.partner1
        adb shell pm uninstall --user 0 com.huawei.himovie.partner2
        adb shell pm uninstall --user 0 com.tencent.qqlivehuawei
        echo ""
        echo ""
        echo ""
        echo "                          卸载华为视频后图库内无法打开视频"
        echo "                          您可输入+037装回，或安装播放器替代"
        echo "                          如MXplayer、QQ影音等简洁流畅强大的播放器"
        echo " "
        echo "                          强烈推荐华为视频海外版（没有在线内容，是存粹的本地播放器）"
        echo " "
        echo " "
        pause_key
        STATE="STARTS2"; continue
        ;;
    038)
        clear
        adb shell pm uninstall --user 0 com.huawei.hwireader
        adb shell pm uninstall --user 0 com.huawei.hwreader.al
        adb shell pm uninstall --user 0 com.huawei.hnreader
        adb shell pm uninstall --user 0 com.huawei.hwread.al
        adb shell pm uninstall --user 0 com.huawei.hwireader
        echo " 华为和荣耀一共发现有5个阅读app包名，success一个就可以了"
        pause_key
        STATE="STARTS2"; continue
        ;;
    039)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.karaoke
        pause_key
        STATE="STARTS2"; continue
        ;;
    040)
        clear
        adb shell pm uninstall --user 0 com.huawei.android.projectmenu
        pause_key
        STATE="STARTS2"; continue
        ;;
    041)
        clear
        echo " 由于政治、软件版本、系统版本原因，有些机型会存在一些非通用、不同名的包，因此特出此项为安卓9（EMUI9为参考）基准的手机深度定制。"
        adb shell pm uninstall --user 0 com.android.keyguard
        echo "  杂志锁屏"
        adb shell pm uninstall --user 0 com.huawei.suggestion
        echo "  情景智能"
        adb shell pm uninstall --user 0 com.huawei.ohos.search
        echo "  小艺搜索"
        adb shell pm uninstall --user 0 com.huawei.bd
        echo "  用户体验计划"
        adb shell pm uninstall --user 0 com.huawei.android.karaoke
        echo "  k歌特效"
        adb shell pm uninstall --user 0 com.huawei.android.projectmenu
        echo "  工程菜单"
        adb shell pm uninstall --user 0 com.google.android.backuptransport
        echo "  谷歌备份传输"
        adb shell pm uninstall --user 0 com.android.apps.tag
        echo "  标记"
        adb shell pm uninstall --user 0 com.android.wallpaper.livepicker
        echo "  动态壁纸选择器"
        adb shell pm uninstall --user 0 package:com.android.vending
        echo "  谷歌更新服务"
        adb shell pm uninstall --user 0 com.huawei.recsys
        echo "  华为智慧能力"
        adb shell pm uninstall --user 0 com.huawei.android.FloatTasks
        echo "  悬浮导航"
        adb shell pm uninstall --user 0 com.android.htmlviewer
        echo "  HTML查看器"
        pause_key
        STATE="STARTS2"; continue
        ;;
    042)
        clear
        adb shell pm uninstall --user 0 com.android.carrierconfig
        echo "若执行生效，重启后您的5G开关【将可能】出现在状态栏控件中"
        echo "卸载此功能，状态栏HD图标会消失，忽略即可（就当精简了此状态栏图标）"
        echo ""
        echo "若您对高清通话功能有需求，您可在定制模式中输入+042安装回去"
        echo "高清通话：采用4G流量替代2G通话，能够传输更高码率的声音，删掉后打电话会断数据网"
        echo ""
        pause_key
        STATE="STARTS2"; continue
        ;;
    043)
        clear
        adb shell pm uninstall --user 0 com.huawei.scenepack
        pause_key
        STATE="STARTS2"; continue
        ;;
    044)
        clear
        echo "建议使用pure天气替代，更小更简洁更流畅"
        echo " 或者可以使用魅族天气，简洁流畅"
        echo "并且桌面的天气时间小工具更加美观实用，款式更丰富"
        adb shell pm uninstall --user 0 com.huawei.android.totemweather
        pause_key
        STATE="STARTS2"; continue
        ;;
    999)
        clear
        echo ""
        echo ""
        echo " 您是否需要【智慧搜索】功能？"
        echo "【智慧搜索】在桌面下拉即可出现搜索框，为您推荐app，快速搜索各种资源，热搜热词头条资讯等"
        echo "即使您从不使用，它依然会缓存在运存里"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.search; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【智慧语音】功能？"
        echo "【智慧语音】说“小艺小艺” “你好优优”就能唤醒，可以执行操作，搜索内容，附带字幕翻译功能"
        echo " 经过监测发现它后台占用的运存较多，即使您从不使用，它依然会缓存在运存里"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.vassistant; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【智慧助手-今天】功能？"
        echo "【智慧助手-今天】也叫桌面负一屏，桌面最左一页，它带来直达的入口和大量资讯"
        echo "即使您从不使用，它依然会缓存在运存里"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.intelligent; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【华为音乐】功能？"
        echo "【华为音乐】自带的在线音乐播放app，若您有替代的app，您可以去掉"
        echo " 推荐QQ音乐简洁版，或其它本地播放器，占用小速度快广告少"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.music; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【华为视频】功能？"
        echo "【华为视频】在图库中打开视频调用的就是华为视频，若您有更强大的本地播放器，可以去掉它"
        echo " 若要去掉，推荐QQ影音播放器和MX player去替代，功能更全无推广"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.himovie; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【服务中心】功能？"
        echo "【服务中心】鸿蒙的卡片中心，从左右下角上滑打开，可以下载第三方卡片"
        echo " 相当于下载了微型的小程序作为卡片，根据个人酌情删减"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.ohos.famanager; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【华为钱包】功能？"
        echo "【华为钱包】可以支付一些东西，可以管理NFC功能：门禁卡/公交卡等nfc卡片"
        echo "若您的手机没有NFC硬件，建议去掉"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.wallet; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【快应用】功能？"
        echo "【快应用中心】相当于小程序，但各大app的快应用都是阉割版，倒逼用户下载app"
        echo " 经过监测发现它后台占用的运存较多，即使您从不使用，它依然会缓存在运存里"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.fastapp; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【华为浏览器】功能？"
        echo "【华为浏览器】如果您有很好的替代，不喜欢浏览器的推广，可以去掉"
        echo " "
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.browser; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【云空间】功能？"
        echo "【云空间】负责手机的云备份，去掉可以去除备份功能"
        echo " 但它与文件管理是同一个app，因此您需要自己安装文件管理器"
        echo " 替代的软件推荐ES文件浏览器（旧版）或者MT管理器"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hicloud; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【畅连】功能？"
        echo "【畅连】和华为设备打视频电话，聊天之类的功能，相当于简洁版小微信"
        echo " "
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.meetime; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【阅读】功能？"
        echo "【阅读】这是自带的读书看报app，若手动无法卸载，您可以在此干掉它"
        echo " 即使您从不使用，它有时依然会缓存在运存里"
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hwireader; fi
        clear
        echo ""
        echo ""
        echo " 您是否需要【Hicar智行】功能？"
        echo "【Hicar智行】若您不使用带有华为hicar功能的车，可以去除"
        echo " "
        echo ""
        read -r -p "输入y卸载，输入n跳过，输入后回车确定:" choice
        if [[ "$choice" == "y" ]]; then adb shell pm uninstall --user 0 com.huawei.hicar; fi
        clear
        echo ""
        echo " "
        echo ""
        echo ""
        echo "以上仅仅只是列出部分，帮助看不懂的小白优化自己的手机"
        echo "若您想要装回以上功能，定制模式中输入  +999  即可一键装回"
        echo ""
        echo "若您有更多优化精简的需要，您可以自行在定制模式中删改"
        echo "涉及重要的一些功能，请您谨慎删除，或做好数据备份"
        echo ""
        echo ""
        echo ""
        sleep 2
        echo "倒计时是防止您误触退出，请您务必阅读以上内容"
        echo "现在可以按任意键退出了"
        pause_key
        STATE="STARTS2"; continue
        ;;
    01a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.instantshare
        adb shell pm install-existing --user 0 com.huawei.pcassistant
        pause_key
        STATE="STARTS2"; continue
        ;;
    02a)
        clear
        adb shell pm install-existing --user 0 com.huawei.browser
        pause_key
        STATE="STARTS2"; continue
        ;;
    03a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hwid
        pause_key
        STATE="STARTS2"; continue
        ;;
    04a)
        clear
        adb shell pm install-existing --user 0 com.android.emergency
        pause_key
        STATE="STARTS2"; continue
        ;;
    05a)
        clear
        adb shell pm install-existing --user 0 com.huawei.gameassistant
        pause_key
        STATE="STARTS2"; continue
        ;;
    06a)
        clear
        adb shell pm install-existing --user 0 com.android.managedprovisioning
        pause_key
        STATE="STARTS2"; continue
        ;;
    07a)
        clear
        adb shell pm install-existing --user 0 com.android.htmlviewer
        pause_key
        STATE="STARTS2"; continue
        ;;
    08a)
        clear
        adb shell pm install-existing --user 0 com.baidu.input_huawei
        adb shell pm install-existing --user 0 com.huawei.secime
        pause_key
        STATE="STARTS2"; continue
        ;;
    09a)
        clear
        adb shell pm install-existing --user 0 com.huawei.privatespace
        pause_key
        STATE="STARTS2"; continue
        ;;
    010a)
        clear
        adb shell pm install-existing --user 0 com.huawei.motionservice
        pause_key
        STATE="STARTS2"; continue
        ;;
    011a)
        clear
        adb shell pm install-existing --user 0 com.huawei.HwMultiScreenShot
        pause_key
        STATE="STARTS2"; continue
        ;;
    012a)
        clear
        adb shell pm install-existing --user 0 com.android.stk
        pause_key
        STATE="STARTS2"; continue
        ;;
    013a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.FloatTasks
        pause_key
        STATE="STARTS2"; continue
        ;;
    014a)
        clear
        adb shell pm install-existing --user 0 com.huawei.videoeditor
        pause_key
        STATE="STARTS2"; continue
        ;;
    015a)
        clear
        adb shell pm install-existing --user 0 com.huawei.controlcenter
        pause_key
        STATE="STARTS2"; continue
        ;;
    016a)
        clear
        adb shell pm install-existing --user 0 com.example.android.notepad
        pause_key
        STATE="STARTS2"; continue
        ;;
    017a)
        clear
        adb shell pm install-existing --user 0 com.huawei.appmarket
        pause_key
        STATE="STARTS2"; continue
        ;;
    018a)
        clear
        adb shell pm install-existing --user 0 com.huawei.aod
        pause_key
        STATE="STARTS2"; continue
        ;;
    019a)
        clear
        adb shell pm install-existing --user 0 com.huawei.camera
        pause_key
        STATE="STARTS2"; continue
        ;;
    020a)
        clear
        adb shell pm install-existing --user 0 com.huawei.meetime
        adb shell pm install-existing --user 0 com.huawei.hwvoipservice
        pause_key
        STATE="STARTS2"; continue
        ;;
    021a)
        clear
        adb shell pm install-existing --user 0 com.sohu.sohuvideo.emplayer
        adb shell pm install-existing --user 0 com.iflytek.speechsuite
        pause_key
        STATE="STARTS2"; continue
        ;;
    022a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.findmyphone
        pause_key
        STATE="STARTS2"; continue
        ;;
    023a)
        clear
        adb shell pm install-existing --user 0 com.android.mms.service
        pause_key
        STATE="STARTS2"; continue
        ;;
    024a)
        clear
        adb shell pm install-existing --user 0 com.huawei.magazine
        pause_key
        STATE="STARTS2"; continue
        ;;
    025a)
        clear
        adb shell pm install-existing --user 0 com.huawei.localBackup
        pause_key
        STATE="STARTS2"; continue
        ;;
    026a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.thememanager
        pause_key
        STATE="STARTS2"; continue
        ;;
    027a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hwdetectrepair
        pause_key
        STATE="STARTS2"; continue
        ;;
    028a)
        clear
        adb shell pm install-existing --user 0 com.android.calculator2
        pause_key
        STATE="STARTS2"; continue
        ;;
    029a)
        clear
        adb shell pm install-existing --user 0 com.android.emergency
        pause_key
        STATE="STARTS2"; continue
        ;;
    030a)
        clear
        adb shell pm install-existing --user 0 com.huawei.scanner
        pause_key
        STATE="STARTS2"; continue
        ;;
    031a)
        clear
        adb shell pm install-existing --user 0 com.android.deskclock
        pause_key
        STATE="STARTS2"; continue
        ;;
    032a)
        clear
        adb shell pm install-existing --user 0 com.huawei.printservice
        adb shell pm install-existing --user 0 com.android.printspooler
        pause_key
        STATE="STARTS2"; continue
        ;;
    033a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hicar
        pause_key
        STATE="STARTS2"; continue
        ;;
    034a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hiai
        pause_key
        STATE="STARTS2"; continue
        ;;
    035a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hidisk
        adb shell pm install-existing --user 0 com.huawei.hicloud
        pause_key
        STATE="STARTS2"; continue
        ;;
    036a)
        clear
        adb shell pm install-existing --user 0 com.huawei.phoneservice
        pause_key
        STATE="STARTS2"; continue
        ;;
    037a)
        clear
        adb shell pm install-existing --user 0 com.huawei.himovie
        adb shell pm install-existing --user 0 com.huawei.himovie.partner1
        adb shell pm install-existing --user 0 com.huawei.himovie.partner2
        adb shell pm install-existing --user 0 com.tencent.qqlivehuawei
        pause_key
        STATE="STARTS2"; continue
        ;;
    038a)
        clear
        adb shell pm install-existing --user 0 com.huawei.hwireader
        adb shell pm install-existing --user 0 com.huawei.hwreader.al
        adb shell pm install-existing --user 0 com.huawei.hnreader
        adb shell pm install-existing --user 0 com.huawei.hwread.al
        adb shell pm install-existing --user 0 com.huawei.hwireader
        pause_key
        STATE="STARTS2"; continue
        ;;
    039a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.karaoke
        pause_key
        STATE="STARTS2"; continue
        ;;
    040a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.projectmenu
        pause_key
        STATE="STARTS2"; continue
        ;;
    041a)
        clear
        echo " 由于政治、软件版本、系统版本原因，有些机型会存在一些非通用、不同名的包，因此特出此项为安卓9（荣耀9）基准的手机深度定制。"
        adb shell pm install-existing --user 0 com.android.keyguard
        echo "  杂志锁屏【已装回】"
        adb shell pm install-existing --user 0 com.huawei.suggestion
        echo "  情景智能【已装回】"
        adb shell pm install-existing --user 0 com.huawei.ohos.search
        echo "  小艺搜索【已装回】"
        adb shell pm install-existing --user 0 com.huawei.bd
        echo "  用户体验计划【已装回】"
        adb shell pm install-existing --user 0 com.huawei.android.karaoke
        echo "  k歌特效【已装回】"
        adb shell pm install-existing --user 0 com.huawei.android.projectmenu
        echo "  工程菜单【已装回】"
        adb shell pm install-existing --user 0 com.google.android.backuptransport
        echo "  谷歌备份传输【已装回】"
        adb shell pm install-existing --user 0 com.android.apps.tag
        echo "  标记【已装回】"
        adb shell pm install-existing --user 0 com.android.wallpaper.livepicker
        echo "  动态壁纸选择器【已装回】"
        adb shell pm install-existing --user 0 package:com.android.vending
        echo "  谷歌更新服务【已装回】"
        adb shell pm install-existing --user 0 com.huawei.recsys
        echo "  华为智慧能力【已装回】"
        adb shell pm install-existing --user 0 com.huawei.android.FloatTasks
        echo "  悬浮导航【已装回】"
        adb shell pm install-existing --user 0 com.android.htmlviewer
        echo "  HTML查看器【已装回】"
        pause_key
        STATE="STARTS2"; continue
        ;;
    042a)
        clear
        adb shell pm install-existing --user 0 com.android.carrierconfig
        clear
        echo " "
        echo " "
        echo " "
        echo " "
        echo " 如果您输入了  +042  来想要恢复5G开关，那您搞错了，是-042"
        echo " 因为恢复5G开关是卸载通话广告的一个副作用，卸载后重启生效"
        echo " "
        echo " "
        pause_key
        STATE="STARTS2"; continue
        ;;
    043a)
        clear
        adb shell pm install-existing --user 0 com.huawei.scenepack
        pause_key
        STATE="STARTS2"; continue
        ;;
    044a)
        clear
        adb shell pm install-existing --user 0 com.huawei.android.totemweather
        pause_key
        STATE="STARTS2"; continue
        ;;
    999a)
        clear
        adb shell pm install-existing --user 0 com.huawei.search
        adb shell pm install-existing --user 0 com.huawei.vassistant
        adb shell pm install-existing --user 0 com.huawei.intelligent
        adb shell pm install-existing --user 0 com.huawei.music
        adb shell pm install-existing --user 0 com.huawei.himovie
        adb shell pm install-existing --user 0 com.huawei.ohos.famanager
        adb shell pm install-existing --user 0 com.huawei.wallet
        adb shell pm install-existing --user 0 com.huawei.fastapp
        adb shell pm install-existing --user 0 com.huawei.browser
        adb shell pm install-existing --user 0 com.huawei.hicloud
        adb shell pm install-existing --user 0 com.huawei.meetime
        adb shell pm install-existing --user 0 com.huawei.hwireader
        adb shell pm install-existing --user 0 com.huawei.hicar
        pause_key
        STATE="STARTS2"; continue
        ;;
    j1)
        clear
        resize_win 100 30
        rm -f result_translat.txt result.txt
        adb shell top -n 1 -s 6 | tr -d '\r' | sed \
            -e 's/Mem/物理内存/g' \
            -e 's/Swap/ 虚拟内存/g' \
            -e 's/total/全部/g' \
            -e 's/used/已用/g' \
            -e 's/free/剩余/g' \
            -e 's/buffers/缓冲区/g' \
            -e 's/cached/缓存/g' \
            -e 's/\[RES\]/占用/g' > result_translat.txt
        cat result_translat.txt
        pause_key
        rm -f result.txt result_translat.txt
        STATE="STARTS4"; continue
        ;;
    j2)
        clear
        adb shell free >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j3)
        clear
        resize_win 140 100
        adb shell pm list packages -s >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j4)
        clear
        resize_win 140 100
        adb shell pm list packages -3 >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j5)
        clear
        resize_win 100 100
        adb shell pm list packages >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j6)
        clear
        resize_win 140 100
        adb shell dumpsys meminfo com.tencent.mm >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j7)
        clear
        resize_win 140 100
        adb shell dumpsys meminfo com.tencent.mobileqq  >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j8)
        clear
        resize_win 140 100
        adb shell dumpsys meminfo com.eg.android.AlipayGphone >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j9)
        clear
        resize_win 140 100
        adb shell dumpsys meminfo com.tencent.tim >result.txt
        cat "result.txt"
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    j10)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo "                                  为您简易地实现监视app占用情况"
        echo " ==============================================================================================="
        echo "   您可以通过第三方app查看系统应用的包名，例如MT管理器"
        echo " ==============================================================================================="
        echo ""
        echo ""
        echo ""
        read -r -p "请您输入包名后回车：" ipnumbe
        adb shell dumpsys meminfo "$ipnumbe" >result.txt
        cat "result.txt"
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo " ==============================================================================================="
        pause_key
        rm -f "result.txt"
        rm -f "result_translat.txt"
        STATE="STARTS4"; continue
        ;;
    g1)
        clear
        resize_win 97 34
        adb reboot recovery
        pause_key
        STATE="STARTS6"; continue
        ;;
    g2)
        clear
        resize_win 97 34
        echo "  "
        echo "                                                                  "
        echo "                          输入的时间单位是毫秒ms，因此您需要计算后再输入"
        echo "  "
        echo "                                   1分钟=60秒，1秒=1000毫秒"
        echo "                          oled屏幕的上限是10分钟，超出会默认设置为10分钟"
        echo "                          切换回省电模式后还是会重置为15s，这是省电模式的特性"
        echo "                         "
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        read -r -p "输入您想要的亮屏时间（单位/毫秒）：" time
        adb shell settings put system screen_off_timeout "$time"
        echo "                                   已完成"
        pause_key
        STATE="STARTS6"; continue
        ;;
    g3)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo ""
        echo ""
        echo "以下是已连接的所有ADB设备"
        rm -f result_translat.txt result.txt
        echo ""
        echo ""
        echo ""
        echo ""
        adb devices | tr -d '\r' | sed 's/List of devices attached/-------设备序列号或ip地址-----/g' > result_translat.txt
        cat result_translat.txt
        echo ""
        echo ""
        echo ""
        echo ""
        pause_key
        rm -f result.txt result_translat.txt
        STATE="STARTS6"; continue
        ;;
    g4)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo " 您的AOSP基准版本号是"
        adb shell getprop ro.build.version.release
        echo ""
        echo "当前还不可通过adb查询open harmony相关信息，建议您到应用市场安装【应用与系统信息】查看"
        echo "共同点：目前鸿蒙OS和安卓一样同样采用了Linux内核"
        echo "不同点：HAL替换成了HDF"
        echo "        Android runtime与Harmony runtime共存（目前为了兼容生态）"
        echo "        Android java api替换成了Harmony Java api"
        echo "总结：开发难度都留给了底层硬件开发者，减少软件开发者上手难度"
        echo "信息来源：极客湾"
        pause_key
        STATE="STARTS6"; continue
        ;;
    g5)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo "                                  协助您快捷设置无线USB调试"
        echo " ==============================================================================================="
        echo "   首先将您的手机和电脑连接入同一局域网内（无防火墙的）"
        echo "   完成后按任意键继续下一步"
        pause_key
        echo " ==============================================================================================="
        adb tcpip 5555
        echo "   查询您手机当前ip地址：【设置】-【关于手机】-【状态信息】"
        echo "   IP地址一栏中首行数字串就是当前ip地址，例如 192.168.137.168"
        read -r -p "输入ip地址后回车：" ipnumbe
        echo " ==============================================================================================="
        adb connect "$ipnumbe":5555
        echo "   完成以上步骤后您拔掉数据线即可，您无线调试端口为5555"
        echo "   现在您可以在【功能模式】-查询已连接的adb设备"
        echo " ==============================================================================================="
        echo "   现在你下载一个Scrcpy就可以“多屏协同”啦，非华为手机也可以哦"
        echo "   或者用gamebench、SoloPi和perdog可以无线测试游戏帧率和温度等数据啦"
        pause_key
        echo " 设置了无线ADB" >> "操作记录.txt"
        STATE="STARTS6"; continue
        ;;
    g6)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo ""
        echo ""
        echo "通过有线连接的adb设备(可能包括虚拟机)将会被重新连接，请等待。。。"
        adb kill-server
        adb devices
        echo ""
        echo ""
        pause_key
        echo " 断开了所有ADB设备" >> "操作记录.txt"
        STATE="STARTS6"; continue
        ;;
    g7)
        clear
        resize_win 97 34
        echo "  此功能正在建设中，敬请期待。。。。"
        echo " 说实话这个功能让我微信安不上，恢复出厂了两次（恶心的微信）"
        echo " 等我调试好了再推出吧，不敢让大家冒这个险"
        pause_key
        STATE="STARTS6"; continue
        ;;
    g8)
        clear
        resize_win 97 34
        adb shell am start -n com.android.systemui/com.android.systemui.DemoMode
        clear
        echo " "
        echo "       现在请先在手机端操作，进入【状态栏】"
        echo "                              "
        echo "             特别提示：部分开关无效，因为不是原生的AOSP"
        echo "                     【耳机】是指有线耳机的状态栏图标，不包括蓝牙耳机"
        echo "                     【蓝牙】包括蓝牙耳机图标在内的蓝牙图标"
        echo "                     【音量】是“响铃” “震动” “静音”图标"
        echo "                      在定制模式中删除042项目可能也有去掉HD图标的作用"
        echo ""
        echo "       其它状态栏图标请您输入代号后回车："
        echo ""
        echo "           0.恢复默认    1.NFC   2.位置   3.省电模式  4.电池   5.护眼模式  6.信号  7.HD   "
        echo "            如果想隐藏多个，按顺输数后回车，例如 257  ，这样就隐藏了位置-护眼模式-HD图标"
        echo "                          部分图标可能无法隐藏，望知晓（没办法,别问了）"
        echo "                                       "
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo ""
        read -r -p "输图标代号再回车，或输入模式代码可跳转:" tubiao
        if [[ "$tubiao" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$tubiao" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$tubiao" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$tubiao" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$tubiao" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$tubiao" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$tubiao" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  图标隐藏中选择了：   $tubiao" >> "操作记录.txt"
        if [[ "$tubiao" == "0" ]]; then adb shell settings put secure icon_blacklist null; fi
        if [[ "$tubiao" == "1" ]]; then adb shell settings put secure icon_blacklist nfc; fi
        if [[ "$tubiao" == "2" ]]; then adb shell settings put secure icon_blacklist location; fi
        if [[ "$tubiao" == "3" ]]; then adb shell settings put secure icon_blacklist powersavingmode; fi
        if [[ "$tubiao" == "4" ]]; then adb shell settings put secure icon_blacklist battery; fi
        if [[ "$tubiao" == "5" ]]; then adb shell settings put secure icon_blacklist eyes_protect; fi
        if [[ "$tubiao" == "6" ]]; then adb shell settings put secure icon_blacklist phone_signal; fi
        if [[ "$tubiao" == "7" ]]; then adb shell settings put secure icon_blacklist volte_call; fi
        if [[ "$tubiao" == "12" ]]; then adb shell settings put secure icon_blacklist nfc,location; fi
        if [[ "$tubiao" == "13" ]]; then adb shell settings put secure icon_blacklist nfc,powersavingmode; fi
        if [[ "$tubiao" == "14" ]]; then adb shell settings put secure icon_blacklist nfc,battery; fi
        if [[ "$tubiao" == "15" ]]; then adb shell settings put secure icon_blacklist nfc,eyes_protect; fi
        if [[ "$tubiao" == "16" ]]; then adb shell settings put secure icon_blacklist nfc,phone_signal; fi
        if [[ "$tubiao" == "17" ]]; then adb shell settings put secure icon_blacklist nfc,volte_call; fi
        if [[ "$tubiao" == "23" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode; fi
        if [[ "$tubiao" == "24" ]]; then adb shell settings put secure icon_blacklist location,battery; fi
        if [[ "$tubiao" == "25" ]]; then adb shell settings put secure icon_blacklist location,eyes_protect; fi
        if [[ "$tubiao" == "26" ]]; then adb shell settings put secure icon_blacklist location,phone_signal; fi
        if [[ "$tubiao" == "27" ]]; then adb shell settings put secure icon_blacklist location,volte_call; fi
        if [[ "$tubiao" == "34" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery; fi
        if [[ "$tubiao" == "35" ]]; then adb shell settings put secure icon_blacklist powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "36" ]]; then adb shell settings put secure icon_blacklist powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "37" ]]; then adb shell settings put secure icon_blacklist powersavingmode,volte_call; fi
        if [[ "$tubiao" == "45" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect; fi
        if [[ "$tubiao" == "46" ]]; then adb shell settings put secure icon_blacklist battery,phone_signal; fi
        if [[ "$tubiao" == "47" ]]; then adb shell settings put secure icon_blacklist battery,volte_call; fi
        if [[ "$tubiao" == "56" ]]; then adb shell settings put secure icon_blacklist eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "57" ]]; then adb shell settings put secure icon_blacklist eyes_protect,volte_call; fi
        if [[ "$tubiao" == "67" ]]; then adb shell settings put secure icon_blacklist phone_signal,volte_call; fi
        if [[ "$tubiao" == "123" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode; fi
        if [[ "$tubiao" == "124" ]]; then adb shell settings put secure icon_blacklist nfc,location,battery; fi
        if [[ "$tubiao" == "125" ]]; then adb shell settings put secure icon_blacklist nfc,location,eyes_protect; fi
        if [[ "$tubiao" == "126" ]]; then adb shell settings put secure icon_blacklist nfc,location,phone_signal; fi
        if [[ "$tubiao" == "127" ]]; then adb shell settings put secure icon_blacklist nfc,location,volte_call; fi
        if [[ "$tubiao" == "234" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery; fi
        if [[ "$tubiao" == "235" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "236" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "237" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,volte_call; fi
        if [[ "$tubiao" == "345" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "346" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,phone_signal; fi
        if [[ "$tubiao" == "347" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "456" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "457" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "567" ]]; then adb shell settings put secure icon_blacklist eyes_protect,phone_signal,volte_call; fi
        if [[ "$tubiao" == "1234" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery; fi
        if [[ "$tubiao" == "1235" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "1236" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "1237" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,volte_call; fi
        if [[ "$tubiao" == "2345" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "2346" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "2347" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "3456" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "3457" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "4567" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,phone_signal,volte_call; fi
        if [[ "$tubiao" == "12345" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "12346" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,phone_signal; fi
        if [[ "$tubiao" == "12347" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "123456" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "123457" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "1234567" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,phone_signal,volte_call; fi
        STATE="g8a"; continue
        ;;
    g8a)
        clear
        echo " "
        echo "       现在请先在手机端操作，进入【状态栏】"
        echo "                              "
        echo "             特别提示：部分开关无效，因为不是原生的AOSP"
        echo "                     【耳机】是指有线耳机的状态栏图标，不包括蓝牙耳机"
        echo "                     【蓝牙】包括蓝牙耳机图标在内的蓝牙图标"
        echo "                     【音量】是“响铃” “震动” “静音”图标"
        echo "                      在定制模式中删除042项目也有去掉HD图标的作用"
        echo ""
        echo "       其它状态栏图标请您输入代号后回车："
        echo ""
        echo "           0.恢复默认    1.NFC   2.位置   3.省电模式  4.电池   5.护眼模式  6.信号  7.HD   "
        echo "            如果想隐藏多个，按顺输数后回车，例如 257  ，这样就隐藏了位置-护眼模式-HD图标"
        echo "                             部分图标可能无法隐藏，望知晓（别问了，没办法）"
        echo "                                       "
        echo "                   模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，帮助help"
        echo ""
        read -r -p "输图标代号再回车，或输入模式代码可跳转:" tubiao
        if [[ "$tubiao" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$tubiao" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$tubiao" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$tubiao" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$tubiao" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$tubiao" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$tubiao" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$tubiao" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  图标隐藏选择了：  $tubiao" >> "操作记录.txt"
        if [[ "$tubiao" == "0" ]]; then adb shell settings put secure icon_blacklist null; fi
        if [[ "$tubiao" == "1" ]]; then adb shell settings put secure icon_blacklist nfc; fi
        if [[ "$tubiao" == "2" ]]; then adb shell settings put secure icon_blacklist location; fi
        if [[ "$tubiao" == "3" ]]; then adb shell settings put secure icon_blacklist powersavingmode; fi
        if [[ "$tubiao" == "4" ]]; then adb shell settings put secure icon_blacklist battery; fi
        if [[ "$tubiao" == "5" ]]; then adb shell settings put secure icon_blacklist eyes_protect; fi
        if [[ "$tubiao" == "6" ]]; then adb shell settings put secure icon_blacklist phone_signal; fi
        if [[ "$tubiao" == "7" ]]; then adb shell settings put secure icon_blacklist volte_call; fi
        if [[ "$tubiao" == "12" ]]; then adb shell settings put secure icon_blacklist nfc,location; fi
        if [[ "$tubiao" == "13" ]]; then adb shell settings put secure icon_blacklist nfc,powersavingmode; fi
        if [[ "$tubiao" == "14" ]]; then adb shell settings put secure icon_blacklist nfc,battery; fi
        if [[ "$tubiao" == "15" ]]; then adb shell settings put secure icon_blacklist nfc,eyes_protect; fi
        if [[ "$tubiao" == "16" ]]; then adb shell settings put secure icon_blacklist nfc,phone_signal; fi
        if [[ "$tubiao" == "17" ]]; then adb shell settings put secure icon_blacklist nfc,volte_call; fi
        if [[ "$tubiao" == "23" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode; fi
        if [[ "$tubiao" == "24" ]]; then adb shell settings put secure icon_blacklist location,battery; fi
        if [[ "$tubiao" == "25" ]]; then adb shell settings put secure icon_blacklist location,eyes_protect; fi
        if [[ "$tubiao" == "26" ]]; then adb shell settings put secure icon_blacklist location,phone_signal; fi
        if [[ "$tubiao" == "27" ]]; then adb shell settings put secure icon_blacklist location,volte_call; fi
        if [[ "$tubiao" == "34" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery; fi
        if [[ "$tubiao" == "35" ]]; then adb shell settings put secure icon_blacklist powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "36" ]]; then adb shell settings put secure icon_blacklist powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "37" ]]; then adb shell settings put secure icon_blacklist powersavingmode,volte_call; fi
        if [[ "$tubiao" == "45" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect; fi
        if [[ "$tubiao" == "46" ]]; then adb shell settings put secure icon_blacklist battery,phone_signal; fi
        if [[ "$tubiao" == "47" ]]; then adb shell settings put secure icon_blacklist battery,volte_call; fi
        if [[ "$tubiao" == "56" ]]; then adb shell settings put secure icon_blacklist eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "57" ]]; then adb shell settings put secure icon_blacklist eyes_protect,volte_call; fi
        if [[ "$tubiao" == "67" ]]; then adb shell settings put secure icon_blacklist phone_signal,volte_call; fi
        if [[ "$tubiao" == "123" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode; fi
        if [[ "$tubiao" == "124" ]]; then adb shell settings put secure icon_blacklist nfc,location,battery; fi
        if [[ "$tubiao" == "125" ]]; then adb shell settings put secure icon_blacklist nfc,location,eyes_protect; fi
        if [[ "$tubiao" == "126" ]]; then adb shell settings put secure icon_blacklist nfc,location,phone_signal; fi
        if [[ "$tubiao" == "127" ]]; then adb shell settings put secure icon_blacklist nfc,location,volte_call; fi
        if [[ "$tubiao" == "234" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery; fi
        if [[ "$tubiao" == "235" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "236" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "237" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,volte_call; fi
        if [[ "$tubiao" == "345" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "346" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,phone_signal; fi
        if [[ "$tubiao" == "347" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "456" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "457" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "567" ]]; then adb shell settings put secure icon_blacklist eyes_protect,phone_signal,volte_call; fi
        if [[ "$tubiao" == "1234" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery; fi
        if [[ "$tubiao" == "1235" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,eyes_protect; fi
        if [[ "$tubiao" == "1236" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,phone_signal; fi
        if [[ "$tubiao" == "1237" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,volte_call; fi
        if [[ "$tubiao" == "2345" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "2346" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "2347" ]]; then adb shell settings put secure icon_blacklist location,powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "3456" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "3457" ]]; then adb shell settings put secure icon_blacklist powersavingmode,battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "4567" ]]; then adb shell settings put secure icon_blacklist battery,eyes_protect,phone_signal,volte_call; fi
        if [[ "$tubiao" == "12345" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect; fi
        if [[ "$tubiao" == "12346" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,phone_signal; fi
        if [[ "$tubiao" == "12347" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,volte_call; fi
        if [[ "$tubiao" == "123456" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,phone_signal; fi
        if [[ "$tubiao" == "123457" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,volte_call; fi
        if [[ "$tubiao" == "1234567" ]]; then adb shell settings put secure icon_blacklist nfc,location,powersavingmode,battery,eyes_protect,phone_signal,volte_call; fi
        STATE="g8a"; continue
        ;;
    g9)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo "                                  为您简易地实现卸载内置app"
        echo " ==============================================================================================="
        echo "   您可以通过第三方app查看系统应用的包名，例如MT管理器"
        echo "   涉及系统应用，请您务必谨慎，必要时做好数据备份"
        echo " ==============================================================================================="
        read -r -p "输入1进入卸载，输入2进入安装：" cho
        echo ""
        echo ""
        echo ""
        read -r -p "请您输入包名后回车：" ipnumbe
        if [[ "$cho" == "1" ]]; then adb shell pm uninstall --user 0 "$ipnumbe"; fi
        if [[ "$cho" == "2" ]]; then adb shell pm install-existing --user 0 "$ipnumbe"; fi
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo " ==============================================================================================="
        pause_key
        if [[ "$cho" == "1" ]]; then echo " 卸载了\"$ipnumbe\"" >> "操作记录.txt"; fi
        if [[ "$cho" == "2" ]]; then echo " 安装了\"$ipnumbe\"" >> "操作记录.txt"; fi
        STATE="STARTS6"; continue
        ;;
    g10)
        clear
        resize_win 97 34
        echo ""
        echo ""
        echo "                                  为您简易地实现禁用app"
        echo " ==============================================================================================="
        echo "   您可以通过第三方app查看系统应用的包名，例如MT管理器"
        echo "   涉及系统应用，请您务必谨慎，必要时做好数据备份"
        echo " ==============================================================================================="
        read -r -p "输入1进入禁用，输入2进入解禁：" cho
        echo ""
        echo ""
        echo ""
        read -r -p "请您输入包名后回车：" ipnumbe
        if [[ "$cho" == "1" ]]; then adb shell pm disable-user "$ipnumbe"; fi
        if [[ "$cho" == "2" ]]; then adb shell pm enable "$ipnumbe"; fi
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo " ==============================================================================================="
        pause_key
        if [[ "$cho" == "1" ]]; then echo " 禁用了\"$ipnumbe\"" >> "操作记录.txt"; fi
        if [[ "$cho" == "2" ]]; then echo " 解禁了\"$ipnumbe\"" >> "操作记录.txt"; fi
        STATE="STARTS6"; continue
        ;;
    g11)
        clear
        echo " 将安装包放入鸿蒙工具箱目录（可放置多个APK）"
        echo " 放置好后可继续"
        pause_key
        for i in *.apk; do
            echo "安装：$i" >> "操作记录.txt"
            echo "请您等待传输，并留意手机提示"
            adb install "$i"
            echo ""
        done
        STATE="STARTS6"; continue
        ;;
    g12)
        clear
        adb shell settings put system peak_ refresh_ rate96.0
        adb shell settings put system min_ refresh_ rate96.0
        echo "  "
        echo "  "
        echo "  "
        echo "  "
        echo "  方案来源 https://tech.sina.com.cn/digi/2020-03-29/doc-iimxxsth2473542.shtml"
        echo "  不保证一定有效，若无效果则是您手机中settings命令中并无此参数，因此并不会产生任何改动"
        echo "  您可以自行下载【应用与系统信息】监测帧率"
        echo "  如果要恢复，只需在屏幕刷新率设置中切换到60Hz或120Hz或智能分辨率"
        echo "  "
        echo "  已执行固定至96.0帧（根据方案），您可以尝试手动输入其它数值（不一定生效）"
        echo ""
        echo ""
        echo ""
        read -r -p "输入y进入自定义帧率，输入n退出:" cho
        if [[ "$cho" == "y" ]]; then STATE="g12-1"; continue; fi
        if [[ "$cho" == "n" ]]; then STATE="STARTS6"; continue; fi
        STATE="STARTS6"; continue
        ;;
    g12-1)
        clear
        echo ""
        echo ""
        echo ""
        echo "如果不生效就不要管了，不会带来任何改变，也没有其它办法"
        echo "无效果就是您手机中settings命令并无此参数，不管就行，就当试一下"
        echo ""
        echo ""
        echo ""
        echo ""
        echo "根据提示输入您想要的刷新率范围，若想固定，输入同一数值"
        read -r -p "输入最大刷新率:" numb1
        read -r -p "输入最小刷新率:" numb2
        echo ""
        echo ""
        adb shell settings put system peak_ refresh_ rate"$numb1"
        adb shell settings put system min_ refresh_ rate"$numb2"
        pause_key
        STATE="STARTS6"; continue
        ;;
    g13)
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "  "
        echo "                 此为实验性功能，若无效或体验不好则请您关闭"
        echo "        由于解除杀后台的机制，希望您能够及时关闭不必要的后台卡片，否则卡顿"
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        read -r -p "输入1解除后台管理，输入2恢复后台管理:" cho
        if [[ "$cho" == "1" ]]; then adb shell pm uninstall --user 0 com.huawei.iaware; fi
        if [[ "$cho" == "2" ]]; then adb shell pm install-existing --user 0 com.huawei.iaware; fi
        echo ""
        echo ""
        echo ""
        pause_key
        STATE="STARTS6"; continue
        ;;
    g14)
        {
            echo "以下当前是您系统的白名单列表："
            adb shell dumpsys deviceidle whitelist | tr -d '\r'
        } | sed \
            -e 's/system-excidle,/系统的包    /g' \
            -e 's/system,/系统的包    /g' \
            -e 's/user,/ 安装的包    /g' \
            -e 's/,/                                     它的PID是/g' > "系统后台白名单.txt"
        clear
        echo ""
        echo "白名单已导出至【系统后台白名单.txt】中，可自行查阅"
        echo ""
        echo "【移出白名单功能】： 1        进入【添入白名单】： 2    "
        echo ""
        read -r -p "退出请直接回车 " choi
        echo ""
        if [[ "$choi" == "1" || "$choi" == "2" ]]; then
            if [[ "$choi" == "1" ]]; then echo " 输入您想移出白名单的包名"; fi
            if [[ "$choi" == "2" ]]; then echo " 输入您想添入白名单的包名"; fi
            read -r -p ":" package
            echo ""
            echo ""
            if [[ "$choi" == "1" ]]; then
                echo "     将\"$package\"移出白名单" >> "操作记录.txt"
                adb shell dumpsys deviceidle whitelist -"$package"
            fi
            if [[ "$choi" == "2" ]]; then
                echo "     将\"$package\"添入白名单" >> "操作记录.txt"
                adb shell dumpsys deviceidle whitelist +"$package"
            fi
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            echo ""
            pause_key
        fi
        rm -f "系统后台白名单.txt"
        STATE="STARTS6"; continue
        ;;
    STARTS5)
        clear
        echo "  "
        echo "                                        自定义动画速度"
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo " ==============================================================================================="
        echo "   【动画模式】"
        echo "          时长原值是1，关闭开发者模式或均输入1会恢复默认，输入非数字无效"
        echo "   "
        echo "          窗口动画缩放倍数:           是弹窗出现的过渡动画     建议 1.5"
        echo "          过渡动画缩放倍数:           是页面切换的过渡动画     建议 1.34"
        echo "          动画程序缩放倍数:           是软件打开的过渡动画     建议 1.17（或1.223）"
        echo ""
        echo "         建议值是以60hz刷新率为参考计算的，您可根据个人的喜好自行调节"
        echo "         建议值是用高速相机统计动画过程帧数，以此推算增加帧数后的阈值。"
        echo "         90-120hz足够丝滑，调节倍数应以个人感受为主，不必遵循阈值边界"
        echo "==============================================================================================="
        echo ""
        echo "也可在时长处输入【模式代码】跳转"
        read -r -p "窗口动画:" numb1
        if [[ "$numb1" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$numb1" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$numb1" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$numb1" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$numb1" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$numb1" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$numb1" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$numb1" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  窗口动画调整倍数：   $numb1" >> "操作记录.txt"
        adb shell settings put global window_animation_scale "$numb1"
        echo "已设置，请继续"
        read -r -p " 过渡动画:" numb2
        if [[ "$numb2" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$numb2" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$numb2" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$numb2" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$numb2" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$numb2" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$numb2" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$numb2" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  过渡动画调整倍数：   $numb2" >> "操作记录.txt"
        adb shell settings put global transition_animation_scale "$numb2"
        echo "已设置，请继续"
        read -r -p "动画程序:" numb3
        if [[ "$numb3" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$numb3" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$numb3" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$numb3" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$numb3" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$numb3" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$numb3" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$numb3" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  动画程序倍数：   $numb3" >> "操作记录.txt"
        adb shell settings put global animator_duration_scale "$numb3"
        echo "已设置完毕"
        echo " ==============================================================================================="
        echo "  【输入代码跳转】"
        echo "           m1    主菜单                                 help  帮助模式  "
        echo "           m2    定制模式                               m4    动画模式"
        echo "           m3    监视模式                               m5    功能模式"
        echo "           直接回车重新进入动画模式"
        read -r -p ":" choice
        if [[ "$choice" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$choice" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$choice" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$choice" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$choice" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$choice" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$choice" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$choice" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$choice" == "m6" ]]; then STATE="m6"; continue; fi
        echo "  执行了：   $choice" >> "操作记录.txt"
        pause_key
        STATE="STARTS5"; continue
        ;;
    m6)
        clear
        echo "                                        瘦身模式"
        echo "                模式：主菜单M1，定制M2，监视M3，动画M4，功能M5，瘦身M6，帮助help"
        echo " ==============================================================================================="
        echo "这是一个实验性功能，可以为一些软件瘦身，占用越高效果越好"
        echo "但还是奉劝您保存好对应软件中下载的重要本地文件再操作！！！！！！！！！！！！！！"
        echo ""
        echo "          "
        echo "     对于QQ、TIM   清理聊天中的视频、图片（不含文字语音聊天记录及手动保存的）"
        echo "                   还有您所下载过的群文件、个人发送文件、微云文件，如有重要文件请先转移"
        echo "                   其余清理的是一些小程序、小游戏缓存、QQ空间数据缓存等等等"
        echo ""
        echo "     对于微信       热更新文件、部分聊天视频及日志缓存（不含文字语音聊天记录及手动保存的）"
        echo "          "
        echo "     对于图库       清理了缩略图"
        echo ""
        echo "     其它           清理了腾讯外部文件夹的大部分日志"
        echo ""
        echo " 目前初步推出功能，后续会提供更多瘦身方案，并允许您单独选择app（我毕设中期进度要到了）"
        echo "          "
        echo " "
        echo " "
        echo " "
        echo " "
        echo " "
        echo " "
        echo " "
        echo " "
        read -r -p ":可以输入跳转代码，输入y开始清理（输入完毕回车）" ch0
        if [[ "$ch0" == "m1" ]]; then echo "跳转-主菜单" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m2" ]]; then echo "跳转-定制模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "help" ]]; then echo "跳转-帮助模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m3" ]]; then echo "跳转-监视模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m4" ]]; then echo "跳转-动画模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m5" ]]; then echo "跳转-功能模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m6" ]]; then echo "跳转-瘦身模式" >> "操作记录.txt"; fi
        if [[ "$ch0" == "m1" ]]; then STATE="STARTS"; continue; fi
        if [[ "$ch0" == "m2" ]]; then STATE="STARTS2"; continue; fi
        if [[ "$ch0" == "help" ]]; then STATE="STARTS3"; continue; fi
        if [[ "$ch0" == "m3" ]]; then STATE="STARTS4"; continue; fi
        if [[ "$ch0" == "m4" ]]; then STATE="STARTS5"; continue; fi
        if [[ "$ch0" == "m5" ]]; then STATE="STARTS6"; continue; fi
        if [[ "$ch0" == "m6" ]]; then STATE="m6"; continue; fi
        if [[ "$ch0" == "y" ]]; then echo " 对QQ和TIM进行瘦身"; fi
        if [[ "$ch0" == "y" ]]; then STATE="QQTIM"; continue; fi
        STATE="m6"; continue
        ;;
    QQTIM)
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------微信部分--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.mm/MicroMsg/5f26b7b28d59b7ae460d13c9a4f1ee9b/video
        adb shell rm -r /sdcard/Android/data/com.tencent.mm/MicroMsg/CheckResUpdate
        adb shell rm -r /sdcard/Android/data/com.tencent.mm/cache
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------TIM的部分--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/android/data/com.tencent.tim/tencent/tim/shortvideo
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/files
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/cache
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/qzone
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/TIM_Favorite
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------TIM的收藏表情--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/QQ_business
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim_Images/QQEditPic
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/mini/files
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/qzone
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/QQ_Collection
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/MobileQQ/pddata/app/offline
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/MobileQQ/.vaspoke
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/diskcache
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/photo
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/thumb
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/troopphoto/tmp
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/rbt
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/funcall
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/tencent/MobileQQ/webso/offline
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------TIM聊天记录图片--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/Tim/chatpic
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------tim下载的文件--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.tim/Tencent/TIMfile_recv
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------QQ的部分--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/tencent/Mobileqq
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/tencent/wxminiapp
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/tencent/QQ_Favorite
        adb shell rm -r /sdcard/Android/data/com.tencent.mobileqq/qzone
        adb shell rm -r /sdcard/Android/data/com.tencent.mobileqq/cache
        adb shell rm -r /sdcard/Android/data/com.tencent.mobileqq/files
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/qcircle
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/Android
        adb shell rm -r /sdcard/android/data/com.tencent.mobileqq/qq
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------QQ下载的--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------QQ聊天图片--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.tencent.mobileqq/Tencent/MobileQQ/chatpic
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------图库缓存--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/Android/data/com.android.gallery3d/files/thumbdb
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------腾讯外部文件夹--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm -r /sdcard/tencent/msflogs/com/tencent/tim
        adb shell rm -r /sdcard/tencent/msflogs/com/tencent/mobileqq
        adb shell rm -r /sdcard/tencent/Tim
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------系统分区内的bug日志--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm /bugreports/*.*
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------缓存及日志--------------------------"
        echo ""
        echo ""
        echo ""
        adb shell rm /sdcard/DCIM/Camera/*.back
        adb shell rm /sdcard/*.log
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "--------------------------已完成--------------------------"
        echo ""
        echo ""
        echo ""
        pause_key
        STATE="m6"; continue
        ;;
    *)
        STATE="STARTS"
        ;;
esac
done
