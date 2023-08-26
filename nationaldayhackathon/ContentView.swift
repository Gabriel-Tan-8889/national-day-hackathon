//
//  ContentView.swift
//  nationaldayhackathon
//
//  Created by Jonaven Tan on 26/8/23.
//

import SwiftUI

struct Candidate: Identifiable { // Add Identifiable conformance
    let id = UUID() // Add a unique identifier
    let name: String
    var attackPower: Double
    var defense: Double
}

struct ContentView: View {
    @State private var candidates: [Candidate] = [
        Candidate(name: "Jamal", attackPower: 0, defense: 0),
        Candidate(name: "Jackson", attackPower: 0, defense: 0),
        Candidate(name: "Junior", attackPower: 0, defense: 0)
    ]
    @State private var selectedCandidate: Candidate?

    var body: some View {
        VStack {
            Text("Presidential Election App")
                .font(.title)
                .padding()

            ForEach(candidates) { candidate in
                VStack {
                    Text(candidate.name)
                        .font(.headline)
                    Slider(value: $candidates.first(where: { $0.id == candidate.id })!.attackPower, in: 0...100, step: 1) // Update the binding
                    Slider(value: $candidates.first(where: { $0.id == candidate.id })!.defense, in: 0...100, step: 1) // Update the binding
                }
                .padding()
            }

            Button(action: {
                // Perform voting logic here
                if let selectedCandidate = selectedCandidate {
                    print("User voted for \(selectedCandidate.name)")
                }
            }) {
                Text("Vote")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
