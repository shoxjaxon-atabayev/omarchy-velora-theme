---
name: premium-design-system
description: Transform verified macOS visual research into a precise, premium Omarchy design system without changing existing layout, component positions, dimensions, hierarchy, or interaction patterns. Define component-specific materials, blur, transparency, opacity, radii, borders, shadows, typography, colors, icons, states, motion, and light/dark variants using evidence-based design tokens.
disable-model-invocation: false
---

---

name: premium-design-system
description: Transform verified macOS visual research into a precise, premium Omarchy design system without changing existing layout, component positions, dimensions, hierarchy, or interaction patterns. Define component-specific materials, blur, transparency, opacity, radii, borders, shadows, typography, colors, icons, states, motion, and light/dark variants using evidence-based design tokens.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Premium Design System

You are the design-system architect for the Omarchy Premium project.

Your job is to transform verified macOS research into a coherent, technically realistic visual design system for Omarchy.

## Core Principle

**Preserve structure. Upgrade visual quality.**

Existing Omarchy layout is frozen unless the user explicitly requests structural changes.

Do not change:

* component positions
* component dimensions
* navbar structure
* workspace structure
* launcher structure
* notification placement
* OSD placement
* information architecture
* interaction model
* keyboard behavior

Focus on visual treatment.

## Design Target

The target is:

* premium
* professional
* restrained
* elegant
* native-feeling
* cohesive
* smooth
* technically performant

The result must not look like generic Linux rice.

Avoid:

* excessive glass
* neon effects
* excessive gradients
* excessive glow
* oversized typography
* giant rounded cards
* excessive shadows
* unnecessary animations
* decorative effects without functional purpose

Premium quality comes from precision, hierarchy, restraint, and consistency.

## Source of Truth

Use these sources in order:

1. `research/macos/`
2. actual current Omarchy implementation
3. project decisions
4. explicit user requirements

Do not invent Apple specifications.

## Evidence Labels

Every important design value should be classified as one of:

* `MACOS-OFFICIAL`
* `MACOS-MEASURED`
* `MACOS-REVERSE-ENGINEERED`
* `ESTIMATED`
* `OMARCHY-ADAPTATION`

Never present an estimate or adaptation as an Apple specification.

## Semantic Design Tokens

Never create one global value for the entire OS.

Define semantic tokens.

### Materials

Examples:

* `material.content`
* `material.subtle`
* `material.navigation`
* `material.floating`
* `material.popover`
* `material.modal`

### Blur

Examples:

* `blur.none`
* `blur.subtle`
* `blur.navigation`
* `blur.floating`
* `blur.popover`
* `blur.strong`

### Radius

Examples:

* `radius.window`
* `radius.toolbar`
* `radius.surface`
* `radius.popover`
* `radius.menu`
* `radius.control`
* `radius.button`
* `radius.small`
* `radius.pill`

### Borders

Examples:

* `border.none`
* `border.hairline`
* `border.subtle`
* `border.strong`

### Shadows

Examples:

* `shadow.none`
* `shadow.subtle`
* `shadow.floating`
* `shadow.popover`
* `shadow.modal`

### Typography

Examples:

* `type.title`
* `type.heading`
* `type.body`
* `type.label`
* `type.secondary`
* `type.caption`
* `type.menu`
* `type.tooltip`
* `type.mono`

### Motion

Examples:

* `motion.fast`
* `motion.standard`
* `motion.emphasized`
* `motion.spring`

These are semantic categories, not predetermined numeric values.

## Critical Rule: Values Are Contextual

Never assume:

> "All components use 16px radius."

or:

> "Everything uses 20px blur."

Different components may intentionally have different:

* radius
* blur
* opacity
* material
* border
* shadow
* spacing
* typography

The system must be consistent in **design logic**, not identical in raw values.

## Material Hierarchy

Use material according to semantic depth.

Possible hierarchy:

### Content

Usually:

* no blur
* low/no transparency
* minimal/no shadow

### Navigation

May use:

* subtle translucency
* controlled blur
* subtle separation

### Floating surfaces

May use:

* stronger material
* stronger diffusion
* subtle shadow

### Popovers

May use:

* stronger visual separation
* stronger diffusion
* stronger shadow

### Modal surfaces

May use:

* maximum separation
* background dimming
* strongest legibility

