using UnityEngine;
using System.Collections;

public class playerTank : tank {
public float rotationSpeed = 4f;
public float moveSpeed = 0.4f;
public GameObject bulletPrefab;
private GameObject Turret;
private GameObject nozzle;
// Use this for initialization
void Start () {
}
// Update is called once per frame
override protected void Update()
{
if (Input.GetButtonDown("Fire1"))
{
Quaternion rotation = Quaternion.Euler(Vector3.up * Turret.transform.rotation.eulerAngles.y);
Instantiate(bulletPrefab, nozzle.transform.position, rotation);
}
Transform[] transforms = GetComponentsInChildren<Transform>();
foreach (Transform t in transforms)
{
if (t.gameObject.name == "Turret")
{
Turret = t.gameObject;
}
if (t.gameObject.name == "nozzle")
{
nozzle = t.gameObject;
}
}
Vector3 mousePos = Input.mousePosition;
mousePos.z = camera.transform.position.y - turret.transform.position.y;
Vector3 worldPos = camera.ScreenToWorldPoint(mousePos);
targetPos = worldPos;
base.Update();
if (Input.GetKey(KeyCode.W))
{
transform.Translate(-Vector3.forward * moveSpeed);
}
if (Input.GetKey(KeyCode.S))
{
transform.Translate(Vector3.forward * moveSpeed);
}
if (Input.GetKey(KeyCode.A))
{
transform.Rotate(-Vector3.up * rotationSpeed);
}
if (Input.GetKey(KeyCode.D))
{
transform.Rotate(Vector3.up * rotationSpeed);
}
}
}
