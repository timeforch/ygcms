Ext.define('CMS.controller.Users', {
    extend: 'Ext.app.Controller',
    stores:[
        'CMS.store.Users'
    ],
    models:[
        'CMS.model.User'
    ],
    views:[
        'CMS.view.user.List',
        'CMS.view.user.Form'
    ],
    init: function () {
        this.control({
            'userlist button[action=addNew]':{
                click:this.addUser
            } ,
            'userform button[action=save]':{
                click:this.updateUser
            } ,
            'userlist button[action=delete]':{
                click: this.deleteUsers
            }
        });
    },
    deleteUsers:function(button){
        var store = this.getUsersStore();
        var grid = button.up('panel');
        var selModel = grid.getSelectionModel() ;
        var isGridSelected = selModel.hasSelection()
        if (!isGridSelected) { //没有被选中
            Ext.MessageBox.alert("注意","没有选择要删除的数据！") ;
            return ;

        }
        var allSelected = selModel.getSelection()  ; //获取最后一个选择的一行的数据
        allSelected.forEach(function(element, index, array){
            store.remove(element);
            store.sync();
            //alert(element.get('id') +"->"+element.get('user_name'))
        });

    },
    addUser:function(button){
        var view = Ext.widget('userform');
        view.show();
    },
    editUser:function(grid,record){
        var view = Ext.widget('userform');
        view.down('form').loadRecord(record);
    },
    updateUser: function(button) {
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();
        var formRecord = form.getRecord();
        var store = this.getUsersStore();
        if (formRecord) {
            formRecord.set(values);
        } else {
            var user = Ext.create('CMS.model.User', values);
            store.add(user);
        }
        store.sync();
        store.load();
        win.close();
    }
});

