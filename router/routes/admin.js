export default [
  {
    path: '/dashboard',
    name: 'dashboard-admin',
    component: () => import('@/views/admin/dashboard/AdminDashboard.vue'),
  },
  
  // *===============================================---*
  // *--------- CLIENTS ---- ---------------------------*
  // *===============================================---*
  {
    path: '/client',
    name: 'client-list',
    component: () => import('@/views/admin/client/users-list/UsersList.vue'),
  },
  {
    path: '/client/view/:id',
    name: 'client-view',
    component: () => import('@/views/admin/client/users-view/UsersView.vue'),
  },
  {
    path: '/client/edit/:id',
    name: 'client-edit',
    component: () => import('@/views/admin/client/users-edit/UsersEdit.vue'),
  },
  // *===============================================---*
  // *--------- PLAN ---- ----------------------_-------*
  // *===============================================---*
  {
    path: '/plan',
    name: 'plan',
    component: () => import('@/views/admin/plan/Plan.vue'),
  },
  // *===============================================---*
  // *--------- COUPONS ---- ---------------------------*
  // *===============================================---*
  {
    path: '/coupon',
    name: 'coupon',
    component: () => import('@/views/admin/coupon/Coupon.vue'),
  },
  // *===============================================---*
  // *--------- LEAVES ---- ----------------------------*
  // *===============================================---*
  {
    path: '/leave',
    name: 'leave',
    component: () => import('@/views/admin/leave/Leave.vue'),
  },
  // *===============================================---*
  // *--------- LUNCH ---- -----------------------------*
  // *===============================================---*
  {
    path: '/lunch',
    name: 'lunch',
    component: () => import('@/views/admin/lunch/Lunch.vue'),
  },



]
