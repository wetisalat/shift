export default [
  {
    path: '/dashboard',
    name: 'dashboard-staff',
    component: () => import('@/views/staff/dashboard/StaffDashboard.vue'),
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
    name: 'staff-todo',
    component: () => import('@/views/staff/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      resource: 'Todo',
      action: 'read',
    },
  },
  {
    path: '/todo/:filter',
    name: 'staff-todo-filter',
    component: () => import('@/views/staff/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      navActiveLink: 'staff-todo',
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
    name: 'staff-todo-tag',
    component: () => import('@/views/staff/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      navActiveLink: 'staff-todo',
      resource: 'Todo',
      action: 'read',
    },
    beforeEnter(to, _, next) {
      if (['team', 'low', 'medium', 'high', 'update'].includes(to.params.tag)) next()
      else next({ name: 'error-404' })
    },
  },

  // *===============================================---*
  // *--------- Expenses ---- --------------------------*
  // *===============================================---*
  {
    path: '/expenses',
    name: 'expenses',
    component: () => import('@/views/staff/expenses/Expenses.vue'),
    meta: {
      resource: 'Expenses',
      action: 'read',
    },
  },

  // *===============================================---*
  // *--------- PROFIL ---- ----------------------------*
  // *===============================================---*
  {
    path: '/profil/view/:id',
    name: 'profil-view',
    component: () => import('@/views/staff/profil/users-view/UsersView.vue'),
    meta: {
      resource: 'Profil',
      action: 'read',
    },
  },
  {
    path: '/profil/edit/:id',
    name: 'profil-edit',
    component: () => import('@/views/staff/profil/users-edit/UsersEdit.vue'),
    meta: {
      resource: 'Profil',
      action: 'read',
    },
  },
]
