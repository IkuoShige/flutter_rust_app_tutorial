#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}! fuckyou!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

// カウンターを増やす関数
pub fn increment_counter(value: i32) -> i32 {
    println!("pushed increment buttom!");
    value + 100
}

// カウンターを減らす関数
pub fn decrement_counter(value: i32) -> i32 {
    println!("pushed decrement buttom!");
    value - 100
}
