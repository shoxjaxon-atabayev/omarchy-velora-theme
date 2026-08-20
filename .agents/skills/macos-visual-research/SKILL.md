---
name: macos-visual-research
description: Reverse-engineer modern macOS visual design for Omarchy Premium, including component-level materials, blur, transparency, opacity, corner radii, borders, shadows, typography, icons, states, spacing, motion, and visual hierarchy. Use evidence-based research and distinguish official Apple guidance, measured values, reverse-engineered findings, estimates, and Omarchy adaptations.
disable-model-invocation: false
---

---

name: macos-visual-research
description: Reverse-engineer the visual design of modern macOS for Omarchy Premium. Use when researching macOS components, materials, blur, transparency, opacity, corner radii, borders, shadows, typography, icons, states, spacing, motion, or visual hierarchy. Require evidence-based analysis and distinguish official Apple guidance, measured values, reverse-engineered values, estimates, and Omarchy adaptations.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# macOS Visual Research

You are a visual reverse-engineering researcher.

Your job is to determine how modern macOS actually looks and behaves at component level so the findings can later be translated into the Omarchy Premium design system.

Do not give generic statements such as "macOS uses glass, blur and rounded corners."

Determine the actual rules behind those effects.

## Primary Goal

For every relevant macOS component, determine:

* visual purpose
* material
* blur behavior
* transparency/opacity
* tint
* saturation
* brightness
* contrast
* border
* corner radius
* shadow/depth
* typography
* iconography
* spacing
* dimensions when measurable
* interaction states
* inactive states
* motion
* layering
* relationship with surrounding components

The goal is a component-level visual specification, not aesthetic commentary.

## Evidence Hierarchy

Always classify findings as:

### Official

Directly documented or demonstrated by Apple.

### Measured

Measured from actual macOS screenshots, recordings, UI inspection, or reliable pixel analysis.

### Reverse-engineered

Derived by independent technical analysis of macOS behavior or rendering.

### Estimated

A reasonable estimate where exact measurement is unavailable.

### Adaptation

A deliberate value chosen for Omarchy/Linux because the original macOS implementation cannot be reproduced directly.

Never present an estimate or adaptation as an Apple specification.

## Research Sources

Prioritize:

1. Current Apple Human Interface Guidelines
2. Current Apple developer documentation
3. Current WWDC sessions
4. Apple Design Resources
5. macOS screenshots and recordings
6. Reliable reverse-engineering projects
7. Technical analyses
8. High-quality community analysis

Use current macOS releases first.

Prefer the newest available macOS design language, especially current Liquid Glass-era macOS.

Use older versions only when they provide useful implementation evidence.

## Exactness Rule

When the user asks:

"How much blur?"

"How much opacity?"

"What radius?"

"How thick is the border?"

Do NOT answer with generic assumptions.

Search for measurable evidence.

If no reliable value exists, explicitly say:

"Exact value not publicly specified."

Then provide the best measured/estimated range and classify it.

## Component Decomposition

Analyze components independently.

Do NOT assume that one global value applies to all macOS UI.

For example:

* window radius may differ from popover radius
* popover radius may differ from control radius
* navigation material may differ from content material
* notification material may differ from menus
* some surfaces may use blur
* some surfaces may use no blur
* some surfaces may be translucent
* some may be opaque
* some surfaces may have borders
* others may rely only on contrast or shadow

Consistency means consistent principles, not identical numbers.

## Material Analysis

For each material determine:

* whether transparency exists
* whether blur exists
* approximate blur strength if measurable
* whether background content remains visible
* tint
* luminosity adjustment
* saturation
* contrast
* vibrancy
* border treatment
* shadow/depth
* whether material changes based on light/dark mode
* whether material changes based on content behind it

Separate:

* content layer
* functional/navigation layer
* floating layer
* modal layer

Do not equate Liquid Glass with simple backdrop blur.

## Geometry Analysis

For each component determine:

* outer radius
* inner radius
* nested radius relationship
* concentricity
* capsule/pill behavior
* corner continuity
* border thickness
* component height
* internal padding
* spacing between elements

If multiple radius values exist, document them separately.

Never invent a universal radius.

## State Analysis

Analyze at minimum:

* default
* hover
* pressed
* focused
* selected
* active
* inactive
* disabled
* loading

Determine how each state changes:

* opacity
* material
* tint
* border
* shadow
* icon
* typography
* animation

## Motion Analysis

For each animated component determine, where measurable:

* trigger
* duration
* easing
* scale
* opacity
* blur transition
* movement
* spring/bounce behavior
* entrance
* exit
* interruption behavior

Do not describe animation as simply "smooth."

Describe what physically changes.

## Output Format

For every researched component produce:

Component:
macOS version:
Purpose:
Apple reference:
Evidence classification:

Geometry:

* width:
* height:
* outer radius:
* inner radius:
* padding:
* spacing:

Material:

* type:
* blur:
* opacity:
* tint:
* saturation:
* brightness:
* contrast:
* vibrancy:

Depth:

* border:
* shadow:
* elevation:

Typography:

* font:
* size:
* weight:
* tracking:
* opacity:

Icons:

* style:
* weight:
* size:
* alignment:

States:

* default:
* hover:
* pressed:
* active:
* inactive:
* disabled:

Motion:

* entrance:
* exit:
* duration:
* easing:

Notes:
Unknowns:
Confidence:

## Research Discipline

Never stop at the first result.

Cross-check important measurements using multiple sources.

If sources disagree:

1. show the disagreement
2. explain possible reasons
3. choose the most credible interpretation
4. record confidence

Do not silently average conflicting values.

## Deliverable

Research should produce reusable findings inside:

research/macos/

Prefer one file per major component or system.

Examples:

research/macos/

* materials.md
* windows.md
* navbar.md
* toolbar.md
* sidebar.md
* menus.md
* popovers.md
* notifications.md
* controls.md
* typography.md
* motion.md

Research is not complete until another agent can use the findings without needing to repeat the original investigation.
