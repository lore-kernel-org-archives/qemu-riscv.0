Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC028CD6E6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 12:53:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV7Z8-00070n-6J; Thu, 04 Jun 2026 08:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV7Z6-00070Q-Tn
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:52:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV7Z5-0007Q9-8s
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 08:52:52 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65488NSe598093
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RHSax5UFAUyZI+zLD8jSqNO8OzUSv2Jmi21RwZt2Bmw=; b=HCRQXLOO9L0rc74p
 GL/tR75jJ5OQkeU7LKQrW2rxf4Sndh8xspZxHdU4AHHBsRaKYsvlskxZGs4dEGdp
 s4SOSCeIMf9cRv/jYWIx2/1yeI3NTeRsZwaTuf0E2VGrhU2riCkMYPwLHTasvzDW
 SkBoqB0qrqvaMp938HD8c9ZvvESRholzvJqwtsc4EuISI0mWzGUj1OcqgkMOeuDm
 P75Z0CVYQfDsDiuLcWy/kAkjS/Ber2ROMV1xfFVEFANXdjBMvJ1empWyj2XlKio0
 l0d9xhPFoglvmLD0o1K3vEJltEMzlEKKDHg7dF639PpL+WQobfBMbcnHJHqb6rjN
 Rh7a6Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m2d2d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 12:52:49 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7df25ce3000so10730717b3.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780577568; x=1781182368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RHSax5UFAUyZI+zLD8jSqNO8OzUSv2Jmi21RwZt2Bmw=;
 b=JPcP++iCqUdori+aci/pMyCftoetb+bcRnuYx2o9nU/yxr8h+omA5vlZxZuqqIR4Ri
 PmPtRVzeE7O/DdSZqOEosuQCXkfkYxAzEdphBLNhWAKWOY8IllZ+ZVi6JDk2leStsROA
 mPr1U1ts/VQGMWQyQzSAHP8RltOqSGWEbEQpkh1Pob9dDoj1oqIEcZEvRMFfK6LCkZof
 L1o9ya3Co1fi9m8tUiMgiF5F4Sd+7RolziZFBvcaWTCGofvSzXOiMwbQ0sOKAfOY0E8T
 PAIYzgQwMlczsOWns32lfRgpyXwfHg5H4gUbEChaEUCa1uGYTUiCUusocoNIU2pmOYVK
 3MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780577568; x=1781182368;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHSax5UFAUyZI+zLD8jSqNO8OzUSv2Jmi21RwZt2Bmw=;
 b=VI+XQJCn7EyjqA9d1T3Qc3LpsBiSFHpsJVi1LG+x8B/hAQBU7BGXM6UIEOnhYaU2b1
 /oKI4V7HZ9XfR73V56arhE45YlVqySyNUoSgRqxcQ4DZUjLoWcDJo7hF6WkOPuoAxmwM
 TVczrp5clLQpSPy6pOBuI6eEx0XSzewEm0G45LWcb9eeuovrQCq4JJ2QvVTWrtJtVMf5
 +JPx3oRCHjlXmasKRcybGB9I0epwlTK33S/fAS8NmgUE4Os7mQ839RmHlhV85jxlBc7k
 S58goWQmOKHZ/V3GK8cSP2ILW0urbbfTVShyKGQTE3t1eLdSX8s15KvmEIjmXMHeGM8X
 +Y9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9A+s3Gu6CjJkRMbCSD2mq0v5gxebLCfoAugez++Jg+6eNT53jxZKrqC2YAF4MJXTCiwCQ8iYThUzT5@nongnu.org
X-Gm-Message-State: AOJu0Yz+vXjOkdgqml5m40eMRTH4vfnjy6zyzwU51K9eNPZBQwWYiYgL
 7NNqUi0Y1WINRwv2CgRmZ2AMB31EMOgxgtE44pPTgzaWNNBezvwTn2l3yJJLlXN3zS3CK3/604x
 6PZu0BmGY+ZdJVbcXRPhzb91QESn4XvzgqWFkMhhcNEFcjlqphMsMzGcvfQ==
X-Gm-Gg: Acq92OHEizUEeu2ytq2MDsQX32xL8sjZgPLRe61AAWNFrlh4+uBdJf/hQAtJsRFlDQM
 LySQHqPQgOmkIztoysp7QHqG//IBg03vMyl2jyS5WU7ZzVWv4fsLH6nrd3uNsLe8OAxR2nJS+Qh
 qHejqyhHGI5DD3LTy2UskzHm5lRsVtvlTrZ0ASyMg2S9wO9luqSkRV/GlNVeqZ85Sg3wTANb9rq
 ezeWm6tUnBXi7aKSz7kTDEmvUgsqzz1CTs3MO8bKJi/FQ1amCeJAHn8YyQ3dLrmXOeL47wjMHKX
 xVvyZGLmvQ+Sz6prWPA8VmfUf/4ml6/mmG40Hu+B/5nt9zRbeDJ/UXR3ksFF1aCLb2yXvvUs5FB
 h7rmdPEs8IM9cI1BSOytyQ9GyzCAQ1TBILBjcPoC/Rzq7i4SEHE4+SyrPfJ7xjsBO2lDY
