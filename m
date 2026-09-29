Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C833C9832A
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 05:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBQHJ-0003C9-P7; Tue, 29 Sep 2026 01:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQHG-0003Av-7n
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:21:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBQHD-00018R-7Y
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:21:17 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T47AV82126517
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 05:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W2XZTiCtdp6e3IMexvjR7U5io+YYIZPaQA1t5PJO66g=; b=EEa/9RWOg9LSijHI
 mSaYH/6wPcJO4jK35Sa1D2QlBTS0v/RyWr2wcYEg6mWiYzQA2AtEKMACzEmrJFud
 /msjKrUAkKccu+iWjtZe8ID0YaQbe60wxIuKwP5bCkoToxg5x92+MLMVnpStF3OU
 eX5wBlgEsd8iBTGgSiGxt8BpUXSCMMf9/jRf1OIVZkZUUjPRKG3sLIH5I0Ai9Zfk
 jC/te42ePIfi1qK964Bva38/dNALKfC8LLX5oGUqiAGAs45/fx6p8x2H9X0rSER7
 U8MWEmamHwhG9EoD1VyUimPjUjzCqjWEnF51OlH3nvCCjEEfdds0Icl3gGFChfDq
 3CdzUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn8w70-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 05:21:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93bf4c0af4eso88832685a.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 22:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790659271; x=1791264071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=W2XZTiCtdp6e3IMexvjR7U5io+YYIZPaQA1t5PJO66g=;
 b=XCWcQKotZMfQPAB/lQydpEYEk7OyXJH+QjPlcXPAl5cvWZK6awSoa5xd+MAQW9oPHF
 wj+LeHi/OPClMSxuS1RnZ0bCsXe17q3WSrI9gGzFU2d5qmjMe7VfdZSzXsrWZLz/ufnU
 eKKRFxsBs2fhP4TlgHH0P5hLHR96qVv7WUqQ8keXwiBwqWJDaZNUnd47rpigkvR7LXNM
 3gKTuyW4XKRnkQtRN4kwOyavGTkgIAvIi6SNaYY3Fly7qctyzVXPNWVthQRxA+i5U/Qr
 ZrYDUxceHUyh0W1GxpucWK66rifkHp5FLy8AXblZ4eU2+TVoeh3+rCu0UI3rGwfvq78H
 jtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659271; x=1791264071;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W2XZTiCtdp6e3IMexvjR7U5io+YYIZPaQA1t5PJO66g=;
 b=T7onvlBnqjYLTfLkvOD6Fcvo39G8RvE2RLwX7JkXZmhfr/NiXUZv0ole/Q/+ZPTe5/
 PKUKuPTONgMou1pxgc1BBDEU1VhA8uo3ywyFduCim+3h5SpVrqznVRqw276IvluXJtSA
 gKFNllCVAnqAJsdi9Da5tJdRMyTo+E8f3lC1EVYoZn4xbjeCzum3bG29aFvSHIKFzzvM
 HZUoTGwA1MgiZO5BNCR38BJABYwrrXnfCx2YcJTA/5ItkkOwrMr0Fy073uTjDaTei0vy
 WMd+G1PpG2ZygnATysUodtMKaCg3wLepyWJ3i4MO7u5Ks6vF8Fk0i4eZ2z4fOXD0cg3A
 AzlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBytfYWdDRuHMcDG4zhqK4Ym/KrEGD3FOSWddKm8aLSSgLNh9VTXy/UAEEFCe08oDBbs/3fH1IbYwYtX@nongnu.org
X-Gm-Message-State: AFuF++lf/69JMei5tQeu6ywHNrO6l/PUy41Al5Gzsx7/tzvc0W9nG5HW
 +Li0AiIGVL0SKFE1Re9Zta+Xg16Ml+awgD1SFFLbNS980ncCg7r3FhVpjENoVbClyVwZ6T2JACq
 m3AyHfFvazaYqEY6o7S2erCM5pVhNCkrICpTzJ+ZhfCUZ+nqrb0hnzoa/jw==
X-Gm-Gg: AYBFou1JBL3q2Zk426LDwWwUyeB+uTTA/QaL9afZg3DF2IE6OqGPjTRcGmRdQ/xnWt5
 mf/Cq8uw5aezgmNeDJBwrnghIWNn5jXfuWvAROcI0UltpTISVFcEca+zcJ57VX5hcBkn3k/Yck4
 1DiRLN+D6iwZrTsXK1xPXFja1Fp04zzergX8yzd78PVgoWiAItgUlqPRPtVHB89h9qyFTgNL7JU
 lP+DQGvxY1NRQD7GZAkYTpYWZYmtN+9vIij4VPphuXFP6kPFgjRh7xyFgQYTWvplsL6VANMwy/R
 fGwzhupzZilkHRPwxcLp7osZLv0OINhFj1rauaSgDCKXn8JYJJwRVIMNDq9RfpjexOcZDArfPdD
 lsa7ipoSV5U0uVIXMECxgZB/24ZsG8p1NXw==
