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
         this.addUserButton = Ext.create('Ext.Button', {
             text: 'Click me',
             handler: function() {
                 alert('You clicked the button!');
             }
         });
        //删除用户
        this.delUserButton = Ext.create('Ext.Button', {
             text: 'Click me',
             handler: function() {
                 alert('You clicked the button!');
             }
         });
        this.tbar = [this.addUserButton,this.delUserButton];
        this.callParent(arguments);
    }
});