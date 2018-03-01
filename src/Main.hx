import haxegon.*;

class Main
{
	//boy
	var x1 = 100;
	var y1 = 200;

	//girl
	var x2 = Gfx.screenwidth - 300;
	var y2 = 200;

	//flower
	var x3 = Gfx.screenwidthmid - 20;
	var y3 = Gfx.screenheightmid - 50;

	//beam1
	var x4 = Gfx.screenwidthmid;
	var y4 = Gfx.screenheightmid;

	//beam2
	var x5 = Gfx.screenwidthmid;
	var y5 = Gfx.screenheightmid;

	var speed  = 10; //boy's speed
	var flowerspeed  = 5; //flower's speed
	var beamspeed  = 10; //beam's speed
	
	var count = 0; //controls animation
	var score = 0; //keeps highscore	
	var lives = 3; // player's hearts
	var win = 15; //score needed to win

	var start = false; //checks if player has started the game
	var gameover = false; //gameover?
	var won = false; //won?
	var first = true; // first play
	var up = false; //checks if flower reaches screen's boundaries

	function init()
	{

	}

	function update()
	{
		//has the game started?
		if (!gameover && !won)
		{
			if (Mouse.leftclick() || Input.pressed(Key.LEFT) || Input.pressed(Key.RIGHT) || Input.pressed(Key.UP) || Input.pressed(Key.DOWN))
			{
				start = true;
				first = false;
			start = true;
			}			
		}
		else
		{
			if (Mouse.leftclick())
			{				
				reset();
			}
		}
		
		//white background
		Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);

		//displays player's remaining lives
		if (lives == 3) Gfx.drawimage(0, 0, "hearts");
		if (lives == 2) Gfx.drawimage(0, 0, "hearts2");
		if (lives == 1) Gfx.drawimage(0, 0, "hearts1");
		
		//gameover
		if (lives == 0)
		{
			Sound.play("boo");
			gameover = true;
			start = false;
	
		}
		
		//displays gameover screen
		if (gameover)
		{
			Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);
			Gfx.drawimage(300,  200, "gameover");
			
