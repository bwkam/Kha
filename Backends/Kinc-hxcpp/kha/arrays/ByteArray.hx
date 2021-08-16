package kha.arrays;

import cpp.vm.Gc;

class ByteArrayPrivate {
	public var self: ByteBuffer;
	public var offset: Int;
	public var length: Int;

	public inline function new(offset: Int, length: Int) {
		this.offset = offset;
		this.length = length;

		Gc.setFinalizer(this, cpp.Function.fromStaticFunction(finalize));
	}

	@:void static function finalize(arr: ByteArrayPrivate): Void {
		arr.self.free();
	}
}

abstract ByteArray(ByteArrayPrivate) {
	public var buffer(get, never): ByteBuffer;

	inline function get_buffer(): ByteBuffer {
		return this.self;
	}

	public var byteLength(get, never): Int;

	inline function get_byteLength(): Int {
		return this.length;
	}

	public var byteOffset(get, never): Int;

	inline function get_byteOffset(): Int {
		return this.offset;
	}

	public inline function new(buffer: ByteBuffer, ?byteOffset: Int, ?byteLength: Int): Void {
		var offset: Int = byteOffset != null ? byteOffset : 0;
		this = new ByteArrayPrivate(offset, byteLength != null ? byteLength : buffer.byteLength - offset);
		this.self = buffer;
	}

	public static inline function make(byteLength: Int): ByteArray {
		var buffer = ByteBuffer.create();
		if (byteLength > 0) {
			buffer.alloc(byteLength);
		}
		return new ByteArray(buffer, 0, byteLength);
	}

	public function getInt8(byteOffset: Int): Int {
		return untyped __cpp__("*(int8_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getUint8(byteOffset: Int): Int {
		return untyped __cpp__("*(uint8_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getInt16(byteOffset: Int): Int {
		return untyped __cpp__("*(int16_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getUint16(byteOffset: Int): Int {
		return untyped __cpp__("*(uint16_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getInt32(byteOffset: Int): Int {
		return untyped __cpp__("*(int32_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getUint32(byteOffset: Int): Int {
		return untyped __cpp__("*(uint32_t *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getFloat32(byteOffset: Int): FastFloat {
		return untyped __cpp__("*(float *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function getFloat64(byteOffset: Int): Float {
		return untyped __cpp__("*(double *)&{0}.data[{1} + {2}]", this.self, this.offset, byteOffset);
	}

	public function setInt8(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((int8_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setUint8(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((uint8_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setInt16(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((int16_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setUint16(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((uint16_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setInt32(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((int32_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setUint32(byteOffset: Int, value: Int): Void {
		return untyped __cpp__("*((uint32_t *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setFloat32(byteOffset: Int, value: FastFloat): Void {
		return untyped __cpp__("*((float *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function setFloat64(byteOffset: Int, value: Float): Void {
		return untyped __cpp__("*((double *)&{0}.data[{1} + {2}]) = {3}", this.self, this.offset, byteOffset, value);
	}

	public function getInt16LE(byteOffset: Int): Int {
		return 0;
	}

	public function getUint16LE(byteOffset: Int): Int {
		return 0;
	}

	public function getInt32LE(byteOffset: Int): Int {
		return 0;
	}

	public function getUint32LE(byteOffset: Int): Int {
		return 0;
	}

	public function getFloat32LE(byteOffset: Int): FastFloat {
		return 0;
	}

	public function getFloat64LE(byteOffset: Int): Float {
		return 0;
	}

	public function setInt16LE(byteOffset: Int, value: Int): Void {}

	public function setUint16LE(byteOffset: Int, value: Int): Void {}

	public function setInt32LE(byteOffset: Int, value: Int): Void {}

	public function setUint32LE(byteOffset: Int, value: Int): Void {}

	public function setFloat32LE(byteOffset: Int, value: FastFloat): Void {}

	public function setFloat64LE(byteOffset: Int, value: Float): Void {}

	public function getInt16BE(byteOffset: Int): Int {
		return 0;
	}

	public function getUint16BE(byteOffset: Int): Int {
		return 0;
	}

	public function getInt32BE(byteOffset: Int): Int {
		return 0;
	}

	public function getUint32BE(byteOffset: Int): Int {
		return 0;
	}

	public function getFloat32BE(byteOffset: Int): FastFloat {
		return 0;
	}

	public function getFloat64BE(byteOffset: Int): Float {
		return 0;
	}

	public function setInt16BE(byteOffset: Int, value: Int): Void {}

	public function setUint16BE(byteOffset: Int, value: Int): Void {}

	public function setInt32BE(byteOffset: Int, value: Int): Void {}

	public function setUint32BE(byteOffset: Int, value: Int): Void {}

	public function setFloat32BE(byteOffset: Int, value: FastFloat): Void {}

	public function setFloat64BE(byteOffset: Int, value: Float): Void {}

	public function subarray(start: Int, ?end: Int): ByteArray {
		var offset: Int = this.offset + start;
		var length: Int = end == null ? this.length - start : end - start;
		return new ByteArray(this.self, offset, length);
	}
}
