module redengine.misc.quad;

import redengine.misc.vertex;


private const Vertex[4] vertices = [
	Vertex([-0.5, 0.5, 0]),
	Vertex([-0.5, -0.5, 0]),
	Vertex([0.5, -0.5, 0]),
	Vertex([0.5, 0.5, 0])
];

private const ushort[6] indices = [
	0, 1, 3,
	3, 1, 2
];


Vertex[4] cubeVertices()
{
	return vertices;
}

ushort[6] cubeIndices()
{
	return indices;
}