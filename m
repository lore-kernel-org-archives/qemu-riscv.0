Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98793C79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 11:44:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3uEb-0001XJ-Tu; Tue, 08 Sep 2026 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3uEZ-0001Wl-Q6
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 07:43:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3uDw-00086H-5h
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 07:43:27 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 688AEF4b2043841
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 11:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hnN/T8WOykzpq8kgmV1otZ2DuIFII8zfh0PSmErxYVQ=; b=bZvtZaJtPZRoGLA6
 4VFfDtwEuUkKzShh8fn+uY24wiRk0kyuhEBkF2CYyIOGWtDYQVabOIoOKwwRnmSj
 QQqMzn6OhjoI/vBhLR8xcB85/994jUDz9p71DnNX4RBTH0DikSQZBGnxPwMgKT+U
 01YhEtK5Uz4SYeWz9WkwBZBRSgNuPPVm3mdPncSJ1yVDv3fE3qBLbR9gzqjkIISu
 mjKnBxsd3K58vK/WvUSty6G8zvjrqcQW7KACz5iSI3zF4nTIytq6xTsP3O50hQPg
 9EUth5yrGgkarlwUL53VyKU+Dc9QswyIDTysyyPqoZeqIWB8JnD9xyzRSyM4Xz7C
 WAGRrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077khyx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 11:42:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92ec3146553so1074697385a.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788867766; x=1789472566; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hnN/T8WOykzpq8kgmV1otZ2DuIFII8zfh0PSmErxYVQ=;
 b=HwAeiutTEdJcWjyPs0NfFEuOETwBUKikAYVd1pqHnU/Rj/3Pjd8v1kRZNNe2eTv5XO
 7sDH/0IVEfxO94iHycy4OKZ0Xh4KbaJwcO/cQ62NK7OT/0Sas2/n6s+CzRX2xpG4jl+A
 ibXTjdlUSE4NkMQQgGgWhZXCV0uFH1WaMddiIG+6ARphmZ8XdZ6oinrJks5Wrj996Teb
 NVvtyEqiXEzJ/wMauMM3F5YrMW+7o2WxTdDDjChVDa3K8Hqy2f6NQqsR8z1mQTMM8a6J
 SdEPhT545BnNNBEjfJtsZPUBakqhAdEIFuQIXeiVlqsaSDic6LyX8AoquQRDQUHL/gh7
 guIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788867766; x=1789472566;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hnN/T8WOykzpq8kgmV1otZ2DuIFII8zfh0PSmErxYVQ=;
 b=R5yyH91OKc2TJj/mXzOca/9oJkZAyMf7WhYyG73rhOqehGrtujMwutlt1N7DorUpHI
 BPbOlPInsX/faV09wRmtPgZJOcbK4zkh6sfQkdeJT/vd4MWqnCB3zc0VLM9CvvJvHE1k
 Bir1X4aNTymeJ2NdPWLctTWC0xNPJ1q7mqcIIrdSYiApWc3vgVhjpoCSftED9IklVUwU
 nvQ/bLD0ocV+WdvVbmaOVYbu5Rf2oOclvmomVPh2X//L3+cjaxA/ISFvqc2gfGlJdX0A
 YyFk4XMRcOjZKlOftvm58ICmSUm6T9GIiAEixQ2L5OE/Er3ZVGFPtWwB6tynlX9q8NKw
 xY4Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByUIjv8XMRhG7sll56OcR12B5vFTwYlHnF2ENKSfvRYV2rRCXGjSgCmA6eVCx0PTp2tSxLYQXGVstIk@nongnu.org
X-Gm-Message-State: AFuF++meCm8qE0FBuSIGtJPn19igwNEU8mtCdb95CpeeIQ50ubm/JrHc
 13VIX1tWPrM+BCdx2c5l7B3KwgA02/t1TeJLOVrd5Jj8ubcYpehk2l0FYrWdWisGYIniCGKFfOb
 Uk8Aja5GvooFiBxOKEbfCGCgH8g22L/LXwNas7WSRdBekPLL6uVh9/mJoaA==
