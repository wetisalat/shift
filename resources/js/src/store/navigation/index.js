export default {
  namespaced: true,
  state: {
    items: [],
  },
  getters: {},
  mutations: {
    UPDATE_NAVIGATION_MENU(state, val) {
      state.items = val
    },
  },
  actions: {},
}
