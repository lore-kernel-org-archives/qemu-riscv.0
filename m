Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E620C5DF86
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 16:56:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx5yv-0004Wy-Et; Thu, 20 Aug 2026 12:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx5yi-0004I2-37
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 12:50:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx5yg-0005VM-62
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 12:50:55 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KG6ppY3415087
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 16:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H64/1nUw/7lLCPh0dZyI8ywBjU05RRXPc4Wjk2rvsDE=; b=PPSwovRks9nHl+Oy
 +S+kf16dQZXayBATpnmwAyglXyeRPQ9cFSdH2E2DgmVKDL2S5kUqtePvmYJMcJea
 XVq66n0Gq59ZXp8EhLm6hO7mb5YTqpZuIdznGxe/bqGTZEEazi3Qe3cXqSR0NCeX
 xFZdjV5F/gLXXaGvkRkfUUSOwJY4LUV23kXn+XVGChQX5OiTq4QWctfoN0eoxadk
 DPSt0Nc5K9ggLbFP8WZYYCDFaG+u2Hsy0Y+0hCy3I97r1EEBiej9/h9wdRBPw73W
 kDuZ9yZU2vOfw+GztF5qkym36MQ2+xfWaoYewu50YJfiD1HIPwpKuMCkjJ5JerUK
 b8m6JA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7thjv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 16:50:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e695a3b28so133134885a.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787244651; x=1787849451; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H64/1nUw/7lLCPh0dZyI8ywBjU05RRXPc4Wjk2rvsDE=;
 b=h9bSyTf487yLmqKLh+IlkzC9hVq0HjeuU00XnZVF9utmkr08ULog34YUlWdyY45gTc
 yiDz5QID7NJl6dHsNu85OXul8FIEi6a4k0P1MJUyNS5dydi1eTnSyRwiix1Ta7paNUV/
 4Br6Il20/7AaK+bHO5nNkk8sUxIaxFc57JBeqiMVPtU01iGnVGA19rVgCPzLoejdd0rS
 IWwBURkHEmL42mZ9X4HtJktmUCawpfpyNz6LFcVpB1QvdOlLGgrKaDbvrUscRS/mJvmY
 nNzdLoWdeWLWk3THmI/lqRr3Be1gC0wYxNfxnE/6EuJH/L14LSScN8gjvdOqBzc4Eu9M
 ir/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787244651; x=1787849451;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H64/1nUw/7lLCPh0dZyI8ywBjU05RRXPc4Wjk2rvsDE=;
 b=DNfPc0dlludSeJwMmvEuAAYmyIEWyyw8gJiM37ve+nsrKcGOMU3u2lOgIejXLZF2di
 cvthyB8PlPPbnK7ZOPTZOlHuTgj6Hrf1sMRbW8dA8Mw0MOxFH2PXtaigViaDI3vOiX9c
 fNRIdVOFBDDFuw6UfzhUpJiGGZOc2v7gxFE/zCmwKd+3wNoe86SM7SwaQMQNaO26McIR
 hzZCRcaK24fvFYpACp7H1hGcVYar2mdwYqWH4PuBVIl7GiTOiB4MQ4q5XOcMTe1ZJAkm
 689lwGy2vli1Gd7yM5NdH7+HNXpHwmWi9nB9pFcQO4Mc2kXqyYwsaLZot6fjxA2lFXdM
 +tbQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5OvFIF/TpSEJ+nG3FNPeEhoo3IReTbAltAkX3Mwd5Sko0wpecgts46gRIddE+eGgvFksF5IReU2xz@nongnu.org
X-Gm-Message-State: AOJu0YxIDWTTg7QnQpyuNzd4NmL7lrTmvAkaMv50ufNVG+5NaNSIWR7Q
 iQvJhqKIKKjxR4Fu/h1DBBbD6tep8jOun1rC0Rl6QjRfnCtu6K10KcBlW+ROHX89JGe2xgCicoO
 w3z9+a1zkCF0eyP7bgzPunJht0oodnwGLXTZ+3gFMx+OU5l99zE7y2UTHLQ==
X-Gm-Gg: AR+sD12YKahR66U2KlY1n0zf2zUSOIdgSUP2aDOFJCiwjXj8x/fz4hx1HFMSbrG55HB
 dAS0g2UxRVPrc+s5Oid/WTBZYI2zVLUsFlQy07aUAvrptkLPAO1N18J0ETzlnQLYFfkA1Oq/I8c
 v6ZiEel6c8Ei54KUtKC8AOa88H/vZ9CKeQg0Jn2bSv1DqAJ4v09wl4hXfL8uuARmoSsHJgZwUcV
 /+h2UMe90hRWyKNVfzKEaYk4Vyei+2i3rg1PPxUBVKelUNEOYhC8NRFhQwIbkTDv6vU/kyYHvm5
 ohjspovMRqFze83xTarMOhk+3V8IdrHtLQOHHwrwzl/AUEJIbHfRYhUHM/B3IvcxHCJpG730YnS
 bS8lGPsePuLKZvU9Od1nNBp0=
X-Received: by 2002:a05:620a:3194:b0:936:e374:9ea with SMTP id
 af79cd13be357-9372849f778mr785726685a.14.1787244651440; 
 Thu, 20 Aug 2026 09:50:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3194:b0:936:e374:9ea with SMTP id
 af79cd13be357-9372849f778mr785719685a.14.1787244650832; 
 Thu, 20 Aug 2026 09:50:50 -0700 (PDT)
