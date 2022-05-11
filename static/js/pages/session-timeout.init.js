$.sessionTimeout({
  keepAliveUrl: "../../pages/utility/starter-page",
  logoutButton: "Logout",
  logoutUrl: "../../authentication/logout",
  redirUrl: "../../authentication/lock-screen",
  warnAfter: 3e3,
  redirAfter: 3e4,
  countdownMessage: "Redirecting in {timer} seconds.",
});
