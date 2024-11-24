using UnityEngine;

public class DissolveController : MonoBehaviour
{
    private Material dissolveMaterial; // Assign in inspector
    public float dissolveSpeed = 1f; // Control speed of dissolve
    private float dissolveAmount = 0f;

    private void Awake()
    {
        dissolveMaterial = GetComponent<SpriteRenderer>().material;
    }

    void Update()
    {
    }

    public bool IsDissolving { get { return isDissolving; } }
    private bool isDissolving = false;

    public System.Collections.IEnumerator Dissolve()
    {
        if (isDissolving || isRessolving) yield break;  // Prevent starting a new dissolve if one is already in progress
        isDissolving = true;

        dissolveAmount = 0f; // Reset for another dissolve
        while (dissolveAmount < 1.0f)
        {
            dissolveAmount += Time.deltaTime * dissolveSpeed;
            dissolveMaterial.SetFloat("_DissolveAmount", dissolveAmount);
            yield return null;
        }

        // 在这里可以添加额外的完成后处理逻辑，例如：
        // 交换纹理或者进行其他状态更新

        isDissolving = false;  // Mark dissolve as complete
    }
    public bool IsRessolving { get { return isRessolving; } }
    private bool isRessolving = false;
    public System.Collections.IEnumerator Ressolve()
    {
        if (isDissolving || isRessolving) yield break;  // Prevent starting a new dissolve if one is already in progress

        isRessolving = true;

        dissolveAmount = 1f; // Reset for another dissolve
        while (dissolveAmount > 0.0f)
        {
            dissolveAmount -= Time.deltaTime * dissolveSpeed;
            dissolveMaterial.SetFloat("_DissolveAmount", dissolveAmount);
            yield return null;
        }
        
        // 在这里可以添加额外的完成后处理逻辑，例如：
        // 交换纹理或者进行其他状态更新

        isRessolving = false;
    }
}
