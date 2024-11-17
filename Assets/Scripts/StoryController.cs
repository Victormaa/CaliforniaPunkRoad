using Ink.Runtime;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class StoryController : MonoBehaviour
{
	public static event Action<Story> OnCreateStory;

	[SerializeField]
    private TextAsset inkJSONAsset = null;
    public Story story;

	[SerializeField]
	private Canvas canvas = null;
	[SerializeField]
	private Canvas canvas1_1 = null;
	[SerializeField]
	private Canvas canvas1_2 = null;

	//public TMP_Text storyText;
	public Button buttonPrefab;

	public TextDisplay textDisplay; // 绑定刚刚的文本显示脚本

	private void Awake()
    {
        // Remove the default message
        //RemoveChildren();
        StartStory();
    }
	// Creates a new Story object with the compiled story which we can then play!
	void StartStory()
	{
		story = new Story(inkJSONAsset.text);
		if (OnCreateStory != null) OnCreateStory(story);
		RefreshView();
	}
	// This is the main function called every time the story changes. It does a few things:
	// Destroys all the old content and choices.
	// Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
	void RefreshView()
	{
		// Remove all the UI on screen
		//RemoveChildren();
		RemoveButtonCanvasChildren();

		// Read all the content until we can't continue any more
		while (story.canContinue)
		{
			// Continue gets the next line of the story
			string text = story.Continue();
			// This removes any white space from the text.
			text = text.Trim();
			// Display the text on screen!
			//CreateContentView(text);
			textDisplay.ShowText(text);
		}

		// Display all the choices, if there are any!
		if (story.currentChoices.Count > 0)
		{
			for (int i = 0; i < story.currentChoices.Count; i++)
			{
				Choice choice = story.currentChoices[i];
				Button button = CreateChoiceView(choice.text.Trim());
				// Tell the button what to do when we press it
				button.onClick.AddListener(delegate {
					OnClickChoiceButton(choice);
				});
			}
		}
		// If we've read all the content and there's no choices, the story is finished!
		else
		{
			Button choice = CreateChoiceView("End of story.\nRestart?");
			choice.onClick.AddListener(delegate {
				StartStory();
			});
		}
	}
	void RemoveChildren()
	{
		int childCount = canvas.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i)
		{
			Destroy(canvas.transform.GetChild(i).gameObject);
		}
	}
	void RemoveButtonCanvasChildren()
	{
		int childCount = canvas1_1.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i)
		{
			Destroy(canvas1_1.transform.GetChild(i).gameObject);
		}
	}
	void OnClickChoiceButton(Choice choice)
	{
		story.ChooseChoiceIndex(choice.index);
		RefreshView();
	}
	// Creates a textbox showing the the line of text
	void CreateContentView(string text)
	{
		//Text storyText = Instantiate(textPrefab) as Text;
		//storyText.text = text;
		//storyText.transform.SetParent(canvas.transform, false);
	}
	// Creates a button showing the choice text
	Button CreateChoiceView(string text)
	{
		// Creates the button from a prefab
		Button choice = Instantiate(buttonPrefab) as Button;
		choice.transform.SetParent(canvas1_1.transform, false);

		// Gets the text from the button prefab
		Text choiceText = choice.GetComponentInChildren<Text>();
		choiceText.text = text;

		// Make the button expand to fit the text
		HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
		layoutGroup.childForceExpandHeight = false;

		return choice;
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
