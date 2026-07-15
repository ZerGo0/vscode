# VS Code configuration

This directory is the Git-backed source of truth for VS Code user settings,
keybindings, and extensions. The old Cursor checkout is no longer the source of
truth after the migration.

## Restore on a new machine

```sh
sh ./extensions.txt
```

VS Code reads `settings.json` and `keybindings.json` directly from this directory.

## Save and push changes

```sh
./push.sh
```
