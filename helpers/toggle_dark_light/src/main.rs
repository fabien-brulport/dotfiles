use std::env;
use std::fs;

use regex::Regex;
extern crate yaml_rust;
use yaml_rust::YamlLoader;

fn main() {
    let home = match env::var("HOME") {
        Ok(home) => home,
        Err(_) => {
            println!("Env variable HOME not set");
            return
            },
    };

    let filename = format!("{}/.config/alacritty/alacritty.yml", home);
    let contents = fs::read_to_string(filename).expect("Something went wrong reading the file");

    // Extract existing schemes from the yaml
    let docs = YamlLoader::load_from_str(&contents).unwrap();
    let doc = &docs[0];
    let mut schemes = Vec::new();
    for n in doc["schemes"].as_hash().unwrap().keys() {
        schemes.push(n.as_str().unwrap());
    }

    let regex_scheme = Regex::new(r"colors: \*(\S+)").unwrap();
    let mut output = String::new();
    for  line in contents.lines() {
        if let Some(cap) = regex_scheme.captures(line) {
            let current_scheme = cap.get(1).unwrap().as_str();
            let current_idx = match schemes.iter().position(|&x| x == current_scheme) {
                Some(idx) => idx,
                None => {
                    println!("Current scheme does not match the available scheme");
                    return
                    },
            };
            let next_index = (current_idx + 1) % schemes.len();
            output.push_str(format!("colors: *{}\n", schemes[next_index]).as_str());
        }
        else {
            output.push_str(format!("{}\n", line).as_str());
        }

    }
    let filename = format!("{}/.config/alacritty/alacritty.yml", home);
    fs::write(filename, output).unwrap();
}
