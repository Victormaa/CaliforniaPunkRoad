using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro; // 如果使用 TextMeshPro

public class AIChatController : MonoBehaviour
{
    public TMP_Text playerInputText;
    public TMP_Text AIReply;
    public TextDisplay textDisplay;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public IEnumerator SendMessageToLLM()
    {
        var task = NPCMessageGenerator.GetCarAIMessage(playerInputText.text);
        yield return new WaitUntil(() => task.IsCompleted);
        string reply = task.Result;
        textDisplay.TypingText(reply);
    }
}