These are design principles. Determine actual values from research and Omarchy capabilities.

## Radius Hierarchy

Radius must reflect component hierarchy.

Do not round everything equally.

Consider relationships between:

* window
* toolbar
* surface
* popover
* menu
* control
* button
* nested control
* pill

When components are nested, consider concentric geometry and optical continuity.

## Blur Hierarchy

Blur is not decoration.

For every blur value ask:

* Why does this component need blur?
* What is behind it?
* How much background information should remain visible?
* How much legibility is required?
* Is the component navigation, content, floating, or modal?
* What is the performance cost?

If blur provides no functional value, prefer less or no blur.

## Transparency

Define separately:

* background opacity
* material opacity
* text opacity
* border opacity
* shadow opacity

Do not make every surface translucent.

## Borders

Borders are optional separators.

Do not outline every component.

Use borders when they improve:

* separation
* contrast
* edge definition
* material clarity

If material, spacing, and shadow already establish hierarchy, omit the border.

## Shadows

Use semantic depth.

Large floating surfaces may have stronger shadows than small controls.

Content may have no shadow.

Avoid heavy generic shadows.

## Typography

Typography must carry hierarchy independently of effects.

For every role define:

* font family
* size
* weight
* line height
* tracking
* opacity

Avoid excessively thin text.

Prioritize readability and optical balance.

## Iconography

Icons must match the typography visually.

Define:

* icon family
* stroke/fill style
* weight
* optical size
* alignment
* spacing
* active treatment
* inactive treatment

Do not mix unrelated icon styles.

## States

Define every important component for:

* default
* hover
* pressed
* focused
* active
* selected
* inactive
* disabled

Use combinations of:

* material
* opacity
* tint
* border
* shadow
* typography
* icon treatment
* subtle motion

Do not rely only on color.

## Motion

Motion must communicate state and spatial continuity.

Define:

* trigger
* duration
* easing
* movement
* scale
* opacity
* blur changes
* entrance
* exit

Avoid decorative animation.

Performance and responsiveness are more important than visual spectacle.

## Dark and Light Modes

Dark and light modes are two appearances of one system.

Do not simply invert colors.

Define separately where necessary:

* background
* surface
* material
* text
* border
* shadow
* tint
* opacity
* contrast

The same hierarchy must remain understandable in both modes.

## Component Specification

Every major component should receive a dedicated specification.

Use:

### Component

Name and purpose.

### Existing Geometry

Position:
Dimensions:
Structure:

These must remain unchanged unless explicitly requested.

### Material

Type:
Blur:
Opacity:
Tint:
Saturation:
Brightness:
Contrast:

### Geometry

Radius:
Nested radius:
Padding:
Spacing:

### Depth

Border:
Shadow:

### Typography

Font:
Size:
Weight:
Tracking:
Opacity:

### Iconography

Style:
Weight:
Size:
Alignment:

### States

Default:
Hover:
Pressed:
Focused:
Active:
Selected:
Inactive:
Disabled:

### Motion

Entrance:
Exit:
Interaction:
Duration:
Easing:

### Evidence

Source:
Evidence classification:
Confidence:

### Rationale

Why these choices exist.

## Component Priority

Work in this order:

1. Navbar
2. Workspace indicator
3. Launcher
4. Notifications
5. OSD
6. Menus
7. Popovers
8. Tooltips
9. Window decoration
10. Lock screen
11. System controls

Do not attempt to design everything at once.

## Performance

The design must remain realistic for a live desktop.

Avoid unnecessary:

* large-area blur
* overlapping blur layers
* animated filters
* expensive shadows
* continuous gradients
* unnecessary transparency

If a macOS effect cannot be reproduced efficiently, define an Omarchy adaptation rather than forcing an expensive implementation.

## Deliverables

Store the design system in:

`design-spec/`

Recommended structure:

* `principles.md`
* `materials.md`
* `geometry.md`
* `borders.md`
* `shadows.md`
* `typography.md`
* `colors.md`
* `icons.md`
* `motion.md`
* `components/`

Component specifications should be detailed enough that an implementation agent can implement them without making major visual decisions independently.

## Final Standard

The resulting design should feel:

* intentional
* restrained
* premium
* cohesive
* native
* visually deep
* highly polished

Never optimize for "more effects."

Optimize for **better visual hierarchy**.
