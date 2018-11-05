import SpriteKit

class CustomScene: SKScene {
    let crab = SKSpriteNode()
    
    override func sceneDidLoad() {
    // throws an error without override, since CustomScene is redifining the one that SKSpriteNode is using.
        super.sceneDidLoad()
        // super usually fixes things
        
        addChild(crab)
        // crab is our only node
        crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey)
        // textureKey was an enhancement key added in the SKSPriteNode, it wasn't provided by Apple.
        crab.position = CGPoint(x: frame.midX, y: frame.midY)
        // standard way of setting a position, (X,Y)
    }
    // Touching on the crab/sprite should move it to where the user has tapped on the application window.
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Fetch a touch or leave
        guard !touches.isEmpty, let touch = touches.first else { return }
        
        // Retrieve position
        let position = touch.location(in: self)
        
        // Create move action
        let actionDuration = 1.0
        let moveAction = SKAction.move(to: position, duration: actionDuration)
        // let turnAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: actionDuration)
        // pi * 2 is a full circle (obviously)
        // let groupAction = SKAction.group([moveAction, turnAction])
        // crab.run(groupAction)
        // groupAction allows things to run simultaneously.
        // in this case, it will move and turn simultaneously.
        
        let zoomAction = SKAction.scale(by: 1.3, duration: 0.3)
        let unzoomAction = SKAction.scale(to: 1.0, duration: 0.1)
        let sequenceAction = SKAction.sequence([zoomAction, moveAction, unzoomAction])
        crab.run(sequenceAction)
        
        // Run move action
        // commented the line out below
        // crab.run(moveAction)
    }
    
}