X-Received: by 2002:a05:690c:64c1:b0:7d1:dd7b:b71f with SMTP id
 00721157ae682-7ea4987b86cmr76104037b3.29.1780577568407; 
 Thu, 04 Jun 2026 05:52:48 -0700 (PDT)
X-Received: by 2002:a05:690c:64c1:b0:7d1:dd7b:b71f with SMTP id
 00721157ae682-7ea4987b86cmr76103837b3.29.1780577567971; 
 Thu, 04 Jun 2026 05:52:47 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea215825dfsm32973487b3.15.2026.06.04.05.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 05:52:47 -0700 (PDT)
Message-ID: <64de69a4-aedc-42b7-a0ac-e9f8cdc8d63a@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 09:52:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/25] target/riscv/debug: Move debug CPU post_load
 details into debug.c
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-15-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-15-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a217521 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MrAWP6gwjXxYpVIVeN4A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfXweBVP4MkQDyK
 Lylq6B5v+IKOKNa+zTmUmPoAeAKxfuomS0bDoelL597tTlKkYTWAfrVivMfnYtsFXUAof8MzkUB
 ICSt51SSeGlycNJGHXRTHQkfjcIuSR/ypxHCsR25EbUGA1bglF8SoXVTbWusjuJcPMqOwO62/8z
 c3mvokRoncicY9Mt6ySDCCXkWXCXYqczUZuDYaIK+Xg0I3Fa/lrKdW2kIzgsb+z56ilbsWU+lV5
 OP6PoxuRn+DrzwK8E1jinTXMvyOOJ+b7zMhJJPEnxr7zyUcYdiP6tquPNA5jDDE5mtzcyrxtJen
 tgVe66csSYy5UOen9SST6zD1rHCHruC9cy9C/g+vLcBTCLxovi7h096yQ+wmzGA7iqUtbGU4sza
 DB0VcpyGYm260kx5e2D0Xyq4EG4mQotoq9531wChAgH5jGzyHe1n2fUPRZfzFLmQXvRTXFxEMmr
 +0D29bOC/sJ5EmWkjeg==
X-Proofpoint-GUID: -DY4Fbu_ZgMBrAKrevJp4DoAWetE3HdA
X-Proofpoint-ORIG-GUID: -DY4Fbu_ZgMBrAKrevJp4DoAWetE3HdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> No need for machine.c to know internals of how debug.c maintains debug
> state.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c   | 9 ++++++++-
>   target/riscv/debug.h   | 2 +-
>   target/riscv/machine.c | 4 +---
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 973de3b2e2..24161fd46b 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -673,7 +673,7 @@ static bool check_itrigger_priv(CPURISCVState *env, int index)
>       return icount_priv_match(env, index);
>   }
>   
> -bool riscv_itrigger_enabled(CPURISCVState *env)
> +static bool riscv_itrigger_enabled(CPURISCVState *env)
>   {
>       int count;
>   
> @@ -1124,6 +1124,13 @@ void riscv_cpu_debug_change_priv(CPURISCVState *env)
>       }
>   }
>   
> +void riscv_cpu_debug_post_load(CPURISCVState *env)
> +{
> +    if (!icount_enabled()) {
> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
> +    }
> +}
> +
>   void riscv_trigger_reset_hold(CPURISCVState *env)
>   {
>       target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 5a14b7894e..400c023943 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -151,9 +151,9 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>   void riscv_trigger_realize(CPURISCVState *env);
>   void riscv_trigger_reset_hold(CPURISCVState *env);
>   
> -bool riscv_itrigger_enabled(CPURISCVState *env);
>   void riscv_itrigger_update_priv(CPURISCVState *env);
>   
>   void riscv_cpu_debug_change_priv(CPURISCVState *env);
> +void riscv_cpu_debug_post_load(CPURISCVState *env);
>   
>   #endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 34fd73c920..bee1445a31 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -230,9 +230,7 @@ static int debug_post_load(void *opaque, int version_id)
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>   
> -    if (!icount_enabled()) {
> -        env->itrigger_enabled = riscv_itrigger_enabled(env);
> -    }
> +    riscv_cpu_debug_post_load(env);
>   
>       return 0;
>   }


