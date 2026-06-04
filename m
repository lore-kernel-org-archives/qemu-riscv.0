Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A817BCD6E6B
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:36:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV6MY-0008Uc-7X; Thu, 04 Jun 2026 07:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6MW-0008Tx-Kc
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:35:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV6MU-00082T-Ga
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 07:35:48 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548AkGc140442
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 11:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Oy3poS7/y02hBUd3t/dHXuYTVBe/+rhy8srBC78zJIg=; b=kKjxzqGtHxpKujQD
 Jzs54CA9+pvNzZxHg+UqGrbaKmv8mBi9IGVxLo0dCa/MjvXHyyCehBDnNrS4DwAw
 SasoNA4JQjoKLvYDuzRsGwPba5SANg70vjobqQKZHEzl88XUOTKO4grwhtlS5RDk
 yGYE9hJ6amS8fLnTU2NC06F68zm+or+6+w+Pjb6RUM3PKt2BJXUDjzZHv4eDmS7o
 0MpwIQOFEx9oam8yhJ8VDho6KiDhXzx5Z4y3Sg1F4FGNTNqgrQC1HhuQNKa8Rqqy
 PYalufEZ+YC5xxyyVHVD/zzEEylTCp/5Z+WECXJhIMOxffVK0IR10xDjAdqRrn7J
 q4QhtQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyena3py-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 11:35:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9639e28bccbso759301241.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780572943; x=1781177743; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oy3poS7/y02hBUd3t/dHXuYTVBe/+rhy8srBC78zJIg=;
 b=JxSm8hs8HjtJb5uqR8qdYh1nv12D0EojZfHnsKCYuNnAa+m9oHXszbEONarLlGp42K
 sfWOVvHs47X6OZMC6Nmo8kB5+doStgXqy/4isfPXIyah5t0vJGJKrRgIA490T1LB/CHS
 KOieRrA+qwp0Z0Gu5MRnubZ5M7fTtTjIUHTpAzoiyWSdw1Tvh29xHuyghNt05QphzeMy
 RNruWmXwWicC0cHn5+HAXtfZFa9wIYu46AlUI2QmfYM/VTQ9SDUFL4yPVfil1RtN2OMi
 sgzR0056y8/sJfWNm/Qtn3RnoGdkKnAKG1yydyt5tJpN+mH/7fFWUk/cl+ydg0kRGJQL
 FdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780572943; x=1781177743;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oy3poS7/y02hBUd3t/dHXuYTVBe/+rhy8srBC78zJIg=;
 b=H+f4sSeJGsL0TcWA0YZT1cndbDNWWuLRelONtTICBY3jeyhmFvwYnp+QyEin+Pt2of
 dHfOE4vRGm6q1VytEr8aVRhWtSy+eM6qI90zSg5ghgDwOA8Du8ae1W33H6VSDVziSEZG
 lY/G6PXKKh1O7jFFzwna0wGqogZupSNIMbUhrhTmizrPK3v1k8UAP4EKJHPrm9DhBOUd
 oC89rPYmXcDm276MnSkkzCAYBK6R52sSSTlucQqUze5ArlQriV5npDRVpAF1S46R8eT4
 Wqu2KZG8LTI9Begp/zoAJKi9Jqie5ktZaHRHtsMICpZf0xSw8vtPw30SmIxwEPQvwPFt
 meyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Dt6hECtd614k5CXkRba8IuvliOdcsI5ranennLjEB3kEr7v2taMlJqiHmmuYQbOX6RLzW699a521g@nongnu.org
X-Gm-Message-State: AOJu0YyMWjcVWij5TKCccC+5sFfzFhgwW89nSxcCg97h9swqAXia9i9K
 2Dj2iiw5DZY5wB9pANZRhXcl0zmwWncqyvZpzU9PE17thp+aY2HCzltkawxFo/K0JYVWEqmuZAK
 PJdvFuD10EhcMSy5r22dtK4zjKxQtBIPvhrh0x3WUDEJxJ0VZ/pOIJx3gMA==
X-Gm-Gg: Acq92OFn7OLir4vXSngpQfKjUxcyNt2XUkTOb3dG/Zq7bxGMPzv78UOy+/Gd5ci4euQ
 Pigc9wtsYoDX5DXqeTn/xR9wqD/fo/jFF0thllooj45SLMl1l9bwO5XtviDaPGJRhY1VR3hmthZ
 ff61kxL5m2TkQ/j++MBeaHZ4mtUZ7dRVTgYHryEQfZ942BwNZyMp06P8RJ5GFL57UZO9dlUjsr4
 cD2gkq6qyNzDUZ6BOvVwbJ1TDbc3+NNzhE2AgYGXPWNrb4HG/CDMZEDwZyU001T6hP1ImR6DCqy
 2OHjpuVw2LWMXQ9lPgyK4z2kSxQyMeYnBWfy86Alz1tFv+JE1GgsjVi5cYKVbwhQCh+DZxZXe/o
 d0sWwsjDgEEru66Hx07g8RXhbobXBfWB8pSbQbSJjjCilMqv2nk2jMvtWrvqnOJoFMMXM
X-Received: by 2002:a05:6102:6b09:b0:636:46ee:2f10 with SMTP id
 ada2fe7eead31-6ec57a842bcmr4294886137.9.1780572943389; 
 Thu, 04 Jun 2026 04:35:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6b09:b0:636:46ee:2f10 with SMTP id
 ada2fe7eead31-6ec57a842bcmr4294875137.9.1780572942868; 
 Thu, 04 Jun 2026 04:35:42 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9641414e1d7sm4208786241.12.2026.06.04.04.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:35:41 -0700 (PDT)
