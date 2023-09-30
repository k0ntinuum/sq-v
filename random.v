import crypto.rand
fn random_i64_vector(l i64, m u64) []i64 {
	mut vec := []i64{len: int(l), init : 0}
	for mut v in vec {
		v = i64(rand.int_u64(m) or {exit(0)})
	}
	return vec
}