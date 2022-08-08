module redengine.core.shaders.shader;

import redengine.interfaces.ishader;

import std.stdio;
import bindbc.opengl;

class Shader : IShader {
private:
    uint type;
    uint shaderId;

    uint getShader(uint type, string shaderPath){
        string source;
        {
            auto file = File(shaderPath, "r");
            while(!file.eof()){
                string line = file.readln();
                source ~= line;
            }
            file.close();
        }
        uint shader = glCreateShader(type);
        {
            const GLint[1] lengths = [cast(int)source.length];
            const(char)*[1] sources = [source.ptr];
            glShaderSource(shader, 1, sources.ptr, lengths.ptr);
            glCompileShader(shader);
        }
        return shader;
    }

public:
    this(uint type, string shaderPath){
        this.shaderId = getShader(type, shaderPath);
        this.type = type;
    }

    uint getShaderId(){
        return this.shaderId;
    }

    uint getType(){
        return this.type;
    }
    
}