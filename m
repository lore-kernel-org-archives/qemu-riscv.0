Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB558C98321
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xA8t5-00079E-Hd; Fri, 25 Sep 2026 12:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8sy-000781-NS
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:34:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA8sx-0001pT-30
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:34:56 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PG3okN801673
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pnkjJ6iJd7jmbHtPLg5O2ybsJ6JSuZtDibMHamcaJ0c=; b=KBe3yFnXFAClZAWN
 r3iYKJVUHF2VJi1B1gus63C0QVQjVQEO6HjL1uXh2C4xpWz8qgMaJa9L4zSzu+Qf
 N/ebOtjbMC/LBPtp8W1nX1YkHz/zWFlUXbugTjj+crJrYZoFlp6XQ2bWq+0864Zi
 aYonsYS+8llRnFxQmB+GKT9WUY357K/wWKKecgTG8farVoQ4MDsF91a7XDCczsk6
 Coia/DC+FiKRixQ76f8SieT5Bbpj0JL+zlcuQxLh1oSb4NxOf/nYAWD8RrWcfFXZ
 93NQ3Cn3/iB1g15LdNllGOaMrlIkPh3cSxKVh38h+1fxvWY0EzqVspz6eGBkuA6l
 ZO/FFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57g4bj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:34:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-530ef845909so22612591cf.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790354093; x=1790958893; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pnkjJ6iJd7jmbHtPLg5O2ybsJ6JSuZtDibMHamcaJ0c=;
 b=kPc35jMbXZ44CGuXLs6aQTyK6IZhaSi0xWgnz2+5y8lXBwK8TtTtI/a4pNzickMsUt
 acavfmV7+beWFRE37Ha0bDwCHaG570+TrMXr1G3wchGxLsxK7oege1S1oFYmjmlvYkaO
 OIRsMOFhpdvmCPSSSYpPOfBs3NJ8p3LNRTFQBhJylNG1hc8AKcklDCBWJsEizD6vfQg8
 K9iLFYhfLjZPg6HU9UdL+dztLWp0ELpfzKst9alrew85F6vZUnpyxvyT36hkTjRVpgKC
 BR/ZxMCuRRP5+QND324fhLMcv/WLSzDz6hqF0w7fi55bTYNadxALH+KPeVABtG/SBhdb
 PYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790354093; x=1790958893;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pnkjJ6iJd7jmbHtPLg5O2ybsJ6JSuZtDibMHamcaJ0c=;
 b=YO0H0R6uDXqmjtg74ao+xgQKY0PS0/As7iS3aQOAdwZsSxpx8dzFaAHomguRYX30HE
 g+okAXmelItp5ECXT+uymsxRlpZYnabkLmzgD5YQf01RuELBU4SzRRw3Rmm46lFvDuIN
 fViKwA7/O8rrephvbaxsKIO064OzLDWQFMzMxb+Gdh6UvFFP/rF/x+Eti5+UCwJzlHU8
 fpIv6nlO6diG1ePCHr+rZTSVgILpcMC95J0mk2khwef9gBX2JZ7zSerhNzCEVnQ/2kLg
 CjlBsYZWwfk9pH7a4wgCI7erXDU9r8JL1EkVPDGVD7/U/H2yjQ5ecq+jrZybNXtJV4bL
 e2TA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6RLCpSRvhjtv9ftLinUnYpzjMWN2Tf3aOAyuuHqV1X5v77RW/FW2u/WnJiQ3VRly3ZJdP/Fw1A4Cf@nongnu.org
X-Gm-Message-State: AFuF++ld4eA86r5lRwVJckP/1vbf7nnlm/DMIQZmx1HjtSaigZ7r+nTl
 PWGKtErTpcygbJ5KOhdLxX2sJ94CGjTqe+T5vXFVAVWCxN8VCWv1/PQa/S2zJVHBTrlXxoCmwTD
 W/BOkV2bPAtFtFuT2TT103zo/JZWKxAfQlwVlfICFC1fs4b8T7akSINgAWA==
X-Gm-Gg: AYBFou2AHcXqSYh7PSOlrhOfLi7aTdavzLUEd30dH1vj5sJngpgpMHNLsP7tqCX9u4q
 +eSbZOxlEvNjR9lPXfiSHn3N24msoyZXVMClIz08dJvINzvYeAj1eKAPyKAFPQbPOxpM4aodpqb
 402GVyfNf4GJ7AQ4XPwZ/adwy+k701d8dAO7XIdWxwCiZZEkVsOpyc89HWyUxJUjLLJ9eAcr2Yv
 zzQehDwmgFnr7qNxsFjLbRcyLuMSjs9Tbt04bad+StQGgNjw/vj5QeB94e4uOLA76ygtY2SRStF
 3nm9Xx7B+UFdU307awciITEyu4KTfnP9hANW3Z2ATIEIOHk/t9/Vb1vDIBTy5b0QguZ8srWUSWk
 Ojpc/Wup/+EUCbWSLA0jj36/+NM/mRTyikQ==
