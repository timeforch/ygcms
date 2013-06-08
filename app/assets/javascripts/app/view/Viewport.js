Ext.define('CMS.view.Viewport', {
  extend: 'Ext.container.Viewport',
  layout: 'fit',
  items: [{
    xtype: 'userlist',
    html : '因某些原因，您的页面无法正常显示！'
  }]
});
