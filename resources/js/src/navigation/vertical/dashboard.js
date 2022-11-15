export default [
  {
    title: 'Dashboards',
    icon: 'HomeIcon',
    tag: '2',
    tagVariant: 'light-warning',
    children: [
      {
        title: 'eCommerce',
        route: 'dashboard-ecommerce',
        // acl: {
          action: 'read',
          resource: 'ACL',
          // },
      },
      {
        title: 'Analytics',
        route: 'dashboard-analytics',
        // acl: {
        action: 'read',
        resource: 'ACL',
        // },
      },
    ],
  },
]
