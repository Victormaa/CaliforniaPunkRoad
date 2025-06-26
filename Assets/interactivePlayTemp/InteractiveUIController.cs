using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System;
using Ink.Runtime;

public class InteractiveUIController : MonoBehaviour
{
    private Image storyImage;

    [HideInInspector]
    public Button[] choices;

    //private Text sublineText;
    TextDisplay sublineText;
    private void Awake()
    {
        Initialized();
    }

    void Initialized()
    {
        choices = new Button[2];

        storyImage = transform.Find("StoryImage").GetComponent<Image>();

        choices[0] = transform.Find("Choice1").GetComponent<Button>();

        choices[1] = transform.Find("Choice2").GetComponent<Button>();
        //sublineText = transform.Find("SublinePanel").Find("Subline").GetComponent<Text>();
        sublineText = transform.Find("SublinePanel").Find("Subline").GetComponent<TextDisplay>();
    }
    public void TypingText(string curText)
    {
        sublineText.TypingText(curText);
    }
    internal void SetButton(int i, string v, Choice choice)
    {
        choices[i].transform.Find("Text").GetComponent<Text>().text = v;
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    
}
