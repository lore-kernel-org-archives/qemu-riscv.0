Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC6C61DD6
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 20:13:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1UqQ-0007yB-Q3; Tue, 01 Sep 2026 16:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1UqP-0007xZ-Ns
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:12:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1UqN-0000ig-Tu
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:12:33 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681HgOuI3228390
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 20:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pIEA+k/hOpXQzlpwDeNyWilYEm+CWDzp0YKvIQiMSrk=; b=GdpxLV6T2Belj0fQ
 5CSjLTSGFkdIEAvFw2rxs+u8XnnyVQc2bpRSeWLsguJtWuOudvM9OTYGis5GNspA
 xmOrlZ1b79aoCykFWhpBPliy64/cFsBFYORVS6In/CR2NsTh7XlwTCkBflmhrxnF
 JK/v592iKX5Y6Dj/f18Y/muNbwxw/ZCMaad8sp4EmOTPY3tuWhisZNz3LYEIgEqE
 5wMuFADy87+ePdbUAK9IHmNihMhVMILWawnMVnOjXplXqUrNGSkys/w3GHmMJL2C
 WLk5ZB4IFaMHHYnYXSBacA1NhA1oL3IqyI2qjeGMmfoLr7f7OAjWE30nv8LYKidR
 siqEWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm2rx9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 20:12:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934956beec8so77879085a.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788293550; x=1788898350; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pIEA+k/hOpXQzlpwDeNyWilYEm+CWDzp0YKvIQiMSrk=;
 b=Li0MbONMSHRKvtLeus2FT6gMEzg0L3XCK9oeTjVn+1hGIlc0Bgz30guDKtuNX9v+zn
 CjmGnV1WVsRVAK681FKuf6382O9BwSB8jLPlnrzokDYixi8tILN7MLZLSfrNseLdoIju
 0m3slYLtINDyLgOiZdkyY2/jYAsXW0+fgK8LdfQxr7r0XD9+J3tXrdAk8IgoOV1woaId
 gQZ5GJVyPYCi7GLxHMch4M6TBJ6lD5dyy3pS9NG8cYpO4a4EYtJ2bzBpPzIhOsHy77Gh
 YmXkJrLBjwIQBh3uYp21VCMkWcRKPYlfgdhDCCV3l8KIkPx2l3Lw/O+MBFbY/nzlJcYv
 uznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788293550; x=1788898350;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pIEA+k/hOpXQzlpwDeNyWilYEm+CWDzp0YKvIQiMSrk=;
 b=dhfDVTSbznZPffPkd3bOOg/19EVhm9R/x2es1CGuJhkMxM0Y5F/N8IpO4UwbYUH7my
 c8nyQWtrvP0tK19bK3IQw8Kt0pAyN+lgOhhsVEzsKA0ASn7yb+Ha0W1q5PCqJ07+dPri
 u8hUalMAn2xufCp2Nij6eg6k1xrBoW894fQChWYoXVIwE+PpsYB9E4bcOhNjSjDzLkXp
 D54DSltVUjdt1w9mplEGtaH1sHIXjXdk1f9QzmB5SjTSHWKVV/avsHoaalsr6ikFWddW
 Bo+RkeGWAWjYYczK7B/C4AmWd0SU0GAAyyDPER8cWxvb0s1k90NlI0XaK88Wfsq48mOO
 4Mww==
X-Forwarded-Encrypted: i=1;
 AHgh+RrY4gNSy3xUgn7iftywsKWE9Rdob6s1A6gbn0pSHpfgbOZzwDra+t5CBlj3JJR+n2n4x/9t0jYzY/Bh@nongnu.org
X-Gm-Message-State: AFuF++lF5CRejNOO2dF4FY8IylGSgEbYBZhVsOBdqDuEp5tbSUqx1vqs
 XE3xmdil0sCu5xwWjuYCtifpaPvaNqNSlbjo07D2OAAjXjyv4iww4bQNsz9EyCnSUTMFsTrIPuO
 gY+OmDtm88oZ/JdQc+PoAuF6hFIeNFA7/fUXAbXrBVvpP0w5kny0bTUCk2g==
X-Gm-Gg: AR+sD10hvqstLPsbVuy7Hu4l30hufiU/5nMfrfYWxSJGF0mBiw7DnhGIbtfPSqrReNF
 nz/g6g8x2SmktNFUO37tzXx1QO/ws98LsNlb8T8jCo91Qi56T2aDN5WKWYlEmHhskE9bTC7yOQO
 73gcyRd6fhgArf76lbet51vfiLxNVKh++q+L9l7fIKDRzBatmnSvug9Qgmo5Lp5Xmk78lie/0t1
 Ss2wDoF2l26sng7gQ5lWQis3dqTDC2dYB1HZzoux9nE24VEiXJlvmUmUbJHcDZl2GVG1W5QBFF+
 BMOnLd+sTfRQwJFduRe0sZu6MIiKAEYo8thXpHheVOgrfcvNU0RU3WFbpqARDl1/0agguWLt7th
 VMipMz/qCg2Fnj25GD7EMBF/zeUlpy8lAWi2L
X-Received: by 2002:a05:620a:1b92:b0:937:356d:eec with SMTP id
 af79cd13be357-93913816194mr4499881185a.16.1788293549724; 
 Tue, 01 Sep 2026 13:12:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:937:356d:eec with SMTP id
 af79cd13be357-93913816194mr4499875585a.16.1788293549137; 
 Tue, 01 Sep 2026 13:12:29 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f35ac8esm22430485a.24.2026.09.01.13.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 13:12:28 -0700 (PDT)
Message-ID: <ea7a6362-54e6-4ff5-9a03-3f50e4f2ae96@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:12:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv/kvm: Reject migration with a different
 timer frequency
To: Xie Bo <xb@ultrarisc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-stable@nongnu.org
References: <20260831074106.1798671-1-xb@ultrarisc.com>
 <20260831074106.1798671-3-xb@ultrarisc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831074106.1798671-3-xb@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iyRfav8ULEc4OVG09NbucZ6-iAdfNrt7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3NyBTYWx0ZWRfX/R/Epzrwoxuo
 8/DBErQfIonP3SRh6MLc4vK2e+ASSnnq9NsitkfyM05GQGX0lqEAYQxsTWtv3OG2sMcTD0Uwmc7
 vJF4llcqJcHOYHtajsZNr8eHV+Dm+A0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3NyBTYWx0ZWRfXzmJ7SImEpSFl
 GQF7bAg5BfThKsTISgcRGL3c7HxBs8JCbl9PJOMIbpIcvn7JUytnTaxMOTx5iGeVxxHDiYT/H4Z
 puH6njsURi4DJbqTPH5egII69F7Pu8wGpQ2aFZh1agS8s2pyzIahpa2lRH/mFqgDhwOuhHOHnx2
 nciUHV5IBfdDiOsfxtA97ujP5nKVw5BkDU//gDPmtAwixLUbVTKji0v23SkikAMtF5jJSqMbubM
 lVQX9lh5DLLJu+LeKrS4IzqUgk/8bznSSp2tpn5pyQW750w7a19mhJ5LXDcFQ3YagAQskwVZVJQ
 JJgs1UKzpJWNRUdJyeJV4HPdZ5/M0BY4ltfpRw+gnJCZQSIrlVTareXYcgm0yl5VUnUiErRpRqY
 jOCKYo8ORiIj05Jtqh00JbQWc7WJVrqviUr+Udy0y/wOaB8Yv0ntHJl+y8hGHFhYGiSTB0yf2wo
 vj5oAYu2106axkrPXHg==
X-Proofpoint-GUID: iyRfav8ULEc4OVG09NbucZ6-iAdfNrt7
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a9731ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Lx1EvxgrAAAA:8 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=7FCzdUK1WRIJhpUUWwkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=ZFi1QaP_tuf8dODdgmj-:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_05,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010177
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



