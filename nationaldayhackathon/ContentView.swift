//
//  ContentView.swift
//  nationaldayhackathon
//
//  Created by Jonaven Tan on 26/8/23.
//
import SwiftUI

struct Candidate: Identifiable {
    let id = UUID()
    var names: String
    var description: String
    var element: String
    var isVoted: Bool = false
}

struct ContentView: View {
    @State private var candidates: [Candidate] = [
        Candidate(names: "Jamal", description: "", element: ""),
        Candidate(names: "Jackson", description: "", element: ""),
        Candidate(names: "Junior", description: "", element: "")
    ]
    
    var body: some View {
        VStack {
            List($candidates) { $candidate in
                VStack(alignment: .leading) {
                    Text(candidate.names)
                        .font(.title)
                    TextField("Description", text: $candidate.description)
                    TextField("Element", text: $candidate.element)
                    Toggle("Vote", isOn: $candidate.isVoted)
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
    
  
  
    
    private func submitVotes() {
        let votedCandidates = candidates.filter { $0.isVoted }
        
        if votedCandidates.isEmpty {
            print("No candidate selected for voting.")
        } else {
            print("Voted candidates:")
            for candidate in votedCandidates {
                print("\(candidate.names)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
