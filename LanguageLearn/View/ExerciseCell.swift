//
//  ExerciseCell.swift
//  LanguageLearn
//
//  Created by Ian Manor on 18/10/20.
//

import SwiftUI
import SwiftUIX
import Introspect

struct ExerciseCell: View {
    @State var exercise: Exercise
    @State var currentPageIndex = 0

    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(Color(.systemBackground))
                .frame(width: 80, height: 80)
                .shadow(radius: 1)
                .frame(width: 82, height: 82)
                .overlay(
                    VStack {
                        Text("Exercise!")
                        Text("0 of \(exercise.count)")
                            .font(.caption)
                    }
                )
        }
    }

    var destination: some View {
        PaginationView {
            ExerciseView().eraseToAnyView()
            ExerciseView().eraseToAnyView()
            ExerciseView().eraseToAnyView()
            ResultsView().eraseToAnyView()
        }
        .currentPageIndex($currentPageIndex)
        .introspectPaginationView {
            $0.isPagingEnabled = false
        }
        .toolbar {
            ToolbarItem {
                Button(action: next) {
                    Text("Next")
                }
            }
        }
    }

    func next() {
        currentPageIndex += 1
    }
}

extension View {
    public func introspectPaginationView(customize: @escaping (UIPageViewController) -> ()) -> some View {
        self.introspectViewController { viewController in
            guard let pageViewController = viewController as? UIPageViewController else { return }
            customize(pageViewController)
        }
    }
}

extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }
}
