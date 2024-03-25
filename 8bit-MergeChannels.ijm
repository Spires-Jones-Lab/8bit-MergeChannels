macro "batch_merge_channels"{

    setBatchMode(true);
    file1= getDirectory("Choose a Directory1");
    list1= getFileList(file1); 
    n1=lengthOf(list1);
    file2= getDirectory("Choose a Directory2");
    list2= getFileList(file2); 
    n2=lengthOf(list2);
    file3= getDirectory("Choose a Directory3");
    list3= getFileList(file3); 
    n3=lengthOf(list3);
    file4= getDirectory("Choose a Directory4");
    list4= getFileList(file4); 
    n4=lengthOf(list4);
    file5= getDirectory("Choose a save Directory");



    for(i=0;i<list1.length;i++)
    {
    open(file1+list1[i]);
    selectWindow(list1[i]);
    	run("8-bit");	
		//run("Threshold...");
		setThreshold(40, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask", " background=Light black");
    open(file2+list2[i]);
    selectWindow(list2[i]);
		run("8-bit");
		//run("Threshold...");
		setThreshold(40, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask", " background=Light black");
    open(file3+list3[i]);
     selectWindow(list3[i]);
		run("8-bit");
		//run("Threshold...");
		setThreshold(40, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask", " background=Light black");
    open(file4+list4[i]);
     selectWindow(list4[i]);
     	run("8-bit");
		//run("Threshold...");
		setThreshold(40, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask", " background=Light black");



      name1 = getInfo("image.filename");  	
      run("Merge Channels...", "c4="+list1[i]+ " c5="+list2[i]+ " c6="+list3[i]+ " c7="+list4[i] + " keep");
      saveAs("tiff", file5+""+name1+"-merged");
      run("Close All");
    }
   // setBatchMode(true);
}