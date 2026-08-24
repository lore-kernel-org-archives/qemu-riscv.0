Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81FC5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 12:24:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyThy-0007v6-9D; Mon, 24 Aug 2026 08:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyThx-0007ui-1x
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 08:23:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyThv-0006rO-9s
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 08:23:20 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OBMgUj2864713
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 12:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4EgWiChQaTnV1u8nxSJ7MKjVlvD5Akc7VE4Rw5yM2cs=; b=lkyH3OCdMur3DsX1
 3WRmN9yBP2yl3BXtOsXe+VGog3aDhl1UN1hzk/SJeynTbkszqkZzzImYfqLVyn9g
 2B+vMsv3dCbRXmwSDwrdNwqQgDwkNB0x6r52qu14xgRvEVPvw3MTti8I7KhGkDVE
 uGMK2aqqTIXPm5P3GQX9TuXqe24/55WAYTDnl20i9fYSc7WhaPsfc6N7xttVY6gF
 a24Rl3MtLXTtXhAxvfsIb50w7Y/spAlFr+AD8wgFQSI93iTY1LKyfO+y5ipWGpaj
 ZAq1kDjoa2ACuG+xwq7sghWYQ6mUChg6JJwr+ZSNN8ny6do8X0TvO14/IwxLB1aF
 wYZdWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr2dfj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 12:23:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso65565631cf.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787574198; x=1788178998; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4EgWiChQaTnV1u8nxSJ7MKjVlvD5Akc7VE4Rw5yM2cs=;
 b=eLiHD3DUk6oKT8xC6m/B8MBw5zR1xas7hMvdajeknwB/kKJHVTXxWFpnIY9zemIH6H
 uMaCLZ+ll9efzrvb6ZTGfgY4A8y5NtSljGB7+e8nbvm0dwlTgDeTauoVZp12HTCxEqpw
 KlzTcDXogwHM4T3uCB8MBCH3pNztViSL9F1jzYtAUfkF6toIffLTOI3usN0icEJYVssJ
 sBdEh7LvWql/1UapK7FSB1At6HZ/t0SqsDeGtTC2DpW4XxyyIFyQtKpzEJ/hx/OrLUQF
 vRiFU0HcSUAdteYBEo/Bry00LHb/EKIMca//2VkMQXsh2OVA86Po5Eor5JbJIYzLea95
 GNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787574198; x=1788178998;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4EgWiChQaTnV1u8nxSJ7MKjVlvD5Akc7VE4Rw5yM2cs=;
 b=G2AzBlTGGlKeJ96DXDTWVoN8l4GCkon61AK6NBhebkLwmTvhDvr2YxNSm6UKBez5ap
 jUsSZGLVFNlEdfUOd60Mhyhkobp3t+FPEEbaZ+fpa2DQLJp2rujJ5tmBSEYuC1B0Iff6
 o7dd0+JqSgYv5DU7aYI2SmCq2CeY0AWm6cXobtMaXSUnNptl54KU3NQg58T5peSoRLD+
 SCdCBbijQCvjYZeLfwB5NP4zlvV8dYFrgaMzH+ghvq11jNideVK2WvvjU2vWCeHODF6W
 4p3nW1S5d3WRyvNv9rPEHU70HRyE7H5Nfe5UVQVZG6mwsC09G3xMOZfbQgdY0VqMB8i4
 bzkA==
X-Gm-Message-State: AFuF++mCZEknpqPU1dWx0SpZygbLopOd5ylzsTemLetKI7mjkcuZWH/7
 NoHuv9rhwMY395mRR2p2iLKdw+bvM3AciJVUFD2y5GYYcNflxuDwhXjkTJ1vgvk79nC5mwGxZml
 fFOdGm+p5Pj/1+O1ct8dGCak+edq8DQVUcO9YsF/5XW7C3Twxw4DMtfrGtw==
X-Gm-Gg: AR+sD11qXaXcxm4c03QM+HQAeEtYyMkdLfD5QozTY1lj1oljCvhWmIA/micyUXYIvE/
 +J1RVWoFRUOE1wok5G3ZO821gcUV6PHGlTFYfhij0JleRWvwd52MtVA7HjYBAGRtVvy278uOmHO
 a+g770w4xlirfX/vBS8FpdnYGVK9YLZ43cnPpznAJq3Xp8SjHriINF25eqyxLxdSEG56Wfcp5pM
 W7Ikx4Sy1N2J0GgG33f4KGEriTpFBBxMeO7WQyrOxmcL1CE+R44+Y5Iab2/oWydkZsMSeS6Mg+X
 WbEMOh0htNTM7YANIR5/Zo8189Ql0ZoFrye4SWoCdterdtx8OX+yG/YKA54wdR5YM8V7KbwGQRR
 lWJQQs/QpQDnWUMnZ1M/oPwcc7NVkH3iIHPKC
