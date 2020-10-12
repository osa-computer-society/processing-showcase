/**
 * Project title: Projection
 * Author: Alexander Cai
 * draws a 2D projection of higher-dimensional cubes
 * an extension of https://thecodingtrain.com/CodingChallenges/113-hypercube.html
 * use numbers to rotate
 * use e/d to +/- rotate speed
 * use w/s to +/- dimensions
 * use r/f to zoom in/out
 */

final float DIST = 2.;

int MAXDIM = 9;
int DIM = 3; // the number of dimensions

// whether or not each dimension is being projected using perspective or orthogonal
boolean pers[] = new boolean[MAXDIM];

float[][] vertices = new float[npoints(MAXDIM)][MAXDIM]; // the original vertices of the cube
float[][] proj = new float[npoints(MAXDIM)][2]; // the projected vertices in 2D

// track a few keys
boolean[] isPressed = new boolean[MAXDIM];
boolean rPressed = false, fPressed = false;

// angles in different directions
// I'm pretty sure this is what makes rotation wonky but let's leave it
float[] theta = new float[MAXDIM];

// pairs of connections
boolean connected[][] = new boolean[npoints(MAXDIM)][npoints(MAXDIM)];

float rotSpeed = 0.001; // rotation speed
float len = 200; // zoom level

void setup() {
  size(600, 600);
  stroke(255);
  strokeWeight(5);
  textAlign(LEFT, TOP);
  generateVertices();
}

void draw() {
  background(0);

  // text box containing info about each layer
  fill(255);
  rect(5, 5, 100, 15 + DIM * 20);
  fill(0);
  for (int i = 0; i < DIM; ++i)
    text("DIM " + (i+1) + ": " + (pers[i] ? "PERSP" : "ORTHO"), 10, 10 + i * 20);

  translate(width/2, height/2); // (0, 0) becomes the center of the screen

  for (int i = 0; i < npoints(); ++i) {
    // Java actually doesn't bother with the length when assigning arrays like this,
    // so this makes proj[i] have a length of 4 instead of 2. Dumb Java.
    proj[i] = vertices[i];

    // handle rotation across several planes
    for (int j = 0; j < DIM; ++j) {
      proj[i] = matrixByVector(rotation(j, (j+1) % DIM, theta[j]), proj[i]);
      if (isPressed[j])
        theta[j] += rotSpeed;
    }

    for (int j = DIM; j > 2; --j) {
      if (pers[j-1])
        proj[i] = perspec(proj[i]);
      else
        proj[i] = orthogonal(proj[i]);
    }

    for (int j = 0; j < proj[i].length; ++j)
      proj[i][j] *= len;
  }

  for (int i = 0; i < npoints(); ++i) {
    point(proj[i][0], proj[i][1]);
    for (int j = i; j < npoints(); ++j)
      if (connected[i][j])
        line(proj[i][0], proj[i][1], proj[j][0], proj[j][1]);
  }

  // zoom in/out
  if (rPressed)
    len *= 1.02;
  if (fPressed)
    len /= 1.02;
}

// generate the vertices of a N-dimensional cube and connect them
void generateVertices() {
  for (int c = 0; c < npoints(); ++c) {
    for (int d = 0; d < DIM; ++d) {
      vertices[c][d] = (((c >> d) & 1)*2-1);
      connected[c][c ^ (1 << d)] = true;
    }
  }
}

int npoints(int dim) {
  return int(pow(2, dim));
}

int npoints() {
  return npoints(DIM);
}

// simply takes off the last dimension of a vector
float[] orthogonal(float[] vec) {
  float[] ans = new float[vec.length - 1];
  for (int i = 0; i < vec.length - 1; ++i)
    ans[i] = vec[i];
  return ans;
}

// generates a perspective projection of a vector
float[] perspec(float[] vec) {
  int newLen = vec.length - 1;
  float w = 1. / (DIST - vec[newLen]);
  float[] ans = new float[newLen];
  for (int i = 0; i < newLen; ++i)
    ans[i] = w * vec[i];
  return ans;
}

// multiply a matrix by a vector
float[] matrixByVector(float[][] proj, float[] vec) {
  // *technically* the number of columns in a matrix needs to equal the number of rows in a vector
  // in order for you to be able to multiply them
  // but here I was too lazy to check for lengths throughout so I just take the minimum of the two
  int newLen = min(proj[0].length, vec.length);
  float[] ans = new float[newLen];

  for (int row = 0; row < newLen; ++row)
    for (int col = 0; col < newLen; ++col) {
      float k = vec[col];
      float j = proj[row][col];
      ans[row] += j * k;
    }

  return ans;
}

/**
 * axis1 and axis2 define the plane we want to rotate around
 * I'm pretty sure rotating around a plane loses meaning in greater than 4 dimensions but whatever
 */
float[][] rotation(int axis1, int axis2, float theta) {
  float[][] ans = new float[DIM][DIM];

  if (axis1 == axis2) throw new Error("must provide two different axes");

  // we make sure axis1 is less than axis2
  if (axis1 > axis2) {
    int temp = axis1;
    axis1 = axis2;
    axis2 = temp;
  }

  // check for the indicated rows and columns and apply the rotation coordinates to them
  for (int r = 0; r < DIM; ++r) {
    if (r == axis1) {
      ans[r][r] = cos(theta);
      ans[r][axis2] = -sin(theta);
    } else if (r == axis2) {
      ans[r][axis1] = sin(theta);
      ans[r][r] = cos(theta);
    } else {
      ans[r][r] = 1;
    }
  }

  return ans;
}

void mousePressed() {
  if (mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 25 + DIM * 20)
    for (int i = 0; i < DIM; ++i)
      if (mouseY > 10 + i * 20 && mouseY < 30 + i * 20)
        pers[i] = !pers[i];
}

// a few menu options
void keyPressed() {
  if (key >= '1' && key <= '0' + DIM) isPressed[key-'1'] = true;
  if (key == ' ') for (int i = 0; i < DIM; ++i) theta[i] = 0;
  if (key == 'w' && DIM < MAXDIM) {
    ++DIM;
    generateVertices();
  }
  if (key == 's' && DIM > 3) {
    --DIM;
    generateVertices();
  }
  if (key == 'e') rotSpeed *= 1.5;
  if (key == 'd') rotSpeed /= 1.5;
  if (key == 'r') rPressed = true;
  if (key == 'f') fPressed = true;
}

void keyReleased() {
  if (key >= '1' && key <= '0' + DIM) isPressed[key-'1'] = false;
  if (key == 'r') rPressed = false;
  if (key == 'f') fPressed = false;
}
