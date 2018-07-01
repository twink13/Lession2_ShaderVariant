using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class BuildBundle {

	[MenuItem("Assets/Build AssetBundles")]
	static void BuildAllAssetBundles()
	{
		List<AssetBundleBuild> maps = new List<AssetBundleBuild>();
		maps.Clear();
		//资源打包

		string[] files = {
			"Assets/Prefab/Cube.prefab",
		};

		AssetBundleBuild build = new AssetBundleBuild();
		build.assetBundleName = "ShaderVariantsPrefab";
		build.assetNames = files;
		maps.Add(build);

		string[] file2s = {
			"Assets//Shader/Colors.shader",
		};

		AssetBundleBuild build2 = new AssetBundleBuild();
		build2.assetBundleName = "ShaderVariantsShader";
		build2.assetNames = file2s;
		maps.Add(build2);

		BuildAssetBundleOptions options = BuildAssetBundleOptions.DeterministicAssetBundle;
		BuildPipeline.BuildAssetBundles("Assets/StreamingAssets", maps.ToArray(), options, BuildTarget.StandaloneWindows);

		AssetDatabase.Refresh();
	}

}
