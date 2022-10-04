	
	local a = 6
	local b = 4
	
meshes = {
  {
    vertexes = {{a,a,a + b},{a,-a,a + b},{-a,-a,a + b},{-a,a,a + b},
				{a,a,-a - b},{a,-a,-a - b},{-a,-a,-a - b},{-a,a,-a - b},
				{a + b,a,a},{a + b,a,-a},{a + b,-a,-a},{a + b,-a,a},
				{-a - b,a,a},{-a - b,a,-a},{-a - b,-a,-a},{-a - b,-a,a},
				{a,a + b,a},{-a,a + b,a},{-a,a + b,-a},{a,a + b,-a},
				{a,-a - b,a},{-a,-a - b,a},{-a,-a - b,-a},{a,-a - b,-a}},
    segments = {{0,1,2,3,0},{4,5,6,7,4},
				{8,9,10,11,8},{12,13,14,15,12},
				{16,17,18,19,16},{20,21,22,23,20}},
	colors = {0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1,
			  0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1,
			  0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1,
			  0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1,
			  0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1,
			  0x9b749bf1,0x9b749bf1,0x9b749bf1,0x9b749bf1}
  }
}
