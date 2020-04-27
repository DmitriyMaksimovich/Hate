<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="Hate" version="0.1" date="04/26/2020" >

        <Author name="dimakss" email="1dimakss@gmail.com" />
        <Description text="HateCounter" />

        <Dependencies>
	         <Dependency name="EA_ChatWindow"/>
        </Dependencies>

        <WARInfo>
          <Categories>
            <Category name="OTHER" />
          </Categories>
          <Careers>
            <Career name="BLACKGUARD" />
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
          <CallFunction name="Hate.shtdwn" />
        </OnShutdown>
    </UiMod>
</ModuleFile>
