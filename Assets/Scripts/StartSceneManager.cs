using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StartSceneManager : MonoBehaviour
{
    public SpriterendererFade spriterendererFade;

    // Start is called before the first frame update
    void Start()
    {
        
    }
    IEnumerator StartGame() 
    {
        StartCoroutine(spriterendererFade.FadeInAndOut());

        yield return new WaitForSeconds(spriterendererFade.fadeDuration + spriterendererFade.displayDuration);
        Color color = spriterendererFade.element.color;  color.a = 0f; spriterendererFade.element.color = color;
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

                }
            }
        }
    }
}
