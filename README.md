# Traktor Kontrol QML Files Repository

This repository holds copies of the `qml` directory from Traktor Pro, starting with version 4.4.1.

## Purpose

- Archive and version the QML files from Traktor Pro for reference, comparison, and development.

## Workflow

- For each new Traktor Pro release, the contents of the `qml` directory will be replaced with the files from the new version.
- After updating, a new tag will be created in the format `v[TP version number]` (e.g., `v4.4.1`).
- This allows easy comparison and switching between different Traktor Pro QML versions.

## Usage

- Clone the repository and checkout the tag corresponding to the desired Traktor Pro version.
- Use Git's diff and checkout features to compare QML changes across versions.

## Example Tagging

```
git tag v4.4.1
git tag v4.5.0
```

## QML Customization Guide

For information on customizing Traktor Pro QML files, see the [QML Customization Guide](https://github.com/lsmith77/traktor-kontrol-qml).

## Contribution

This repository is intended for archival purposes. Please do not submit pull requests unless you are updating to a new Traktor Pro version.
