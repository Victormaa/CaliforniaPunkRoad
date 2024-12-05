using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]  // 要求添加 Button
public class ButtonParameter : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    private Button thisButton;

    [HideInInspector]
    public bool isPointerInside;

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("Pointer entered the button");
        // 增加其他逻辑，比如改变外观等
        isPointerInside = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        Debug.Log("Pointer exited the button");
        // 增加其他逻辑，比如恢复外观等
        isPointerInside = false;
    }

    void Start()
    {
        thisButton = this.GetComponent<Button>();
        // 其他初始化逻辑
        thisButton.onClick.AddListener(MapButtonFunction);
    }

    void MapButtonFunction()
    {
        // 点击按钮后的逻辑
    }
}