X-Received: by 2002:ac8:5d4e:0:b0:532:c82e:7481 with SMTP id
 d75a77b69052e-5330b6d2c68mr56815671cf.51.1790354092539; 
 Fri, 25 Sep 2026 09:34:52 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:532:c82e:7481 with SMTP id
 d75a77b69052e-5330b6d2c68mr56815081cf.51.1790354092042; 
 Fri, 25 Sep 2026 09:34:52 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5330beb3a81sm18546511cf.5.2026.09.25.09.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:34:51 -0700 (PDT)
Message-ID: <ac765b6b-15bc-4063-972a-33698f1fdb79@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:34:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] target/riscv: Process PMU timer expiry on the
 owner vCPU
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Zephyr Li <fritchleybohrer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260910-riscv-pmu-correctness-v2-0-5da5159a0c64@linux.alibaba.com>
 <20260910-riscv-pmu-correctness-v2-11-5da5159a0c64@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910-riscv-pmu-correctness-v2-11-5da5159a0c64@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfX8mZDbrqaL2bG
 +tXG8wCx6pn4oqDbZqHRL9eCKXMKQg3D4acnTg+F64QPWE8kf1eINOVMrEDoWfDiEdmnY6Vn5JA
 aLkLeZnTzyhj+t5462EBkPvUI6BjtGEMGTZnYEwAl0GTA04p62mZJ1UTUtfUNryeEuoBprj65St
 msciOl6wA0u74n4evtsi/pSgyJFcniCgWoIAEK8c/ofkQlyC/hGdE6WUiGpWuFnswV456+0BNsE
 I07birZObnBJzfl0NeyFM1faYX/tZNA8AIs/4HKfcyVi++X4GVxWy4YLA9kHR+XcyC7SGxXhFh6
 HOb4RWvAefmC9YnaA7Gl60VvIE098t2Rxm37eZd4Rpit5TIybiuljICldbf1o0pKIwtBpWHV56U
 MXDRKjI+xFWd1ScaEn4bSTUjWjMGHlfTjsLTnbEkjWaa2hLpQzpgO3nXuhgNb4msDtCLb0yCY3Q
 vHJwrA/8eBl3FMGMwlA==
X-Proofpoint-GUID: a1Qw74EndM8tPhUw5T-UygcdYRiy2G5S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfX2i2gU1vlKuLx
 3bvstK/so96MjmW9GfEtqXKzHk/+znK4kNoSoE+4cxSXPDwAhzX5pZ+3uYIcBivuz64xhLWs6Z2
 Nn5kZ+/sddi9h2hYjo8xg3Qk7GTLLOs=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6a2ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VsVoKZ9dl8H_e5NpkdEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a1Qw74EndM8tPhUw5T-UygcdYRiy2G5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250066
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



On 9/10/2026 11:39 AM, TANG Tiancheng wrote:
> The PMU timer callback can race MTTCG execution and CSR writes while
> reading the event map and updating counters, OF and MIP.
> 
> Queue counter checks on the owning vCPU. The callback atomically sets
> pmu_timer_work_pending and queues work only if it was previously false.
> The vCPU clears the flag before checking counters and rebuilding the
> timer. Earlier expiries are covered by that check; the first later expiry
> queues another check.

In case a v3 is needed:  s/expiries/expires or even "Earlier expired counters"


Otherwise Alistair can amend it in-tree.

> 
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


>   target/riscv/cpu.h     |  1 +
>   target/riscv/tcg/pmu.c | 18 ++++++++++++++++--
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 17b9929785f668487d2ec851b736d588e025fd91..a4d33f55c4e5cb6052cea6bee4c0afa46372b5c5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -583,6 +583,7 @@ struct ArchCPU {
>       QEMUTimer *pmu_timer;
>       uint64_t pmu_timer_instret_snapshot;
>       bool pmu_timer_stalled;
> +    bool pmu_timer_work_pending;
>       /* A bitmask of Available programmable counters */
>       uint32_t pmu_avail_ctrs;
>       /* Mapping of events to counters */
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 08298010b6d06f5792fa14ff81fe2f7a28c6476f..6286552a4ebf614df0252f84ddfadbc25d8d2258 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -663,15 +663,29 @@ void riscv_pmu_rebuild_timer(CPURISCVState *env)
>       riscv_pmu_rebuild_timer_internal(env, false);
>   }
>   
> +static void riscv_pmu_timer_work(CPUState *cs, run_on_cpu_data data)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    /*
> +     * An expiry before this exchange is covered by the following counter
> +     * check. The first expiry after it sets pmu_timer_work_pending and queues
> +     * another check.
> +     */
> +    qatomic_xchg(&cpu->pmu_timer_work_pending, false);
> +    riscv_pmu_rebuild_timer_internal(&cpu->env, true);
> +}
> +
>   /* Timer callback for instret and cycle counter overflow */
>   void riscv_pmu_timer_cb(void *priv)
>   {
>       RISCVCPU *cpu = priv;
>   
> -    riscv_pmu_rebuild_timer_internal(&cpu->env, true);
> +    if (!qatomic_xchg(&cpu->pmu_timer_work_pending, true)) {
> +        async_run_on_cpu(CPU(cpu), riscv_pmu_timer_work, RUN_ON_CPU_NULL);
> +    }
>   }
>   
> -
>   void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>   {
>       if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_TM | COUNTEREN_IR)) {
> 