			//reset
			lives = 3;
			score = 0;
		}

		//won
		if (score == win)
		{
			Sound.play("win");
			won = true;
			start = false;
		}
		
		//show win screen
		if (won)
		{
			Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);
			Gfx.drawimage(200,  200, "win");
			
			//reset
			lives = 3;
			score = 0;
		}

		//increases speed when player reach 5 scores
		if (score == 5)
		{
			flowerspeed  = 10;
			beamspeed  = 15;
		}

		//increases speed when player reach 10 scores
		if (score == 10)
		{
			beamspeed  = 25;
		}

		//game continues when player still have lives
		if (!gameover && !won)
		{
			//draws boy
			if (!start)
			{
				Gfx.drawimage(x1, y1, "boy");
			}
			else
			{
				if (count % 5 == 0)
				{
					Gfx.drawimage(x1, y1, "boy");
				}
				else
				{
					Gfx.drawimage(x1, y1, "boy2");
				}
			}

			//draws girl
			if (!start)
			{
				Gfx.drawimage(x2, y2, "girl2"); 
			}
			else
			{
				Gfx.drawimage(x2, y2, "girl"); 
			}
			
			//draws flower
			Gfx.drawimage(x3, y3, "flower");

			//draw beams
			if (start)
			{
				Gfx.drawimage(x4, y4, "beam");
				Gfx.drawimage(x5, y5, "beam");
			}
			
			//draws sun
			if (!start)
			{
				Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun");
			}
			else
			{
				if (count % 3 == 0)
				{
					Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun");
				}
				else if (count % 3 == 1)
				{
					Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun1");
				}
				else
				{
					Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun2");
				}
			}

			if (start)
			{
				if (Input.pressed(Key.LEFT))
				{
					x1 -= speed;
				}

				if (Input.pressed(Key.RIGHT))
				{
					x1 += speed;
				}	

				if (Input.pressed(Key.UP))
				{
					y1 -= speed;
				}

				if (Input.pressed(Key.DOWN))
				{
					y1 += speed;
				}
			}

			//checks if boy goes out of screen boundaries
			if (x1 < -20) x1 = -20;
			if (y1 < -10) y1 = -10;

			if (x1 > Gfx.screenwidth - 150) x1 = Gfx.screenwidth - 150;
			if (y1 > Gfx.screenheight - 250) y1 = Gfx.screenheight - 250;

			//checks if girl goes out of screen boundaries
			if (x2 < -20) x2 = -20;
			if (y2 < -10) y2 = -10;

			if (x2 > Gfx.screenwidth - 200) x2 = Gfx.screenwidth - 200;
			if (y2 > Gfx.screenheight - 300) y2 = Gfx.screenheight - 300;

			//scores if boy reaches girl and moves girl to a new random spot
			if (Math.abs(x1 - x2) < 100 && Math.abs(y1 - y2) < 200)
			{
				Sound.play("yay");
				score++;

				x2 = Random.int(0, Gfx.screenwidth - 20);
				y2 = Random.int(0, Gfx.screenheight - 50);
			}

			//moves flower
			if (start)
			{
				//changes direction of flower when it hits upper boundary
				if (!up)			
				{
					y3 -= flowerspeed;

					if (y3 < 0)
					{
						y3 = 0;
						up = true;
					}
				}

				//changes direction of flower when it hits lower boundary
				if (up)
				{
					y3 += flowerspeed;

					if (y3 == Gfx.screenheight - 100)
					{
						y3 = Gfx.screenheight - 100;
						up = false;
					}
				}
			}

			//damage
			if (x1 != 100 || y1 != 200) //checks if boy has moved or not
			{
				//boy hits flower
				if (x3 > x1 && x3 + 106 < x1 + 165 && y3 < y1 && y3 - 138 > y1 - 257)
				{
					Sound.play("ouch");
					lives--;
					x1 = 100;
					y1 = 200;
				}

				//boy hit beam 1
				if (x4 > x1 && x4 <= x1 + 115 && y4 > y1 && y4 < y1 + 220)
				{
					Sound.play("ouch");
					lives--;
					x1 = 100;
					y1 = 200;
				}

				//boy hits beam 2
				if (x5 < x1 + 120 && x5 + 37 >= x1 && y5 > y1 && y5 < y1 + 220)
				{
					Sound.play("ouch");
					lives--;
					x1 = 100;
					y1 = 200;
				}
			}
			
			//shoots beams
			if (start)
			{
				x4 -= beamspeed;
				x5 += beamspeed;
			
				y4 = y3;
				y5 = y3;
				
				if (x4 < 0) x4 = Gfx.screenwidthmid;
				if (x5 > Gfx.screenwidth - 50) x5 = Gfx.screenwidthmid;
			}

			//displays highscore
			Text.size = 4;
			Text.display(Text.RIGHT - 10, Text.BOTTOM, "SCORE: " + score, Col.BLACK, 1);
			
			//start?
			if (!start && first)
			{
				if (count % 30 == 0)
					Text.display(Text.RIGHT - 420, Text.BOTTOM - 120, "CLICK TO START", Col.WHITE, 1);
				else			
					Text.display(Text.RIGHT - 420, Text.BOTTOM - 120, "CLICK TO START", Col.BLACK, 1);			
			}
			
			
		}
		
			//restart?
			if (gameover || won)
			{
			
				if (count % 30 == 0)
					Text.display(Text.RIGHT - 400, Text.BOTTOM - 120, "CLICK TO RESTART", Col.WHITE, 1);
				else			
					Text.display(Text.RIGHT - 400, Text.BOTTOM - 120, "CLICK TO RESTART", Col.BLACK, 1);	
			}
			count++;
			
	}
	
	//resets variables to its original values
	function reset() {
		gameover = false;
		won = false;
		
		speed  = 10;
		flowerspeed  = 5; 
		beamspeed  = 10;
		
		x1 = 100;
		y1 = 200;

		x2 = Gfx.screenwidth - 300;
		y2 = 200;

		x3 = Gfx.screenwidthmid - 20;
		y3 = Gfx.screenheightmid - 50;

		x4 = Gfx.screenwidthmid;
		y4 = Gfx.screenheightmid;

		x5 = Gfx.screenwidthmid;
		y5 = Gfx.screenheightmid;
	}
}