    Red [Needs: 'View]




    view [text center center bold "Welcome to Red IDE" 
    return
     img: image loose center https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png ]


     [



     ]



;Mocalization
    ;langs:  ["English" "Russian"]
    langs:  ["English"]


;menu 


    labels: [


        ["Blue" "Green" "Project" "Exit without saving" "Red" "Yellow" "White" "Black" "Save session" "Load last session""Load project 2 session" "Load project 3 session"]

        ["Голубой" "Зеленый" "Проект" "Exit without saving" "Красный" "Жёлтный" "Белый" "Чёрный" " Сохранить сессию" "Открыть последнюю сессию" "Открыть вторую сессию" "Открыть третью сессию"]
    ]
    set-lang: function [f event][
        root: f/parent
        condition: [all [face/text face/type <> 'drop-list]]

        list: collect [foreach-face/with root [keep face/text] condition]
        forall list [append clear list/1 labels/(f/selected)/(index? list)]

        foreach-face/with root [
            pads: any [metrics?/total face 'paddings 'x 0]
            prev: face/size/x
            face/size/x: pads + first size-text face
            face/offset/x: face/offset/x + ((prev - face/size/x) / 2)
        ][face/type = 'button]

        
    ]





; colors

    view [



        style txt: text right

        radio "Blue" [set-focus f  f/color: green or blue t2/color: green or blue a/color: white ]  
        radio "Green" [set-focus f  f/color: green t2/color: green a/color: white ]  
        radio "Red" [set-focus f  f/color: t2/color: red red a/color: white ]  
        radio "Yellow" [set-focus f f/color: t2/color: yellow yellow a/color: black]  
        radio "White" [set-focus f  f/color: white t2/color: white a/color: black ]     

return



;tabs

        tab-panel 900x600 [

        "Project GUI " [   f: area 900x600  {Red [ ] 
          view/flags  [text "Hello World" ]'modal }  no-border
        font [name: "Comic Sans MS" size: 10 color: black]


        ]



        "Project Console " [   t2: area 900x600    { Red [Title: "Simple hello world script"]
     print "Hello World!"}
        no-border
        font [name: "Comic Sans MS" size: 10 color: black]


        ]

    


        "Project Loader " [   t4: area 900x600    {{Please load file to get contents..}}
        no-border
        font [name: "Comic Sans MS" size: 10 color: black]



        ]


            "TODO " [   t3: area 900x600  no-border 
        font [name: "Comic Sans MS" size: 10 color: black]



        ]


                   ]



; SAVER
 ;      style txt: text right 45
 ;       drop-list data langs select 1 on-change :set-lang return
 ;       return
 ;      
 ;      button "Save session 1" [save %redscript.red f/text]
 ;      button "Save session 2" [save %redscript2.red t2/text]
 ;      button "Save TODO session" [save %redscript3.red t3/text]
 ;      button "Save loaded file" [save %redscript4.red t4/text]
    return





;LOADER
    button "Load last session" [f/text: load %redscript.red]
    button "Load project 2 session" [t2/text: load %redscript2.red]
    button "Load from file session" [t4/text: load %redscript4.red]
    button "Load TODO" [t3/text: load %redscript3.red]
    return


    ;load from file

        button "Load to gui tab" [if Lf: request-file [f/text: read Lf  f/text: f  ] ]
        button "Load to console tab" [if Lf: request-file [t2/text: read Lf  t2/text: t2  ] ]
        button "Load from loaded file" [if Lf: request-file [t4/text: read Lf  t4/text: t4  ] ]
        button "Load to TODO" [if Lf: request-file [t3/text: read Lf  t3/text: t3  ] ]
        return


;run
button "Run"[ do f/text  "Try some different code" ]
button "Run 2 project" [ do t2/text  "Try some different code" ]
button "Run uploaded file"[ do t4/text  "Try some different code" ]
            return

;save to path

       button font-color brown "Save gui tab" [if sf: request-file/save  [unless suffix? sf [append sf %.liv]  write sf f/text ] ]
       button font-color brown "Save console tab" [if sf: request-file/save  [unless suffix? sf [append sf %.liv]  write sf t2/text ] ]
       button font-color brown "Save loaded file" [if sf: request-file/save  [unless suffix? sf [append sf %.liv]  write sf t4/text ] ]
       button font-color brown "Save TODO" [if sf: request-file/save  [unless suffix? sf [append sf %.liv]  write sf t3/text ] ]

return


 
        txt "Font name" drop-list 120
            data  ["Arial" "Consolas" "Comic Sans MS" "Times"]
            react [f/font/name: pick face/data any [face/selected 3]]
            react [t2/font/name: pick face/data any [face/selected 3]]

            return
  
        txt "Font size" s: field "11" react [f/font/size: s/data t2/font/size: s/data]
        button "+" bold 40 [s/data: s/data + 1]
        button "-" bold 40 [s/data: max 1 s/data - 1]
        return


       button right "Compile 1 tab" [on-click call %compile_1.bat]
       button right "Compile 2 tab" [on-click call %compile_2.bat]
       button right "Compile 3 tab" [on-click call %compile_3.bat]
       return
       button right "Install rebel from Github  " [on-click do https://raw.githubusercontent.com/red/community/master/tools/celer.red]
       button right "Red language documentation  " [view [text center "Red documentation" img: image loose center https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png ]]
       button right "Download last version of Red " [on-click do https://raw.githubusercontent.com/red/community/master/tools/red-master-dl.red]
       button right "Open Red IDE " [on-click call %red.exe]
       button "Clear" [f/text: ""   f/area: "" ]


       button right "Exit without saving" [quit]
      
    ]
