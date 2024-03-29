# MXHX for MinimalComps

Registers [MinimalComps](https://lib.haxe.org/p/minimalcomps) components for use with MXHX.

_Note:_ You will also need to install either [mxhx-component](https://github.com/mxhx-dev/mxhx-component) or [mxhx-runtime-component](https://github.com/mxhx-dev/mxhx-runtime-component), depending on whether you want to create MXHX components at compile-time or at run-time.

## Minimum Requirements

- Haxe 4.0
- MinimalComps 1.0

## Installation

This library is not yet available on Haxelib, so you'll need to install it from Github.

```sh
haxelib git mxhx-minimalcomps https://github.com/mxhx-dev/mxhx-minimalcomps.git
```

## Project Configuration

After installing the library above, add it to your OpenFL _project.xml_ file:

```xml
<haxelib name="mxhx-minimalcomps" />
```

You will also need to add one of the following libraries (but probably not both):

```xml
<haxelib name="mxhx-component" />
```

or

```xml
<haxelib name="mxhx-runtime-component" />
```

## Usage

The MinimalComps namespace for MXHX is _https://ns.mxhx.dev/minimalcomps/mxhx_.

```xml
<?xml version="1.0" encoding="utf-8"?>
<m:Application xmlns:mx="https://ns.mxhx.dev/2024/mxhx"
	xmlns:m="https://ns.mxhx.dev/minimalcomps/mxhx">
	<mx:Declarations>
	</mx:Declarations>
</m:Application>
```
