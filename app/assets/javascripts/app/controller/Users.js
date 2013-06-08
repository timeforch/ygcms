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
            }
        });
    },
    editUser:function(grid,record){
         console.log("双击"+record.get('user_name'))
        var view = Ext.widget('userform');
        view.down('form').loadRecord(record);
    },
    updateUser: function(button) {
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();

        record.set(values);
        win.close();
        this.getUsersStore().sync();
    }
});

