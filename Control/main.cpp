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
            robot.dStraight(500);
            break;
        case 'a':
            //Place turning code here
            break;
        case 's':
            robot.dStraight(-500);
            break;
        case 'd':
            //Place turning code here
            break;
        case '/':
            robot.seekDock();
            break;
        case 'x':
            robot.modesafe();
            break;
        case 'm':
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

