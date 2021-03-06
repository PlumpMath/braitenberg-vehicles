;;; I don't care what the extension is, this is really -*-Lisp-*-

;; *lamp-size* .3
;; *window-scale* 15


(define-radiation-types
  (light (electromagnetic))
  (visible-light (light))
  (infrared (light))
  (low-infrared (infrared))
  (high-infrared (infrared)))


;(define-lamp lamp-with-a-sensor
;  (:position 0.0 0.0)
;  (:radiator r1
;             (:radiation-type visible-light)
;             (:decay-factor 0.05))
;  (:sensor s1
;           (:radiation-type infrared)
;           (:field-of-view 360)
;           (:sensitivity 2.0))
;  (:brain
;   (n1 (:inputs (s1))
;       (:threshold 1))
;   (n2 (:inputs (s1))
;       (:threshold 1))
;   (r1 (:inputs (n1 n2)))))


(lamp lamp-1
  (:position 0.0 0.0)
  (:color 1.0 1.0 0.0)
  (:radiator r1
             (:radiation-type visible-light)
             (:decay-factor 0.05)))

(lamp lamp-2
  (:position -4.0 -4.0)
  (:color 1.0 1.0 0.0)
  (:radiator r1
             (:radiation-type visible-light)
             (:decay-factor 0.05)))


;(define-lamp simple-lamp
;  (:position -1.0 0.0)
;  (:radiator r1
;             (:radiation-type infrared)
;             (:decay-factor 0.05)))


(vehicle simple-light-seeker
  (:position 5.0 5.0)
  (:orientation 0)
  (:max-speed 15)
  (:color 0 1.0 0)
  (:sensor s1
           (:orientation -30)
           (:radiation-type visible-light)
           (:sensitivity 3.0))
  (:sensor s2
           (:orientation 30)
           (:radiation-type visible-light)
           (:sensitivity 3.0))
  (:motor m1
          (:position right)
          (:decay-factor 0.02))
  (:motor m2
          (:position left)
          (:decay-factor 0.02))
  (:radiator r1
             (:radiation-type low-infrared)
             (:decay-factor 0.05))
  (:brain
   (r1 (:inputs (m1 m2)))
   (m1 (:inputs (s2)))
   (m2 (:inputs (s1)))))


(vehicle heat-seeker
  (:position -7.0 6.0)
  (:orientation 0.0)
  (:max-speed 15.0)
  (:color 1.0 0 0)
  (:sensor s1
           (:orientation -40)
           (:radiation-type low-infrared)
           (:sensitivity 10.0))
  (:sensor s2
           (:orientation 40)
           (:radiation-type low-infrared)
           (:sensitivity 10.0))
  (:motor m1
          (:position right)
          (:decay-factor 0.005))
  (:motor m2
          (:position left)
          (:decay-factor 0.005))
  (:radiator r1
             (:radiation-type high-infrared)
             (:decay-factor 0.05))
  (:brain
   (m2 (:inputs (s1)))
   (m1 (:inputs (s2)))
   (r1 (:inputs (m1 m2)))))


(vehicle non-linear-shy-seeker
  (:position -2.0 4.0)
  (:orientation 294)
  (:color 0 0 1.0)

  (:sensor s1
           (:orientation 30)
           (:radiation-type visible-light)
           (:sensitivity 4.0))
  (:sensor s2
           (:orientation -30)
           (:radiation-type visible-light)
           (:sensitivity 4.0))

  (:sensor s3
           (:orientation 50)
           (:radiation-type high-infrared)
           (:sensitivity 2.0))
  (:sensor s4
           (:orientation -50)
           (:radiation-type high-infrared)
           (:sensitivity 2.0))


  (:motor m1
          (:position left)
          (:decay-factor 0.05))
  (:motor m2
          (:position right)
          (:decay-factor 0.05))

  (:radiator r1
             (:radiation-type low-infrared)
             (:decay-factor 0.05))

  (:brain

   ;; Light-seeking behavior
   (n1 (:inputs (s1))
       (:inhibitors (n2))
       (:threshold 1))
   (n1.5 (:inputs (s1))
         (:threshold 1))
   (n2 (:inputs (n1.5))
       (:threshold 1))
   (m2 (:inputs (n1 s4)))

   ;; Predator avoidance behavior
   (n3 (:inputs (s2))
       (:threshold 1))
   (n3.5 (:inputs (s2))
         (:threshold 1))
   (n4 (:inputs (n3.5))
       (:inhibitors (n3))
       (:threshold 1))
   (m1 (:inputs (n4 s3)))
   
   (r1 (:inputs (m1 m2)))))