Message-ID: <a96e582e-b0db-4054-90bb-de9ebd5b53d0@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:35:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/25] target/riscv/debug: Fix breakpoint matching
 action
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-12-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-12-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a216310 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=A_bB6noEEDiufqyG5SEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 5jBac1IZMiWCOeRIgOQUdcCh6e1S74GE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMiBTYWx0ZWRfX5+TFC1XFRQf9
 P6Kky3rp2ndmpuz7rId5Mww02TzAsoUpWgQKvoCLWykMH3roZlVr3ATYOJqCMHAVjLiFQwnaPtP
 hXseCvHf30Gkj9K17kn7f0Ok9NCfdSJMpCz1Jf55elN495lpBM9LrrYTNiEd2UiT5Z22UWaYfjX
 zw+O2lAx+UrCu69f0GQq0eZ5OOJn31gWcE+SirLQ3w9OHeAdW+Qf+Kgtf3zIWeQNtuMlH2GOEzb
 mEeePlPg1Lz7F5NQqz4dsDEANjdYR60Ni2FNKHsx45WHWJNtXZns5SIrVxrDmBOBo4HC69fBv2v
 CTN8KErSkNbIDult++9DjQXnQE/2b+v5ltnQV/Uvba9xjbav4+DXq2AO36t3RO9ycl3G2HtTRm0
 0KCDvy1tNsTPJBeKST3QPNhPm8HjFYcdbfnLJq8H8gA6y16aTY41c6Zm7L9Jp5Dcn/TRIDXIcVF
 TIVLabKQ814QPw2fiwQ==
X-Proofpoint-GUID: 5jBac1IZMiWCOeRIgOQUdcCh6e1S74GE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040112
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
> The debug exception callback is too late to find the action for the
> trigger(s) which caused it, and it is actually passing the wrong thing
> to do_trigger_action(), which expects a trigger index but is given
> DBG_ACTION_BP (which will be interpreted as trigger 0 and use the
> action set for that trigger).
> 
> It could be possible to derive the trigger index from the bp/wp address,
> but that is clunky and it is really the action that determines whether
> an exception should be raised, also multiple triggers may perform their
> actions in the same cycle, so it is more consistent to check action
> during the breakpoint matching phase. If a breakpoint exception is to be
> taken then that is signaled at that time.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 35 +++++++++++++++++++++++------------
>   1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 7ae02fe2d2..bd61b7ff02 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -280,7 +280,8 @@ static target_ulong textra_validate(CPURISCVState *env, target_ulong tdata3)
>       return textra;
>   }
>   
> -static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
> +/* Return true if an exception should be raised */
> +static bool do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
>   {
>       trigger_action_t action = get_trigger_action(env, trigger_index);
>   
> @@ -288,8 +289,7 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
>       case DBG_ACTION_NONE:
>           break;
>       case DBG_ACTION_BP:
> -        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> -        break;
> +        return true;
>       case DBG_ACTION_DBG_MODE:
>       case DBG_ACTION_TRACE0:
>       case DBG_ACTION_TRACE1:
> @@ -302,6 +302,7 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
>       default:
>           g_assert_not_reached();
>       }
> +    return false;
>   }
>   
>   /*
> @@ -718,7 +719,9 @@ void helper_itrigger_match(CPURISCVState *env)
>           }
>           itrigger_set_count(env, i, count--);
>           if (!count) {
> -            do_trigger_action(env, i);
> +            if (do_trigger_action(env, i)) {
> +                riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +            }
>           } else {
>               enabled = true;
>           }
> @@ -965,11 +968,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>   
>       if (cs->watchpoint_hit) {
>           if (cs->watchpoint_hit->flags & BP_CPU) {
> -            do_trigger_action(env, DBG_ACTION_BP);
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
>           }
>       } else {
>           if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> -            do_trigger_action(env, DBG_ACTION_BP);
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
>           }
>       }
>   }
> @@ -1006,8 +1009,10 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>                   pc = env->tdata2[i];
>   
>                   if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> -                    env->badaddr = pc;
> -                    return true;
> +                    if (do_trigger_action(env, i)) {
> +                        env->badaddr = pc;
> +                        return true;
> +                    }
>                   }
>                   break;
>               case TRIGGER_TYPE_AD_MATCH6:
> @@ -1015,8 +1020,10 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>                   pc = env->tdata2[i];
>   
>                   if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
> -                    env->badaddr = pc;
> -                    return true;
> +                    if (do_trigger_action(env, i)) {
> +                        env->badaddr = pc;
> +                        return true;
> +                    }
>                   }
>                   break;
>               default:
> @@ -1067,7 +1074,9 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>               }
>   
>               if ((wp->flags & flags) && (wp->vaddr == addr)) {
> -                return true;
> +                if (do_trigger_action(env, i)) {
> +                    return true;
> +                }
>               }
>               break;
>           case TRIGGER_TYPE_AD_MATCH6:
> @@ -1083,7 +1092,9 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>               }
>   
>               if ((wp->flags & flags) && (wp->vaddr == addr)) {
> -                return true;
> +                if (do_trigger_action(env, i)) {
> +                    return true;
> +                }
>               }
>               break;
>           default:


