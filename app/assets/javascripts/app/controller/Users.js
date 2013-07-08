Ext.define('CMS.controller.Users', {
    extend: 'Ext.app.Controller',
    stores:[
        'Users'
    ],
    models:[
        'User'
    ],
    views:[
        'user.List',
        'user.Form'
    ],
    init: function () {
        this.control({
            'viewport > userlist': {
                itemdblclick: this.editUser
            },
            'userlist button[action=addNew]':{
                click:this.addUser
            } ,
            'userform button[action=save]':{
                click:this.updateUser
            }
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
        console.log('click')
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
        win.close();
        store.sync();
    }
});

