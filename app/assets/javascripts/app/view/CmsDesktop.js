/*!
 * Ext JS Library 4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */

Ext.define('CMS.view.CmsDesktop', {
    extend: 'Ext.ux.desktop.App',

    requires: [

        'Ext.window.MessageBox',

        'Ext.ux.desktop.ShortcutModel',
        //===========split ============

//        'CMS.view.user.UserListWindow',

//        'CMS.view.demo.SystemStatus',
//        'CMS.view.demo.VideoWindow',
        'CMS.view.demo.GridWindow',
//        'CMS.view.demo.TabWindow',
//        'CMS.view.demo.AccordionWindow',
//        'CMS.view.demo.Notepad',
//        'CMS.view.demo.BogusMenuModule',
//        'CMS.view.demo.BogusModule',


//        'CMS.view.demo.Blockalanche',
        'CMS.view.demo.Settings'
    ],

    init: function() {
        // custom logic before getXYZ methods get called...

        this.callParent();

        // now ready...
    },

    getModules : function(){
        return [
//            new CMS.view.user.UserListWindow(),
            //===========上面是系统用到的，下面是例子
//            new CMS.view.demo.VideoWindow(),
////            new CMS.view.demo.Blockalanche(),
//            new CMS.view.demo.SystemStatus(),
            new CMS.view.demo.GridWindow()
//            new CMS.view.demo.TabWindow(),
//            new CMS.view.demo.AccordionWindow(),
//            new CMS.view.demo.Notepad(),
//            new CMS.view.demo.BogusMenuModule(),
//            new CMS.view.demo.BogusModule()
        ];
    },

    getDesktopConfig: function () {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            //cls: 'ux-desktop-black',

            contextMenuItems: [
                { text: 'Change Settings', handler: me.onSettings, scope: me }
            ],

            shortcuts: Ext.create('Ext.data.Store', {
                model: 'Ext.ux.desktop.ShortcutModel',
                data: [
                    { name: '用户管理', iconCls: 'accordion-shortcut', module: 'user-list-win', moduleClassName: 'CMS.view.user.UserListWindow', controllerName: 'CMS.controller.Users'}
                    //==============split=============================
//                    { name: 'Grid Window', iconCls: 'grid-shortcut', module: 'grid-win', moduleClassName: '', controllerName: '' }
//                      { name: 'Accordion Window', iconCls: 'accordion-shortcut', module: 'acc-win', moduleClassName: '', controllerName: '' },
//                      { name: 'Notepad', iconCls: 'notepad-shortcut', module: 'notepad', moduleClassName: '', controllerName: '' },
//                      { name: 'System Status', iconCls: 'cpu-shortcut', module: 'systemstatus', moduleClassName: '', controllerName: '' }
                ]
            }),

            wallpaper: 'desk.jpg',
            wallpaperStretch: false
        });
    },

    // config for the start menu
    getStartConfig : function() {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            title: '系统菜单',
            iconCls: 'user',
            height: 300,
            toolConfig: {
                width: 100,
                items: [
                    {
                        text:'设置',
                        iconCls:'settings',
                        handler: me.onSettings,
                        scope: me
                    },
                    '-',
                    {
                        text:'注销',
                        iconCls:'logout',
                        handler: me.onLogout,
                        scope: me
                    }
                ]
            }
        });
    },

    getTaskbarConfig: function () {
        var ret = this.callParent();

        return Ext.apply(ret, {
            quickStart: [
               { name: 'Accordion Window', iconCls: 'accordion', module: 'acc-win' },
               { name: 'Grid Window', iconCls: 'icon-grid', module: 'grid-win' }
            ],
            trayItems: [
                { xtype: 'trayclock', flex: 1 }
            ],
            startBtnText:"开始"
        });
    },

    onLogout: function () {
        Ext.Msg.confirm('注销', '你确定要退出系统吗?');
    },

    onSettings: function () {
        var dlg = new CMS.view.demo.Settings({
            desktop: this.desktop
        });
        dlg.show();
    }
});
