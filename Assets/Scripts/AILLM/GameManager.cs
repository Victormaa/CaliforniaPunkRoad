using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    private static GameManager _instance;

    public AIChatController chatController;

    public static GameManager Instance
    {
        get { return _instance; }
    }

    private Contact _carAI;
    public Contact GetCarAI()
    {
        if (_carAI == null)
            _carAI = new Contact(0, "CarAI");

        return _carAI;
    }

    void Awake()
    {
        _instance = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            chatController.SendMessageToLLM();
        }
    }
}
