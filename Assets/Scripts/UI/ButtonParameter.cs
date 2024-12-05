using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]  // Ҫ����� Button
public class ButtonParameter : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    private Button thisButton;

    [HideInInspector]
    public bool isPointerInside;

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("Pointer entered the button");
        // ���������߼�������ı���۵�
        isPointerInside = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        Debug.Log("Pointer exited the button");
        // ���������߼�������ָ���۵�
        isPointerInside = false;
    }

    void Start()
    {
        thisButton = this.GetComponent<Button>();
        // ������ʼ���߼�
        thisButton.onClick.AddListener(MapButtonFunction);
    }

    void MapButtonFunction()
    {
        // �����ť����߼�
    }
}