On 8/31/2026 4:41 AM, Xie Bo wrote:
> The timer frequency check is currently in kvm_riscv_put_regs_timer()
> and guarded by migration_is_running().  That condition is false on the
> incoming side, and the source frequency is not part of the migration
> stream, so migration between hosts with different frequencies completes.
> 
> Add the source frequency to a KVM-only subsection.  Its post_load checks
> the destination frequency before the timer registers are restored and
> rejects a mismatch.  When loading an older stream without the subsection,
> skip the check and retain the old behavior.
> 
> Fixes: 27abe66f31ef ("target/riscv: Add kvm_riscv_get/put_regs_timer")
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> Cc: qemu-stable@nongnu.org
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h           |  1 +
>   target/riscv/kvm/kvm-cpu.c   | 40 +++++++++++++++++++++++-------------
>   target/riscv/kvm/kvm_riscv.h |  1 +
>   target/riscv/machine.c       | 31 ++++++++++++++++++++++++++++
>   4 files changed, 59 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a5ec69c3cc..193f81f00d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -541,6 +541,7 @@ struct CPUArchState {
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +    bool kvm_timer_frequency_loaded;
>   
>       /* KVM multiprocessor state */
>       uint32_t kvm_mp_state;
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c8ccd9124e..1993bd446b 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -45,7 +45,6 @@
>   #include "kvm_riscv.h"
>   #include "sbi_ecall_interface.h"
>   #include "chardev/char-fe.h"
> -#include "migration/misc.h"
>   #include "system/runstate.h"
>   #include "hw/riscv/numa.h"
>   
> @@ -822,9 +821,34 @@ static void kvm_riscv_get_regs_timer(CPUState *cs)
>       env->kvm_timer_dirty = true;
>   }
>   
> +int kvm_riscv_check_timer_frequency(RISCVCPU *cpu)
> +{
> +    CPUState *cs = CPU(cpu);
> +    CPURISCVState *env = &cpu->env;
> +    int ret;
> +    uint64_t frequency;
> +
> +    if (!env->kvm_timer_frequency_loaded) {
> +        return 0;
> +    }
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(frequency), &frequency);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    if (frequency != env->kvm_timer_frequency) {
> +        error_report("KVM timer frequency mismatch: source %" PRIu64
> +                     " Hz, destination %" PRIu64 " Hz",
> +                     env->kvm_timer_frequency, frequency);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
>   static void kvm_riscv_put_regs_timer(CPUState *cs)
>   {
> -    uint64_t reg;
>       CPURISCVState *env = &RISCV_CPU(cs)->env;
>   
>       if (!env->kvm_timer_dirty) {
> @@ -844,18 +868,6 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
>           KVM_RISCV_SET_TIMER(cs, state, env->kvm_timer_state);
>       }
>   
> -    /*
> -     * For now, migration will not work between Hosts with different timer
> -     * frequency. Therefore, we should check whether they are the same here
> -     * during the migration.
> -     */
> -    if (migration_is_running()) {
> -        KVM_RISCV_GET_TIMER(cs, frequency, reg);
> -        if (reg != env->kvm_timer_frequency) {
> -            error_report("Dst Hosts timer frequency != Src Hosts");
> -        }
> -    }
> -
>       env->kvm_timer_dirty = false;
>   }
>   
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index 61eaa12443..0e27ce8bf3 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -29,6 +29,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>   bool kvm_riscv_has_mp_state(void);
> +int kvm_riscv_check_timer_frequency(RISCVCPU *cpu);
>   void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>   uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu);
>   
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 2685338901..14a50f1d33 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -198,6 +198,35 @@ static const VMStateDescription vmstate_rv128 = {
>   };
>   
>   #ifdef CONFIG_KVM
> +static bool kvm_timer_frequency_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +static int kvm_timer_frequency_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    if (!kvm_enabled()) {
> +        return -ENOTSUP;
> +    }
> +
> +    cpu->env.kvm_timer_frequency_loaded = true;
> +    return kvm_riscv_check_timer_frequency(cpu);
> +}
> +
> +static const VMStateDescription vmstate_kvm_timer_frequency = {
> +    .name = "cpu/kvm-timer-frequency",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvm_timer_frequency_needed,
> +    .post_load = kvm_timer_frequency_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_frequency, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static bool kvm_fcsr_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -256,6 +285,7 @@ static int riscv_cpu_kvm_pre_load(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
>   
> +    cpu->env.kvm_timer_frequency_loaded = false;
>       cpu->env.kvm_mp_state_loaded = false;
>       return 0;
>   }
> @@ -592,6 +622,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_rv128,
>   #ifdef CONFIG_KVM
>           &vmstate_kvm_fcsr,
> +        &vmstate_kvm_timer_frequency,
>           &vmstate_kvmtimer,
>           &vmstate_kvm_mp_state,
>   #endif


