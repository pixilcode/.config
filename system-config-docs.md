# System Configuration

## Tools

### `notify-send`

Send simple notifications to the user.

```bash
notify-send "Title" "My message"
```


### `yad` (Yet Another Dialog)

A more complete tool for dialog boxes, including tools for
calendar selection, text entry, and progress bars. The following
is just a sample. Use `yad --help` for a full list.

```bash
yad --title="Name Entry" --text="We need your name for important purposes" --entry --entry-label="Enter your name:"
```

### `dex` (DesktopEntry Execution)

Run and create desktop entries.

```
dex ... # run an entry
dex --create ... # create an entry
dex --property ... # get an entry property
```

### `fc-list`

List all fonts installed on the system


## Desktop Entries

Desktop entries enable you to add programs to a launcher. See
<https://wiki.archlinux.org/title/Desktop_entries> for more details.


## General System Config

### `PATH` variable

To update the `PATH` variable, add an entry to `~/.config/path`. Both
nushell and bash read this file.


## Sway Config

### Assign a Workspace

This will move any window with an app ID of `firefox` to workspace 2.

```
assign [app_id="firefox"] 2
````

You may also want to give the app focus when it opens.

```
for_window [app_id="firefox"] focus
```

### Make a window floating by default

This will cause a window to be a floating window when
it opens.

```
for_window [window_role="About"] floating enable
```

If you would like to assign it a size, use the following.

```
for_window [title="htop"] floating enable, resize set width 50 ppt height 70 ppt
```

### Inhibit idling for an app when fullscreen

```
for_window [app_id="firefox"] inhibit_idle fullscreen
```

### Configure notification appearance

Currently, `mako` is used for Sway notifications.

See `config.d/autostart_applications` for details on how it
is started.

### Debugging authentication problems

If commands such as `systemctl start bluetooth` are giving weird-looking
prompts (aesthetically), then check `config.d/autostart_applications`
to make sure that you have the correct authentication agent running.

### Autostarting applications

Desktop applications found in `/etc/xdg/autostart/` and `~/.config/autostart` are
automatically run on start up, as defined in `config.d/autostart_applications`.

### Running sway commands after config

In order to run sway commands after configuration, use `swaymsg <cmd>`.

### Updating the keyboard configuration

To change which keyboard is being used, update `config.d/input`.

### Configuring screens

To configure screens, update `config.d/input`.

### Discovering what keycode to use for a keybinding

To figure out what name to use for a key, use `wev | grep 'sym'`.
However, note that not all keys have an associated symbol, especially
if the keyboard is built for Windows.

### Editing the theme

To edit the theme of sway, update `config.d/theme`.

### Waybar configuration

The sway configuration uses `waybar` as defined in `config.d/theme`.

For details on configuring waybar, see <https://github.com/Alexays/Waybar/wiki/Configuration>.
