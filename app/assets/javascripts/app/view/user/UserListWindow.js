Ext.define('CMS.view.user.UserListWindow', {
    extend: 'Ext.ux.desktop.Module',
    requires: [
        'Ext.data.ArrayStore',
        'Ext.util.Format',
        'Ext.grid.Panel',
        'Ext.grid.RowNumberer'
    ],
    id:'user-list-win',
    init : function(){
        this.launcher = {
            text: '用户管理',
            iconCls:'accordion'
        };
    },

    createWindow : function(){
        var desktop = this.app.getDesktop();
        var win = desktop.getWindow('user-list-win');
        if(!win){
            win = desktop.createWindow({
                id: 'user-list-win',
                title:'用户管理',
                width:740,
                height:480,
                iconCls: 'accordion',
                animCollapse:false,
                constrainHeader:true,
                layout: 'fit',
                items: [
                    {
                        xtype: 'userlist'
                    }
                ]
            });
        }
        return win;
    }
});

