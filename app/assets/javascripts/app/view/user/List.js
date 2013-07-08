Ext.define('CMS.view.user.List',{
    extend:'Ext.grid.Panel',
    alias:'widget.userlist',
    title:'用户列表',
    store:"Users",
    initComponent:function(){
        this.columns =[
            {header:"用户名" ,dataIndex:'user_name' ,flex:1},
            {header:"登录名" ,dataIndex:'login_name' ,flex:1},
            {header:"电话号码" ,dataIndex:'phone_number' ,flex:1},
            {header:"enabled" ,dataIndex:'enabled' ,flex:1}
        ];
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

        //删除用户
        this.delUserButton = Ext.create('Ext.Button', {
             text: 'Click me',
             handler: function() {
                 alert('You clicked the button!');
             }
         });
        this.tbar = [{
            text: '添加新用户',
            action: 'addNew'
        },this.delUserButton,this.geCommodityButton];
        this.callParent(arguments);
    }
});