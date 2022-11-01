export default [
  {
    header: 'Client menu',
  },
  {
    title: 'Dashboard',
    route: 'dashboard',
    icon: 'HomeIcon',
  },
  {
    title: 'Staff',
    icon: 'UsersIcon',
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
  },
  {
    title: 'Expenses',
    route: 'expenses',
    icon: 'DollarSignIcon',
  },
  {
    title: 'Schedule',
    href: 'https://google.fr',
    icon: 'ClockIcon',
  },
  {
    title: 'Request',
    route: 'request',
    icon: 'CoffeeIcon',
  },
  {
    title: 'Attendance',
    route: 'attendance',
    icon: 'WatchIcon',
  },
  {
    title: 'Payroll',
    route: 'payroll',
    icon: 'BarChart2Icon',
  },
  {
    title: 'Analyse',
    href: 'https://google.fr',
    icon: 'ActivityIcon',
  },
]

