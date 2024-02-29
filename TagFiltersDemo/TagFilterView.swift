//
//  TagFilterView.swift
//  TagFilterDemo
//
//  Created by Marcello Morellato on 29/02/24.
//

import SwiftUI

public class TagFilterViewModel: ObservableObject {
    @Published var selectedTags: Set<String> = []
    
    let availableTags = [
        Tag(identifier: "1", name: "All", isAll: true),
        Tag(identifier: "2", name: "Order"),
        Tag(identifier: "3", name: "Offer"),
        Tag(identifier: "4", name: "Web Order"),
        Tag(identifier: "5", name: "Other")
    ]

    func toggleTagSelection(_ tag: Tag) {
        if tag.isAll {
            if selectedTags.contains(tag.identifier) {
                // If "All" tag is deselected, deselect all other tags
                selectedTags.removeAll()
            } else {
                // If "All" tag is selected, select only "All" tag
                selectedTags = [tag.identifier]
            }
        } else {
            // If any other tag is selected, deselect "All" tag
            selectedTags.remove(availableTags.first { $0.isAll }!.identifier)
            
            if selectedTags.contains(tag.identifier) {
                selectedTags.remove(tag.identifier)
            } else {
                selectedTags.insert(tag.identifier)
            }
        }
    }
}

struct TagFilterView: View {
    @StateObject public var viewModel:TagFilterViewModel
    
    let cornerRadius: CGFloat = 20
    let spacing: CGFloat = 10
    let horizontalPadding: CGFloat = 12
    let verticalPadding: CGFloat = 8

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(viewModel.availableTags) { tag in
                    Button(action: {
                        viewModel.toggleTagSelection(tag)
                    }) {
                        Text(tag.name)
                            .padding(.horizontal, horizontalPadding)
                            .padding(.vertical, verticalPadding)
                            .font(.body)
                            .foregroundColor(viewModel.selectedTags.contains(tag.identifier) ? .white : .blue)
                            .background(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .fill(viewModel.selectedTags.contains(tag.identifier) ? Color.blue : Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: cornerRadius)
                                            .stroke(Color.blue, lineWidth: viewModel.selectedTags.contains(tag.identifier) ? 0 : 1)
                                    )
                            )
                    }
                }
            }
            .padding()
        }
    }
}

struct Tag: Identifiable {
    let id = UUID()
    let identifier: String
    let name: String
    let isAll: Bool
    
    init(identifier: String, name: String, isAll: Bool = false) {
        self.identifier = identifier
        self.name = name
        self.isAll = isAll
    }
}

import SwiftUI

struct TagFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TagFilterView(viewModel: TagFilterViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Tag Filter View")
    }
}
