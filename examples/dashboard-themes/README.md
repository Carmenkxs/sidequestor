# Dashboard theme templates

A starting point for several switchable dashboard themes in one workspace, built on theme API v1
(`runtime/yaas-triage/skills/yaas-dashboard-theme/references/theming.md`).

The built-in dashboard styles hard-code about 300 colours, so the documented variables alone
don't recolour every panel. `assets/base.css` points those fixed colours at a small set of
`--t-*` variables, so one theme file can restyle the whole page, including review cards, pop-ups
and the Field Guide. It targets best-effort selectors, so a dashboard update can break parts of it.

## Files

| File                  | What it is                                                         |
|-----------------------|--------------------------------------------------------------------|
| `assets/base.css`     | Shared wiring. Leave it as it is.                                  |
| `assets/starter.css`  | A complete theme with every variable explained. Copy it per theme. |
| `presets/starter.json`| Example logo and activity pictures for one theme.                  |
| `switch.sh`           | Switches colours and pictures together.                            |

## Use

1. Copy this folder's contents into `<workspace>/theme/`.
2. Copy `assets/starter.css` to `assets/<name>.css` and change the colours.
3. Optional: put PNG pictures in `assets/` and copy `presets/starter.json` to
   `presets/<name>.json` with their paths.
4. Run `./theme/switch.sh <name>` from the workspace, then refresh the dashboard.
   `./theme/switch.sh default` goes back to the built-in look.

Only `custom.css` and `branding.json` are read by the dashboard; `switch.sh` writes both.
