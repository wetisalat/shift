export default [

  // *===============================================---*
  // *--------- TEST ---- ------------------------------*
  // *===============================================---*
  {
    path: '/test',
    name: 'test',
    component: () => import('@/views/test/Test.vue'),
  },

  {
    path: '/dashboard/analytics',
    name: 'dashboard-analytics',
    component: () => import('@/views/dashboard/analytics/Analytics.vue'),
    meta: {
      resource: 'Dashboard',
      action: 'read',
    },
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('@/views/dashboard/ecommerce/Ecommerce.vue'),
        meta: {
      resource: 'Dashboard',
      action: 'read',
    },
  },
]
