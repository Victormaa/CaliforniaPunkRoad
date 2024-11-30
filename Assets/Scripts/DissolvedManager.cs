using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolvedManager : MonoBehaviour
{
    // first pic name
    private const string FIRSTPICNAME = "fog";

    public Dictionary<string, DissolveController> dissolvedObjects;
                    
    private DissolveController dissovlveObject;
    private DissolveController resovlveObject;

    public DissolveController currentShowingObj;

    private void Awake()
    {
        dissolvedObjects = new Dictionary<string, DissolveController>();

        var objects = transform.GetComponentsInChildren<DissolveController>();
        foreach(var obj in objects)
        {
            dissolvedObjects.Add(obj.transform.name, obj);
        }

        currentShowingObj = dissolvedObjects[FIRSTPICNAME];

        currentShowingObj.transform.GetComponent<SpriteRenderer>().sortingOrder = 10;
    }

    public System.Collections.IEnumerator SetSceneChange(DissolveController cur, string next)
    {
        if (!dissolvedObjects.ContainsKey(next))
            yield break;
        if (cur == dissolvedObjects[next])
            yield break;

        // setup order
        cur.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = 10;
        dissolvedObjects[next].gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = 9;

        foreach(var o in dissolvedObjects)
        {
            if(o.Value != cur && o.Value != dissolvedObjects[next])
                o.Value.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = -1;
        }


        StartCoroutine(cur.Dissolve());
        StartCoroutine(dissolvedObjects[next].Ressolve());

        yield return new WaitUntil(() => !cur.IsDissolving && !dissolvedObjects[next].IsRessolving);

        cur.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = -1;

        currentShowingObj = dissolvedObjects[next];
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.Alpha0))
        //{
        //    StartCoroutine(SetSceneChange(currentShowingObj, "road"));
        //}
    }
}
