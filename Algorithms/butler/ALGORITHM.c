

/**
 * main.c
 */

int x_sp,y_sp,x_cp,y_cp,x,y,x_pre,y_pre,x_temp,y_temp;
int main(void)
{
int curr_x = 0;
int curr_y = 0;

int dest_x = 7;
int dest_y = 8;


while(curr_x == dest_x && curr_y == dest_y){
    get_checkpoints(x, y, x_pre, y_pre);
    get_temp_goal(x_sp, y_sp, x_cp, y_cp, x, y, x_pre, y_pre, x_temp,y_temp);
    go_to_pose(x,y);
    curr_x = x_temp;
    curr_y = y_temp;
    if(curr_x == dest_x && curr_y == dest_y){
        dest_x = 0;
        dest_y = 0;
    }
}


	return 0;
}
