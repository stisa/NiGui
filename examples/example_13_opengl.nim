# This example shows the basic use of the NiGui toolkit.

import ../src/nigui
# First, import the library.
import opengl

app.init()
# Initialization is mandatory.

var window = newWindow("NiGui Example")

window.width = 600
window.height = 400

# Create the control that holds the context
var gl = window.initGL()
# Initialize and add the context to the window
window.add(gl)

loadExtensions()
glClearColor(0.0, 1.0, 0.0, 1.0)
glClear(GL_COLOR_BUFFER_BIT)

gl.onDraw = proc (event: DrawEvent) =
  swapBuffers()

window.show()

app.run()