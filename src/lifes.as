using UnityEngine;
using System.Collections;

public class Lifes : MonoBehaviour {
public int lives = 10;
public int bulletDamg = 1;
public int tankDamg = 0;
// Use this for initialization

void Start()
{
}
// Update is called once per frame
void Update()
{
if (lives <= 0)
{
Destroy(this.gameObject);
}
}
void OnCollisionEnter(Collision coll)
{
print(coll.gameObject.name);
if (coll.gameObject.name == "tank")
{
lives -= tankDamg;
}
if (coll.gameObject.name == "Bullet(Clone)")
{
lives -= bulletDamg;
}
}
}
