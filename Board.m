
function Board(Checker,turn) 

for ii=1:8
     for jj=1:8  
          hold on
          rectangle('Position', [0+ii 0+jj 1 1],'linewidth',0.5,'edgecolor',[0.8 0.9 0.9]);
          X=[0+ii 1+ii 1+ii 0+ii];
          Y=[0+jj 0+jj 1+jj 1+jj];
          
          if mod(mod(ii,2)+mod(jj,2),2)==0,                
              fill(X,Y,'k'); 
          end          
          if mod(mod(ii,2)+mod(jj,2),2)==1,                
              fill(X,Y,'w');
          end
          
          Xcir=(0.5+ii)+0.4*cos(0:1/50:2*pi);
          Ycir=(0.5+jj)+0.4*sin(0:1/50:2*pi);
          
          if (Checker(ii,jj)==0 || Checker(ii,jj)==2)               
              fill(Xcir,Ycir,'r','EdgeColor','w');
          end
          if ((Checker(ii,jj)==1) || (Checker(ii,jj)==3)),                
              fill(Xcir,Ycir,'b','EdgeColor','w');  
          end
          
          SXcir=(0.5+ii)+0.2*cos(0:1/50:2*pi);
          SYcir=(0.5+jj)+0.2*sin(0:1/50:2*pi);
          
          if (Checker(ii,jj)==2 || Checker(ii,jj)==3),                
              fill(SXcir,SYcir,'y','EdgeColor','w');  
          end       
     end
end

text(-2,9,'U Score','color','g','fontsize',15);
text(10,9,'I Score','color','g','fontsize',15);

rectangle('Position', [1 1 8 8],'linewidth',2,'edgecolor',[0.0 1.0 0.9]);
axis([0 10 0 10]);
title('Checker','fontsize',18,'color','m');
axis equal
axis off
set(gcf,'Resize','off');
hold off
if mod(turn,2)==0,
    Checkers('UUU');
end
if mod(turn,2)==1,   
    Checkers('CPU');
end
%**************************************************************%

function [Button]=Check(Checker,Xnew,Ynew)

Button=0;% NOT a valid Coin

%Soldier
if Checker(Xnew,Ynew)==0,
  if (Xnew>=0 && Xnew<8 && Ynew>=0 && Ynew<8)
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=1;
    end
  end
  
  if (Xnew>=0 && Xnew<8 && Ynew>1 && Ynew<=9)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==1 || Checker(Xnew+1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==1 || Checker(Xnew+1,Ynew-1)==3), 
        Button=0;    
    end
  end
end
if Checker(Xnew,Ynew)==1,
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==0 || Checker(Xnew-1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==0 || Checker(Xnew-1,Ynew-1)==2), 
        Button=0;    
    end
  end
