using UnityEngine;
using System.Collections;
public class enemyTank : tank{
public Transform player;
private float reloadTime;
public float timeToReload;
public float enemySight;
private Transform turret;
public GameObject bulletPrefab;
private Transform nozzle;
// Use this for initialization
void Start () {
reloadTime = 0;
Transform[] transforms = this.gameObject.GetComponentsInChildren<Transform>();
foreach (Transform t in transforms)
{
if (t.gameObject.name == "Turret")
{
turret = t;
}
if (t.gameObject.name == "nozzle")
{
nozzle = t;
}
}
}
// Update is called once per frame
override protected void Update()
{
if (player != null)
{
targetPos = player.position;
base.Update();
}
reloadTime += Time.deltaTime;
if (reloadTime >= timeToReload)
{
checkForPlayer();
}
}
private void checkForPlayer()
{
Ray myRay = new Ray();
myRay.origin = turret.position;
myRay.direction = turret.forward;
RaycastHit hitInfo;
if(Physics.Raycast(myRay, out hitInfo, enemySight))
{
//print(hitInfo.collider.gameObject.name);
string hitObject = hitInfo.collider.gameObject.name;
if (hitInfo.collider.transform.parent && hitInfo.collider.transform.parent.name == "tank")
{
Instantiate(bulletPrefab, nozzle.position, nozzle.rotation);
reloadTime = 0f;
}
}
}
}
