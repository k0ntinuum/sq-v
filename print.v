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