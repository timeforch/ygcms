Ext.define('CMS.model.User', {
    extend:'Ext.data.Model',
    fields:['login_name','user_name','password','phone_number','enabled'],
    idProperty: 'id'
});