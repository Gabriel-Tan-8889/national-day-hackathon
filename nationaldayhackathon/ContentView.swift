//
//  ContentView.swift
//  nationaldayhackathon
//
//  Created by Jonaven Tan on 26/8/23.
//

import SwiftUI

struct Candidate: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var element: String
    var isVoted: Bool = false
}

struct ContentView: View {
    @State private var candidates: [Candidate] = [
        Candidate(name: "Jamal", description: "", element: ""),
        Candidate(name: "Jackson", description: "", element: ""),
        Candidate(name: "Junior", description: "", element: "")
    ]
    
    var body: some View {
        VStack {
            List(candidates) { candidate in
                VStack(alignment: .leading) {
                    Text(candidate.name)
                        .font(.title)
                    TextField("Description", text: self.getDescriptionBinding(for: candidate))
                    TextField("Element", text: self.getElementBinding(for: candidate))
                    Toggle("Vote", isOn: self.getVoteBinding(for: candidate))
                }
            }
            
            Button(action: {
                // Perform action when vote button is tapped
                self.submitVotes()
            }) {
                Text("Vote")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func getDescriptionBinding(for candidate: Candidate) -> Binding<String> {
        return Binding<String>(
            get: {
                candidate.description
            },
            set: {
                candidate.description = $0
            }
        )
    }
    
    private func getElementBinding(for candidate: Candidate) -> Binding<String> {
        return Binding<String>(
            get: {
                candidate.element
            },
            set: {
                candidate.element = $0
            }
        )
    }
    
    private func getVoteBinding(for candidate: Candidate) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                candidate.isVoted
            },
            set: {
                candidate.isVoted = $0
            }
        )
    }
    
    private func submitVotes() {
        let votedCandidates = candidates.filter { $0.isVoted }
        
        if votedCandidates.isEmpty {
            print("No candidate selected for voting.")
        } else {
            print("Voted candidates:")
            for candidate in votedCandidates {
                print("- \(candidate.name)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
