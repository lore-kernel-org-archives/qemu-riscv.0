Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C238C79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3dMz-00025s-Di; Mon, 07 Sep 2026 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dMx-00025U-Mc
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:42:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dMv-0004fi-6Z
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:42:58 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687H8rnV1050815
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 17:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gV8y0TGvee2XULE2T2HZVTQVSI+o+VN423nDauT2W2w=; b=NGnMkYheldXH/fzr
 Zkfmkn7KXgbZPfpkZL/qDl4ZVY01BwOgdfvG+1qoB3ZZPjZQI7RhxFCp6HTdWl6p
 X3MEO1WZc53bttgpB8BuPRG24G/nX4GfIsnqFoLaqZPINlprReZlTcYkIL5VoIE9
 hdG+fWqTEgzZCgDX6lznf6Bnj2VeQM9hceiAhqUU3ba7Uz8oegZo06BjJkUs74X8
 CtG8pbB3kmbvEcIkR/0I0W7nrOCsPSvGeAUBzwEmcTZZjVc5oNyexpr6jEl9hUjW
 vCAkyc17bLj2VrYJBIofXay/AsJR6O5UArbx3Vk2URwXpa312eb8bYipOV2IvzOI
 LhdGiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqhv0b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 17:42:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91043af01d9so56106356d6.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788802975; x=1789407775; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gV8y0TGvee2XULE2T2HZVTQVSI+o+VN423nDauT2W2w=;
 b=AEEHy921Q8fLOhKHofMZkI5zHbq3D3b2SFZd1B5GA+1RC7lPo7XPrS5sSioy6xsyVC
 yQLkdgAjVqvLYClDh7s938pkfXggYpQJ7ioE0KfMxNYBEtF/F0Jt1KzFoxl5t8JyMg8D
 8NZgRpLgNw6HuiA5V7c7yOLkXgqGKN/nj04AV7RaTs+DsyECwXvyEck5YfPDqRb/rTr0
 +jkzKvYfgcWyWUJsI2P2Fi8MZ0rgnECQgIK8042iKMXcZDNoIkSxjaLy/XbkTIqUUUOq
 gt4mDna7vQEePsDxYrLWgMrp3u647vVPam8iRb4lMk2k7uwcFsyF/RcnETU2IG3X+kc+
 ouOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788802975; x=1789407775;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gV8y0TGvee2XULE2T2HZVTQVSI+o+VN423nDauT2W2w=;
 b=DK15dr/QmbmOuAForSLNBaVQ4NddbMWWEmbsZ9Hu99xDMgXRMhMHZ8glnc9LXsGKX7
 GFyQsuLxWGnTuT9/2BZt81YwmDHnGuOAaN/zKYLp3/nWQ6tCJNufQXonSZBnbhRvsy9X
 B3jntcrr7L1KDQL/BlItxsGJOKVBtZlUnECiyDebZWlzUG0oOCct+LfMKypbaghYpy78
 W6MFf79/KMgLJ0JQ1A8Euy+8mk+oCRLbc7mkyhDI5megBg48fdvhff5/2FXH3CM2NYM6
 wRxdxNylUqVnyaqwXdMNqsPpe2sdzpKSV8KNG57nQED4lZPvFI4mgQ1GK28WU9jfmIis
 mf9A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwn/tKh7wuBMtnyVxRsq2wQzAjixrr8xZW1Fv4MpFi5ws/TxR6OP2tfN3IPHEgUGvMbwiVi7eF6jirf@nongnu.org
X-Gm-Message-State: AFuF++mIbyTCB50AtWTI6Fjaox2JP19155ivZK/1b+WnN2CI9zHT0JRx
 aMYKEvnqYduIcdxkEjeq7D3SphdLByipmnrzDQzY0Iv1eJu5uTrumT1D1A/NkjAjJdXgXfmX33X
 tKW/WpGRG+U9qfhhHnGNf8SADFTZmD/HXre3REDM1xlU5WLY5Q69HkSMKpg==
X-Gm-Gg: AYBFou3VJvnBsNQdC/WQmuE9hEFB0jqz3pVOCaGiuixAt22fF6nY24PizzSPvOtk7fN
 kHODbzsl7mVl6eD4G5fk48YfFDFvpfVvSWWlzSs+y/iOvWXNsqccskZJt8tf0P2BL6ZmX0kk3Sp
 iKSgqYMMPY61/6dqSUI45/sA7EB0Y+YRKuS4a42i204KZ+uN/qIIbv8Su5ADrADJGzHRlhXhox/
 dBEh9dOR/aRlX54Pcuv0JtN4dlTBvSWqBRlFJcnavJH/rc4Dw/QjMt7V9gObV7OpRDroPx/oSZK
 Lwp4d1FVDO/4IeNybsq1dpiFlVIUyyuvw/Mu+4NktHr2W0eY9WhUFdC7hmTic5JlJoOpryDABhd
 EIciTvOUYm6eD06Q7KVHGHiKMxi/TX1VlEvU=
