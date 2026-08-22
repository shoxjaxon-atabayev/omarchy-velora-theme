-- Omarchy Velora — Hyprland theme layer (Omarchy 4 / Quattro).
--
-- Loaded as `omarchy.current.theme.hyprland` by
-- $OMARCHY_PATH/default/hypr/omarchy.lua: after Omarchy's own
-- default/hypr/looknfeel.lua and default/hypr/windows.lua, and before the
-- user's ~/.config/hypr/*.lua. Everything below therefore overrides Omarchy's
-- defaults while staying overridable by personal config.
--
-- Migrated from Velora's Omarchy 3 hyprland.conf. Only the visual identity is
-- carried across — borders, spacing, rounding, shadows, blur, opacity and
-- animation feel. Input, layout and binding behaviour stay with Omarchy.

-- ── Borders ─────────────────────────────────────────────────────────────────
-- Velora's signature: a cool white gradient on focus, near-invisible grey when
-- unfocused. These mirror colors.toml's hyprland_active_border /
-- hyprland_inactive_border so shell.toml's [hyprland] tokens stay in sync.
local active_border_color = { colors = { "rgba(ffffff66)", "rgba(ffffff22)" }, angle = 90 }
local inactive_border_color = "rgba(3a3a3a60)"

local group_border_active = { colors = { "rgba(ffffff55)", "rgba(ffffff22)" }, angle = 90 }
local group_border_inactive = "rgba(3a3a3a55)"
local group_locked_active = { colors = { "rgba(ff990088)", "rgba(ff990022)" }, angle = 90 }
local group_locked_inactive = "rgba(3a3a3a77)"

-- ── Premium frosted glass ───────────────────────────────────────────────────
-- Dark tinted glass with clearly visible, diffused backdrop detail — not flat
-- transparency, not a muddy opaque panel. `contrast` above 1.0 and neutral
-- `brightness` (see decoration.blur below) are what actually deliver that;
-- window/shell opacity only controls how much of the blurred backdrop blends
-- through the tint.
--
-- Terminals deliberately keep their own background fully opaque (see
-- alacritty.toml / kitty.conf / ghostty.conf) so that window translucency has
-- exactly one source: the opacity values below. Stacking a translucent
-- terminal background on top of these produced the "transparent terminal"
-- look this theme is trying to avoid.
local glass_active_opacity = 0.92
local glass_inactive_opacity = 0.88

-- Terminals are large flat-color panels — they need to sit thinner than
-- regular windows or there's not enough blur blend to perceive at all.
local terminal_active_opacity = 0.80
local terminal_inactive_opacity = 0.76

-- Layer surfaces below this alpha are left unblurred, so the fully
-- transparent padding around bar modules, notification cards and panels does
-- not pick up a blur halo.
local glass_ignore_alpha = 0.2

hl.config({
  general = {
    -- Velora runs tighter than Omarchy's 5/10 default. Personal spacing
    -- belongs in ~/.config/hypr/looknfeel.lua, which loads after this file.
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = group_border_active,
      border_inactive = group_border_inactive,
      border_locked_active = group_locked_active,
      border_locked_inactive = group_locked_inactive,
    },

    groupbar = {
      font_size = 10,
      gaps_in = 3,
      gaps_out = 3,
    },
  },

  decoration = {
    -- The shell reads decoration:rounding straight out of hyprctl for its
    -- own corner radius, so this rounds every Quickshell glass surface
    -- (menu, bar, panels, notifications, ...) to match windows automatically
    -- — there's no per-surface radius to set separately. rounding_power > 2
    -- gives a smoother superellipse curve than Hyprland's default circular
    -- corner, closer to how native Quattro themes round their surfaces.
    rounding = 10,
    rounding_power = 3,

    -- Fallback for windows Omarchy's own rules do not tag; the tag rules
    -- further down are what actually drive most windows.
    active_opacity = glass_active_opacity,
    inactive_opacity = glass_inactive_opacity,
    fullscreen_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 25,
      render_power = 3,
      color = "rgba(00000055)",
      color_inactive = "rgba(00000044)",
      offset = { 0, 5 },
      scale = 1.0,
    },

    blur = {
      enabled = true,
      size = 20,
      passes = 3,
      noise = 0.0117,
      -- contrast > 1.0 gives blurred detail real separation instead of
      -- flattening it toward mid-gray (Hyprland runs an S-curve gain here,
      -- not CSS-style linear contrast — 1.15 is a mild, deliberate push, not
      -- a guess). brightness = 1.0 is the only truly neutral value: Hyprland
      -- applies it twice, asymmetrically (brightens pre-blur only if > 1.0,
      -- darkens post-blur only if < 1.0), so the old 0.9 was silently
      -- darkening every blurred pixel and is the direct cause of blur
      -- reading muddy over dark backdrops. vibrancy is a perceptually-aware
      -- HSL saturation boost divided by `passes`; 0.20 stays subtle.
      contrast = 1.15,
      brightness = 1.0,
      vibrancy = 0.20,

      -- Frost application context menus and dropdowns as well, so an open
      -- menu inside a window matches the window it belongs to.
      popups = true,
      popups_ignorealpha = glass_ignore_alpha,
    },
  },
})

