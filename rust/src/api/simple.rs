use flutter_rust_bridge::frb;

pub struct AppState {
    pub counter: i32,
    pub message: String,
}

impl Default for AppState {
    fn default() -> Self {
        Self {
            counter: 0,
            message: String::from("Hello from Rust! project: flutter_rust_app "),
        }
    }
}

pub fn increment_counter(mut state: AppState) -> AppState {
    state.counter += 1;
    state.message = format!("カウンター: {}", state.counter);
    state
}

pub fn decrement_counter(mut state: AppState) -> AppState {
    state.counter -= 1;
    state.message = format!("カウンター: {}", state.counter);
    state
}

pub fn get_initial_state() -> AppState {
    AppState::default()
}


#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
