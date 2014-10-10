import SimpleOpenNI.*;

SimpleOpenNI  context;
color colorEsqueleto = color(250,183,38);//color(#FAB726);
color colorFondo = color(#B76518);

int[] tiposDeJoint;/* = {
  SimpleOpenNI.SKEL_HEAD,
  SimpleOpenNI.SKEL_NECK,
  SimpleOpenNI.SKEL_TORSO,
  SimpleOpenNI.SKEL_LEFT_SHOULDER,
  SimpleOpenNI.SKEL_LEFT_ELBOW,
  SimpleOpenNI.SKEL_LEFT_HAND,
  SimpleOpenNI.SKEL_RIGHT_SHOULDER,
  SimpleOpenNI.SKEL_RIGHT_ELBOW,
  SimpleOpenNI.SKEL_RIGHT_HAND,
  SimpleOpenNI.SKEL_LEFT_HIP,
  SimpleOpenNI.SKEL_LEFT_KNEE,
  SimpleOpenNI.SKEL_LEFT_FOOT,
  SimpleOpenNI.SKEL_RIGHT_HIP,
  SimpleOpenNI.SKEL_RIGHT_KNEE,
  SimpleOpenNI.SKEL_RIGHT_FOOT,
};*/

HashMap<Integer,PVector> joints = new HashMap();

void setup() {
  size(800,600,P3D);
  context = new SimpleOpenNI(this);
  
  tiposDeJoint = new int[]{
  SimpleOpenNI.SKEL_HEAD,
  SimpleOpenNI.SKEL_NECK,
  SimpleOpenNI.SKEL_TORSO,
  SimpleOpenNI.SKEL_LEFT_SHOULDER,
  SimpleOpenNI.SKEL_LEFT_ELBOW,
  SimpleOpenNI.SKEL_LEFT_HAND,
  SimpleOpenNI.SKEL_RIGHT_SHOULDER,
  SimpleOpenNI.SKEL_RIGHT_ELBOW,
  SimpleOpenNI.SKEL_RIGHT_HAND,
  SimpleOpenNI.SKEL_LEFT_HIP,
  SimpleOpenNI.SKEL_LEFT_KNEE,
  SimpleOpenNI.SKEL_LEFT_FOOT,
  SimpleOpenNI.SKEL_RIGHT_HIP,
  SimpleOpenNI.SKEL_RIGHT_KNEE,
  SimpleOpenNI.SKEL_RIGHT_FOOT,
};
  
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  inicializarJoints();  
  
  context.enableDepth();
  //context.enableRGB();
  context.enableUser();
  
  fill(colorEsqueleto);
  noStroke();
  //stroke(colorEsqueleto);
  //strokeWeight(3);
  //smooth();  
}

void inicializarJoints() {
  for (int tipoDeJoint : tiposDeJoint) {
    joints.put(tipoDeJoint, new PVector());
  }
}

void draw() {
  hint(DISABLE_DEPTH_TEST);
  background(colorFondo);
  translate(width/2, height/2, 0);
  rotateX(PI);
  translate(0,0,-1000);
  
  context.update();
  
  image(context.userImage(),0,0);

  int[] userList = context.getUsers();
  for(int i=0;i<userList.length;i++)
  {
    if(context.isTrackingSkeleton(userList[i]))
    {
      
      for (int tipoDeJoint : tiposDeJoint) {
        
        PVector pos = joints.get(tipoDeJoint);
        float confianza = context.getJointPositionSkeleton(userList[i], tipoDeJoint , pos );
        //context.convertRealWorldToProjective(pos,pos);println(pos);
        
        pushMatrix();
        translate( pos.x , pos.y , pos.z );
        sphere(80);
        popMatrix();
      }
      
    }      
  }
} 

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}
