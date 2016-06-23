#include <iostream>
#include <irobot.h>
#include <curses.h>
#include <psensor.h>
using namespace std;

int main()
{
    cout << "Hello World!" << endl;

    iRobot  robot;
    std::string ip;
    cout << "Ip:";
    cin  >> ip;

    if (robot.startNetwork(ip,2468)!=ERROR::NONE){
        std::cout << "NO network path found";
        return -1;
    }
    robot.modesafe();

    robot.sstream({SENSOR::charge,SENSOR::dirt});

    int dir = '!';
    initscr();
    timeout(-1);
    raw();
    cbreak();
    noecho();
    while (dir!='e'){
        dir = getch();
        switch(dir){
        case 'w':
            robot.dStraight(100);
            break;
        case 'a':
            //left
            robot.dCClockwise(100);
            break;
        case 's':
            robot.dStraight(-100);
            break;
        case 'd':
            //clockwise
            robot.dClockwise(100);
            break;
        case 'q':
            robot.dStraight(0);
            break;
        case '/':
            robot.seekDock();
            break;
        case 'x':
            robot.modesafe();
            break;
        case 'i':
            //right
            robot.driveDirect(100, 200);
            break;
        case '0':
            //left
            robot.driveDirect(200, 100);
            break;
        case 'm':
            //puts into full mode
            robot.modefull();
            break;
        case 'z':
            robot.start("/dev/ttyUSB0");
            break;
        case 'n':
            robot.startNetwork(ip,2468);
            break;
        case 'v':
            endwin();
            break;
        case 'b':
        {
            using namespace psong;
            uint8_t* notes = new uint8_t[15]
            {g,g,g,e,e,b,g,e,b,g,d,d,d,e,b};
             /*b,b,c,d,d,c,b,a,g,g,a,b,a,g,g,
             a,a,b,g,a,b,c,b,g,a,b,c,d,a,g,a,d,
             b,b,c,d,d,c,b,a,g,g,a,b,a,g,g};*/
            uint8_t* len   = new uint8_t[15]
            {4,4,4,3,1,4,3,1,8,4,4,4,3,1,4};
             /*1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
             1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
             1,1,1,1,1,1,1,1,1,1,1,1,1,1,2};*/

            for (int i=0;i!=15;i++){
                len[i] =len[i]*16;
            }

            pSong song(1);
            song.setSong(notes,len,0,15);
            robot.song(song);
            break;
        }
        case '.':
            robot.play(1);
        }

    }

}

