pub fn cls() {
	print('\x1b[2J')
}

pub fn move_cursor(r int, c int) {
	print('\x1b[${r};${c}H')
}

pub fn hide_cursor() {
	print('\x1b[?25l')
}

pub fn show_cursor() {
	print('\x1b[?25h')
}

pub fn set_text_color_rgb(r int, g int, b int) {
	print('\x1b[38;2;${r};${g};${b}m')
}
