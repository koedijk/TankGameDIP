using UnityEngine;
using System.Collections;

public class tank : Lifes{
private Transform[] transforms;
protected Transform turret;
protected Vector3 targetPos;
protected Rigidbody rb;
// Use this for initialization
void Start()
{
rb = gameObject.GetComponent<Rigidbody>();
bool turretFound = false;
transforms = gameObject.GetComponentsInChildren<Transform>();
foreach (Transform t in transforms)
{
if (t.gameObject.name == "Turret")
{
turret = t;
turretFound = true;
}
}
if (!turretFound)
print("turret not found");
}
// Update is called once per frame
protected virtual void Update()
{
if (rb.velocity != Vector3.zero)//(0,0,0)
{
rb.velocity = Vector3.zero;
}
if (rb.angularVelocity != Vector3.zero)
{
rb.angularVelocity = Vector3.zero;
}
turret.LookAt(targetPos);
}
}
