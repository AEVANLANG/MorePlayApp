import CarPlay
import UIKit

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    
    var interfaceController: CPInterfaceController?
    
    func templateApplicationScene(
        _ templateApplicationScene: CPTemplateApplicationScene,
        didConnect interfaceController: CPInterfaceController
    ) {
        
        self.interfaceController = interfaceController
        
        // Browser button
        let browserButton = CPGridButton(
            titleVariants: ["Browser"],
            image: UIImage(systemName: "globe")!
        ) { [weak self] _ in
            
            guard let interfaceController = self?.interfaceController else {
                return
            }
            
            let browserTemplate = CPInformationTemplate(
                title: "Browser",
                layout: .leading,
                items: [],
                actions: []
            )
            
            interfaceController.setRootTemplate(browserTemplate, animated: true) { _, error in
                if let error = error {
                    print(error)
                }
            }
        }
        
        let gridTemplate = CPGridTemplate(
            title: "MorePlay",
            gridButtons: [browserButton]
        )
        
        interfaceController.setRootTemplate(gridTemplate, animated: true) { _, error in
            if let error = error {
                print(error)
            }
        }
    }
    
}
