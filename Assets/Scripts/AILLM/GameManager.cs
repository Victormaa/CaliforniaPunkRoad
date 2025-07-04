using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameManager : MonoBehaviour
{

    private static GameManager _instance;

    public AIChatController chatController;

    public AudioSource publicAudioSource;

    public GameObject easeImageParent;

    private ImageFader spriterendererFader;

    public bool isTransitioning;

    public SpriterendererFade spriterendererFade;
    public static GameManager Instance
    {
        get { return _instance; }
    }

    void Awake()
    {
        _instance = this;
        publicAudioSource = GetComponent<AudioSource>();
    }

    // Start is called before the first frame update
    void Start()
    {
        spriterendererFade = GameObject.Find("Square").GetComponent<SpriterendererFade>();
        StartCoroutine(spriterendererFade.FadeOut());
    }

    public void LoadScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    public IEnumerator ShowSceneImageFader(string fadeName)
    {
        easeImageParent.SetActive(true);
        isTransitioning = true;
        spriterendererFader = easeImageParent.transform.Find(fadeName).GetComponent<ImageFader>();
        StartCoroutine(spriterendererFader.FadeInAndOut());
        yield return new WaitForSeconds(2 * spriterendererFader.fadeDuration + spriterendererFader.displayDuration);
        isTransitioning = false;
        easeImageParent.SetActive(false);
    }

    public IEnumerator LoadSceneWithFaderFader(string fadeName, string sceneName)
    {
        easeImageParent.SetActive(true);
        isTransitioning = true;
        spriterendererFader = easeImageParent.transform.Find(fadeName).GetComponent<ImageFader>();
        StartCoroutine(spriterendererFader.FadeIn());
        yield return new WaitForSeconds(2 * spriterendererFader.fadeDuration + spriterendererFader.displayDuration);
        isTransitioning = false;
        easeImageParent.SetActive(false);
        LoadScene(sceneName);
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.Return))
        //{
        //    if(chatController!= null)
        //        StartCoroutine(chatController.SendMessageToLLM());// chatController.SendMessageToLLM();
        //}
#if !UNITY_WEBGL
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
#endif
    }

}
