#!/usr/bin/env python3

import asyncio
import pygame as pg

pg.init()
screen = pg.display.set_mode((640, 480))
clock = pg.time.Clock()

async def main():
	running = True
	while running:
		screen.fill((0, 0, 0))
		
		screen.fill((255, 0, 0), pg.Rect(50, 50, 100, 100))
		pg.display.flip()

		clock.tick(60)
		await asyncio.sleep(0)

		for e in pg.event.get():
			if e.type == pg.QUIT:
				running = False

asyncio.run(main())
