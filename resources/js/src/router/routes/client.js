export default [
  {
    path: '/todo',
    name: 'apps-todo',
    component: () => import('@/views/client/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
    },
  },

  // *===============================================---*
  // *--------- TODO & IT'S FILTERS N TAGS ---------------------------------------*
  // *===============================================---*
  {
    path: '/todo/:filter',
    name: 'apps-todo-filter',
    component: () => import('@/views/client/todo/Todo.vue'),
    meta: {
      contentRenderer: 'sidebar-left',
      contentClass: 'todo-application',
      navActiveLink: 'apps-todo',
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
    },
    beforeEnter(to, _, next) {
      if (['team', 'low', 'medium', 'high', 'update'].includes(to.params.tag)) next()
      else next({ name: 'error-404' })
    },
  },

// *===============================================---*
// *--------- USER ---- ---------------------------------------*
// *===============================================---*
  {
    path: '/staff',
    name: 'apps-users-list',
    component: () => import('@/views/client/staff/users-list/UsersList.vue'),
  },
  {
    path: '/staff/view/:id',
    name: 'apps-users-view',
    component: () => import('@/views/client/staff/users-view/UsersView.vue'),
  },
  {
    path: '/staff/edit/:id',
    name: 'apps-users-edit',
    component: () => import('@/views/client/staff/users-edit/UsersEdit.vue'),
  },

// *===============================================---*
// *--------- TEST ---- ------------------------------*
// *===============================================---*
  {
    path: '/test',
    name: 'test',
    component: () => import('@/views/client/expenses/Expenses.vue'),
  },

// *===============================================---*
// *--------- Expenses ---- --------------------------*
// *===============================================---*
{
  path: '/expenses',
  name: 'expenses',
  component: () => import('@/views/client/expenses/Expenses.vue'),
},

// *===============================================---*
// *--------- Request ---- --------------------------*
// *===============================================---*
{
  path: '/request',
  name: 'request',
  component: () => import('@/views/client/request/Request.vue'),
},

// *===============================================---*
// *--------- Attendance ---- --------------------------*
// *===============================================---*
{
  path: '/attendance',
  name: 'attendance',
  component: () => import('@/views/client/attendance/Attendance.vue'),
},

// *===============================================---*
// *--------- Payroll ---- --------------------------*
// *===============================================---*
{
  path: '/payroll',
  name: 'payroll',
  component: () => import('@/views/client/payroll/Payroll.vue'),
},






]