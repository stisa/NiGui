# This example shows how to draw a triangle with opengl
import nigui
# First, import the library.
import opengl

app.init()
# Initialization is mandatory.

var window = newWindow("NiGui OpenGL Example")

window.width = 600
window.height = 400

# Create the control that holds the context
var gl = window.initGL()
# Initialize and add the context to the window
window.add(gl)

loadExtensions()
glClearColor(1.0, 1.0, 1.0, 1.0)
glClear(GL_COLOR_BUFFER_BIT)

var vertices = [
  -0.5'f32,0.5,0.0,
  -0.5,-0.5,0.0,
  0.5,-0.5,0.0, 
];

# Create an empty buffer object to store vertex buffer
var 
  vertexBuffer: GLuint
glGenBuffers(1,addr vertexBuffer)

# Bind appropriate array buffer to it
glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer)

# Pass the vertex data to the buffer
glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), addr vertices, GL_STATIC_DRAW)

# Unbind the buffer
glBindBuffer(GL_ARRAY_BUFFER, 0)

# Shaders

# Vertex shader source code
var vertCode = "attribute vec3 coordinates;"&
  "void main(void) {" &
  " gl_Position = vec4(coordinates, 1.0);" &
  "}"
  
# Create a vertex shader object
var vertShader = glCreateShader(GL_VERTEX_SHADER)

# Attach vertex shader source code
glShaderSource(vertShader, 1, [vertCode].allocCStringArray, nil)

# Compile the vertex shader
glCompileShader(vertShader)

#fragment shader source code
var fragCode ="void main(void){" &
  "gl_FragColor = vec4(1.0, 0.0, 0.0, 0.1);" &
  "}"
  
# Create fragment shader object
var fragShader = glCreateShader(GL_FRAGMENT_SHADER)

# Attach fragment shader source code
glShaderSource(fragShader, 1, [fragCode].allocCStringArray, nil)

# Compile the fragmentt shader
glCompileShader(fragShader)

# Create a shader program object to store
# the combined shader program
var shaderProgram = glCreateProgram()

# Attach a vertex shader
glAttachShader(shaderProgram, vertShader)

# Attach a fragment shader
glAttachShader(shaderProgram, fragShader)

# Link both the programs
glLinkProgram(shaderProgram)
# Use the combined shader program object
glUseProgram(shaderProgram)

# Associating shaders to buffer objects

# Bind vertex buffer object
glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer)

# Get the attribute location
var coord = glGetAttribLocation(shaderProgram, "coordinates").GLuint

# Point an attribute to the currently bound VBO
glVertexAttribPointer(coord, 3, cGL_FLOAT, false, 0, cast[pointer](0))

# Enable the attribute
glEnableVertexAttribArray(coord)

# Set the view port
glViewport(0,0,window.width.GLSizei,window.height.GLSizei)

# Draw the triangle
glDrawArrays(GL_TRIANGLES, 0, vertices.len.GLSizei)

gl.onDraw = proc (event: DrawEvent) =
  swapBuffers()

window.show()

app.run()