Received: from [10.111.143.150] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm134318275e9.3.2026.08.20.09.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 09:50:50 -0700 (PDT)
Message-ID: <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
 <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
 <854739cc-1275-4324-aaea-576f0a504172@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <854739cc-1275-4324-aaea-576f0a504172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEyNyBTYWx0ZWRfX8nUpiTjSHirh
 hAliRiNBeWVvLY3RwCdZc3T+IhfHyBa5mT3Womhfu8/p4FV7iFgicNHPIGFLq1MbtMgSgKjGlFr
 2WV09rYqn8XsDsbxNzhsLsWEITKIFHi4Tfa2635r2Q+gjQgFHl9xFpPUNfaYAasz03gGQo8MCdk
 BrKtOBJSJb0ydNdjC5qy3Q0RgxGH4KFl7nd0tPz66v0U+HVUoEzk2CqlKowf01XJs65pWVzuaKk
 5izCBv10mfSpAxdDmSx83DuKf016DTi2KhKRvoBIJQwISzwoVOhSrNyapwYvL5Nd0XDZA0P2sFd
 BI+VsPG2JDxvH6OKVC9uw6m7OFfab61S7FzyiW/9pcOMiAvUI2pHa8SAtCe3fqczqjCSQ7+9hWL
 QcPsIHf5EtFDxfuRBoACEO1DFfGv/cO4FmXrhiS8Ay+3FkJIWhQUyWIkDD7U2YnW64GfVdU94c/
 UUk5Jw1r6vrLIQlejLg==
X-Proofpoint-ORIG-GUID: L1UqKlnDRkCfwgsQPcmmWGeZbfBOZ9DQ
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a87306c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3SCseZUizC4PB6VshvYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEyNyBTYWx0ZWRfX3KONtVzQ/oHQ
 +0UOezPYD1/ki9zYb6GPQ2vpavAE3KPun6B/0Hgqu+QLn19rX54+ryU+6tAG0Z0acne1ltYHM6w
 9p/EI5Pfncd+1MqQix6SFDi4c0JefMM=
X-Proofpoint-GUID: L1UqKlnDRkCfwgsQPcmmWGeZbfBOZ9DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200127
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

On 2026-08-20 18:24, Philippe Mathieu-Daudé wrote:
> On 2026-08-20 17:21, Richard Henderson wrote:
>> On 8/20/26 03:47, Philippe Mathieu-Daudé wrote:
>>> Introduce const-qualified variants of cpu_env() and
>>> env_archcpu(), to safely access CPU architecture
>>> state when it should not be modified.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>>> ---
>>>   include/exec/cpu-common.h | 11 +++++++++++
>>>   include/hw/core/cpu.h     |  6 ++++++
>>>   2 files changed, 17 insertions(+)
>>>
>>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>>> index 6594f7fa1be..f3a3799f451 100644
>>> --- a/include/exec/cpu-common.h
>>> +++ b/include/exec/cpu-common.h
>>> @@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const 
>>> CPUState *cpu)
>>>   }
>>>   #endif /* CONFIG_TCG */
>>> +/**
>>> + * env_archcpu_const(env)
>>> + * @env: The architecture environment (const).
>>> + *
>>> + * Return the const ArchCPU associated with the environment.
>>> + */
>>> +static inline const ArchCPU *env_archcpu_const(const CPUArchState *env)
>>> +{
>>> +    return (const void *)env - sizeof(CPUState);
>>> +}
>>> +
>>>   /**
>>>    * env_archcpu(env)
>>>    * @env: The architecture environment
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 81af7b9ee1a..59f777f3f15 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -594,6 +594,12 @@ struct CPUState {
>>>   QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
>>>                     sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
>>> +static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
>>> +{
>>> +    /* We validate that CPUArchState follows CPUState in cpu- 
>>> target.c */
>>> +    return (const CPUArchState *)(cpu + 1);
>>> +}
>>> +
>>>   static inline CPUArchState *cpu_env(CPUState *cpu)
>>>   {
>>>       /* We validate that CPUArchState follows CPUState in cpu- 
>>> target.c */
>>
>> I wonder if we can use _Generic to make this automatic, rather than 
>> have to choose between two different function names.
> Eh clever :) This seems to work:
> 
>    #define env_archcpu_(p) _Generic(*(p), \
>                                CPUArchState: (void *)p, \
>                                const CPUArchState: (const void *)p)

Actually simpler and even well readable:

-- >8 --
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1b..d67d008236 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const 
CPUState *cpu)
   *
   * Return the ArchCPU associated with the environment.
   */
-static inline ArchCPU *env_archcpu(CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
-
-/**
- * env_cpu_const(env)
- * @env: The architecture environment
- *
- * Return the CPUState associated with the environment.
- */
-static inline const CPUState *env_cpu_const(const CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
+#define env_archcpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (ArchCPU *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const ArchCPU *)((const void *)env - sizeof(CPUState)))

  /**
   * env_cpu(env)
@@ -107,9 +97,10 @@ static inline const CPUState *env_cpu_const(const 
CPUArchState *env)
   *
   * Return the CPUState associated with the environment.
   */
-static inline CPUState *env_cpu(CPUArchState *env)
-{
-    return (CPUState *)env_cpu_const(env);
-}
+#define env_cpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (CPUState *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const CPUState *)((const void *)env - sizeof(CPUState)))

  #endif /* CPU_COMMON_H */
---

