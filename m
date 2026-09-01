Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2330C61DD3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 21:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1WBj-0003zE-Lc; Tue, 01 Sep 2026 17:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1WBh-0003yq-Nn
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:38:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1WBc-0000LY-CY
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:38:33 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KT7iV3663496
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 21:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6g0FXPehmA2uZ7Cl9iBL3LorYruePKAfwhgPzwb2Wfg=; b=OPEug+Q5hspp9IEm
 UFM8ZvlQA1hfl+7XqIvfc/7Id8ebdsFAotcXLg0mWsfHtLePX3tEahEaT59J3ldE
 rY5XK9CXqO/nc9C4dF0OxYCfq4B4tfsYv0qFTTVz7ynTLkTlNOzcgYvTMlJYmFZb
 4SWEY1lay+esXOF8tRV/JUoTK3Gzj6jSlQ5aJWeoooAjTDAt9OEm07s4yjUeSCoW
 9lzjvOoqZKIbvRu2AA54mGllFSNeW0WwJGIjrwORKFsCIcZ/lUKynTXCyVIBA7TC
 A5lbxOtYBCBLZLEx+W00twxiC8EKKDjA30DyUhuVjPw3nrf1Gv39EUGZZW1qtG+o
 srB6UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j0xun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 21:38:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5283df62d68so5539841cf.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788298710; x=1788903510; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6g0FXPehmA2uZ7Cl9iBL3LorYruePKAfwhgPzwb2Wfg=;
 b=cm6UoenY+pp0DsyAwbztjORbMUZpVEUzqBU9dcUWnPTZmZdFQBCxAp8rd/kiR+1qQz
 ZB9N+bxa20tGcO9x+i7eH73LDw58Icxn9Q3zeWVDs0F3xgV2NQQYpYjOJP4Ns1b4C5TA
 T8rBANgO0z7m9aM0oQHRH37mZ7R4wulfuAlytinm6NBy/BZIBZpQbuWiTYPinRhKo8ON
 nRyd2pjqiwenXEdEByElCqHzBiLS+7gcP5rg1umQxZsnTfivHiP9kcYaYXrpiLf6rRUq
 N8O9FxjXqH4mdydEWx2T6Nwe7E22ZrmykUgBYrwio+MNjCE+FtJ9/Xjrv5MAXrpv4TRZ
 nZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788298710; x=1788903510;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6g0FXPehmA2uZ7Cl9iBL3LorYruePKAfwhgPzwb2Wfg=;
 b=Y61YI7SFSYAaiDdqh/WKyHMGZB+FuMXVzq5TUMPFZE+VgoNaDVrdT1rBgFunsbx8fd
 W07U01efJ12mumBMdllRnnl60mxjTqzQtySy9zJL3/k2nuF0iT07gT/Apexo5o0dAhOI
 gfjPYy8JsJUWGzn+DtBG97a8RY/JTPoT8Vr6Njobxo+mG7WV5O2w4CObwy6PjDW2NRJf
 0ryGVQRCYzL2/6XFwNROrWazeTsdBvk4d71O+vUWPPqqXSMtdg6rPfK4XWPNpvD4SMsZ
 1n+mumIgKNvFySrc89v30Q+wL0bgRaE6t6bU64tq7PU+b1T9JY5KbmG24YJvNKZfo1XN
 UOqA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoKCc1mACj1Iu6AREJRh9Cw1BjmlTtxPFaJJYW1Wxr8R4de4Esc6AT75ynFZBjem12aahFBgYqINwDN@nongnu.org
X-Gm-Message-State: AFuF++lREIigrvVohqUAFJquTRx2ZzlvdO4cmu9bIk/8f2QZrGPUoYgb
 NlAv/UXXaXrE7oxVmTqYKGfAb3kIUKE5ng1CGQLd9jUGmbkczFaGarxwvnvPves6PIZUpiJYMSU
 sSikbQvnhQKnYundt4tI5ds0xMp8jba3LkTTG0K7d1dQhAaBr5nKTecwGNg==
X-Gm-Gg: AR+sD133twLm60/s8M8E8JDvl62p3Dm4hwL3etOoDudi5Yr/ByUITSkimtIf6cSM+as
 e3vfzN+tJ/Qn0qkKcXZPplwcADVegkwXqAZEhonLLIRxWugdpb1g9jNtAA1peai+1gFWKvhVwKz
 nXYM/TzC160qFha1cd8X582ipGF5uJ9YHmDIO3uRnWc2CaBHIrjRZR7hrtohnBfYtBVbj+BfX1w
 bmLt5kRNJHvogJjPi8WTx1OifEO7BiIFD0pKPe+3fSGujZk47emgcptPpvO1yg9ZEXQx4SW7+Nz
 c95QFmESwppjOLQDiKEEaLnhTHxvcRkGtr+Me+ZU4BE7ZkxKTJpZOrhKBZdGGXIwdapmcOZKqrn
 D3GsT08VHN50buo8W2iGDyxD2YVkvs/yf2Kgv
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id
 d75a77b69052e-53021ce5310mr159380361cf.29.1788298709711; 
 Tue, 01 Sep 2026 14:38:29 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:528:3471:937f with SMTP id
 d75a77b69052e-53021ce5310mr159379551cf.29.1788298709164; 
 Tue, 01 Sep 2026 14:38:29 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9ee260b6sm3472566d6.14.2026.09.01.14.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 14:38:28 -0700 (PDT)
