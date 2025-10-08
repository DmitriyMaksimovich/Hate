<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="Hate" version="1.0" date="10/08/2025" >

        <Author name="dimakss" email="1dimakss@gmail.com" />
        <Description text="HateCounter" />

        <Dependencies>
        </Dependencies>

        <WARInfo>
          <Categories>
            <Category name="OTHER" />
          </Categories>
          <Careers>
            <Career name="BLACKGUARD" />
            <Career name="IRON_BREAKER" />
            <Career name="DISCIPLE_OF_KHAINE" />
            <Career name="WARRIOR_PRIEST" />
            <Career name="WITCH_ELF" />
            <Career name="WITCH_HUNTER" />
            <Career name="SORCERER" />
            <Career name="BRIGHT_WIZARD" />
            <Career name="CHOPPA" />
            <Career name="SLAYER" />
          </Careers>
        </WARInfo>

        <Files>
            <File name="Hate.lua" />
            <File name="Hate.xml" />
        </Files>

        <OnInitialize>
            <CallFunction name="Hate.Init" />
        </OnInitialize>
        <OnUpdate/>
        <OnShutdown>
          <CallFunction name="Hate.Shutdown" />
        </OnShutdown>
    </UiMod>
</ModuleFile>
