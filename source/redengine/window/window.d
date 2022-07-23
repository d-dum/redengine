module redengine.window.window;

import glfw3.api;

class Window {
private:
    int width;
    int height;
    string title;
    GLFWwindow* window;

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
    }

    ~this(){
        glfwTerminate();
    }

    bool isCloseRequested(){
        return cast(bool)glfwWindowShouldClose(this.window);
    }

    void update(){
        glfwSwapBuffers(window);
        glfwPollEvents();
    }
}