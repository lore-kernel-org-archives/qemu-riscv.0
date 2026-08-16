Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FA5C5DF66
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:09:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvWrz-0005Bm-CO; Sun, 16 Aug 2026 05:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWrw-0005BC-T0
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:09:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWru-0000ii-IS
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:09:27 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71nnY2347021
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=; b=M4QtkWCu4wf6gOdJ
 MLjfs1jdJ9OdaamDKG8rWRFUVR7pybngVk9zPBwL6Y1L3+pLl2lFsrVtFtkAvhDI
 eNOuRMvthBWFXhpMMzWoeCTgLH541UJWCNu0wLDn+q7UIsOQkaatkuCZ5rlLoU5H
 OfZKQ8QhrNtVN5fXFuQgO3OEnz38+V4/X5TdZ8vvtiEmijhSvLbnlFyz3rUm4Rfj
 4/GfSzzzYF/TL8y9NpM5Z8v4QX+WKt/ea/Nso7OrHL6VyopDnElHT4wVnYbyXW8Z
 gYlJytbeTv9ePNUvISLrDYY47RjJ3+CxemarQ8r3mLhhURuGKyPf0Q0tebKCOy1V
 oaJkhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7u0ak-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:09:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d7b3adda4so24149231cf.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871363; x=1787476163; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=;
 b=QCK0G2o6uKFlCs3L9T2mK8HZB+bql4TJH+HG1+YqJrt97sCntZX0Lv8jdlvEO6+Eek
 RLDNcMHVgRZgudl9TuCx9PjVKyyblmAv0TubYRYCE6mubAI/BGLfrdJ8ELHxGpctjUGL
 B85uxgAIGAzBEBNejQjWt+N4GQ9d3h03nZym5y44FKzOru1vfjjS0WKQ1z2YHIZZ+ImH
 uzv9lK6eD5Q2ip64ZBb20ONFjMrbE5frJVNBWZPTa5qppykmRrfk/JgMbeuaTY3M/uv6
 1Bv6YXmxpTs6DtFY0aRBDwSIX/KMzcr7qj0Uu3aDSngVMI3XK2Tq5JIjS72/F+7kq1A1
 MD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871363; x=1787476163;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lENoUCbKTcsn0o0Qiy2E7a4zjxvHNECXyajxvrquTLQ=;
 b=junppZuzxmJU0JqPbNZX2y2OHFeT65MTaqWucHpTIxyUEpsmIE4vKxLM3VvActy900
 Qh2oU8tWZ6d+f90a+jbtP1mkJIG1qllF/XGdnarViUFVeSoghLUVVVr9KTeS1rjs2inN
 qkNayr4Iv1yFgegozGS+/x2z1DXw6EKXE9Z1bymOXCrF28JLxlduVrsVG0aQKfwww/+K
 eP/DpNjp7bOQdJ/X5MlJ0xHNYnoHfMQPLPeC3K2/25cW1GYJL5gsQzTM5E7l5tcPw3J6
 M98GcNrBkGploKpq1MZqxwDUvnhHPzP9kUll07zvmWHYqCVB0rv3Jlf/URbfySufSip8
 TXmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrFow0LNKGwUG5PTbA3U5eIsy/P94cqibVmJRY+GpBIqAYxn7Dx6arMPGUN2TaU7W+VMGa+hUYpL+BI@nongnu.org
X-Gm-Message-State: AOJu0Yxtm1h/tUrKEIfsPGfTunkPEAPh8XIq/Lz/PHXSrCfrAR1OETAI
 91OpsSurCyw4aQZNQcXxtsiwE57/A4g8z1Lni4eAbqWcaYIwPgfwhow/Gmx2M2qCBHN36UaZinE
 hBxAlzVKDBH1KrVEox32UwJJ7HUj30GHTvEqIaNSGqH6B0bAautKwDQvBdw==