end
if Checker(Xnew,Ynew)==2,
  if (Xnew>=0 && Xnew<=7 && Ynew>=0 && Ynew<=7)  
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=7 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==1 || Checker(Xnew+1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==1 || Checker(Xnew+1,Ynew-1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==1 || Checker(Xnew-1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==1 || Checker(Xnew-1,Ynew-1)==3), 
        Button=0;    
    end
  end
end
if Checker(Xnew,Ynew)==3,
  if (Xnew>=0 && Xnew<=7 && Ynew>=0 && Ynew<=7)  
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=7 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==0 || Checker(Xnew+1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==0 || Checker(Xnew+1,Ynew-1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==0 || Checker(Xnew-1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==0 || Checker(Xnew-1,Ynew-1)==2), 
        Button=0;    
    end
  end
end
%***********************************************%

function Checkers(action)

global turn Checker handles;

clc
%--------------------------------------------------------------------------
if nargin < 1, Checker=9*ones(8,8);  action = 'initialize'; end;
%--------------------------------------------------------------------------
if strcmp(action,'initialize')
    %non coin places
    for ii=1:8
        for jj=1:8
            if mod(ii-1+jj,2)==1,
                Checker(ii,jj)=5;
            end
        end    
    end
    %assigning the coins either side
    for ii=[1:3 6:8]
        for jj=1:8
            if (mod(ii,2)+mod(jj,2))==1,
                Checker(ii,jj)=floor(ii/5);
            end
        end    
    end
       
    fig=figure( ...
                'Name','CHECKERS', 'NumberTitle','off', ...
                'Visible','off', 'BackingStore','off');  

    turn=mod(fix(10*rand(1,1)),2); 
    %Score
    handles(1) = text(-1,8,sprintf('%d',length(find(Checker==0))),'color','k','fontsize',12);
    handles(2) = text(11,8,sprintf('%d',length(find(Checker==1))),'color','k','fontsize',12);
    if mod(turn,2)==0,
        handles(3) = text(3.5,0,'UUU turn...','color','w','fontsize',18);
    end
    if mod(turn,2)==1,
        handles(3) = text(3.5,0,'CPU turn...','color','k','fontsize',18);
    end
    
    handles(4) = text(2.5,-1,'Start','color','g','fontsize',18);  
    handles(5)=line([1 10 1],[1 10 1],'linewidth',3,'color','g','visible','off');
    handles(6)=line([1 10 1],[1 10 1],'linewidth',3,'color','g','visible','off');
    
    Board(Checker,turn);
    figure(fig);
    
    if mod(turn,2)==0,
        Checkers('UUU');    
    end
    if mod(turn,2)==1,
        Checkers('CPU');    
    end
end
%--------------------------------------------------------------------------
% Handling the handles

fig_handle = axes( ...
                'Units','normalized',  ...
                'Visible','off', 'DrawMode','fast', ...
                'NextPlot','replace');
            
help_handle = uicontrol('units','normalized',...
                'position',[.85 .12 .1  .05],'string','Help', ...
                'callback','Checkers(''Help'')', ...
                'interruptible','on');

exit_handle = uicontrol('units','normalized',...
                'position',[.85 .05 .1  .05],'string','Exit', ...
                'callback','delete(gcf)', ...
                'interruptible','off');
%--------------------------------------------------------------------------
if strcmp(action,'Help')
    msg=strvcat('DESCRIPTION of GAME:                                                        ',...
                '1. Checkers is played on the dark squares only.                             ',...
                '2. If one of your pieces is next to one of your opponent''s pieces and      ',...
                '   the square beyond it is free, you are required to jump over the          ',...
                '   opponents piece. The opponents piece is then removed from the board.    ',...
                '3. It is possible to jump many times in a row with the same piece.          ',...
                '4. In the beginning, pieces can only move and jump forward.                 ',...
                '   However, if a piece reaches the far end of the board (in the case of     ',...
                '   the person playing red, the top), then it becomes a king.                ',...
                '   on top of the other. In this program, the king has a star on it.)        ',...
                '5. A king is allowed to move and jump diagonally backwards and forwards.    ',...
                '6. Kings can be captured like any other piece.                              ');
     
    msgbox(msg,'GAME->CHECKERS','help');
end
%--------------------------------------------------------------------------
if strcmp(action,'UUU') 
    %getting the input
    Button=1;
    while Button==1,        
       set(handles(4),'string','Select the Coin...','color','g');  
       [Xnew Ynew Button] = ginput(1);
       Xnew=floor(Xnew);
       Ynew=floor(Ynew);
       if (Checker(Xnew,Ynew)==0 || Checker(Xnew,Ynew)==2 && (Xnew>0 && Xnew<9 && Ynew>0 && Ynew<9) && Button==1),
           Button=0;
           set(handles(5),'XData',[Xnew Xnew+1 Xnew+1 Xnew Xnew],'YData',[Ynew Ynew Ynew+1 Ynew+1 Ynew],'linewidth',3,'color','y','visible','on');
           pause(0.25);
           Button=Check(Checker,Xnew,Ynew);
           if Button==1,  
               set(handles(4),'string','Not a valid Selection...','color','r');
               pause(0.25);
           end
       else           
           set(handles(4),'string','Not a valid Selection...','color','r');
           Button=1;
           pause(0.25);
       end
    end
    
    while Button==0,
       set(handles(4),'string','Select the Position...','color','c');
       [SXnew SYnew Button] = ginput(1);
       SXnew=floor(SXnew);
       SYnew=floor(SYnew);
       if (Checker(SXnew,SYnew)==9 && (SXnew>0 && SXnew<9 && SYnew>0 && SYnew<9) && Button==1),
           set(handles(6),'XData',[SXnew SXnew+1 SXnew+1 SXnew SXnew],'YData',[SYnew SYnew SYnew+1 SYnew+1 SYnew],'linewidth',3,'color','g','visible','on');
           pause(0.25);
           if Checker(Xnew,Ynew)==0, 
               if (SXnew<=Xnew)  
                    set(handles(4),'string','Not a valid Position...','color','r');
                    Button=0;
                    pause(0.25);
               end
           end
       else
           set(handles(4),'string','Not a valid Position...','color','r');
           Button=0;
           pause(0.25);           
       end
    end
    
   %Soldier
   if Checker(Xnew,Ynew)==0,
      if ((SXnew-Xnew==1) && abs(SYnew-Ynew)==1), 
            Checker(SXnew,SYnew)=0;
            Checker(Xnew,Ynew)=9;  
      end                                    
      if ((SXnew-Xnew)==2 && abs(SYnew-Ynew)==2), 
        if (Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==1 || Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==3),
            Checker(SXnew,SYnew)=0;
            Checker(Xnew,Ynew)=9;
            Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)=9;
        end
      end
   end
    
    %King
    if Checker(Xnew,Ynew)==2,
       if (abs(SXnew-Xnew)==1 && abs(SYnew-Ynew)==1), 
           Checker(SXnew,SYnew)=2;
           Checker(Xnew,Ynew)=9;
       end
       if (abs(SXnew-Xnew)==2 && abs(SYnew-Ynew)==2), 
          if (Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==1 || Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==3),
             Checker(SXnew,SYnew)=2;
             Checker(Xnew,Ynew)=9;
             Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)=9;
          end
       end
    end
        
    if (SXnew==8), Checker(SXnew,SYnew)=2;  end
    
    turn=turn+1;    
    set(handles(1),'string',num2str(sprintf('%d',length(find(Checker==0))+length(find(Checker==2)))));
    set(handles(2),'string',num2str(sprintf('%d',length(find(Checker==1))+length(find(Checker==3)))));
    set(handles(3),'string','CPU turn...','color','w');

    %checking for win/loose (NO Move + NO Coin)
    count=0;
    [R,C,v]=find(Checker==1 | Checker==3);
    for kk=1:length(R)
        Button=Check(Checker,R(kk),C(kk));
        if Button==1, count=count+1;  end
    end
    if (length(find(Checker==1))+length(find(Checker==3))==0 || count==0), 
        %set(handles(3),'string','Congrats...UUU won the GAME...','color','r');
        msg=['Congrats...U WON the Game...'];
        [namastedata namastemap]=imread('namaste.jpg');
        msg_handle=msgbox(msg,'Nice Play...!','custom',namastedata,namastemap);        
        pause(4);
        close(msg_handle);
        closereq
        return
    end
          
    set(handles(5),'XData',[Xnew Xnew+1 Xnew+1 Xnew Xnew],'YData',[Ynew Ynew Ynew+1 Ynew+1 Ynew],'color','r','visible','off');
    set(handles(6),'XData',[SXnew SXnew+1 SXnew+1 SXnew SXnew],'YData',[SYnew SYnew SYnew+1 SYnew+1 SYnew],'color','r','visible','off');
    Board(Checker,turn);
    drawnow;
end
%--------------------------------------------------------------------------
if strcmp(action,'CPU') 
    %getting the input
    Button=1;
    while Button==1,        
       set(handles(4),'string','Select the Coin...','color','g');  
       [Xnew Ynew Button] = ginput(1);
       Xnew=floor(Xnew);
       Ynew=floor(Ynew);
       if (Checker(Xnew,Ynew)==1 || Checker(Xnew,Ynew)==3 && (Xnew>0 && Xnew<9 && Ynew>0 && Ynew<9) && Button==1),
           Button=0;
           set(handles(5),'XData',[Xnew Xnew+1 Xnew+1 Xnew Xnew],'YData',[Ynew Ynew Ynew+1 Ynew+1 Ynew],'linewidth',3,'color','y','visible','on');
           Button=Check(Checker,Xnew,Ynew);
           if Button==1,  
               set(handles(4),'string','Not a valid Selection...','color','r');
               pause(0.25);
           end
       else         
           set(handles(4),'string','Not a valid Selection...','color','r');
           Button=1;
           pause(0.25);
       end
    end
    
    while Button==0,
       set(handles(4),'string','Select the Position...','color','c');
       [SXnew SYnew Button] = ginput(1);
       SXnew=floor(SXnew);
       SYnew=floor(SYnew);
       if (Checker(SXnew,SYnew)==9 && (SXnew>0 && SXnew<9 && SYnew>0 && SYnew<9) && Button==1),           
           set(handles(6),'XData',[SXnew SXnew+1 SXnew+1 SXnew SXnew],'YData',[SYnew SYnew SYnew+1 SYnew+1 SYnew],'linewidth',3,'color','g','visible','on');
           pause(0.25);
           if Checker(Xnew,Ynew)==1, 
               if (SXnew>=Xnew)  
                    set(handles(4),'string','Not a valid Position...','color','r');
                    Button=0;
                    pause(0.25);
               end
           end
       else        
           set(handles(4),'string','Not a valid Position...','color','r');
           Button=0;
           pause(0.25);
       end
    end
    
   %Soldier
   if Checker(Xnew,Ynew)==1,
      if ((Xnew-SXnew)==1 && abs(SYnew-Ynew)==1),
          Checker(SXnew,SYnew)=1;
          Checker(Xnew,Ynew)=9;  
      end                                    
      if ((Xnew-SXnew)==2 && abs(SYnew-Ynew)==2), 
        if (Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==0 || Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==2),
            Checker(SXnew,SYnew)=1;
            Checker(Xnew,Ynew)=9;
            Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)=9;
        end
      end
    end
    
    %King
    if Checker(Xnew,Ynew)==3,
       if (abs(SXnew-Xnew==1) && abs(SYnew-Ynew)==1), 
           Checker(SXnew,SYnew)=3;
           Checker(Xnew,Ynew)=9;
       end
       if (abs(SXnew-Xnew)==2 && abs(SYnew-Ynew)==2), 
          if (Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==0 || Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)==2),
             Checker(SXnew,SYnew)=3;
             Checker(Xnew,Ynew)=9;
             Checker((Xnew+SXnew)/2,(Ynew+SYnew)/2)=9;
          end
       end
    end
        
    if (SXnew==1), Checker(SXnew,SYnew)=3;  end
    
    turn=turn+1;    
    set(handles(1),'string',num2str(sprintf('%d',length(find(Checker==0))+length(find(Checker==2)))));
    set(handles(2),'string',num2str(sprintf('%d',length(find(Checker==1))+length(find(Checker==3)))));
    set(handles(3),'string','UUU turn...','color','k');
    
    %checking for win/loose (NO Move + NO Coin)
    count=0;
    [R,C,v]=find(Checker==0 | Checker==2);
    for kk=1:length(R)
        Button=Check(Checker,R(kk),C(kk));
        if Button==1, count=count+1;  end
    end
    if (length(find(Checker==0))+length(find(Checker==2))==0 || count==0), 
        %set(handles(3),'position',[0 0],'string','Congrats...CPU won the GAME...','color','r');
        msg=['Congrats...CPU WON the Game...'];
        [namastedata namastemap]=imread('namaste.jpg');
        msg_handle=msgbox(msg,'Nice Play...!','custom',namastedata,namastemap);        
        pause(4);
        close(msg_handle);
        closereq
        return        
    end
    
    set(handles(5),'XData',[Xnew Xnew+1 Xnew+1 Xnew Xnew],'YData',[Ynew Ynew Ynew+1 Ynew+1 Ynew],'color','r','visible','off');
    set(handles(6),'XData',[SXnew SXnew+1 SXnew+1 SXnew SXnew],'YData',[SYnew SYnew SYnew+1 SYnew+1 SYnew],'color','r','visible','off');
    Board(Checker,turn);
    drawnow;
end
%****************************************%