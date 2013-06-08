Ext.define('CMS.view.user.Form', {
  extend: 'Ext.window.Window',
  alias : 'widget.userform',

  title : '添加/修改用户',
  layout: 'fit',
  autoShow: true,
  modal: true,

  initComponent: function() {
    this.items = [{
      xtype: 'form',
      items: [{
        xtype: 'hidden',
        name : 'id',
        fieldLabel: 'id'
      }, {
        xtype: 'textfield',
        name : 'user_name',
        fieldLabel: '用户名'
      }, {
        xtype: 'textfield',
        name : 'login_name',
        fieldLabel: '登陆名'
      }, {
        xtype: 'textfield',
        name : 'phone_number',
        fieldLabel: '电话号码'
      }]
    }];

    this.buttons = [{
      text: '保存',
      action: 'save'
    }, {
      text: '取消',
      scope: this,
      handler: this.close
    }];

    this.callParent(arguments);
  }
});

