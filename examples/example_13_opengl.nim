# This example shows how to open an opengl context

import nigui

import opengl

app.init()

var window = newWindow("NiGui OpenGL Example")

window.width = 600
window.height = 400

# Create the control that we will use to handle events
var gl = window.initGL()
# Add the control to the window
window.add(gl)

loadExtensions()
glClearColor(0.0, 1.0, 0.0, 1.0)
glClear(GL_COLOR_BUFFER_BIT)

gl.onDraw = proc (event: DrawEvent) =
  swapBuffers()

window.show()

app.run()