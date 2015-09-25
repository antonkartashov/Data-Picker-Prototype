selection = document.getElementById('ant-select')
x1 = 0; y1 = 0
x2 = 0; y2 = 0
x3 = 0; y3 = 0
x4 = 0; y4 = 0
moused = off

dayz = document.getElementsByClassName('calendar-year-month__day');
day.style.backgroundColor = "white" for day in dayz

seldayz = dayz

reCalc = ->
    x3 = Math.min x1, x2    
    x4 = Math.max x1, x2
    y3 = Math.min y1, y2
    y4 = Math.max y1, y2

    selection.style.left = x3 + 'px'
    selection.style.top = y3 + 'px'
    selection.style.width = x4 - x3 + 'px'
    selection.style.height = y4 - y3 + 'px'

document.addEventListener "mousedown", (e) ->
    moused = on
    selection.hidden = 0
    x1 = e.clientX
    y1 = e.clientY
    reCalc()
    
document.addEventListener "mousemove", (e) ->
    x2 = e.clientX
    y2 = e.clientY  
    reCalc()

    for i in [0..dayz.length]
        day = dayz[i]
        selday = seldayz[i]
        if moused
            if day.getBoundingClientRect().right > x3 and
            day.getBoundingClientRect().left < x4 and
            day.getBoundingClientRect().bottom > y3 and
            day.getBoundingClientRect().top < y4

                if selday.style.backgroundColor = "white"
                    day.style.backgroundColor = "#3399cc"
                else
                    day.style.backgroundColor = "white"

                # day.style.backgroundColor = "#3399cc"
                
    
        
document.addEventListener "mouseup", (e) ->
    selection.hidden = 1
    moused = off  
    seldayz = dayz