X-Received: by 2002:a05:6214:f25:b0:910:44f2:5ce3 with SMTP id
 6a1803df08f44-91044f25d21mr250680446d6.8.1788802975379; 
 Mon, 07 Sep 2026 10:42:55 -0700 (PDT)
X-Received: by 2002:a05:6214:f25:b0:910:44f2:5ce3 with SMTP id
 6a1803df08f44-91044f25d21mr250679746d6.8.1788802974857; 
 Mon, 07 Sep 2026 10:42:54 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91043b54cd6sm85722896d6.34.2026.09.07.10.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 10:42:54 -0700 (PDT)
Message-ID: <d72d945a-f9ec-42c0-a01c-c7b4d6d6a41a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:42:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/riscv: require read permission for HLVX
 accesses
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260905093749.491-1-wangyang25@otcaix.iscas.ac.cn>
 <20260905093749.491-4-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260905093749.491-4-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfX5pHtYxpIgtKK
 hzv6V06+p/lUqmx+XIkzNlt3xnFEVjBHksZMAXDdSk6mzuMjxKPyViNY85VWrYw5UgI5Vhc8zZA
 ee8vkcHErGDTLvoocRceaeoKh6Ms0EPhGqjF9eITGDvmMSIrH8BPIhWb2X09tdGy8qGrleOR+zp
 axU7hqjRoYuToF3jfUNzHgguhqkFnMhpUOPxXkmGyuZiVl7H2xcVwxMYZTCTxQXJl03nCInJmtH
 ErPZPhyDe8bhnPGppyKceC5rtPwiDwV1ZXqbodh+KgxmfTYWQOdKovCL9FE0eFF/w6SBvPRMRi8
 jePMa9MGNRmQyd6lNwEFlUu827Y7BYbS0BndSYHduxt4TMWYnn5nvlwBKltYZ9t6CIjvgbqMjPg
 AZ6FD5U9TPtRJTANzkjLQoLCN9EygqmNfGQnHQ4oepTuRNlCOld9Zf7ldkEbEqnhuG0QYXfgx+a
 qDx41vA9/OHubmUZ6Ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfXz4VhJZi7hFZz
 GjFK2LQRJ/1ZAyzm/gvBayrZtRcUFN1YBwTM58evEYBVOKp7T1M2gn8GWGrztxiMLsVgaKWn3O5
 mmCc9xmTjefWouR5K9H4bxcTYfbrYu0=
X-Proofpoint-ORIG-GUID: QVtHwW1bVsZ_PWHuDvGWfmSUgTVT4En7
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ef7a0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=p0WdMEafAAAA:8 a=UUCCqBSPgqXJescDracA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: QVtHwW1bVsZ_PWHuDvGWfmSUgTVT4En7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070196
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



On 9/5/2026 6:37 AM, wangyang wrote:
> HLVX address translation uses execute permission, but the final PMP
> check on the supervisor physical address must also require read
> permission. Carry the HLVX operation through the MMU index and include
> PMP_READ in the final check so execute-only pages fault.
> 
> Tested: RV32 system-mode RWX, HLV, and HLVX.WU PMP witness matrix.

Please remove the "witness matrix" part.

We are aware that some Gitlab issues, like 4414 that is being fixed here,
are using the word "witness" quite liberally.  In 4414 alone:

"I triaged the result and independently replayed the fixed witness on
  upstream QEMU 11.1.1."

"OS/kernel version: not applicable to the direct witness."

"Source witness and linker script are attached to this issue."

"Build the attached witness source and linker script into ..."


I'll take a guess that 'witness' is being used as a synonym for 'test case'. I
would expect reading something like "witness matrix" in a Law and Order episode,
not QEMU source.

English isn't my native language, and maybe the use of 'witness' here is valid.
Even then I'll ask to remove any references to it, replacing it with 'test case'
if needed, to keep the source code easier to follow.


ps: the code LGTM. Thanks,

Daniel

> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4414
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---
>   target/riscv/internals.h      |  6 ++++++
>   target/riscv/tcg/cpu_helper.c | 24 ++++++++++++++++--------
>   target/riscv/tcg/op_helper.c  | 11 +++++------
>   3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 5d84e4de96..832c6406bc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -42,6 +42,7 @@
>   #define MMUIdx_M            3
>   #define MMU_2STAGE_BIT      (1 << 2)
>   #define MMU_IDX_SS_WRITE    (1 << 3)
> +#define MMU_IDX_HLVX        (1 << 4)
>   
>   static inline privilege_mode_t mmuidx_priv(int mmu_idx)
>   {
> @@ -62,6 +63,11 @@ static inline bool mmuidx_2stage(int mmu_idx)
>       return mmu_idx & MMU_2STAGE_BIT;
>   }
>   
> +static inline bool mmuidx_hlvx(int mmu_idx)
> +{
> +    return mmu_idx & MMU_IDX_HLVX;
> +}
> +
>   /*
>    * Return the endianness for the current privilege
>    * level, based on the MSTATUS MBE/SBE/UBE bits.
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 07d9222652..ad41de9d06 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -905,6 +905,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>    */
>   static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
>                                       int size, MMUAccessType access_type,
> +                                    pmp_priv_t extra_privs,
>                                       privilege_mode_t mode)
>   {
>       pmp_priv_t pmp_priv;
> @@ -915,7 +916,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
>           return TRANSLATE_SUCCESS;
>       }
>   
> -    pmp_has_privs = pmp_hart_has_privs(env, addr, size, 1 << access_type,
> +    pmp_has_privs = pmp_hart_has_privs(env, addr, size,
> +                                       (1 << access_type) | extra_privs,
>                                          &pmp_priv, mode);
>       if (!pmp_has_privs) {
>           *prot = 0;
> @@ -1177,7 +1179,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           int pmp_prot;
>           int pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
>                                                  sxlen_bytes,
> -                                               MMU_DATA_LOAD, PRV_S);
> +                                               MMU_DATA_LOAD, 0, PRV_S);
>           if (pmp_ret != TRANSLATE_SUCCESS) {
>               return TRANSLATE_PMP_FAIL;
>           }
> @@ -1425,7 +1427,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           }
>   
>           pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
> -                                           sxlen_bytes, MMU_DATA_STORE, PRV_S);
> +                                           sxlen_bytes, MMU_DATA_STORE, 0,
> +                                           PRV_S);
>           if (pmp_ret != TRANSLATE_SUCCESS) {
>               return TRANSLATE_PMP_FAIL;
>           }
> @@ -1711,7 +1714,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   
>               if (ret == TRANSLATE_SUCCESS) {
>                   ret = get_physical_address_pmp(env, &prot_pmp, pa,
> -                                               size, access_type, mode);
> +                                               size, access_type,
> +                                               mmuidx_hlvx(mmu_idx) ?
> +                                               PMP_READ : 0, mode);
>                   tlb_size = pmp_get_tlb_size(env, pa);
>   
>                   qemu_log_mask(CPU_LOG_MMU,
> @@ -1746,7 +1751,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   
>           if (ret == TRANSLATE_SUCCESS) {
>               ret = get_physical_address_pmp(env, &prot_pmp, pa,
> -                                           size, access_type, mode);
> +                                           size, access_type,
> +                                           mmuidx_hlvx(mmu_idx) ?
> +                                           PMP_READ : 0, mode);
>               tlb_size = pmp_get_tlb_size(env, pa);
>   
>               qemu_log_mask(CPU_LOG_MMU,
> @@ -1786,9 +1793,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
>                                wp_access, retaddr);
>   
> -        raise_mmu_exception(env, address, access_type, pmp_pma_violation,
> -                            first_stage_error, two_stage_lookup,
> -                            two_stage_indirect_error);
> +        raise_mmu_exception(env, address,
> +                            mmuidx_hlvx(mmu_idx) ? MMU_DATA_LOAD : access_type,
> +                            pmp_pma_violation, first_stage_error,
> +                            two_stage_lookup, two_stage_indirect_error);
>           cpu_loop_exit_restore(cs, retaddr);
>       }
>   
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index 3e94005d2b..060d97ee9c 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -650,7 +650,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
>       if (!x && mode == PRV_S && get_field(env->vsstatus, MSTATUS_SUM)) {
>           mode = MMUIdx_S_SUM;
>       }
> -    return mode | MMU_2STAGE_BIT;
> +    return mode | MMU_2STAGE_BIT | (x ? MMU_IDX_HLVX : 0);
>   }
>   
>   target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
> @@ -726,11 +726,10 @@ void helper_hyp_hsv_d(CPURISCVState *env, target_ulong addr, target_ulong val)
>   }
>   
>   /*
> - * TODO: These implementations are not quite correct.  They perform the
> - * access using execute permission just fine, but the final PMP check
> - * is supposed to have read permission as well.  Without replicating
> - * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
> - * which would imply that exact check in tlb_fill.
> + * HLVX accesses are translated with execute permission (first stage),
> + * but the final PMP check on the supervisor physical address must
> + * require read permission as well.  The MMU_IDX_HLVX mmu_idx bit set
> + * by check_access_hlsv() makes riscv_cpu_tlb_fill() enforce this.
>    */
>   target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong addr)
>   {


