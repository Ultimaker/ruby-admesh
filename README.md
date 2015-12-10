# ruby-admesh [![ruby-admesh](https://travis-ci.org/Ultimaker/ruby-admesh.svg?branch=master)](https://travis-ci.org/Ultimaker/ruby-admesh)

The `ruby-admesh` gem wraps the
[Admesh STL mesh manipulation tool](http://admesh.readthedocs.org/en/latest/index.html) in a Ruby 
gem.

## Installation

Add to `Gemfile`:

```
gem "ruby-admesh", github: "Ultimaker/ruby-admesh"
```

Run `bundle install` and require the gem:

```
require "admesh"
```

## Perform file operations

Perform file operations by running `Admhes::Admesh.perform(file, options = {})`. It uses the same
options as [the admesh executable](http://admesh.readthedocs.org/en/latest/cli.html#options),
but remember to underscore all options names (eg. `z_rotate` instead of `z-rotate`).

ADMesh supports the following options, grouped by type.

### Mesh Transformation and Manipulation Options

```
   x_rotate: angle          # Rotate CCW about x-axis by angle degrees
   y_rotate: angle          # Rotate CCW about y-axis by angle degrees
   z_rotate: angle          # Rotate CCW about z-axis by angle degrees
   xy-mirror: true          # Mirror about the xy plane
   yz-mirror: true          # Mirror about the yz plane
   xz_mirror: true          # Mirror about the xz plane
   scale: factor            # Scale the file by factor (multiply by factor)
   translate: x,y,z         # Translate the file to x, y, and z
   merge: name              # Merge file called name with input file
```

### Mesh Checking and Repairing Options

```
   exact: true              # Only check for perfectly matched edges
   nearby: true             # Find and connect nearby facets. Correct bad facets
   tolerance: tol           # Initial tolerance to use for nearby check = tol
   iterations: i            # Number of iterations for nearby check = i
   increment: inc           # Amount to increment tolerance after iteration=inc
   remove_unconnected: true # Remove facets that have 0 neighbors
   fill_holes: true         # Add facets to fill holes
   normal_directions: true  # Check and fix direction of normals (ie. CW, CCW)
   reverse_all: true        # Reverse the directions of all facets and normals
   normal_values: true      # Check and fix normal values
   no_check: true           # Don't do any check on input file
```

### File Output Options

```
   write_binary_stl: name   # Output a binary STL file called name
   write_ascii_stl: name    # Output an ASCII STL file called name
   write_off: name          # Output a Geomview OFF format file called name
   write_dxf: name          # Output a DXF format file called name
   write_vrml: name         # Output a VRML format file called name
```

For more information about running `admesh`, please refer to the 
[official documentation](http://admesh.readthedocs.org/en/latest/index.html)

## Print help information

```
Admesh::Admesh.help         # Prints the same info as "admesh --help"
```
