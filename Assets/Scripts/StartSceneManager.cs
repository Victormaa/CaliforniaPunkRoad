using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StartSceneManager : MonoBehaviour
{
    public SpriterendererFade spriterendererFade;

    public GameObject interactionPanel;
    public AnimationCurve showCurve;
    public AnimationCurve hideCurve;
    public float animationSpeed;
    private bool isInStuff;

    // Start is called before the first frame update
    void Start()
    {
        isInStuff = false;
    }
    IEnumerator StartGame() 
    {
        StartCoroutine(spriterendererFade.FadeIn());

        //yield return new WaitForSeconds(spriterendererFade.fadeDuration + spriterendererFade.displayDuration);
        yield return new WaitUntil(()=>spriterendererFade.isFadeFinish);
        SceneManager.LoadScene("prologue");
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            mousePosition.z = 0;
            Collider2D collider = GetComponent<Collider2D>();
            if (collider != null && collider.OverlapPoint(mousePosition))
            {
                if(collider.name == "Start")
                {
                    StartCoroutine(StartGame());
                }

                if(collider.name == "Language")
                {

                }

                if(collider.name == "Stuff")
                {
                    StartCoroutine(ShowPanel(interactionPanel));
                    
                }
            }
        }
    }
    IEnumerator ShowPanel(GameObject CHECK1UI)
    {
        CHECK1UI.transform.localScale = Vector3.zero;
        CHECK1UI.SetActive(true);
        float timer = 0;
        while (timer <= 1)
        {
            CHECK1UI.transform.localScale = Vector3.one * showCurve.Evaluate(timer);
            timer += Time.deltaTime * animationSpeed;
            yield return null;
        }
        CHECK1UI.transform.localScale = new Vector3(1, 1, 1);
        yield return new WaitForSeconds(0.2f);       
        isInStuff = true;
    }
    public void TriggerHidePanel()
    {
        StartCoroutine(HidePanel(interactionPanel));
    }
    IEnumerator HidePanel(GameObject CHECK1UI)
    {
        if (!isInStuff)
            yield return null;
        else
        {
            CHECK1UI.transform.localScale = Vector3.zero;
            CHECK1UI.SetActive(true);
            float timer = 0;
            while (timer <= 1)
            {
                CHECK1UI.transform.localScale = Vector3.one * hideCurve.Evaluate(timer);
                timer += Time.deltaTime * animationSpeed;
                yield return null;
            }
            CHECK1UI.transform.localScale = new Vector3(0, 0, 0);
            yield return new WaitForSeconds(0.2f);
            isInStuff = false;
        }
        
    }
}
