#version 330 core
  
layout(location=0) in vec3 vVertex;		 //per-vertex position
layout(location=1) in vec3 vNormal;  	 //per-vertex normal
 
//uniforms 
uniform mat4 MVP;		  //combined modelview projection matrix
uniform mat4 MV;		  //modelview matrix
uniform mat3 N;			  //normal matrix

//shader outputs to the fragment shader
smooth out vec3 vEyeSpaceNormal;		 //eye space normal
smooth out vec3 vEyeSpacePosition;		//eye space position

void main()
{ 	
	//multiply the object space vertex position with the modelview matrix 
	//to get the eye space vertex position
	vEyeSpacePosition = (MV*vec4(vVertex,1)).xyz; 
	
	//multiply the object space normal with the normal matrix 
	//to get the eye space normal
	vEyeSpaceNormal   = N*vNormal;

	//multiply the combiend modelview projection matrix with the object space vertex
	//position to get the clip space position
    gl_Position = MVP*vec4(vVertex,1);  
}
 