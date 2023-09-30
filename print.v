pub fn print_glyph(g Glyph) {
	match g {
		0 { print("O")}
		1 { print("|")}
		else {print("${g}")}
	}
}

pub fn print_glyph_vector(v []Glyph) {
	for i in 0..v.len { print_glyph(v[i]) }
	print("\n")
}

pub fn print_glyph_vectors(u []Glyph, v []Glyph, k int) {
	for i in 0..u.len { 
		//if i == k {set_text_color_rgb(255,0,0) } else {set_text_color_rgb(255,255,255)}
		print_glyph(u[i]) 
	}
	print("  ")
		for i in 0..v.len { 
		//if i == k {set_text_color_rgb(255,0,0) } else {set_text_color_rgb(255,255,255)}
		print_glyph(v[i]) 
	}
	print("\n")
	set_text_color_rgb(255,255,255)
}