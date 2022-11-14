export default [
  {
    header: 'Staff menu',
  },
  {
    title: 'Dashboard',
    route: 'dashboard-staff',
    icon: 'HomeIcon',
    resource: 'Dashboard',
    action: 'read',
  },
  {
    title: 'Todo',
    route: 'staff-todo',
    icon: 'CheckSquareIcon',
    resource: 'Todo',
    action: 'read',
  },
  {
    title: 'Schedule',
    href: 'https://google.fr',
    icon: 'CalendarIcon',
    resource: 'Schedule',
    action: 'read',
  },
  {
    title: 'Attendance',
    href: 'https://google.fr',
    icon: 'WatchIcon',
    resource: 'Attendance',
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
    title: 'Profil',
    icon: 'UserIcon',
    resource: 'Profil',
    action: 'read',
    children: [
      {
        title: 'View',
        route: { name: 'profil-view', params: { id: 21 } },
        resource: 'Profil',
        action: 'read',
      },
      {
        title: 'Edit',
        route: { name: 'profil-edit', params: { id: 21 } },
        resource: 'Profil',
        action: 'read',
      },
    ],
  },
]
