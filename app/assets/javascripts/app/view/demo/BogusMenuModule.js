/*!
* Ext JS Library 4.0
* Copyright(c) 2006-2011 Sencha Inc.
* licensing@sencha.com
* http://www.sencha.com/license
*/

Ext.define('CMS.view.demo.BogusMenuModule', {
    extend: 'CMS.view.demo.BogusModule',

    init : function() {

        this.launcher = {
            text: '例子程序',
            iconCls: 'bogus',
            handler: function() {
                return false;
            },
            menu: {
                items: [

                ]
            }
        };

        for (var i = 0; i < 5; ++i) {
            this.launcher.menu.items.push({
                text: 'Window '+(++windowIndex),
                iconCls:'bogus',
                handler : this.createWindow,
                scope: this,
                windowId: windowIndex
            });
        }
    }
});