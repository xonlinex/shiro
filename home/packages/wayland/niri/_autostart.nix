{
  spawn-sh-at-startup = [
    "vicinae server"
    "wl-clip-persist --clipboard both"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];

  spawn-at-startup = [
    "noctalia"
  ];

}