X-Gm-Gg: AYBFou2KReehpkqqVeFBjBaKnPHvNwawnU08NnPblY1/Q1sFcIXQFIXU8gdv4YlX8H+
 lvg4o/TCyhYBCBW92L9f+m6tRzE5d64dm5Vwy1PtTXhhZnTdeNw0JT9b0Jxi9kM8kgTVzjl70Vv
 h/tMukyF4V9ITBmGsHMeYb1cRy9G82lpmnQ4Op/tbl87KsR1IC7DoAdBjk+YZ/DJvDLF5xGUrJg
 DMYYZ5ag12lFk5KkYyObh42iJ2yU/PldR+K7RN7IytdzuIiT9mBYOYUHrcHigC6nK8e80An0aKH
 18bMFZjPd88oiZHKcIv0mGK8qic+2PaIIHHm0dd1qhJbjba+Rag0u0F+KrVUYgb+ipc/AbnfqN4
 MIaY6osN6iLyogXwx0ikeeSH0iVcpMTMhZSAa
X-Received: by 2002:a05:620a:3714:b0:939:b0ef:ee9b with SMTP id
 af79cd13be357-939b0efef45mr980603985a.16.1788867764381; 
 Tue, 08 Sep 2026 04:42:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:939:b0ef:ee9b with SMTP id
 af79cd13be357-939b0efef45mr980596085a.16.1788867763706; 
 Tue, 08 Sep 2026 04:42:43 -0700 (PDT)
Received: from [192.168.15.12] ([177.214.151.199])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9398c498610sm941495685a.43.2026.09.08.04.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 04:42:43 -0700 (PDT)
Message-ID: <1faf1930-247a-4f71-b49a-c45b377d9b35@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:42:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] target/riscv: Support multiple counters per PMU
 event
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Zephyr Li <fritchleybohrer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260907-riscv-pmu-correctness-v1-0-5f1f41458989@linux.alibaba.com>
 <20260907-riscv-pmu-correctness-v1-2-5f1f41458989@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907-riscv-pmu-correctness-v1-2-5f1f41458989@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX2iP1hGJPmHcb
 i4gYM5vrfDZ6pr5CH8BXBjOlcyNrV4mGaD/80nqHx3T2whxJScpZ3habPkAKFURzh80Ra5PM8Qz
 bS5xOBTvLAl6t3nFnjA06qyAAy1aVZB2FLHXKIvdfXvuwiB42XnRZzBFKOeegwLf6aiJ+Gxe02L
 h9fw7QVKtI9/ZiYDIMjDvQifFbQQ0dcJuJAcaD3xpk7/oH5QKNv/wDiTXXmza8aCXNyBw3WdcnA
 vBd7rRuKsQYxRgdRL/JGWR9qK5SwmOhLZ/08HJrkwmrUiJ/Rczqih021kNYCou4lywNasm/s5K4
 25Vr7rZayuvOsY9+eTFM/f4MP/av723qVrtKHP9oizZHf1zT/GX9F0TZrS85VDTO86oqbvgOGeN
 Z6I8fcNncG7fuo0t9rt/USFkzwTRO/yj3IXCfskHes3SX6yQzwez2TR9LWJrb+0WbeN8+eoeC9V
 owzwGFV9015B0ZD/iRw==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9ff4b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=lJrVL2S40hk4Skp227i47g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=pndswYKaZ13dySNfk3wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HMaTqhiDOxM6udCZGEZD1VwNWy2_sN55
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX3dst/+uvNFPS
 +yEHBdJByKjkOVNSIxDnot9M1jrJzsGuzo79FWCFyhtF+qsAnv422uIFSZN4zyaUZjZsI4hUuML
 dndiyxtufMU33+A6nN3OxZ+YgVLlvTo=