X-Received: by 2002:a05:622a:3c8:b0:51c:ace:de6a with SMTP id
 d75a77b69052e-52df5696d94mr249664711cf.18.1787574197584; 
 Mon, 24 Aug 2026 05:23:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3c8:b0:51c:ace:de6a with SMTP id
 d75a77b69052e-52df5696d94mr249663901cf.18.1787574196938; 
 Mon, 24 Aug 2026 05:23:16 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a1c2faba20sm12192381fa.20.2026.08.24.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 05:23:15 -0700 (PDT)
Message-ID: <93833a3e-348f-46a1-89bf-fbc1e137b185@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:23:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] target/riscv: Capture Sspesa sample PC and
 counter ID on overflow
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160321.3313698-3-mayuresh.chitale@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260817160321.3313698-3-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfXzovtswX9sNgA
 uIlgnJkqhWQExIh5az25MFbxsW6R7D/wiR6seLwoIOHzFp+sKM740BSAqim74biHjiynfqKjVW/
 drAOqVHTNf3rY5y4q7U6ibutYvobyeSvuVc2FnIWkHuHe8gNWeabnM7CG1rjEHzCwhvoRvgwC55
 LOL8Jilz/bt2/eU27oS+9iQW677sa8Cd7jLqRbXS3Lcb4cH9Qk38nCT5hz9wum42+Wq42KBggc0
 p5mgGAaqqcjWDDvfiYGsNhEyWs2mnZeax6w4gvuv4yQ9wXPViqYD7R8HQqpJi3j6O/8hAzQPNs0
 P8gb6TOKktLv+bHY1Oq4AMT+5R4XiZ06RQLSQVkwa3tTm0aQkPFo0MEP3//ETOzw3YXVjAdnAUy
 p7uadDBNCF1E++FnT9m4wphABBFsGtAYUG946iaz4d+WHFYS35r8bbvUd2agRpx27ZzDAL4gMfH
 LK3KCoS/14YVMt1RK3g==
X-Proofpoint-GUID: SstOWlSrKfsYS0CQaFBtOKWRU3NcvUIl
X-Proofpoint-ORIG-GUID: SstOWlSrKfsYS0CQaFBtOKWRU3NcvUIl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfX7iObL8JoO+QC
 5T2N3Y/LKMbHdCCwlbAzmsVjjPQEMhoWCsQO85D1sAZ2VDMGsdsGNsdIAZQYDDXL5em+wVljw52
 HfIkP73MSGtn2UOVtew6cUoM9WGxxCw=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c37b6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9ezhH3L1faEcu5qmGvwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240104
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



