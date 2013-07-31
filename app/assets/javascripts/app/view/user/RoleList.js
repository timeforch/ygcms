/**
 * User: solon
 * Date: 7/30/13
 * Time: 4:25 PM
 * To change this template use File | Settings | File Templates.
 */
Ext.define('CMS.view.user.RoleList', {
    extend: 'Ext.grid.Panel',
    title: '列表',
    alias: 'widget.userrolelist',
    store: "CMS.store.Users",
    id: 'user-rolelist',

    initComponent: function() {
        this.columns =[
            {header:"用户名", dataIndex:'user_name', editor:'textfield', flex:1},
            {header:"登录名", dataIndex:'login_name',editor:'textfield'},
            {header:"电话号码", dataIndex:'phone_number', editor:'textfield'},
            {header:"是否启用" ,dataIndex:'enabled',
                editor: new Ext.form.field.ComboBox({
                    triggerAction: 'all',
                    selectOnTab: true,
                    store: [
                        ['false', 'false'],
                        ['true', 'true']
                    ],
                    queryMode: 'local'
                })
            }
        ];

        this.tbar = [{
            text: '添加新用户',
            action: 'addNew',
            iconCls:'add'
        },{
            text: '删除',
            action: 'delete',
            iconCls:'remove'
        }];
        this.callParent(arguments);
    }
});