//
//  confuseC.c
//  widgetDemo
//
//  Created by Yangyue on 15/5/19.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#include <stdio.h>
#include <sys/types.h>
#include <dirent.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

int Mydir( char *filepath);
int checkFile( char *filepath);

int findNum = 0;

int main(int argc,  char *argv[])
{
    //此代码的功能是遍历ios的项目的所有。h和。m的文件，把里面的类名，方法名，参数名等都提取出来，
    //方便用CSDN博主“念茜”的方法来混淆自己的代码用。
    Mydir("/myProject");//填写自己的工程的根目录路径。
    
    return 0;
}

int Mydir( char *filepath)
{
    char *fullpath,*filetype,*tmp;
    struct stat statbuf;
    DIR *dr;
    struct dirent *drt;
    
    if((dr=opendir(filepath))==NULL)
        return 2;
    
    while((drt=readdir(dr))!=NULL)
    {
        if(strcmp(drt->d_name,".")==0||strcmp(drt->d_name,"..")==0)
            continue;
        fullpath=strdup(filepath);
        fullpath=strcat(fullpath,"/");
        fullpath=strcat(fullpath,drt->d_name);
        
        if( stat ( fullpath,&statbuf)<0)
            return 3;
        
        if (S_ISREG(statbuf.st_mode))
        {
            filetype = "reguler";
            int a = strlen(drt->d_name);
            char *pp = drt->d_name;
            //printf("----%d %c 2 %c", a, pp[a - 2], pp[a - 1]);
            
            if(pp[a - 2] == '.' && pp[a - 1] == 'm')
            {
                pp[a - 2] = '\0';
                printf("%s\n", drt->d_name);
                checkFile(fullpath);
            }
            if(pp[a - 2] == '.' && pp[a - 1] == 'h')
            {
                char *mPath = strdup(filepath);
                mPath=strcat(mPath,"/");
                mPath=strcat(mPath,drt->d_name);
                char *pp = drt->d_name;
                int a = strlen(mPath);
                pp[ a - 1] = 'm';//检查m文件是否存在。
                if((access(mPath,F_OK))==0){
                    continue;
                }
                pp[a - 2] = '\0';
                printf("%s\n", drt->d_name);
                checkFile(mPath);
            }
        }
        else if(S_ISDIR(statbuf.st_mode))
        {
            filetype="directory";
            //fullpath=strcat(fullpath,"/");
            //printf("%s,%s\n",fullpath,filetype);
            tmp=strdup(fullpath);
            Mydir(tmp);
        }
        else
        {
            filetype="invalid";
            printf("%s,%s\n",fullpath,filetype);
        }
        //printf("%s,%s\n",fullpath,filetype);
        bzero(fullpath,strlen(fullpath));
    }
    return 0;
}
int print_Method( char *text)
{
    char *p = text;
    char c;
    int start = 0;
    while((c = *p++) !='\n'){//Method
        if(c == ':' || c == '{' || c == ';'){
            start = 0;
            break;
        }
        if(start == 1){
            printf("%c", c);
        }
        if(c == ')')
            start = 1;
    }
    printf("\n");
    start = 0;
    while((c = *p++) !='\n'){//arge
        if(c == ':'){
            start = 0;
            printf("\n");
        }
        if(start == 2 && c != '{'){
            printf("%c", c);
        }
        if(c == ' ' && start == 1)
            start = 2;
        if(c == ')')
            start = 1;
    }
    //printf("\n");
    
    return 0;
}
int findMethod( char *text)
{
    char *p = text;
    char c;
    while((c = *p++) !='\n'){
        if(c == '-' && ((*p == ' ' && *(p + 1) == '(') || *p == '(' )){
            if( text[0] == '-' )
            {
                //printf("%d %s\n", findNum++, text);
                print_Method(text);
            }
            //else
            //  printf("%d %s\n", findNum++, text);
        }
    }
    return 0;
}
int checkFile( char *filepath)
{
    //printf("＝＝＝＝%s", filepath);
    FILE *fp1;//定义文件流指针，用于打开读取的文件
    char text[10241];//定义一个字符串数组，用于存储读取的字符
    fp1 = fopen(filepath,"r");//只读方式打开文件a.txt
    while(fgets(text,10240,fp1)!=NULL)//逐行读取fp1所指向文件中的内容到text中
    {
        //puts(text);//输出到屏幕
        findMethod(text);
    }
    fclose(fp1);//关闭文件a.txt，有打开就要有关闭
    
    return 0;
}