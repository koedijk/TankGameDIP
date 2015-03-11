using UnityEngine;
using System.Collections;

public class selfDestruct : MonoBehaviour {
public float maxLifeTime;
public float lightFade;
private float lifeTime;
private Light light;
// Use this for initialization
void Start () {
light = GetComponent<Light>();
}
// Update is called once per frame
protected virtual void Update()
{
light.intensity -= lightFade;
lifeTime += Time.deltaTime;
if (lifeTime > maxLifeTime)
{
Destroy(this.gameObject);
}
}
}