X-Proofpoint-GUID: HMaTqhiDOxM6udCZGEZD1VwNWy2_sN55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080125
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 9/6/2026 1:37 PM, TANG Tiancheng wrote:
> The PMU FDT lists multiple eligible counters for each event, but the
> event map stores only one counter per event. A second selector for the
> same event is accepted by the CSR but ignored by the map, so its counter
> does not count or overflow. Changing a selector between nonzero events
> also leaves the old mapping.
> 
> Store a counter mask per event and rebuild the map from mhpmevent CSRs
> after selector writes and migration. Update event delivery, fixed-source
> accounting and overflow handling to cover every mapped counter.
> 
> Test selector replacement and multiple counters selecting instructions
> or DTLB misses.
> 
> Fixes: 14664483457b ("target/riscv: Add sscofpmf extension support")
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/machine.c                |   6 ++
>   target/riscv/tcg/csr.c                |   2 +-
>   target/riscv/tcg/pmu.c                | 182 +++++++++++++++++-----------------
>   target/riscv/tcg/pmu.h                |   3 +-
>   tests/tcg/riscv64/sscofpmf-overflow.S |  80 ++++++++++++++-
>   5 files changed, 176 insertions(+), 97 deletions(-)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index bf203bffcefb32710ed0f2af4d4f4595e122d1d9..b0ff2fc7f2ac10fab1f2ff845a953649091e1f43 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -24,6 +24,9 @@
>   #include "migration/cpu.h"
>   #include "exec/icount.h"
>   #include "target/riscv/tcg/debug.h"
> +#ifdef CONFIG_TCG
> +#include "target/riscv/tcg/pmu.h"
> +#endif
>   #ifdef CONFIG_KVM
>   #include "kvm/kvm_riscv.h"
>   #endif
> @@ -311,6 +314,9 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
>       CPURISCVState *env = &cpu->env;
>   
>       env->xl = cpu_recompute_xl(env);
> +#ifdef CONFIG_TCG
> +    riscv_pmu_rebuild_event_map(env);
> +#endif
>       return 0;
>   }
>   
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 52664a26f5a97a5dc8ff37abf99b4d10927fb120..d15a2d096cb6e13cd123ff9ae82ee7c643c2a961 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1241,7 +1241,7 @@ static void riscv_pmu_write_mhpmevent(CPURISCVState *env,
>       }
>   
>       env->mhpmevent_val[ctr_idx] = value;
> -    riscv_pmu_update_event_map(env, value, ctr_idx);
> +    riscv_pmu_rebuild_event_map(env);
>   
>       if (enabled &&
>           (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 1a4658319b11a9a8a0edef18fc8a5abd0027eb31..f19f417e90e33a94d00007ef132ef4e154175b19 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -49,6 +49,17 @@ static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
>       }
>   }
>   
> +static uint32_t riscv_pmu_event_counter_mask(RISCVCPU *cpu,
> +                                             uint32_t event_idx)
> +{
> +    if (!cpu->pmu_event_ctr_map) {
> +        return 0;
> +    }
> +
> +    return GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                                                GUINT_TO_POINTER(event_idx)));
> +}
> +
>   static bool riscv_pmu_counter_filtered(CPURISCVState *env, uint64_t cfg)
>   {
>       bool virt_on = env->virt_enabled;
> @@ -180,41 +191,41 @@ void riscv_pmu_decr_instret(CPURISCVState *env)
>   
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>   {
> -    uint32_t ctr_idx;
> +    uint32_t ctr_idx, ctr_mask;
>       CPURISCVState *env = &cpu->env;
>       uint64_t max_val = UINT64_MAX;
>       PMUCTRState *counter;
> -    gpointer value;
>   
>       if (!cpu->cfg.pmu_mask) {
>           return 0;
>       }
> -    value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
> -                                GUINT_TO_POINTER(event_idx));
> -    if (!value) {
> -        return -1;
> -    }
>   
> -    ctr_idx = GPOINTER_TO_UINT(value);
> -    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
> +    ctr_mask = riscv_pmu_event_counter_mask(cpu, event_idx);
> +    if (!ctr_mask) {
>           return -1;
>       }
>   
> -    if (riscv_pmu_counter_filtered(env, env->mhpmevent_val[ctr_idx])) {
> -        return 0;
> -    }
> +    while (ctr_mask) {
> +        ctr_idx = ctz32(ctr_mask);
> +        ctr_mask &= ~BIT(ctr_idx);
>   
> -    /* Handle the overflow scenario */
> -    counter = &env->pmu_ctrs[ctr_idx];
> -    if (counter->mhpmcounter_val == max_val) {
> -        counter->mhpmcounter_val = 0;
> -        /* Generate interrupt only if OF bit is clear */
> -        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> -            env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> -            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
> +        if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
> +            riscv_pmu_counter_filtered(env, env->mhpmevent_val[ctr_idx])) {
> +            continue;
> +        }
> +
> +        /* Handle the overflow scenario */
> +        counter = &env->pmu_ctrs[ctr_idx];
> +        if (counter->mhpmcounter_val == max_val) {
> +            counter->mhpmcounter_val = 0;
> +            /* Generate interrupt only if OF bit is clear */
> +            if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> +                env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> +                riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            }
> +        } else {
> +            counter->mhpmcounter_val++;
>           }
> -    } else {
> -        counter->mhpmcounter_val++;
>       }
>   
>       return 0;
> @@ -224,8 +235,7 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>                                           uint32_t target_ctr)
>   {
>       RISCVCPU *cpu;
> -    uint32_t event_idx;
> -    uint32_t ctr_idx;
> +    uint32_t ctr_mask;
>   
>       /* Fixed instret counter */
>       if (target_ctr == 2) {
> @@ -237,21 +247,15 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>           return false;
>       }
>   
> -    event_idx = RISCV_PMU_EVENT_HW_INSTRUCTIONS;
> -    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> -                               GUINT_TO_POINTER(event_idx)));
> -    if (!ctr_idx) {
> -        return false;
> -    }
> -
> -    return target_ctr == ctr_idx ? true : false;
> +    ctr_mask = riscv_pmu_event_counter_mask(cpu,
> +                                            RISCV_PMU_EVENT_HW_INSTRUCTIONS);
> +    return (ctr_mask & BIT(target_ctr)) != 0;
>   }
>   
>   bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
>   {
>       RISCVCPU *cpu;
> -    uint32_t event_idx;
> -    uint32_t ctr_idx;
> +    uint32_t ctr_mask;
>   
>       /* Fixed mcycle counter */
>       if (target_ctr == 0) {
> @@ -263,22 +267,23 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
>           return false;
>       }
>   
> -    event_idx = RISCV_PMU_EVENT_HW_CPU_CYCLES;
> -    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> -                               GUINT_TO_POINTER(event_idx)));
> -
> -    /* Counter zero is not used for event_ctr_map */
> -    if (!ctr_idx) {
> -        return false;
> -    }
> -
> -    return (target_ctr == ctr_idx) ? true : false;
> +    ctr_mask = riscv_pmu_event_counter_mask(cpu,
> +                                            RISCV_PMU_EVENT_HW_CPU_CYCLES);
> +    return (ctr_mask & BIT(target_ctr)) != 0;
>   }
>   
> -static gboolean pmu_remove_event_map(gpointer key, gpointer value,
> -                                     gpointer udata)
> +static bool riscv_pmu_event_supported(uint32_t event_idx)
>   {
> -    return (GPOINTER_TO_UINT(value) == GPOINTER_TO_UINT(udata)) ? true : false;
> +    switch (event_idx) {
> +    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
> +    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
> +    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
> +    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> +    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> +        return true;
> +    default:
> +        return false;
> +    }
>   }
>   
>   static int64_t pmu_icount_ticks_to_ns(int64_t value)
> @@ -294,48 +299,32 @@ static int64_t pmu_icount_ticks_to_ns(int64_t value)
>       return ret;
>   }
>   
> -int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> -                               uint32_t ctr_idx)
> +void riscv_pmu_rebuild_event_map(CPURISCVState *env)
>   {
> -    uint32_t event_idx;
> +    uint32_t ctr_idx, ctr_mask, event_idx;
>       RISCVCPU *cpu = env_archcpu(env);
>   
> -    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
> -        return -1;
> +    if (!cpu->pmu_event_ctr_map) {
> +        return;
>       }
>   
> -    /*
> -     * Expected mhpmevent value is zero for reset case. Remove the current
> -     * mapping.
> -     */
> -    if (!(value & MHPMEVENT_IDX_MASK)) {
> -        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
> -                                    pmu_remove_event_map,
> -                                    GUINT_TO_POINTER(ctr_idx));
> -        return 0;
> -    }
> +    g_hash_table_remove_all(cpu->pmu_event_ctr_map);
> +    for (ctr_idx = 3; ctr_idx < RV_MAX_MHPMCOUNTERS; ctr_idx++) {
> +        if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
> +            continue;
> +        }
>   
> -    event_idx = value & MHPMEVENT_IDX_MASK;
> -    if (g_hash_table_lookup(cpu->pmu_event_ctr_map,
> -                            GUINT_TO_POINTER(event_idx))) {
> -        return 0;
> -    }
> +        event_idx = env->mhpmevent_val[ctr_idx] & MHPMEVENT_IDX_MASK;
> +        if (!event_idx || !riscv_pmu_event_supported(event_idx)) {
> +            continue;
> +        }
>   
> -    switch (event_idx) {
> -    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
> -    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
> -    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
> -    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> -    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> -        break;
> -    default:
> -        /* We don't support any raw events right now */
> -        return -1;
> +        ctr_mask = riscv_pmu_event_counter_mask(cpu, event_idx);
> +        ctr_mask |= BIT(ctr_idx);
> +        g_hash_table_insert(cpu->pmu_event_ctr_map,
> +                            GUINT_TO_POINTER(event_idx),
> +                            GUINT_TO_POINTER(ctr_mask));
>       }
> -    g_hash_table_insert(cpu->pmu_event_ctr_map, GUINT_TO_POINTER(event_idx),
> -                        GUINT_TO_POINTER(ctr_idx));
> -
> -    return 0;
>   }
>   
>   static bool pmu_hpmevent_set_of_if_clear(CPURISCVState *env, uint32_t ctr_idx)
> @@ -348,23 +337,14 @@ static bool pmu_hpmevent_set_of_if_clear(CPURISCVState *env, uint32_t ctr_idx)
>       }
>   }
>   
> -static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> -                                  enum riscv_pmu_event_idx evt_idx)
> +static void pmu_timer_trigger_irq_counter(RISCVCPU *cpu, uint32_t ctr_idx)
>   {
> -    uint32_t ctr_idx;
>       CPURISCVState *env = &cpu->env;
>       PMUCTRState *counter;
>       int64_t irq_trigger_at;
>       uint64_t curr_ctr_val, curr_ctrh_val;
>       uint64_t ctr_val;
>   
> -    if (evt_idx != RISCV_PMU_EVENT_HW_CPU_CYCLES &&
> -        evt_idx != RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
> -        return;
> -    }
> -
> -    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> -                               GUINT_TO_POINTER(evt_idx)));
>       if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
>           return;
>       }
> @@ -408,6 +388,26 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
>       }
>   }
>   
> +static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> +                                  enum riscv_pmu_event_idx evt_idx)
> +{
> +    uint32_t ctr_idx;
> +    uint32_t ctr_mask;
> +
> +    if (evt_idx != RISCV_PMU_EVENT_HW_CPU_CYCLES &&
> +        evt_idx != RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
> +        return;
> +    }
> +
> +    ctr_mask = riscv_pmu_event_counter_mask(cpu, evt_idx);
> +
> +    while (ctr_mask) {
> +        ctr_idx = ctz32(ctr_mask);
> +        ctr_mask &= ~BIT(ctr_idx);
> +        pmu_timer_trigger_irq_counter(cpu, ctr_idx);
> +    }
> +}
> +
>   /* Timer callback for instret and cycle counter overflow */
>   void riscv_pmu_timer_cb(void *priv)
>   {
> diff --git a/target/riscv/tcg/pmu.h b/target/riscv/tcg/pmu.h
> index 2429c01b776693ebb324ed63fee1feb56c821c21..910091690290cac9f77855f479bb9d90b2762efe 100644
> --- a/target/riscv/tcg/pmu.h
> +++ b/target/riscv/tcg/pmu.h
> @@ -28,8 +28,7 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                     uint32_t target_ctr);
>   void riscv_pmu_timer_cb(void *priv);
>   void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
> -int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> -                               uint32_t ctr_idx);
> +void riscv_pmu_rebuild_event_map(CPURISCVState *env);
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
>   void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
>   int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> diff --git a/tests/tcg/riscv64/sscofpmf-overflow.S b/tests/tcg/riscv64/sscofpmf-overflow.S
> index 587c7d3ec430aac984621dfb818f141088be7b23..b91d9dee825f9c9f547785225882b3fc6a87e3da 100644
> --- a/tests/tcg/riscv64/sscofpmf-overflow.S
> +++ b/tests/tcg/riscv64/sscofpmf-overflow.S
> @@ -6,14 +6,18 @@
>   	.text
>   	.global _start
>   _start:
> -	/* Program hpmcounter3 while no event is selected. */
> +	/* Program counters 3 and 4 while no event is selected. */
>   	csrw	0x323, zero		/* mhpmevent3 */
>   	li	t0, -256
>   	csrw	0xb03, t0		/* mhpmcounter3 */
> +	csrw	0x324, zero		/* mhpmevent4 */
> +	li	t0, -512
> +	csrw	0xb04, t0		/* mhpmcounter4 */
>   
> -	/* Start counting retired instructions with overflow enabled. */
> +	/* Count the same event in both counters with overflow enabled. */
>   	li	t0, 2
>   	csrw	0x323, t0
> +	csrw	0x324, t0
>   
>   	/* Cross the 64-bit unsigned overflow boundary. */
>   	.rept	1024
> @@ -26,6 +30,10 @@ _start:
>   	srli	t1, t0, 63
>   	xori	t1, t1, 1
>   	or	t4, t4, t1
> +	csrr	t0, 0x324
> +	srli	t1, t0, 63
> +	xori	t1, t1, 1
> +	or	t4, t4, t1
>   
>   	csrr	t0, mip
>   	li	t1, 1 << 13
> @@ -34,12 +42,68 @@ _start:
>   	xori	t0, t0, 1
>   	or	t4, t4, t0
>   
> -	/* The counter wraps and continues counting after overflow. */
> +	/* Both counters wrap and continue counting after overflow. */
>   	csrr	t0, 0xb03
>   	li	t1, -256
>   	sltu	t0, t0, t1
>   	xori	t0, t0, 1
>   	or	t4, t4, t0
> +	csrr	t0, 0xb04
> +	li	t1, -512
> +	sltu	t0, t0, t1
> +	xori	t0, t0, 1
> +	or	t4, t4, t0
> +
> +	/* After selecting write misses, read misses must not increment HPM3. */
> +	csrw	0x323, zero		/* mhpmevent3 */
> +	csrw	0xb03, zero		/* mhpmcounter3 */
> +	li	t0, 0x10019		/* DTLB read miss */
> +	csrw	0x323, t0
> +	li	t0, 0x1001b		/* DTLB write miss */
> +	csrw	0x323, t0
> +	sfence.vma
> +	lla	t2, stale_probe
> +	lw	t3, 0(t2)
> +	csrr	t0, 0xb03
> +	or	t4, t4, t0
> +
> +	/* Both counters must count a DTLB read miss. */
> +	csrw	0x323, zero		/* mhpmevent3 */
> +	csrw	0x324, zero		/* mhpmevent4 */
> +	csrw	0xb03, zero		/* mhpmcounter3 */
> +	csrw	0xb04, zero		/* mhpmcounter4 */
> +	li	t0, 0x10019		/* DTLB read miss */
> +	csrw	0x323, t0
> +	csrw	0x324, t0
> +	sfence.vma
> +	lla	t2, tlb_probe
> +	lw	t3, 0(t2)
> +	csrr	t0, 0xb03
> +	csrr	t1, 0xb04
> +	sltu	t2, zero, t0
> +	xori	t2, t2, 1
> +	or	t4, t4, t2
> +	sltu	t2, zero, t1
> +	xori	t2, t2, 1
> +	or	t4, t4, t2
> +	xor	t0, t0, t1
> +	sltu	t0, zero, t0
> +	or	t4, t4, t0
> +
> +	/* Disabling HPM3 must leave HPM4 counting the same event. */
> +	csrr	t5, 0xb03
> +	csrr	t6, 0xb04
> +	csrw	0x323, zero		/* mhpmevent3 */
> +	sfence.vma
> +	lla	t2, tlb_probe2
> +	lw	t3, 0(t2)
> +	csrr	t0, 0xb03
> +	xor	t0, t0, t5
> +	or	t4, t4, t0
> +	csrr	t0, 0xb04
> +	sltu	t0, t6, t0
> +	xori	t0, t0, 1
> +	or	t4, t4, t0
>   
>   	lla	a1, semiargs
>   	li	t0, 0x20026		/* ADP_Stopped_ApplicationExit */
> @@ -55,6 +119,16 @@ _start:
>   	j	.
>   
>   	.data
> +	/* Give each DTLB probe a separate page. */
> +	.balign	4096
> +stale_probe:
> +	.word	0
> +	.balign	4096
> +tlb_probe:
> +	.word	0
> +	.balign	4096
> +tlb_probe2:
> +	.word	0
>   	.balign	16
>   semiargs:
>   	.space	16
> 


