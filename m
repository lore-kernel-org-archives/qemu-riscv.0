Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80414C98321
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:40:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xA8yL-0000PM-I4; Fri, 25 Sep 2026 12:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8yJ-0000OB-7j
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:40:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8yG-0002Sv-FG
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:40:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PG0lFp2124484
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 61hXCIdDzY87h0SokloM2NF7s4nIcor0Uucv6xOZd2M=; b=AEZsidrwYE72D+g6
 z/Z1YfKAspZ9Cj+TH2OId4mYeK2eoGc+YIHFh7lvyxvrsK7eGH7WoQXMMVmlj9kR
 xmMB6UmuQJqq6PJItbEgYzX0qFHjlPUyMzbe7cDMkHTvhvYEd1f3fu+n8/1BhwSS
 nEOzvwQnet5keaFoEyCrzCaOhiqw2J+uI+VB8Cw4MrfbmTLj1sBaIuJ4GjtJG/iS
 g8c2ol9oaxAOWXIggW8lqPANDVwviinYRulTzIwDEcEslaQeJjozWwWDsf7ESx8f
 NP508Lva/vt/to1lQI+1rX+i04u073VKIruDZkQtFa1IPjWGjNZOMt+wsikowEf+
 ED8KZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0a91n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9390a2c895bso291351285a.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790354422; x=1790959222; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=61hXCIdDzY87h0SokloM2NF7s4nIcor0Uucv6xOZd2M=;
 b=cIQummMxewjqGNlrZPtPDb47pcFvVkfOCj4MXlozlKQkEF4HM3IXo1Zeiaxh0Sp3Uw
 QE236AGmxCFWIxYvfA4kiHNJjfA78uHaYo4tFR9mT2vnRAWJh1O1weVwVyUPPldqDbgA
 F1NuVrS5eQUvpVbN+QzvNmv+oh879DiVFrDDfDM5P0V4SltRbSDbONBcvcdDPP9d9lNX
 otuJePi2KFm2mbYV4fqwmN5N3vGZCoiblAEYjf6fmKuNc8yhy69sWjvuxf7JYLwNih0S
 YlARSaOBFINAL95s/5FxMOXd7ZSejKe4UdYou+x1IYbsLzoRDj1Byv//XqoGIdxGXXVw
 iXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790354422; x=1790959222;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=61hXCIdDzY87h0SokloM2NF7s4nIcor0Uucv6xOZd2M=;
 b=f0c4TelHd3dMtpGtds5eOaGGxiHzfgehPi29wCOna+rNCNfTCbXSgGyXtdWKLrJk1c
 N+Sb9vznormXdYBhqex67liTt4UEToVugWrBUyEjZ9BipwUX2h1nHsdkWLxigcdIGd57
 ETlMuTo3CXw6qbIj4NZf2ueNFtFNr8xu4lR9NgqkuA0a54/HdJklsjESGOnAb0bQpXdT
 YjaT3c9agNeO084owkpU3jp2XH6WjCvW+ewqpEwsCCNR0cRySr4nIwkhjE2YPxWeqOwU
 DKud1RQ2aY4645vKSEQdfp8DwMRfmn2arazgQ0NcQJpSu6eq9TxXD9g9xo2zoBSr6W4j
 VGQA==
X-Forwarded-Encrypted: i=1;
 AKwUvByoycwvZ21mxs0R1Ol8WoGNvugOq3r5yvcgD2YELnNvB3JVKVL3f9BXagoRE1hn1+BENcDx7SIet4Pb@nongnu.org
X-Gm-Message-State: AFuF++nHknOslk6O8CEz/a4ytd962iTsfO6RwgX4wJ2EJUCvdu3mwjp+
 7jY3yYi4acsbnivVwMA41R0toh7/arXdgBPwosEP+hFP8FJReMYMknjTaVNqgdFwIBgEVkBVIne
 UoeEv3Tv6e3o+LsqTqXC+NaVbLBMArGtjwa5z0OC3HPcO66uxxx2JLxJ+ZA==
X-Gm-Gg: AYBFou2Cfy84yAcuQm21ex+jZZCv6pDRsbsAcaRsUBDdiLJuuaSHSpeMqvwJ1EX5hNC
 3SDSlJ3dlCHIRL4P1MogsQiD6pYQg1jJ8lo2USoaEW/VhXFt62xSz5w8s2nc2o4tTTIkO+CcZXp
 vpH99Gag1FZEcIDg/c8YIbDCBbPyKB/g/5ImZhKYc0kkZ24vQiUVL6fVvQFWcSiMS9W8hE+Oluq
 ZHK6q2AcePIqirxY+eXYiN2wOUqU70cGlBSGO6lfYqIInkxXGLa/dYJmDtbc7ZBqE/GkQJrSSEG
 xPXQVCmXY2e+HpmNJdYl3waYwFUKcltoxeS33nV8U7hdybYDsyPgNqmQPU8HWJim7Ple6M5dA/6
 MhOWm8chaHYYNQnmYovgTn7/QVHiHhB368w==
