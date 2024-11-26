using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolvedManager : MonoBehaviour
{
    private Dictionary<string, DissolveController> dissolvedObjects;
                    
    private DissolveController dissovlveObject;
    private DissolveController resovlveObject;

    private DissolveController currentShowingObj;

    private void Awake()
    {
        dissolvedObjects = new Dictionary<string, DissolveController>();


        var objects = transform.GetComponentsInChildren<DissolveController>();
        foreach(var obj in objects)
        {
            dissolvedObjects.Add(obj.transform.name, obj);
        }

        //currentShowingObj = dissolvedObjects["prologue_background"];
        //resovlveObject = dissolvedObjects["1"];
    }

    public System.Collections.IEnumerator SetSceneChange(DissolveController cur, DissolveController next)
    {
        // setup order
        cur.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = 10;
        next.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = 9;
        foreach(var o in dissolvedObjects)
        {
            if(o.Value != cur && o.Value != next)
                o.Value.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = -1;
        }


        StartCoroutine(cur.Dissolve());
        StartCoroutine(next.Ressolve());

        yield return new WaitUntil(() => !cur.IsDissolving && !next.IsRessolving);

        cur.gameObject.transform.GetComponent<SpriteRenderer>().sortingOrder = -1;

        currentShowingObj = next;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha0))
        {
           // StartCoroutine(SetSceneChange(currentShowingObj, resovlveObject));
        }
    }
}
