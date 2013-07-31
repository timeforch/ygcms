function showInfo(rid) {
    console.log(rid);
    Ext.getCmp('user-rolelist').show();
}
Ext.define('CMS.view.user.List',{
    extend: 'Ext.grid.Panel',
    alias: 'widget.userlist',
    title: '用户列表',
    store: "CMS.store.Users",
    multiSelect: true,
    collapsible: false,
    selModel: Ext.create('Ext.selection.CheckboxModel'),
    selType: 'rowmodel',
    plugins: [
        Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 2
        })
    ],
    id:'user-list',

    initComponent: function(){
        this.columns =[
            {header:'id', dataIndex:'id', hidden:true},
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
            },
            {
                header: 'operation',
                dataIndex: '',
                renderer: function(value, meta, record, rowIndex, colIndex, store, view) {
                    return '<a href="#" onclick="showInfo('+record.get('id')+')">Info</a>'
                }
            }
        ];

        this.dockedItems = [{
            xtype: 'pagingtoolbar',
            store: 'CMS.store.Users',
            dock: 'bottom',
            displayInfo: true
        }];
        //添加用户
        this.geCommodityButton = Ext.create('Ext.Button', {
            text: '获取商品url',
            handler: function() {
                Ext.Ajax.request({
                    url: '/get_full_url_by_commodity_no.json',
                    headers: {
                        'userHeader': 'userMsg'
                    },
                    params: { commodity_no:'99821137' },
                    method: 'GET',
                    success: function (response, options) {
                        Ext.MessageBox.alert('成功', '从服务端获取结果: ' + response.responseText);
                    },
                    failure: function (response, options) {
                        Ext.MessageBox.alert('失败', '请求超时或网络故障,错误编号：' + response.status);
                    }
                });
            }
        });

        this.tbar = [{
                text: '添加新用户',
                action: 'addNew',
                iconCls:'add'
            },{
                text: '删除',
                action: 'delete',
                iconCls:'remove'
            },this.geCommodityButton];
        this.callParent(arguments);
    }
});