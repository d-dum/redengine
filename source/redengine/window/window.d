module redengine.window.window;

import glfw3.api;
import bindbc.opengl;

class Window {
private:
    int width;
    int height;
    string title;
    GLFWwindow* window;
    void function() updateCallback = null;

public:
    this(int width, int height, string name){
        this.width = width;
        this.height = height;

        if(!glfwInit)
            throw new Exception("Failed to initialize glfw");
        
        glfwWindowHint(GLFW_SAMPLES, 4); // 4x antialiasing
        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE); // opengl core 3.3

        this.window = glfwCreateWindow(width, height, name.ptr, null, null);
        if(!this.window)
            throw new Exception("Failed to create window");
        glfwMakeContextCurrent(this.window);
        glfwSetInputMode(this.window, GLFW_STICKY_KEYS, GLFW_TRUE);

        const GLSupport retVal = loadOpenGL();
        if (retVal == GLSupport.badLibrary || retVal == GLSupport.noLibrary)
            throw new Exception("GLFW not found");
        
        glViewport(0, 0, width, height);

        // Enable depth test
        glEnable(GL_DEPTH_TEST);
        // Accept fragment if it closer to the camera than the former one
        glDepthFunc(GL_LESS);
    }

    this(int width, int height, string name, void function() updateCallback){
        this.updateCallback = updateCallback;
        this(width, height, name);
    }

    ~this(){
        glfwTerminate();
    }

    bool isCloseRequested(){
        return cast(bool)glfwWindowShouldClose(this.window);
    }

    void update(){
        if(this.updateCallback != null)
            this.updateCallback();
        glfwSwapBuffers(window);
        glfwPollEvents();
    }
}