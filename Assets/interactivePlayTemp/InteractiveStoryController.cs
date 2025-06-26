using System;
using UnityEngine;
using Ink.Runtime;

public class InteractiveStoryController : MonoBehaviour
{
    public static event Action<Story> OnCreateStory;

    [SerializeField]
    private TextAsset inkJSONAsset = null;
    public Story story;

    private string curImageKey;
    private InteractiveUIController uIController;

    // Start is called before the first frame update
    void Start()
    {
        uIController = GameObject.Find("Canvas").GetComponent<InteractiveUIController>();
        StartStory();
    }
    void StartStory()
    {
        story = new Story(inkJSONAsset.text);
#if DEBUG
        if (OnCreateStory != null) OnCreateStory(story);
#endif
        RefreshView();
    }

    void RefreshView()
    {
        // Read all the content until we can't continue any more
        while (story.canContinue)
        {
            // Continue gets the next line of the story
            string text = story.Continue();

            // This removes any white space from the text.
            text = text.Trim();

            // Display the text on screen!
            if (text != "")
                DisplayStoryMessage(text);
        }

        // Display all the choices, if there are any!
        if (story.currentChoices.Count == 2)
        {
            for (int i = 0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                uIController.SetButton(i, choice.text.Trim(), choice);
                //Tell the button what to do when we press it
                uIController.choices[i].onClick.AddListener(delegate
                {
                    OnClickChoiceButton(choice);
                });
            }
        }
        else if (story.currentChoices.Count == 1) 
        {
            Choice choice = story.currentChoices[0];
            uIController.SetButton(0, choice.text.Trim(), choice);
            //Tell the button what to do when we press it
            uIController.choices[0].onClick.AddListener(delegate
            {
                OnClickChoiceButton(choice);
            });

            uIController.SetButton(1, choice.text.Trim(), choice);
            uIController.choices[1].onClick.AddListener(delegate
            {
                OnClickChoiceButton(choice);
            });
        }
        else
        {
            //Button choice = CreateChoiceView("End of story.\nRestart?");
            //choice.onClick.AddListener(delegate {
            //	StartStory();
            //});
        }
    }

    private void DisplayStoryMessage(string curText)
    {
        // 获取 ChatItemView 组件并设置消息内容
        uIController.TypingText(curText);
    }
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        RefreshView();
    }
    // Update is called once per frame
    void Update()
    {
        
    }
}