-- ── Window opacity ──────────────────────────────────────────────────────────
-- Omarchy tags every window `default-opacity` in default/hypr/windows.lua and
-- then applies "0.985 0.96"; apps that must stay solid (mpv, vlc, OBS, Steam,
-- qemu, RetroArch, PiP, webcam overlay …) drop the tag first. Re-applying the
-- rule to the same tag keeps every one of those opt-outs intact.
o.window({ tag = "default-opacity" }, { opacity = glass_active_opacity .. " " .. glass_inactive_opacity })

-- Browsers are opted out of default-opacity upstream and pinned to
-- "1.0 0.985". Velora wants them in the same glass system as everything else;
-- delete these two lines to hand browsers back to the Omarchy default.
o.window({ tag = "chromium-based-browser" }, { opacity = glass_active_opacity .. " " .. glass_inactive_opacity })
o.window({ tag = "firefox-based-browser" }, { opacity = glass_active_opacity .. " " .. glass_inactive_opacity })

-- Terminals: a single explicit "thin" tier, not Omarchy's shared `terminal`
-- tag. Alacritty, kitty and Ghostty all ship Velora-authored configs pinned
-- opaque (see alacritty.toml/kitty.conf/ghostty.conf), so they need the same
-- lower opacity to expose blur through their otherwise flat backgrounds; the
-- About window is a TUI running inside Alacritty and gets the same
-- treatment. Deliberately NOT using Omarchy's `terminal` tag: that also
-- matches foot, wezterm, and every dense org.omarchy.*/TUI.* app (btop,
-- lazygit, ...) — Velora doesn't theme foot/wezterm (their own opacity is
-- unknown and untouchable, risking a silent double-transparency stack), and
-- dense TUIs weren't asked for and are a real legibility risk at this
-- opacity without a dedicated check.
o.window(
  "(Alacritty|kitty|com\\.mitchellh\\.ghostty|org\\.omarchy\\.about)",
  { opacity = terminal_active_opacity .. " " .. terminal_inactive_opacity }
)

-- ── Shell surface glass ─────────────────────────────────────────────────────
-- Window blur alone stops at the edge of Quickshell. Omarchy 4 renders its
-- bar, menus, panels, notifications and OSD as layer-shell surfaces, so each
-- one needs its own layer rule to get the same backdrop. The alpha of those
-- surfaces is set in shell.toml — blur here, tint there.
--
-- Namespaces are the ones the running shell actually registers (see
-- `hyprctl layers` and $OMARCHY_PATH/shell/**/*.qml). Deliberately excluded:
-- omarchy-background (the wallpaper itself), omarchy-bar-drag-ghost and
-- omarchy-bar-move-ghost (drag affordances), omarchy-keyboard-panel-dismiss
-- (an invisible click catcher) and omarchy-lock-preview (the lock screen
-- already blurs its own wallpaper in QML).

-- The bar, plus every flyout and tooltip it opens as an xdg popup — that
-- covers the audio, network, bluetooth, monitor, power and clock panels when
-- they are opened by mouse.
hl.layer_rule({
  name = "velora-glass-bar",
  match = { namespace = "^omarchy-bar$" },
  blur = true,
  blur_popups = true,
  ignore_alpha = glass_ignore_alpha,
})

