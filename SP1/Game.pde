import java.util.Random;

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player2Life;
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot[] enemies2;
  private Dot[] foods;
  private Dot[] foods2;


  Game(int width, int height, int numberOfEnemies, int numberOfEnemies2, int numberOfFoods, int numberOfFoods2)
  {
    if (width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if (numberOfEnemies < 0 || numberOfEnemies2 < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0, 0, width-1, height-1);
    player2 = new Dot(width-1, 0, width-1, height-1);
    enemies = new Dot[numberOfEnemies];
    enemies2 = new Dot[numberOfEnemies2];
    foods = new Dot[numberOfFoods];
    foods2 = new Dot[numberOfFoods2];
    for (int i = 0; i < numberOfFoods; ++i)
    {
      foods[i] = new Dot(width/2, height/2, width-1, height-1);
    }
    for (int i = 0; i < numberOfFoods2; ++i)
    {
      foods2[i] = new Dot(width/2, height/2, width-1, height-1);
    }
    for (int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    for (int i = 0; i < numberOfEnemies2; ++i)
    {
      enemies2[i] = new Dot(0, height-1, width-1, height-1);
    }
    this.playerLife = 100;
    this.player2Life = 100;
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }

  public int getPlayerLife()
  {
    return playerLife;
  }

  public int getPlayer2Life()
  {
    return player2Life;
  }

  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }

  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }

  public void update()
  {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateEnemies2();
    updateFoods();
    updateFoods2();
    checkForCollisions();
    checkForCollisions2();
    clearBoard();
    populateBoard();
  }



  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }

  private void updatePlayer()
  {
    //Update player
    if (keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if (keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if (keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if (keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }
  }

  private void updatePlayer2()
  {
    if (keys.arrowUp() && !keys.arrowDown())
    {
      player2.moveUp();
    }
    if (keys.arrowLeft() && !keys.arrowRight())
    {
      player2.moveLeft();
    }
    if (keys.arrowDown() && !keys.arrowUp())
    {
      player2.moveDown();
    }
    if (keys.arrowRight() && !keys.arrowLeft())
    {
      player2.moveRight();
    }
  }



  private void updateEnemies()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }

  private void updateEnemies2()
  {
    for (int i = 0; i < enemies2.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player2.getX() - enemies2[i].getX();
        int dy = player2.getY() - enemies2[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies2[i].moveRight();
          } else
          {
            //Player is to the left
            enemies2[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies2[i].moveDown();
        } else
        {//Player is up;
          enemies2[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies2[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies2[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies2[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies2[i].moveDown();
        }
      }
    }
  }

  private void updateFoods()
  {
    for (int i = 0; i < foods.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - foods[i].getX();
        int dy = player.getY() - foods[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            foods[i].moveLeft();
          } else
          {
            //Player is to the left
            foods[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player is down;
          foods[i].moveUp();
        } else
        {//Player is up;
          foods[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          foods[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          foods[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          foods[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          foods[i].moveDown();
        }
      }
    }
  }

  private void updateFoods2()
  {
    for (int i = 0; i < foods2.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player2.getX() - foods2[i].getX();
        int dy = player2.getY() - foods2[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            foods2[i].moveLeft();
          } else
          {
            //Player is to the left
            foods2[i].moveRight();
          }
        } else if (dy > 0)
        {
          //Player is down;
          foods2[i].moveUp();
        } else
        {//Player is up;
          foods2[i].moveDown();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          foods2[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          foods2[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          foods2[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          foods2[i].moveDown();
        }
      }
    }
  }

  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    board[player2.getX()][player2.getY()] = 4;
    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    for (int i = 0; i < enemies2.length; ++i)
    {
      board[enemies2[i].getX()][enemies2[i].getY()] = 5;
    }
    //Insert foods
    for (int i = 0; i < foods.length; ++i)
    {
      board[foods[i].getX()][foods[i].getY()] = 3;
    }
    for (int i = 0; i < foods2.length; ++i)
    {
      board[foods2[i].getX()][foods2[i].getY()] = 6;
    }
  }

  private void checkForCollisions()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        if (playerLife > 0)
        {
          //We have a collision
          --playerLife;
        }
      }
    } 
    for (int j = 0; j < foods.length; ++j)
    {
      if (foods[j].getX() == player.getX() && foods[j].getY() == player.getY())
      {
        if (playerLife < 100)
        {
          //We have collision
          ++playerLife;
          foods[j].setDestination(width/2,height/2);
        }
      }
    }
  }
  
  private void checkForCollisions2()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies2.length; ++i)
    {
      if (enemies2[i].getX() == player2.getX() && enemies2[i].getY() == player2.getY())
      {
        if (player2Life > 0)
        {
          //We have a collision
          --player2Life;
        }
      }
    } 
    for (int j = 0; j < foods2.length; ++j)
    {
      if (foods2[j].getX() == player2.getX() && foods2[j].getY() == player2.getY())
      {
        if (player2Life < 100)
        {
          //We have collision
          ++player2Life;
          foods2[j].setDestination(width/2,height/2);
        }
      }
    }
  }
}
