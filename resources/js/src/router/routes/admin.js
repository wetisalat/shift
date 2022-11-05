export default [
  {
    path: '/dashboard',
    name: 'dashboard-admin',
    component: () => import('@/views/admin/dashboard/AdminDashboard.vue'),
    meta: {
      resource: 'Dashboard',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- CLIENTS ---- ---------------------------*
  // *===============================================---*
  {
    path: '/client',
    name: 'client-list',
    component: () => import('@/views/admin/client/users-list/UsersList.vue'),
    meta: {
      resource: 'Clients',
      action: 'read',
    },
  },
  {
    path: '/client/view/:id',
    name: 'client-view',
    component: () => import('@/views/admin/client/users-view/UsersView.vue'),
    meta: {
      resource: 'Clients',
      action: 'read',
    },
  },
  {
    path: '/client/edit/:id',
    name: 'client-edit',
    component: () => import('@/views/admin/client/users-edit/UsersEdit.vue'),
    meta: {
      resource: 'Clients',
      action: 'update',
    },
  },
  // *===============================================---*
  // *--------- PLAN ---- ----------------------_-------*
  // *===============================================---*
  {
    path: '/plan',
    name: 'plan',
    component: () => import('@/views/admin/plan/Plan.vue'),
    meta: {
      resource: 'Plan',
      action: 'read',
    },
  },
  // *===============================================---*
  // *--------- COUPONS ---- ---------------------------*
  // *===============================================---*
  {
    path: '/coupon',
    name: 'coupon',
    component: () => import('@/views/admin/coupon/Coupon.vue'),
    meta: {
      resource: 'Coupon',
      action: 'read',
    },
  },
  // *===============================================---*
  // *--------- LEAVES ---- ----------------------------*
  // *===============================================---*
  {
    path: '/leave',
    name: 'leave',
    component: () => import('@/views/admin/leave/Leave.vue'),
    meta: {
      resource: 'Leave',
      action: 'read',
    },
  },
  // *===============================================---*
  // *--------- LUNCH ---- -----------------------------*
  // *===============================================---*
  {
    path: '/lunch',
    name: 'lunch',
    component: () => import('@/views/admin/lunch/Lunch.vue'),
    meta: {
      resource: 'Lunch',
      action: 'read',
    },
  },
]
