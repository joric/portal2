/*
	Speed up lighting stage by replacing vrad.exe with dummy vrad
	Usage:
	1) Important! Backup bin/vrad.exe to vrad.orig.exe
	2) Copy compiled vrad.exe to bin/vrad.exe
	3) Hold Shift while building the map to skip lighting stage
	// you may also press Ctrl+C to cancel lighting stage
*/

#include <stdio.h>
#include <windows.h>

int main(int argc, char * argv[]) {

	// if Shift pressed, quit with code 0
	// else run vrad.orig.exe

	if ( GetKeyState(VK_SHIFT) & 0x8000 ) {
		return 0;
	}

	char buf[2048] = { 0 };

	strcpy(buf, "..\\bin\\vrad.orig.exe");

	FILE * fp = fopen("C:\\Temp\\log.txt", "a+");

	for (int i=1; i<argc; i++) {
		fprintf(fp, "%i %s\n", i, argv[i]);
		//strcat(buf, " ");
		//strcat(buf, argv[i]);
	}

	fprintf(fp, buf);

	fclose(fp);

	STARTUPINFOA s_info;
	PROCESS_INFORMATION p_info;
	s_info.cb = sizeof(STARTUPINFOA);

	//CreateProcess(buf, NULL, NULL, NULL, NULL, NULL, NULL, NULL,&StartInfo, &PrInfo);

	/* params:
	0 C:/Games/Portal 2/bin/vrad.exe
	1 -final
	2 -staticproppolys
	3 -staticproplighting
	4 -textureshadows
	5 -hdr
	6 -game
	7 C:/Games/Portal 2/portal2
	8 C:/Games/Portal 2/sdk_content\maps/preview.bsp
	*/

	//argv 0 is vrad.exe, replace with vrad.orig.exe

	SetCurrentDirectory("C:/Games/Portal 2/portal2");

	char programpath[] = "C:/Games/Portal 2/portal2";
	char cmdline[] = "C:/Games/Portal 2/bin/vrad.orig.exe -final -staticproppolys -staticproplighting -textureshadows -hdr -game \"C:/Games/Portal 2/portal2\" \"C:/Games/Portal 2/sdk_content\\maps/preview.bsp\"";
	
	if (CreateProcess(NULL, cmdline, NULL, NULL, 0, 0, NULL, programpath, &s_info, &p_info)) {
		WaitForSingleObject(p_info.hProcess, INFINITE);
		CloseHandle(p_info.hProcess);
		CloseHandle(p_info.hThread);
	} else {
		printf("Error creating process.\nCmdline: %s\nProgramPath: %s\n", cmdline, programpath);
	}
	
	//ShellExecute(NULL,"open", wapLink, NULL, NULL, SW_SHOW);
	//ShellExecute(NULL, NULL, buf, NULL, NULL, SW_SHOWNORMAL);
	//system(buf);

	return 0;
}
