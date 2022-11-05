export default [
  {
    header: 'Client menu',
  },
  {
    title: 'Dashboard',
    route: 'dashboard',
    icon: 'HomeIcon',
    resource: 'Dashboard',
    action: 'read',
  },
  {
    title: 'Staff',
    icon: 'UsersIcon',
    resource: 'Staff',
    action: 'read',
    children: [
      {
        title: 'List',
        route: 'staff-list',
      },
      {
        title: 'View',
        route: { name: 'staff-view', params: { id: 21 } },
      },
      {
        title: 'Edit',
        route: { name: 'staff-edit', params: { id: 21 } },
      },
    ],
  },
  {
    title: 'Todo',
    route: 'apps-todo',
    icon: 'CheckSquareIcon',
    resource: 'Todo',
    action: 'read',
  },
  {
    title: 'Expenses',
    route: 'expenses',
    icon: 'DollarSignIcon',
    resource: 'Expenses',
    action: 'read',
  },
  {
    title: 'Schedule',
    href: 'https://google.fr',
    icon: 'ClockIcon',
    resource: 'Schedule',
    action: 'read',
  },
  {
    title: 'Request',
    route: 'request',
    icon: 'CoffeeIcon',
    resource: 'Request',
    action: 'read',
  },
  {
    title: 'Attendance',
    route: 'attendance',
    icon: 'WatchIcon',
    resource: 'Attendance',
    action: 'read',
  },
  {
    title: 'Payroll',
    route: 'payroll',
    icon: 'BarChart2Icon',
    resource: 'Payroll',
    action: 'read',
  },
  {
    title: 'Analyse',
    href: 'https://google.fr',
    icon: 'ActivityIcon',
    resource: 'Analyse',
    action: 'read',
  },
]