-- Scrim-backed cards: menu, clipboard and emojis (all three render through
-- Menu.qml's Color.menu tokens) plus polkit and the image selector each draw
-- a single wlr-layer-shell surface that contains TWO regions of very
-- different alpha: a fullscreen scrim (shell.toml scrim-alpha, 0.25) behind
-- a smaller card (background-alpha, 0.43 for menu/clipboard/emojis, 0.55 for
-- polkit; the image selector has no card, only its scrim). One layer_rule
-- can't blur one region of a surface and not another directly, but
-- ignore_alpha *is* a per-pixel alpha gate — so setting it between those two
-- values makes the scrim (0.25, below the gate) fall through unblurred as a
-- light dim wash, while the card (0.43+, above the gate) keeps the frosted
-- blur.
--
-- The card alpha and this gate must move together: drop card alpha below
-- the gate and blur silently turns off for the card too (it just shows the
-- raw, unblurred backdrop at low opacity — easy to mistake for "blur is
-- broken" rather than "blur is skipped here"). Keep real margin on both
-- sides of the gate, not just enough to clear it on paper: card edges
-- (the gradient border, corner/shadow blending) produce a band of soft
-- intermediate-alpha pixels, not a hard step, so a tight margin risks part
-- of that edge falling below the gate — a visible unblurred seam right
-- where the border is supposed to read as a clean glass edge. 0.33 keeps
-- ~0.08 above the scrim and ~0.10 below the lowest card.
local scrim_card_ignore_alpha = 0.33

hl.layer_rule({
  name = "velora-glass-scrim-cards",
  match = { namespace = "^omarchy-(menu|clipboard|emojis|polkit|image-selector)$" },
  blur = true,
  blur_popups = true,
  ignore_alpha = scrim_card_ignore_alpha,
})

-- Full-surface overlays with no scrim of their own: the keyboard-driven panel
-- scaffolding (network/bluetooth/power/etc.), notifications, OSD, reminders,
-- the Wi-Fi QR card and the speed-test gauges. The entire visible area here
-- *is* the card, so it stays frosted edge to edge.
hl.layer_rule({
  name = "velora-glass-overlays",
  match = {
    namespace = "^omarchy-(keyboard-panel|notifications|osd|reminders|network-qr|disk-speedtest|network-speedtest)$",
  },
  blur = true,
  blur_popups = true,
  ignore_alpha = glass_ignore_alpha,
})

-- ── Animations ──────────────────────────────────────────────────────────────
-- Velora's water-and-flow curve set, ported from the Omarchy 3 config. Drop
-- this whole block to fall back to Omarchy's default animation feel.
hl.curve("veloraWater", { type = "bezier", points = { { 0.22, 0.9 }, { 0.36, 1.0 } } })
hl.curve("veloraFlow", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1.0 } } })
hl.curve("veloraRipple", { type = "bezier", points = { { 0.33, 0.0 }, { 0.2, 1.0 } } })
hl.curve("veloraStream", { type = "bezier", points = { { 0.4, 0.0 }, { 0.4, 1.0 } } })
hl.curve("veloraCascade", { type = "bezier", points = { { 0.19, 1.0 }, { 0.22, 1.0 } } })
hl.curve("veloraStandard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("veloraAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("veloraOvershot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3.0, bezier = "veloraWater" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.8, bezier = "veloraCascade" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.4, bezier = "veloraStream" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.6, bezier = "veloraFlow" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.4, bezier = "veloraWater" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.0, bezier = "veloraCascade" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.8, bezier = "veloraRipple" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 2.0, bezier = "veloraWater" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 1.4, bezier = "veloraFlow" })
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "veloraStandard" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1.5, bezier = "veloraOvershot", style = "popin 80%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.3, bezier = "veloraAccel", style = "popin 90%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.8, bezier = "veloraFlow" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.5, bezier = "veloraWater" })
hl.animation({ leaf = "border", enabled = true, speed = 2.9, bezier = "veloraWater" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 3.5, bezier = "veloraFlow" })
