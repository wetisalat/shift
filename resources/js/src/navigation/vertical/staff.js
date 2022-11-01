export default [
  {
    header: 'Staff menu',
  },
  {
    title: 'Dashboard',
    route: 'dashboard-staff',
    icon: 'HomeIcon',
  },
  {
    title: 'Todo',
    route: 'staff-todo',
    icon: 'CheckSquareIcon',
  },
  {
    title: 'Schedule',
    href: 'https://google.fr',
    icon: 'CalendarIcon',
  },
  {
    title: 'Attendance',
    href: 'https://google.fr',
    icon: 'WatchIcon',
  },
  {
    title: 'Expenses',
    route: 'expenses',
    icon: 'DollarSignIcon',
  },
  {
    title: 'Profil',
    icon: 'UserIcon',
    children: [
      {
        title: 'View',
        route: { name: 'profil-view', params: { id: 21 } },
      },
      {
        title: 'Edit',
        route: { name: 'profil-edit', params: { id: 21 } },
      },
    ],
  },

]