X-Received: by 2002:a05:620a:880c:b0:939:a095:e458 with SMTP id
 af79cd13be357-93c8bcd0262mr272689785a.3.1790659271425; 
 Mon, 28 Sep 2026 22:21:11 -0700 (PDT)
X-Received: by 2002:a05:620a:880c:b0:939:a095:e458 with SMTP id
 af79cd13be357-93c8bcd0262mr272684485a.3.1790659270896; 
 Mon, 28 Sep 2026 22:21:10 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50513c7sm969440f8f.16.2026.09.28.22.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 22:21:10 -0700 (PDT)
Message-ID: <2f039184-d0a6-4556-a514-72a39ebfedf0@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/24] target/hppa: convert excp to raise_excp
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-15-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260928052051.251-15-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb4ac8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=OjroqGzRqyjf1ntX9NUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LdQcTW3LWf-ZhkAQzkDidss3F5dRN5wF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX4Cp66+0DSaWQ
 FWeC1rE6aTaFKOksytgeES8T2pg5XaUr821pdhm7wh33mjeeuQXLzBeCP5VvZsZsYDO4hD9NN8q
 yP63D9D39kU7kcnhi0NbllWxQywqUgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMSBTYWx0ZWRfX2oZArSaMedyy
 HfVhttEPc/pqIyXKfmdqY1rWNsgGjzONVm+dvSB7HGILwUFxV37sdzyy0NTRbd9LFdBvuPLjt0j
 guNLR1HsclpsrXbrzKvV0XpostT0odw6bw1zdHD5FS9O4f/uZ9HgeUdA9vQZz+7hy9Zs+/NXppo
 tHzlW4R5Y6T4fnlYikT5Bbdk5Kzvi+LCiq15Usg9LvdeApkQhk/eUNVPVnicjzvFsTvQsa+1QK0
 JAe/Z6XL9vixL9B5KJSHSvoJSSzxppCjhNTBFwcCN3EStxPbpbtShzagdA/tZHMgsaz4ZlvDz74
 /tu6gbzUNKnO4tWwXqo9eLYWFt6d2LnQUrIYXAKzp8XncEnxzpM+zCeRj/ViQBVAInp23m4FaIL
 JmagQ6p9JmqGLIbgXT8Xl73UsFPHcEmtoRruNHGhZn2cW0bnzmSb07mF+hPwqeXYR6yjp6wurOt
 LRkmzkr9VEILuVLtdew==
X-Proofpoint-ORIG-GUID: LdQcTW3LWf-ZhkAQzkDidss3F5dRN5wF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290021
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

On 28/9/26 07:20, Yonggang Luo wrote:
> Drop TCG excp and call raise_excp. Keep C hppa_dynamic_excp and use
> cpu_loop_exit_excp. Route leftover C callers through
> hppa_dynamic_excp instead of helper_excp.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/hppa/helper.h     |  2 --
>   target/hppa/op_helper.c  | 15 ++-------------
>   target/hppa/sys_helper.c |  4 ++--
>   target/hppa/translate.c  |  2 +-
>   4 files changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/target/hppa/helper.h b/target/hppa/helper.h
> index 8369855d78e..5ed39e01e31 100644
> --- a/target/hppa/helper.h
> +++ b/target/hppa/helper.h
> @@ -1,5 +1,3 @@
> -DEF_HELPER_2(excp, noreturn, env, int)
> -
>   DEF_HELPER_FLAGS_3(stby_b, TCG_CALL_NO_WG, void, env, tl, tl)
>   DEF_HELPER_FLAGS_3(stby_b_parallel, TCG_CALL_NO_WG, void, env, tl, tl)
>   DEF_HELPER_FLAGS_3(stby_e, TCG_CALL_NO_WG, void, env, tl, tl)
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 76a8d8a0d34..c4651f0d85a 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -30,20 +30,9 @@
>   #include "user/page-protection.h"
>   #endif
>   
> -G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
> -{
> -    CPUState *cs = env_cpu(env);
> -
> -    cs->exception_index = excp;
> -    cpu_loop_exit(cs);
> -}
> -
>   G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra)
>   {
> -    CPUState *cs = env_cpu(env);
> -
> -    cs->exception_index = excp;
> -    cpu_loop_exit_restore(cs, ra);
> +    cpu_loop_exit_excp(env_cpu(env), excp, ra);

cpu_loop_exit_excp() replacement is one logical change, ...

>   }
>   
>   static void atomic_store_mask32(CPUHPPAState *env, target_ulong addr,
> @@ -341,7 +330,7 @@ target_ulong HELPER(probe)(CPUHPPAState *env, target_ulong addr,
>           if (excp == EXCP_DTLB_MISS) {
>               excp = EXCP_NA_DTLB_MISS;
>           }
> -        helper_excp(env, excp);
> +        hppa_dynamic_excp(env, excp, 0);

... removing helper_excp() and calling hppa_dynamic_excp()
another one. Please split in 2 distinct patches.

>       }
>       return (want & prot) != 0;
>   #endif


