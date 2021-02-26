#lang at-exp racket

(require codespells/lore)

(define-authored-work-lore
  #:name "Voxel" 
  #:description 
  @md{
    Strange and beautiful magic has sculpted the landscape of this world with angles and sharp edges. Many a wizard has been inspired to produce geometrically structured spells in this environment.  

    @(div
       (alert-primary "In its current form, we estimate this build to be worth about " (b "5 minutes of fun") ". Walk through the infinite world.  Fall into ravines.  Try to get out again.  Grumble that we have not yet added the teleport Rune to this build."))
    }
  #:rune-collections
  (list 'hierarchy
	'fire-particles
	'ice-particles
	'rocks)
  #:preview-image preview.png)

