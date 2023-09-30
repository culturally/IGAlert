import SwiftUI
import UserNotifications
import UIKit


struct ContentView: View {
    @State private var isSendingNotifications = false
    @State private var notificationCount = 0

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()

            if !isSendingNotifications {
                Text("Press the button to start sending notifications.")
                    .padding()

                Button(action: {
                    isSendingNotifications = true
                    notificationCount = 0
                    scheduleNotifications()
                }) {
                    Text("Start Sending Notifications")
                }
            } else {
                Text("Sending Notifications...")
                    .padding()
            }
        }
    }

    func scheduleNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()

        // Request permission for notifications
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                self.sendNotifications(notificationCenter: notificationCenter)
            } else if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }
    
    func clearNotificationsAfterDelay(timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = ""
        content.body = ""

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: "ClearNotifications", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    

    func sendNotifications(notificationCenter: UNUserNotificationCenter) {
        let batchSize = 60
        let delayBetweenBatches: TimeInterval = 3
        let delayWithinBatch: TimeInterval = 0.3
        let clearDelay: TimeInterval = 2.3 // Set the clear delay time

        for i in 1...batchSize {
            let content = UNMutableNotificationContent()
            content.title = "username"
            content.body = "\(randomUsername()) started following you"

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(i) * delayWithinBatch, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            notificationCenter.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    self.notificationCount += 1

                    if self.notificationCount == batchSize {
                        // Schedule a clearing notification after the clear delay
                        clearNotificationsAfterDelay(timeInterval: clearDelay)

                        // Wait for the delayBetweenBatches before sending the next batch
                        DispatchQueue.main.asyncAfter(deadline: .now() + delayBetweenBatches) {
                            if self.notificationCount < 600 {
                                self.sendNotifications(notificationCenter: notificationCenter)
                            } else {
                                // All notifications sent, reset the state
                                self.isSendingNotifications = false
                            }
                        }
                    }
                }
            }
        }
    }



    
    func randomUsername() -> String {
        let commonUsernames = [
            "stargazer42",
            "pixelpioneer",
            "lunalark",
            "quantumquasar",
            "techtrailblazer",
            "mysticmarauder",
            "cybersculptor",
            "solarflarex",
            "nebulanomad",
            "bytebard",
            "zenithzephyr",
            "echoenigma",
            "velvetvoyager",
            "chronocipher",
            "sereneshadow",
            "terratempo",
            "novanurturer",
            "etherengineer",
            "binaryblossom",
            "astroartisan",
            "galacticgoddess",
            "vortexvigilante",
            "cosmiccomposer",
            "neonnebulist",
            "quantumquill",
            "ciphersorcerer",
            "datadynamo",
            "orionoracle",
            "zerogravityzen",
            "solsticesculptor",
            "cyberspacesiren",
            "stellarseeker",
            "enigmaexplorer",
            "lunarluthier",
            "spectersculptor",
            "metamystic",
            "novanebulist",
            "fluxfusion",
            "astralarchitect",
            "nebulaninja",
            "quantumquill",
            "pixelpioneer",
            "zenithzephyr",
            "solarsculptor",
            "echoengineer",
            "bytebard",
            "lunalark",
            "stargazer42",
            "terratempo",
            "novanomad",
            "cosmiccrafter",
            "etherexplorer",
            "binarybard",
            "neonnebula",
            "mysticmarauder",
            "quantumquasar",
            "datadynamo",
            "celestialcoder",
            "vortexvoyager",
            "auroraartisan",
            "astralarcher",
            "sereneshadow",
            "chronocipher",
            "solsticesculptor",
            "cybersorcerer",
            "solarsculptor",
            "lunarluthier",
            "novanurturer",
            "neonnebulist",
            "terratempo",
            "zenithzephyr",
            "pixelpioneer",
            "quantumquasar",
            "bytebard",
            "cosmiccomposer",
            "mysticmarauder",
            "vortexvigilante",
            "echoenigma",
            "astralartisan",
            "datadynamo",
            "orionoracle",
            "quantumquill",
            "fluxfusion",
            "etherengineer",
            "spectersculptor",
            "lunalark",
            "novanebulist",
            "neonnomad",
            "zerogravityzen",
            "stargazer42",
            "cybersculptor",
            "metamystic",
            "solarflarex",
            "terratempo",
            "enigmaexplorer",
            "novanomad",
            "galacticgoddess",
            "lunaluthier",
            "zenithzephyr",
            "auroraarcher",
            "laserlabyrinth",
            "cosmictrailblazer",
            "stellarartisan",
            "quasarcrafter",
            "digitaldreamweaver",
            "lunarquill",
            "cybercelestial",
            "quantumcreator",
            "starrywanderer",
            "auroravoyager",
            "nebulasculptor",
            "metamysticist",
            "binaryexplorer",
            "cipherstar",
            "galacticgoddess",
            "zenithzephyr",
            "lunarlark",
            "supernovaseeker",
            "ethersculptor",
            "timelesswanderer",
            "luminarycoder",
            "stellararcher",
            "celestialtraveller",
            "quantumquasar",
            "neonnomad",
            "interstellarbard",
            "datasculptor",
            "moonlightmaestro",
            "digitaldreamer",
            "cyberspacepioneer",
            "lunaroracle",
            "vortexvirtuoso",
            "starryexplorer",
            "auroraarchitect",
            "novasculptor",
            "metamysticmind",
            "binarydreamer",
            "cosmiccaster",
            "zenithzen",
            "larkofthestars",
            "stellarflux",
            "nebulawalker",
            "quantumquill",
            "datadiscoverer",
            "celestialoracle",
            "solarsculptor",
            "cyberarchitect",
            "zenithvoyager",
            "lunarmystic",
            "stargazersculptor",
            "byteboundless",
            "supernovaseeker",
            "etherealwanderer",
            "stellarcomposer",
            "luminouslark",
            "celestialcipher",
            "nebulaexplorer",
            "quantumquasar",
            "datasculptor",
            "cosmictraveler",
            "zenithzephyr",
            "solarcreator",
            "lunarengineer",
            "starlightstargazer",
            "nebularider",
            "datavoyager",
            "cipherarchitect",
            "stellarartificer",
            "quantumscribe",
            "celestialtraveller",
            "lunarlark",
            "starrymystic",
            "novanebula",
            "neoncosmic",
            "stargazer42",
            "cybercraftsman",
            "metamysticmind",
            "solarflarex",
            "terratempo",
            "enigmaticexplorer",
            "novacrafter",
            "galacticgoddess",
            "lunarharmony",
            "zenithzephyr",
            "auroraarcher",
        ];

        
        let randomIndex = Int.random(in: 0..<commonUsernames.count)
        return commonUsernames[randomIndex]
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
