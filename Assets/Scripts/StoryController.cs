using Ink.Runtime;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class StoryController : MonoBehaviour
{
	private enum StoryProcessState
    {
		None,
		PressEnter,
		InputText,
		AIChat,
    }

	public static event Action<Story> OnCreateStory;

	[SerializeField]
    private TextAsset inkJSONAsset = null;
    public Story story;

	private StoryProcessState curProcessState = StoryProcessState.None;
	private StoryProcessState preProcessState = StoryProcessState.None;
	private StoryProcessState beforAIState = StoryProcessState.None;
	private bool isTransferingToAIState = false;
	private bool isTransferingToBeforState = false;

	[Header("StoryObject")]
	public Transform storyListContainer; // 显示消息的容器
	public GameObject storyItemPrefab; // 消息小预构体
	public ScrollRect scrollRect;       // 滚动视图
	private Stack<TextDisplay> textDisplays;
	private string curText;

	[Header("InputFieldObject")]
	public TMP_InputField inputField;
	public GameObject inputItemPrefab; // 消息小预构体

	[Header("InputFieldObject")]
	public GameObject aiItemPrefab;
	public Button AITriggerButton;
	// 将十六进制颜色转换为 Unity 的 Color
	Color buttonTriggeredColor = new Color(50f / 255f, 79f / 255f, 255f / 255f);
	Color buttonClosedColor = new Color(0f, 0f, 0f);

	private void Awake()
    {
		textDisplays = new Stack<TextDisplay>();
		inputField.interactable = false;
		AITriggerButton.onClick.AddListener(AIButtonFunction);

		StartStory();
	}
	// Creates a new Story object with the compiled story which we can then play!
	void StartStory()
	{
		story = new Story(inkJSONAsset.text);
#if DEBUG
		if (OnCreateStory != null) OnCreateStory(story);
#endif
		RefreshView();
	}
	// This is the main function called every time the story changes. It does a few things:
	// Destroys all the old content and choices.
	// Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
	void RefreshView()
	{
		// Read all the content until we can't continue any more
		while (story.canContinue)
		{
			// Continue gets the next line of the story
			//string text = story.Continue();
			curText = story.Continue();

			// This removes any white space from the text.
			curText = curText.Trim();

			// Display the text on screen!
			//CreateContentView(text);
			//textDisplay.TypingText(curText);
			DisplayStoryMessage(curText);
		}

		// Display all the choices, if there are any!
		if (story.currentChoices.Count > 0)
		{
			// define process state
			curProcessState = StoryProcessState.PressEnter;
			if (story.currentChoices.Count > 1 || (story.currentChoices[0].text != "Press Enter" && story.currentChoices[0].text != "press enter"))
				curProcessState = StoryProcessState.InputText;

			//for (int i = 0; i < story.currentChoices.Count; i++)
			//{
			//             Choice choice = story.currentChoices[i];
			//             Button button = CreateChoiceView(choice.text.Trim());
			//             //Tell the button what to do when we press it
			//
			//             button.onClick.AddListener(delegate
			//             {
			//                 OnClickChoiceButton(choice);
			//             });
			//         }
		}
		// If we've read all the content and there's no choices, the story is finished!
		else
		{
			//Button choice = CreateChoiceView("End of story.\nRestart?");
			//choice.onClick.AddListener(delegate {
			//	StartStory();
			//});
		}
	}
	void OnClickChoiceButton(Choice choice)
	{
		story.ChooseChoiceIndex(choice.index);
		RefreshView();
	}
	private void DisplayStoryMessage(string curText)
	{
		// 实例化消息预构体
		GameObject storyItemGO = Instantiate(storyItemPrefab, storyListContainer);

		// 获取 ChatItemView 组件并设置消息内容
		TextDisplay textDisplay = storyItemGO.transform.GetChild(0).GetComponent<TextDisplay>();

		textDisplay.TypingText(curText);

		// 将生成的预构体添加到列表中以便管理
		//chatPrefabs.Add(storyItemGO);
		textDisplays.Push(textDisplay);
		// 自动滚动到最下方
		ScrollToBottom();
	}
	private void DisplayInputMessage(string curText)
	{
		// 实例化消息预构体
		GameObject storyItemGO = Instantiate(inputItemPrefab, storyListContainer);

		// 获取 ChatItemView 组件并设置消息内容
		TextDisplay textDisplay = storyItemGO.transform.GetChild(0).GetComponent<TextDisplay>();

		textDisplay.TypingText(curText);

		// 将生成的预构体添加到列表中以便管理
		//chatPrefabs.Add(storyItemGO);
		textDisplays.Push(textDisplay);
		// 自动滚动到最下方
		ScrollToBottom();
	}
	private void DisplayAIMessage(string curText)
	{
		// 实例化消息预构体
		GameObject storyItemGO = Instantiate(aiItemPrefab, storyListContainer);

		// 获取 ChatItemView 组件并设置消息内容
		TextDisplay textDisplay = storyItemGO.transform.GetChild(0).GetComponent<TextDisplay>();

		textDisplay.TypingText("XN701: " + curText);

		// 将生成的预构体添加到列表中以便管理
		//chatPrefabs.Add(storyItemGO);
		textDisplays.Push(textDisplay);
		// 自动滚动到最下方
		ScrollToBottom();
	}
	private IEnumerator SendMessageToLLM(string text)
    {
		var task = NPCMessageGenerator.GetCarAIMessage(text);
		yield return new WaitUntil(() => task.IsCompleted);
		string reply = task.Result;
		DisplayAIMessage(reply);
	}
	private void ScrollToBottom()
	{
		Canvas.ForceUpdateCanvases();
		scrollRect.verticalNormalizedPosition = 0;
		Canvas.ForceUpdateCanvases();
	}
	void AIButtonFunction()
    {
		if (curProcessState == StoryProcessState.AIChat)
        {
			isTransferingToBeforState = true;
			AITriggerButton.transform.GetComponent<Image>().color = buttonClosedColor;
		}
        else
        {
			isTransferingToAIState = true;
			beforAIState = curProcessState;
			AITriggerButton.transform.GetComponent<Image>().color = buttonTriggeredColor;
		}
    }
	// Start is called before the first frame update
	void Start()
    {
        
    }
    // Update is called once per frame
    void Update()
    {
		string currentSceneImage = (string)(story.variablesState["current_scene_image"].ToString()); //previous_knot  current_scene_image

		// on update => state change
		if (curProcessState == StoryProcessState.PressEnter)
        {
			if (Input.GetKeyDown(KeyCode.Return))
            {
				if(textDisplays.TryPeek(out TextDisplay tempText))
                {
					if (tempText.isTyping)
						tempText.ShowTextImmediately(curText);
					else
					{
						OnClickChoiceButton(story.currentChoices[0]);
					}
				}
			}
        }

		if (curProcessState == StoryProcessState.InputText)
        {
			if (Input.GetKeyDown(KeyCode.Return) && inputField.text != "")
            {
				string inputMessage = inputField.text;
				inputField.text = "";
				DisplayInputMessage(inputMessage);

				Choice choice = story.currentChoices[story.currentChoices.Count-1];
				for(int i = 0; i < story.currentChoices.Count; ++i)
                {
                    if (story.currentChoices[i].text.Contains(inputMessage))
                    {
						choice = story.currentChoices[i];
					}
                }
				OnClickChoiceButton(choice);
			}
		}

		if (curProcessState == StoryProcessState.AIChat)
        {
			if (Input.GetKeyDown(KeyCode.Return) && inputField.text != "")
            {
				string inputMessage = inputField.text;
				inputField.text = "";
				DisplayInputMessage(inputMessage);
				StartCoroutine(SendMessageToLLM(inputMessage));
			}

		}

		//AI State
		if (isTransferingToAIState)
		{
			curProcessState = StoryProcessState.AIChat;
			isTransferingToAIState = false;
		}
        if (isTransferingToBeforState)
        {
			curProcessState = beforAIState;
			isTransferingToBeforState = false;
        }

		// on enter and exit
		if (curProcessState != preProcessState)
		{
			//exit pre
			switch (preProcessState)
			{
				case StoryProcessState.PressEnter:
					break;
				case StoryProcessState.InputText:
					break;
				case StoryProcessState.AIChat:
					break;
				default:
					break;
			}

			// enter cur
			switch (curProcessState)
			{
				case StoryProcessState.PressEnter:
					inputField.interactable = false;
					break;
				case StoryProcessState.InputText:
					inputField.interactable = true;
					break;
				case StoryProcessState.AIChat:
					inputField.interactable = true;
					break;
				default:
					break;
			}
		}

		preProcessState = curProcessState;
	}
}
