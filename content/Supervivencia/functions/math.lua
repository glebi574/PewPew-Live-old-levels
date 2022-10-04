	
	function sin_fx(angle)
		local s,c = fmath.sincos(angle)
		return s
	end
	
	function cos_fx(angle)
		local s,c = fmath.sincos(angle)
		return c
	end
	
	function random_sincos()
		local angle = fmath.random_fixedpoint(0fx,628fx) / 100fx
		local s, c = fmath.sincos(angle)
		return s, c
	end
	
	function chance(i)
		if fmath.random_int(1,100) <= i then return true end
		return false
	end
	
	function abs_int(n)
		if n < 0 then n = -n end
		return n
	end
	
	function abs_fx(n)
		if n < 0fx then n = -n end
		return n
	end
	
	function count_lenght(a1,b1,a2,b2)
		local n 
		if a2 == 0fx and b2 == 0fx then
			n = fmath.sqrt(a1 * a1 + b1 * b1)
		else
			n = fmath.sqrt((a1 - a2) * (a1 - a2) + (b1 - b2) * (b1 - b2))
		end
		if n == 0fx then n = 0.1fx end
		return n
	end
	
	function count_vector(a1,b1,a2,b2)
		local d = count_lenght(a1,b1,a2,b2)
		if a1 < a2 then d = -d end
		if b1 < b2 then d = -d end
		return d
	end
	