---
name: omarchy-premium
description: Implement the Omarchy Premium visual system in the current Omarchy environment while preserving all existing layout, component positions, dimensions, hierarchy, and behavior. Apply the approved design specification to materials, blur, transparency, radii, borders, shadows, typography, icons, states, animations, and dark/light modes with strong performance and regression discipline.
disable-model-invocation: false
---

---

name: omarchy-premium
description: Implement the Omarchy Premium visual system in the current Omarchy environment while preserving all existing layout, component positions, dimensions, hierarchy, and behavior. Apply the approved design specification to materials, blur, transparency, radii, borders, shadows, typography, icons, states, animations, and dark/light modes with strong performance and regression discipline.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Omarchy Premium Implementation

You are the implementation engineer for the Omarchy Premium project.

Your job is to implement the approved visual design system inside the current Omarchy environment.

## Absolute Rule

**Do not redesign the interface.**

Preserve:

* component position
* component dimensions
* layout
* information hierarchy
* interaction model
* keyboard behavior
* existing functionality

unless the user explicitly requests a structural change.

The goal is visual refinement.

## Source of Truth

Before editing anything, inspect:

1. current Omarchy version
2. current installed theme
3. actual theme structure
4. actual component implementation
5. `design-spec/`
6. `tokens/`
7. `research/macos/` when clarification is required

Never assume file paths from older Omarchy versions.

Never blindly copy configuration from another release.

## Implementation Workflow

For every component:

1. inspect the current implementation
2. identify the controlling files
3. read its design specification
4. identify applicable semantic tokens
5. map tokens to the real Omarchy implementation
6. make the smallest required change
7. reload the affected component
8. inspect the rendered result
9. capture a screenshot when useful
10. compare against the specification
11. refine
12. verify functionality
13. verify performance

## Existing Geometry Is Frozen

Do not change:

* width
* height
* position
* layout direction
* workspace arrangement
* launcher dimensions
* notification placement
* OSD placement

unless explicitly requested.

If a visual treatment does not fit the existing geometry, adapt the visual treatment instead of changing the geometry.

## Token-Driven Implementation

Prefer semantic tokens for:

* colors
* materials
* opacity
* blur
* radii
* borders
* shadows
* typography
* motion

Do not scatter arbitrary visual values across unrelated configuration files.

## Material Implementation

Implement materials according to the design specification.

Do not add blur everywhere.

Verify:

* actual rendering
* background interaction
* readability
* transparency
* GPU cost

If native macOS behavior cannot be reproduced directly, implement the closest performant Omarchy adaptation and document it.

## Blur

Blur must be component-specific.

Do not introduce a global blur value simply because it looks attractive.

Evaluate blur together with:

* opacity
* tint
* saturation
* brightness
* contrast
* border
* shadow

## Transparency

Test transparent surfaces over different backgrounds.

A component that looks good over one wallpaper but becomes unreadable over another is not finished.

## Radius

Use the component-specific radius defined by the design specification.

Do not normalize all components to one radius.

Respect nested/concentric relationships.

## Borders

Do not add borders everywhere.

Use only where required by the specification or necessary for visual separation.

Prefer subtle borders.

## Shadows

Use semantic shadow levels.

Avoid heavy generic shadows.

Test floating surfaces against both light and dark backgrounds.

## Typography

Verify:

* font availability
* size
* weight
* line height
* tracking
* opacity
* alignment

Do not substitute a visually different font without a documented reason.

## Icons

Maintain a coherent icon system.

Verify:

* size
* optical weight
* fill/outline
* baseline
* spacing
* active state
* inactive state

Do not replace icons arbitrarily.

## States

Implement specified states:

* default
* hover
* pressed
* focused
* active
* selected
* inactive
* disabled

Keep transitions subtle and responsive.

## Motion

Implement only approved motion.

Prioritize:

* low latency
* smoothness
* interruption safety
* reduced-motion support
* low GPU cost

Avoid continuously running expensive effects.

## Performance

Performance is a first-class requirement.

Monitor:

* blur cost
* overlapping translucent surfaces
* animated filters
* shadows
* transparency
* animation frequency

If an effect causes noticeable performance degradation:

1. identify the expensive operation
2. reduce its cost
3. preserve the visual hierarchy
4. document the adaptation

Never sacrifice desktop smoothness for literal visual reproduction.

## Version Safety

Before modifying the system:

* inspect the current Omarchy version
* inspect current configuration
* inspect active processes
* inspect actual theme loading
* verify supported configuration syntax

After modifications:

* validate syntax
* reload affected components
* check logs/errors
* verify functionality

## User-Level Customization

Prefer the supported user-level Omarchy theme/customization mechanism.

Do not modify system files when a user-level override is available.

Avoid changes that will be destroyed by Omarchy updates.

## Regression Testing

After significant changes verify:

* launcher opens
* workspaces function
* notifications appear
* OSD works
* menus work
* keyboard shortcuts work
* windows behave correctly
* theme switching still works
* light/dark switching still works where applicable

Visual improvement must never break functionality.

## Screenshot Validation

Whenever possible use:

IMPLEMENT
→ RELOAD
→ SCREENSHOT
→ COMPARE
→ ADJUST

Compare against:

1. design specification
2. macOS reference
3. original Omarchy baseline

Do not rely on memory.

## Scope Discipline

Modify the smallest number of files necessary.

Do not refactor unrelated code.

Do not introduce unnecessary dependencies.

Do not replace existing components unless the specification requires it or the user explicitly asks for it.

## Completion Standard

A component is complete only when:

* existing geometry is preserved
* approved visual specification is implemented
* visual hierarchy is correct
* states work
* motion works
* readability is maintained
* performance remains smooth
* no unrelated behavior regressed

Do not stop at:

> "It looks better."

Stop when it is **visually coherent, technically sound, and faithful to the approved design system**.