X-Received: by 2002:a05:620a:700c:b0:92e:bd39:9993 with SMTP id
 af79cd13be357-93c43e0e3ccmr536721985a.31.1790354421802; 
 Fri, 25 Sep 2026 09:40:21 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:92e:bd39:9993 with SMTP id
 af79cd13be357-93c43e0e3ccmr536716785a.31.1790354421246; 
 Fri, 25 Sep 2026 09:40:21 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c527f1a1fsm71776985a.31.2026.09.25.09.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:40:20 -0700 (PDT)
Message-ID: <3da698b9-8b0f-40a9-bc70-87c18363e033@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:40:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] target/riscv: Migrate fixed PMU counter state
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Zephyr Li <fritchleybohrer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260910-riscv-pmu-correctness-v2-0-5da5159a0c64@linux.alibaba.com>
 <20260910-riscv-pmu-correctness-v2-12-5da5159a0c64@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910-riscv-pmu-correctness-v2-12-5da5159a0c64@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfX47bk5wkJnnKI
 CIjSDY5cJPNxET0RBPW9CUT2R1TMDkYqjxNbtVJFDPLrJcMR8zq5fzuQhUC6GSNBj/dknCaJs6a
 mj6LRGD9XH/tijLJZEQq/4ZthqqFEUA=
X-Proofpoint-GUID: NkXDmPDo_C4G6V3OijhYMIsKp3sqlUlx
X-Proofpoint-ORIG-GUID: NkXDmPDo_C4G6V3OijhYMIsKp3sqlUlx
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6a3f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=p0WdMEafAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=wncE4Eqe_XyKzoaJrS0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfX6rdxEUbzlJxQ
 9uPKl13hqVupXgDTi7p1gNTIyv1lKCGQXvz+iGE30R+yy+SnbNVsaLSgHku/LnDHV2Fnd6R8SGz
 enqwUK+BbGtdjEgD543TOOsFQC6TJJ08TjWy3CeujkxA+ROqTn6n9prJHBu5wMUInL4dJdb3Ssi
 zk7r2XNDkSKiLEIUjGfHy21622OYNe9c3PaWaibPUcDhUwcQ+thi3GUaZcy+KcdnbYV92MSCGtV
 MOKrMfL/a7jMr78xCho3346bypPSNk8AafM7bi18oGOdznnkOV9wKJLew+bRX0eDJLQ6pR0yX5/
 5hFg/HRCQ1fbyqfPWop1bkF7ivQaAODhzog467V3V5/QAnsPKzfHuzHWeN0u344MYW0o37hbImj
 Cgd1bhYE35xk0pUIyzDyyikehJUrBi19LlxLm1ygloorPH+VdsgwHtOE4kYVVUG02x7SJHiImY0
 BOFHwUvIR0ePdSnEuSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250066
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