X-Gm-Gg: AR+sD11uyFPN2cGlrl8zANH349YTHLiMmG6v38EuHmQGpCpE++MTYhUFu9bIMZfQqFK
 wcC1vl1CUxo8NFCrPw42WQg22SNPML3DH++Bje6y3dEVQtFITcz1zch8x4Kv1DNelyclggHILlu
 aNJGchrFUptKHVLTCw7AtMvvh4uExYNCu2YmCj/XgwXPUPNIm9KcV8hiIwE8LFfpjqJz10KlGrz
 DCkaV5vVMpA7kVIGRjFeV0nLB4XT0DOCBcama+uLH0q1MQrbcZUUiaxgFfGDRADi4kJ1NBQ92PC
 aEneL7JA823IL46/b2ka+pWMxtnuMdDIbnYKaMXWLs/Pje623rRF4rbW7d2PHicfPoZ0CJLaDH2
 obWKHHRlTt+n52XDV8DavYkzmuOKuPsY5FeI=
X-Received: by 2002:ac8:5cd1:0:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-52d854d682fmr198488551cf.39.1786871363354; 
 Sun, 16 Aug 2026 02:09:23 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:517:87bc:9b47 with SMTP id
 d75a77b69052e-52d854d682fmr198488291cf.39.1786871362991; 
 Sun, 16 Aug 2026 02:09:22 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f20051esm24659460f8f.7.2026.08.16.02.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:09:22 -0700 (PDT)
Message-ID: <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2NyBTYWx0ZWRfXyIZkLw4jcmxn
 Re/3Cvvm5kGX3fv+M6AJFlP4w6vUOMMh9eDzePqGr341oR0GBHqoNviL46lW3XfjlhxhPVA257/
 1UgVjTJcXCViGbJUPtaM/uOXNjGztxa/cN2sLabEq7BB54FxEebriG4uunnEAWr0NQVGVqYSSKS
 hq2N+G/ptr556mjN6ZDAzqBCGJHxhnTug/DguB1sZrjHa4VergrzwJM8VXUynyH5aOd/dnpSSkr
 0FCBCXUdT72JWHhB7lg2hSxYFqirl3Pr5nSe7jUEhEumx36uq1UE6mmHjSv8d3+JQcjz0pCRtaY
 IG1A3OY4q4BVlPmn6FDNWYHjEtd10h/tYNOhmzM1IiIQ19yz51PvXPLvclpB+eZLUaxIrQRnSO/
 iZoJXO+66sospnc8FAB2zgILaTDhEhiilVT6uCaenmC5U3M6Us1YF8eH7g8Po08fThsSA9sOFQ6
 gAHSOlvM+SaV6GPIGyQ==
X-Proofpoint-GUID: ye7836EccUDMIWnaCMjuqAdhTFKiXL7u
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a817e44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JkiptoVkqo8WkY8BhawA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ye7836EccUDMIWnaCMjuqAdhTFKiXL7u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2NyBTYWx0ZWRfX7oJliSzsgiz5
 D5W7aATGmqCp2gs7n6QyLM55P9U4uTyZvujCmD4XzAcbkIHDTgSFJ3+pNeUevFh3NgyFb5TTYi1
 fMenV4Sc4IfibEZZgCqFyjYEhqRgkac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160067
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/probe.h     |  2 +-
>   accel/tcg/cputlb.c            | 17 +++++++++++------
>   target/arm/tcg/helper-a64.c   |  5 ++++-
>   target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>   target/arm/tcg/sve_helper.c   |  5 ++++-
>   target/mips/tcg/ldst_helper.c |  4 ++--
>   6 files changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index 0b788901ba..e3068a79de 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -86,7 +86,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, int size,
>    * This function will return TLB_MMIO in order to force the access
>    * to be handled out-of-line if plugins wish to instrument the access.
>    */
> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,

I prefer this clearer first/last range API, it feels safer.

Missing updating the docstring, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost,
>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);