On 8/17/2026 1:03 PM, Mayuresh Chitale wrote:
> On a Zihpm counter overflow and with LCOFIP asserted, record the
> overflowing counter ID in shpmsdata and arm a capture. When the LCOFI is
> actually delivered, the shpmspc register is populated with the address of
> the interrupted instruction.
> Capturing shpmspc at LCOFI delivery (rather than at overflow time)
> ensures the sample PC reflects the correct interrupted instruction.
> 
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h            |  2 ++
>   target/riscv/tcg/cpu_helper.c |  6 ++++++
>   target/riscv/tcg/csr.c        | 25 +++++++++++++++++++++++++
>   target/riscv/tcg/pmu.c        | 27 +++++++++++++++++++++++++++
>   4 files changed, 60 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe56a6afd1..36425c3605 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -473,6 +473,8 @@ struct CPUArchState {
>       /* Sspesa CSRs */
>       target_ulong shpmspc;
>       target_ulong shpmsdata;
> +    /* Capture shpmspc/shpmsdata only on the first overflow */
> +    bool sspesa_capture_pending;
>   
>       /* Sstc CSRs */
>       uint64_t stimecmp;
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 07d9222652..15af3262ed 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -2255,6 +2255,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           sxlen = 16 << riscv_cpu_sxl(env);
>           env->scause = cause | ((target_ulong)async << (sxlen - 1));
>           env->sepc = env->pc;
> +        /* On LCOFI delivery, latch the sample PC to the interrupted PC. */
> +        if (riscv_cpu_cfg(env)->ext_sspesa && env->sspesa_capture_pending) {
> +            if (async && cause == IRQ_PMU_OVF) {
> +                env->shpmspc = env->pc;
> +            }
> +        }
>           env->stval = tval;
>           env->htval = htval;
>           env->htinst = tinst;
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index ea49d28aae..e48c954359 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1228,6 +1228,15 @@ static RISCVException write_minstretcfgh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static bool sspesa_is_captured_ctr(CPURISCVState *env, uint32_t evt_index)
> +{
> +    if (!riscv_cpu_cfg(env)->ext_sspesa || !env->sspesa_capture_pending) {
> +        return false;
> +    }
> +
> +    return (env->shpmsdata & SHPMSDATA_CNTRID) == evt_index;
> +}
> +
>   static RISCVException read_mhpmevent(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {
> @@ -1259,6 +1268,14 @@ static RISCVException write_mhpmevent(CPURISCVState *env, int csrno,
>           mhpmevt_val = val & inh_avail_mask;
>       }
>   
> +    /* Enable the sample capture when OF is cleared for the captured counter. */
> +    if (sspesa_is_captured_ctr(env, evt_index)) {
> +        if ((env->mhpmevent_val[evt_index] & MHPMEVENT_BIT_OF) &&
> +            !(mhpmevt_val & MHPMEVENT_BIT_OF)) {
> +            env->sspesa_capture_pending = false;
> +        }
> +    }
> +
>       env->mhpmevent_val[evt_index] = mhpmevt_val;
>       riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
>   
> @@ -1289,6 +1306,14 @@ static RISCVException write_mhpmeventh(CPURISCVState *env, int csrno,
>       inh_avail_mask |= (riscv_has_ext(env, RVH) &&
>                          riscv_has_ext(env, RVS)) ? MHPMEVENTH_BIT_VSINH : 0;
>   
> +    /* Enable the sample capture when OF is cleared for the captured counter. */
> +    if (sspesa_is_captured_ctr(env, evt_index)) {
> +        if ((env->mhpmevent_val[evt_index] & MHPMEVENT_BIT_OF) &&
> +            !((val & inh_avail_mask) & MHPMEVENTH_BIT_OF)) {
> +            env->sspesa_capture_pending = false;
> +        }
> +    }
> +
>       env->mhpmevent_val[evt_index] = deposit64(env->mhpmevent_val[evt_index],
>                                                 32, 32, val & inh_avail_mask);
>   
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 38ad2737e1..337e255da4 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -147,6 +147,31 @@ void riscv_pmu_update_fixed_ctrs(CPURISCVState *env,
>       riscv_pmu_icount_update_priv(env, newpriv, new_virt);
>   }
>   
> +static void riscv_pmu_sspesa_capture(CPURISCVState *env, uint32_t ctr_idx)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_sspesa) {
> +        return;
> +    }
> +
> +    /*
> +     * Only the first overflow updates the sample CSRs. While a capture is
> +     * pending, keep the lowest counter ID as required by the spec.
> +     */
> +    if (env->sspesa_capture_pending) {
> +        if ((ctr_idx & SHPMSDATA_CNTRID) <
> +            (env->shpmsdata & SHPMSDATA_CNTRID)) {
> +            env->shpmsdata = ctr_idx & SHPMSDATA_CNTRID;
> +        }
> +        return;
> +    }
> +
> +    /* shpmspc is latched later, on LCOFI delivery. */
> +    env->shpmsdata = ctr_idx & SHPMSDATA_CNTRID;
> +    env->sspesa_capture_pending = true;
> +}
> +
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>   {
>       uint32_t ctr_idx;
> @@ -191,6 +216,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>           /* Generate interrupt only if OF bit is clear */
>           if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
>               env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> +            riscv_pmu_sspesa_capture(env, ctr_idx);
>               riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>           }
>       } else {
> @@ -383,6 +409,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
>   
>       if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
>           if (pmu_hpmevent_set_of_if_clear(env, ctr_idx)) {
> +            riscv_pmu_sspesa_capture(env, ctr_idx);
>               riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>           }
>       }


