-- Источник 1: https://csrulez.ru/topic4910.html
-- Источник 2: https://c-s.net.ua/forum/topic87777.html#:~:text=cl_updaterate%20%2D%20c%D0%BA%D0%BE%D0%BB%D1%8C%D0%BA%D0%BE%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%B2%20%D1%81%D0%B5%D0%BA%D1%83%D0%BD%D0%B4%D1%83,%D0%BD%D0%B0%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%2C%20%D0%BE%20%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D1%8F%D1%85%20%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D1%85%20%D0%B8%D0%B3%D1%80%D0%BE%D0%BA%D0%BE%D0%B2%20.
-- Источник 3: https://developer.valvesoftware.com/wiki/Source_Multiplayer_Networking:ru
-- Источник 4: https://8arena.ru/threads/chto-takoe-lerp-v-cs-s-ili-kak-izbezhat-lagov-v-igre.160/ -- хороший источник
-- Источник 5: https://steamcommunity.com/sharedfiles/filedetails/?id=1789347135 -- отличный источник
-- Источник 6: FlameRP 2018\addons\flame_dev\lua\autorun\client
-- Источник 7: cl_fpsfix_convs тоже из FlameRP

-- ping - за сколько мс пакет от сервера дойдёт до клиента
-- loss - число пакетов, которые потерялись во время передачи от сервера к клиенту. Обычно при разной скорости входящего клиентского канала и серверного
-- choke - сколько пакетов клиент не может передать серверу, так как 1) скорость не позволяет, 2) сервер запрашивате очень много
-- lerp - промежуток времени в котором пакеты полученные клиентом будут интерполироваться.c

-- rate - количество байт в секунду от клиентк к серверу.
--    28.8k = 1500-2200
--    33.6k = 2000-3500
--    56k = 3500-4000
--    ISDN = 4000-6000
--    xDSL, Cable, T1, etc = 6000-9999

-- cl_cmdrate - сколько обновлений в секунды будет отправлено от вашей машины серверу. 
--Следовательно, от этого параметра будет зависеть то, как скоро сервер получит информацию о ваших действиях.
-- модем = 25-35
-- выделенка = 40-101

-- cl_update -  cколько обновлений в секунду посылать от сервера вашей машине. 
-- Этот параметр влияет на то, насколько быстро вы получите серверные данные

hook.Add( 'PostGamemodeLoaded', 'AMB.Opti.SetNetworkOptimizationConnection', function()

    -- Interpolation --------------------------------------------------------

    -- cl_interp вычисляют по 1 / cl_updaterate и указывают cl_interp_ratio 1
    -- стандартное значение: cl_interp 0.1, cl_interp_ratio 2
    -- ----------------------------------------------------------------------

    RunConsoleCommand( 'cl_timeout', '300' ) -- после ShutDown через сколько секунд клиент вылетит с сервера
    RunConsoleCommand( 'cl_showhelp', '0' ) -- зачем подсказки?

    -- Вдруг звук может забагаться
    RunConsoleCommand( 'stopsound' )
    RunConsoleCommand( 'snd_restart' )

    RunConsoleCommand( 'fov_desired', '90' )

end )