Message-ID: <3f97f88c-9c49-49fd-9990-86dbca2c3404@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:38:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: add helper_tlb_flush_page()
To: Trevor Gamblin <tgamblin@baylibre.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
 <20260831-riscv_tlb_page_flush-v1-2-4fc6af95673a@baylibre.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831-riscv_tlb_page_flush-v1-2-4fc6af95673a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zd14uydrOR-8h2qRk8X5UkPxYvy6wsU0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE4OSBTYWx0ZWRfXyJHa3KU31bwq
 9G5ehgBDkQTW//+3NdWOjXuyIl0K+PAFuk98ghw4mqGz1gacjyZWmAYgCpeaz12rzqKie0kivoS
 nfii5RTVLSbeMTYXRQ9Y8mdkM0rDJWk=
X-Proofpoint-ORIG-GUID: zd14uydrOR-8h2qRk8X5UkPxYvy6wsU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE4OSBTYWx0ZWRfX3u/xFWQ9J4w6
 WRA1gcp0JZhBhJPzkPOlX+E8boC+8GGLt5jxgRdNsShn+N764MSn3isFDZPYUicsGjeMK23rEap
 P/VUlLc2HCyytz8XpzoKjAUcJcQIOZGB77IRpIcoGtrcg0/3fhiyoAfYeZiKSVZxm2j1zfENTku
 v0hmN++ATMER5Wq0ewLuauhS9o3Tu0iczsixYLIOmlPMle6FUQ7ieHDRRs3CBdX1dh9G45kKB3O
 XA37uFvgYu9f1Oxs3foZ5DHSF+3pHoUnR6oFhr6tS+SvzJ0X2YrW+MDxF0Mb6WuonId68GGy6lL
 MeJJGrZ6rkSHsLxY/9nv9fpBtVpnm+5nzZBMk+bzC71E3rkaz5FcpmnvotBF+dayyoti+lVq+04
 zRGQ2M7VkLqylSc0+y0fFcGoFCYa1mvjs+hgyj38CDwh03WC3uaIrR4yMvTEKFthpsXna11H1qV
 WfhBjF3ryTZ4u3u5BHw==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a9745d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IpJZQVW2AAAA:8 a=0vUcrW1TMMbxpHMFu-UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010189
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/31/2026 3:59 PM, Trevor Gamblin wrote:
> Add a page-level counterpart to helper_tlb_flush(), and condition its
> internal call to tlb_flush_page() on return value from the new
> sfence_vma_allowed() function.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

I believe this code should be squashed into patch 3 where there's an
actual caller for helper_tlb_flush_page.

Also ...

>   target/riscv/helper.h        | 1 +
>   target/riscv/tcg/op_helper.c | 7 +++++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 4fc2d3a155..652f85a5c7 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -137,6 +137,7 @@ DEF_HELPER_1(ctr_clear, void, env)
>   DEF_HELPER_1(wfi, void, env)
>   DEF_HELPER_1(wrs_nto, void, env)
>   DEF_HELPER_1(tlb_flush, void, env)
> +DEF_HELPER_2(tlb_flush_page, void, env, tl)
>   DEF_HELPER_1(tlb_flush_all, void, env)
>   DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
>   /* Native Debug */
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index 8039df2b48..723a45d181 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -610,6 +610,13 @@ void helper_tlb_flush(CPURISCVState *env)
>       }
>   }
>   
> +void helper_tlb_flush_page(CPURISCVState *env, target_ulong addr)
> +{
> +    if (sfence_vma_allowed(env, GETPC())) {
> +        tlb_flush_page(env_cpu(env), addr);
> +    }
> +}
> +

Following my suggestion in patch 1 this would turn into something like:


void helper_tlb_flush_page(CPURISCVState *env, target_ulong addr)
{
     check_sfence_vma(env, GETPC());
     tlb_flush_page(env_cpu(env), addr);
}


Thanks,
Daniel


>   void helper_tlb_flush_all(CPURISCVState *env)
>   {
>       CPUState *cs = env_cpu(env);
> 


