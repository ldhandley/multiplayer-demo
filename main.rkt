#lang codespells

(require multiplayer-demo/mod-info
         racket/gui)


(require-mod hierarchy)
(require-mod fire-particles)
(require-mod ice-particles)
(require-mod rocks)

(define my-mod-lang
  (append-rune-langs #:name main.rkt  
                     (hierarchy:my-mod-lang #:with-paren-runes? #t)
                     (fire-particles:my-mod-lang)
                     (ice-particles:my-mod-lang)
                     (rocks:my-mod-lang)
		     ))

(module+ main
  (codespells-workspace ;TODO: Change this to your local workspace if different
   ;(build-path (current-directory) ".." "..")
   (build-path (current-directory))
   )

  (if (eq? (message-box "Multiplayer" "Do you want to run a CodeSpells server?" #f '(yes-no)) 'yes)
      (multiplayer 'server)
      (let ()
        (multiplayer 'client)
        (server-ip-address (get-text-from-user "Multiplayer" "IP Address:" #f "127.0.0.1")))
      )
  
  ;-WinX=0 -WinY=50 -ResX=640 -ResY=480 -Windowed 
  (extra-unreal-command-line-args "-AudioMixer -PixelStreamingIP=localhost -PixelStreamingPort=8888")
  
  (once-upon-a-time
   #:world (arena-world)
   #:aether (demo-aether
             #:lang my-mod-lang)))