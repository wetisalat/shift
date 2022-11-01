export default [
  {
    path: '/dashboard',
    name: 'dashboard-staff',
    component: () => import('@/views/staff/dashboard/StaffDashboard.vue'),
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
  },

  // *===============================================---*
  // *--------- PROFIL ---- ----------------------------*
  // *===============================================---*
  {
    path: '/profil/view/:id',
    name: 'profil-view',
    component: () => import('@/views/staff/profil/users-view/UsersView.vue'),
  },
  {
    path: '/profil/edit/:id',
    name: 'profil-edit',
    component: () => import('@/views/staff/profil/users-edit/UsersEdit.vue'),
  },



]
