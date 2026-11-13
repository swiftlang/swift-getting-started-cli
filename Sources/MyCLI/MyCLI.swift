import ArgumentParser
import Figlet

@main
struct MyCLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mycli",
        abstract: "Print a message as ASCII art."
    )

    @Argument(help: "The message to print.")
    var message: String

    @Option(name: .shortAndLong, help: "The number of times to print the message.")
    var count = 1

    @Flag(help: "Convert the message to uppercase.")
    var uppercase = false

    func validate() throws {
        guard count >= 1 else {
            throw ValidationError("Please specify a count of at least 1.")
        }
    }

    func run() {
        let text = uppercase ? message.uppercased() : message
        for _ in 0..<count {
            Figlet.say(text)
        }
    }
}
