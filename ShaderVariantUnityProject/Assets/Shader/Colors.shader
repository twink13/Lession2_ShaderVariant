Shader "Unlit/Colors"
{
	Properties
	{
		[Toggle(KEYWORD_RED)]KEYWORD_RED("KEYWORD_RED", Int) = 0
		[Toggle(KEYWORD_GREEN)]KEYWORD_GREEN("KEYWORD_GREEN", Int) = 0
		[Toggle(KEYWORD_BLUE)]KEYWORD_BLUE("KEYWORD_BLUE", Int) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature KEYWORD_RED KEYWORD_GREEN KEYWORD_BLUE
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = fixed4(0, 0, 0, 1);

				#if KEYWORD_RED
				{
					col.rgb += fixed3(1, 0, 0);
				}
				#endif

				#if KEYWORD_GREEN
				{
					col.rgb += fixed3(0, 1, 0);
				}
				#endif

				#if KEYWORD_BLUE
				{
					col.rgb += fixed3(0, 0, 1);
				}
				#endif
				return col;
			}
			ENDCG
		}
	}
}
