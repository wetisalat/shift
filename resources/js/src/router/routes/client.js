export default [
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('@/views/client/dashboard/ClientDashboard.vue'),
    meta: {
      resource: 'Dashboard',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- TODO & IT'S FILTERS N TAGS -------------*
  // *===============================================---*
  {
    path: '/todo',
    name: 'apps-todo',
    component: () => import('@/views/client/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      resource: 'Todo',
      action: 'read',
    },
  },
  {
    path: '/todo/:filter',
    name: 'apps-todo-filter',
    component: () => import('@/views/client/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      navActiveLink: 'apps-todo',
      resource: 'Todo',
      action: 'read',
    },
    beforeEnter(to, _, next) {
      if (['important', 'completed', 'deleted'].includes(to.params.filter)) next()
      else next({ name: 'error-404' })
    },
  },
  {
    path: '/todo/tag/:tag',
    name: 'apps-todo-tag',
    component: () => import('@/views/client/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      navActiveLink: 'apps-todo',
      resource: 'Todo',
      action: 'read',
    },
    beforeEnter(to, _, next) {
      if (['team', 'low', 'medium', 'high', 'update'].includes(to.params.tag)) next()
      else next({ name: 'error-404' })
    },
  },

  // *===============================================---*
  // *--------- STAFF ---- -----------------------------*
  // *===============================================---*
  {
    path: '/staff',
    name: 'staff-list',
    component: () => import('@/views/client/staff/users-list/UsersList.vue'),
    meta: {
      resource: 'Staff',
      action: 'read',
    },
  },
  {
    path: '/staff/view/:id',
    name: 'staff-view',
    component: () => import('@/views/client/staff/users-view/UsersView.vue'),
    meta: {
      resource: 'Staff',
      action: 'read',
    },
  },
  {
    path: '/staff/edit/:id',
    name: 'staff-edit',
    component: () => import('@/views/client/staff/users-edit/UsersEdit.vue'),
    meta: {
      resource: 'Staff',
      action: 'Update',
    },
  },

  // *===============================================---*
  // *--------- Expenses ---- --------------------------*
  // *===============================================---*
  {
    path: '/expenses',
    name: 'expenses',
    component: () => import('@/views/client/expenses/Expenses.vue'),
    meta: {
      resource: 'Expenses',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- Request ---- ---------------------------*
  // *===============================================---*
  {
    path: '/request',
    name: 'request',
    component: () => import('@/views/client/request/Request.vue'),
    meta: {
      resource: 'Request',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- Attendance ---- ------------------------*
  // *===============================================---*
  {
    path: '/attendance',
    name: 'attendance',
    component: () => import('@/views/client/attendance/Attendance.vue'),
    meta: {
      resource: 'Attendance',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- Payroll ---- ---------------------------*
  // *===============================================---*
  {
    path: '/payroll',
    name: 'payroll',
    component: () => import('@/views/client/payroll/Payroll.vue'),
    meta: {
      resource: 'Payroll',
      action: 'read',
    },
  },
]