On 9/10/2026 11:39 AM, TANG Tiancheng wrote:
> Migration saves fixed-source baselines but not the per-mode totals they
> refer to, nor mcyclecfg/minstretcfg. TCG can therefore subtract an
> unrelated baseline or apply the wrong privilege filter after loading.
> 
> Before saving, add pending increments allowed by the current filters to
> each enabled fixed-source counter, including HPM cycle/instruction
> counters. The per-mode totals then need not migrate.
> 
> On load, clear those totals and establish destination-local baselines.
> Inhibited counters get a new baseline when enabled; other event counters
> get one when switched to a fixed source. This excludes migration downtime
> and avoids using the source QEMU's saved baselines.
> 
> Rebuild the event map and overflow timer. Recompute interrupt requests
> because pre-save can set LCOFIP after cpu_common saved CPU_INTERRUPT_HARD.
> 
> Keep the existing main-section fields and add cpu/pmu-fixed to carry
> mcyclecfg/minstretcfg and identify values that include pending increments.
> All TCG CPUs send and require it because mcycle/minstret exist even
> without Zicntr, Zihpm or HPM counters. Reject older TCG streams, whose
> counter values cannot be reconstructed reliably. KVM PMU migration is
> unchanged.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4422
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4425
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h     |  1 +
>   target/riscv/machine.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++----
>   target/riscv/tcg/pmu.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>   target/riscv/tcg/pmu.h |  2 ++
>   4 files changed, 163 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a4d33f55c4e5cb6052cea6bee4c0afa46372b5c5..788d5a3ced45b32be05e29eaeb9ea3af0c0ccd6d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -584,6 +584,7 @@ struct ArchCPU {
>       uint64_t pmu_timer_instret_snapshot;
>       bool pmu_timer_stalled;
>       bool pmu_timer_work_pending;
> +    bool pmu_fixed_subsection_present;
>       /* A bitmask of Available programmable counters */
>       uint32_t pmu_avail_ctrs;
>       /* Mapping of events to counters */
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index b0ff2fc7f2ac10fab1f2ff845a953649091e1f43..7aa38b739cfd4d9274fe249eb914411e8a65b91f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -267,6 +267,30 @@ static const VMStateDescription vmstate_kvm_mp_state = {
>   };
>   #endif
>   
> +static int riscv_cpu_pre_load(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    cpu->pmu_fixed_subsection_present = false;
> +#ifdef CONFIG_KVM
> +    return riscv_cpu_kvm_pre_load(opaque);
> +#else
> +    return 0;
> +#endif
> +}
> +
> +static int riscv_cpu_pre_save(void *opaque)
> +{
> +#ifdef CONFIG_TCG
> +    RISCVCPU *cpu = opaque;
> +
> +    if (tcg_enabled()) {
> +        riscv_pmu_prepare_save(&cpu->env);
> +    }
> +#endif
> +    return 0;
> +}
> +
>   static bool debug_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -308,16 +332,25 @@ static const VMStateDescription vmstate_debug = {
>       }
>   };
>   
> -static int riscv_cpu_post_load(void *opaque, int version_id)
> +static bool riscv_cpu_post_load(void *opaque, int version_id, Error **errp)
>   {
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
>   
>       env->xl = cpu_recompute_xl(env);
>   #ifdef CONFIG_TCG
> -    riscv_pmu_rebuild_event_map(env);
> +    if (tcg_enabled()) {
> +        if (!cpu->pmu_fixed_subsection_present) {
> +            error_setg(errp,
> +                       "missing RISC-V fixed-counter PMU migration state");
> +            return false;
> +        }
> +        riscv_pmu_complete_load(env);
> +        /* PMU pre-save can raise an interrupt after cpu_common was saved. */
> +        riscv_cpu_interrupt(env);
> +    }
>   #endif
> -    return 0;
> +    return true;
>   }
>   
>   static bool smstateen_needed(void *opaque)
> @@ -404,6 +437,42 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>       }
>   };
>   
> +static int pmu_fixed_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    /* Let the outer post-load distinguish this format from a legacy stream. */
> +    cpu->pmu_fixed_subsection_present = true;
> +    return 0;
> +}
> +
> +static bool pmu_fixed_needed(void *opaque)
> +{
> +    /*
> +     * KVM keeps PMU state in the kernel, not in the TCG counter model.
> +     * TCG implements mcycle/minstret even without Zicntr, Zihpm or
> +     * programmable counters.
> +     */
> +    return tcg_enabled();
> +}
> +
> +/*
> + * This subsection identifies TCG streams whose fixed-source counter values
> + * include pending deltas. It also carries mcyclecfg and minstretcfg.
> + */
> +static const VMStateDescription vmstate_pmu_fixed = {
> +    .name = "cpu/pmu-fixed",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pmu_fixed_needed,
> +    .post_load = pmu_fixed_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(env.mcyclecfg, RISCVCPU),
> +        VMSTATE_UINT64(env.minstretcfg, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static bool jvt_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -505,10 +574,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
>       .version_id = 12,
>       .minimum_version_id = 12,
> -#ifdef CONFIG_KVM
> -    .pre_load = riscv_cpu_kvm_pre_load,
> -#endif
> -    .post_load = riscv_cpu_post_load,
> +    .pre_load = riscv_cpu_pre_load,
> +    .pre_save = riscv_cpu_pre_save,
> +    .post_load_errp = riscv_cpu_post_load,
>       .fields = (const VMStateField[]) {
>           VMSTATE_UINT64_ARRAY(env.gpr, RISCVCPU, 32),
>           VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -554,6 +622,11 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.mcounteren, RISCVCPU),
>           VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
>           VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
> +        /*
> +         * TCG includes pending fixed-source deltas in mhpmcounter_val
> +         * before saving. After loading, it ignores mhpmcounter_prev and
> +         * rebuilds the baseline from the destination source.
> +         */
>           VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
>                                vmstate_pmu_ctr_state, PMUCTRState),
>           VMSTATE_UINT64_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
> @@ -582,6 +655,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_ctr,
>           &vmstate_sstc,
>           &vmstate_mseccfg,
> +        &vmstate_pmu_fixed,
>           NULL
>       }
>   };
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 6286552a4ebf614df0252f84ddfadbc25d8d2258..df99b572a4c16cb1ac65c2f7cde35c6f8349e681 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -663,6 +663,85 @@ void riscv_pmu_rebuild_timer(CPURISCVState *env)
>       riscv_pmu_rebuild_timer_internal(env, false);
>   }
>   
> +static uint32_t riscv_pmu_fixed_source_counter_mask(CPURISCVState *env)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint32_t mask = COUNTEREN_CY | COUNTEREN_IR;
> +
> +    mask |= riscv_pmu_event_counter_mask(
> +        cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
> +    mask |= riscv_pmu_event_counter_mask(
> +        cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
> +    return mask;
> +}
> +
> +static void riscv_pmu_accumulate_fixed_source_counters(
> +    CPURISCVState *env, const RISCVPMUFixedSnapshot *snapshot)
> +{
> +    uint32_t mask = riscv_pmu_fixed_source_counter_mask(env);
> +
> +    while (mask) {
> +        uint32_t ctr_idx = ctz32(mask);
> +
> +        mask &= ~BIT(ctr_idx);
> +        if (riscv_pmu_fixed_ctr_running(env, ctr_idx)) {
> +            riscv_pmu_accumulate_fixed_delta(env, ctr_idx, snapshot);
> +        }
> +    }
> +}
> +
> +void riscv_pmu_prepare_save(CPURISCVState *env)
> +{
> +    RISCVPMUFixedSnapshot snapshot;
> +
> +    riscv_pmu_take_fixed_snapshot(env, &snapshot);
> +    riscv_pmu_accumulate_fixed_source_counters(env, &snapshot);
> +}
> +
> +static void riscv_pmu_rebase_fixed_source_counters(
> +    CPURISCVState *env, const RISCVPMUFixedSnapshot *snapshot)
> +{
> +    uint32_t mask;
> +
> +    memset(env->pmu_fixed_ctrs, 0, sizeof(env->pmu_fixed_ctrs));
> +    if (env->virt_enabled) {
> +        env->pmu_fixed_ctrs[RISCV_PMU_FIXED_DOMAIN_CYCLE]
> +            .counter_virt_prev[env->priv] = snapshot->cycle;
> +        env->pmu_fixed_ctrs[RISCV_PMU_FIXED_DOMAIN_INSTRET]
> +            .counter_virt_prev[env->priv] = snapshot->instret;
> +    } else {
> +        env->pmu_fixed_ctrs[RISCV_PMU_FIXED_DOMAIN_CYCLE]
> +            .counter_prev[env->priv] = snapshot->cycle;
> +        env->pmu_fixed_ctrs[RISCV_PMU_FIXED_DOMAIN_INSTRET]
> +            .counter_prev[env->priv] = snapshot->instret;
> +    }
> +
> +    mask = riscv_pmu_fixed_source_counter_mask(env);
> +    while (mask) {
> +        uint32_t ctr_idx = ctz32(mask);
> +
> +        mask &= ~BIT(ctr_idx);
> +        if (riscv_pmu_fixed_ctr_enabled(env, ctr_idx)) {
> +            riscv_pmu_set_fixed_baseline(env, ctr_idx, snapshot);
> +        }
> +    }
> +}
> +
> +void riscv_pmu_complete_load(CPURISCVState *env)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    RISCVPMUFixedSnapshot snapshot;
> +
> +    riscv_pmu_rebuild_event_map(env);
> +    riscv_pmu_take_fixed_snapshot(env, &snapshot);
> +    riscv_pmu_rebase_fixed_source_counters(env, &snapshot);
> +
> +    qatomic_set(&cpu->pmu_timer_work_pending, false);
> +    cpu->pmu_timer_stalled = false;
> +    cpu->pmu_timer_instret_snapshot = snapshot.instret;
> +    riscv_pmu_rebuild_timer(env);
> +}
> +
>   static void riscv_pmu_timer_work(CPUState *cs, run_on_cpu_data data)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
> diff --git a/target/riscv/tcg/pmu.h b/target/riscv/tcg/pmu.h
> index d9238ae680f5e67031511db4f9afc2884212c5c2..1cfe6acf55b5468f5c00c4a136ece88981384341 100644
> --- a/target/riscv/tcg/pmu.h
> +++ b/target/riscv/tcg/pmu.h
> @@ -45,6 +45,8 @@ void riscv_pmu_write_counter(CPURISCVState *env, uint32_t ctr_idx,
>   void riscv_pmu_write_inhibit(CPURISCVState *env, uint32_t value);
>   void riscv_pmu_timer_cb(void *priv);
>   void riscv_pmu_rebuild_timer(CPURISCVState *env);
> +void riscv_pmu_prepare_save(CPURISCVState *env);
> +void riscv_pmu_complete_load(CPURISCVState *env);
>   void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
>   void riscv_pmu_rebuild_event_map(CPURISCVState *env);
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
> 


