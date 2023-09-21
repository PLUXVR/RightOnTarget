//
//  SceneDelegate.swift
//  RightOnTarget
//
//  Created by Максим Беседин on 15.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    
    //В первую очередь создается экземпляр типа UIWindow, описывающий окно, в котором в дальнейшем
    //будет выводиться интерфейс.
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // // Используйте этот метод для дополнительной настройки и присоединения UIWindow `window` к предоставленной сцене окна пользовательского интерфейса `scene`.
        // При использовании раскадровки свойство `window` будет автоматически инициализировано и прикреплено к сцене.
        // Этот делегат не подразумевает, что сцена подключения или сеанс являются новыми (вместо этого смотрите `application:configurationForConnectingSceneSession`).
        
        print("------willConnectTo")
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //  Размеры UIWindow должны соответствовать размерам экрана устройства. Именно для этогоиспользуется класс UIScreen, описывающий дисплей устройства, на котором запущено приложение. Свойство main.bounds возвра- щает экземпляр типа CGRect (прямоугольник), размеры которого соответ- ствуют размеру дисплея.
        
        //  Созданное окно (UIWindow) инициализируется в свойство window класса SceneDelegate. В этом свойстве обязательно должна содержаться ссылка на окно, используемое для отображения текущего экземпляра графического иттерфейса. Установим его на следующем шаге.
        
        window = UIWindow(windowScene: windowScene)
        
        guard let window = window else {
            return
        }
        
        
        //  Производится загрузка вью контроллера. Для этого сперва загружает- ся сториборд, а потом с помощью идентификатора MainViewController и сам контроллер.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! UIViewController
        
        window.rootViewController = viewController
        
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        // Вызывается по мере того, как система освобождает сцену.
        // Это происходит вскоре после того, как сцена переходит в фоновый режим, или когда ее сеанс отменяется.
        // // Освободите все ресурсы, связанные с этой сценой, которые могут быть воссозданы при следующем подключении сцены.
        // // Сцена может подключиться позже, поскольку ее сеанс не обязательно был отменен (вместо этого смотрите "application:didDiscardSceneSessions").
        
        print("------sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        // Вызывается, когда сцена переходит из неактивного состояния в активное.
        // Используйте этот метод для перезапуска любых задач, которые были приостановлены (или еще не запущены), когда сцена была неактивна.
        print("------sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        // Вызывается, когда сцена переходит из активного состояния в неактивное.
        // Это может произойти из-за временных перебоев (например, входящего телефонного звонка).
        
        print("------sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        
        // Вызывается при переходе сцены с заднего плана на передний.
        // Используйте этот метод, чтобы отменить изменения, внесенные при входе в фоновый режим.
        
        print("------sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Вызывается при переходе сцены с переднего плана на задний.
        // Используйте этот метод для сохранения данных, высвобождения общих ресурсов и хранения достаточного количества информации о состоянии конкретной сцены
        // чтобы восстановить сцену обратно в ее текущее состояние.
        
        print("------sceneDidEnterBackground")
    }


}

