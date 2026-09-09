Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07FC79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 20:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4OVZ-0008LM-8f; Wed, 09 Sep 2026 16:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4OVX-0008Ko-6G
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:02:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4OVV-0005HH-4i
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:02:58 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JI6Uj2363679
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 20:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XfRMQpOLAVE9+T0lTgcOZDux6EKDc6MP1lhQd9tFPAI=; b=OCmpCimeP6l0ATFc
 0U7H1RCfiYstITs5RN4mZQXlxdEtXp7rFZdMFQudh5JfdFZc9bViBZHOkpJFnglE
 ruxqpS7iPIaZ/KRcxAUbm2oRrwcNgs1toDpB9d1uxYnBOFPSe9QRa5hdR3RvPoHl
 mrhMHxfl0TAEVj6iGACISpiVsfU6mS6J8c2nALk7tE4pxeAryUSAUKSt/qOPMOgy
 677rGsoJze08rBsBAYw7OJOqi2NYk8YVhcGCyx8ow8tZWqKtou10Oe2qEI/roh0O
 xqXRwmTzL91O3kL3L44eZoK/gkLQQAYdFZPEM2djcO32iVJsmY6lW7RpM10T/GPg
 kuSw7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydrcjn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 20:02:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93771aa0379so1250858485a.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 13:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788984173; x=1789588973; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XfRMQpOLAVE9+T0lTgcOZDux6EKDc6MP1lhQd9tFPAI=;
 b=jEyBo2aJpATSEuP5xMvZvOeByCHhRgD9aEon1bxM0mabpdyfk7QaBS8P7GgmY5cc20
 ewlzLYxVH8U1ru91Irqi3js8HpY6iQEMPKak1BUMgV9lVHogGp8H9aUlxnypXy7CSEnH
 jwSoIrkuyak+opcMrNtFqJufdauOlpj/JPPBWrwOGCNG2D5cLx5DsUdgYf+wpDnzQKZf
 q5kOBAoFlOjozmzuN7CLhtYAvQSR4iOiWLdgh6XAom7YaXtJ/vIGG56f3VvP9szKom9j
 5qj1j1/cqlpfE6VN708LXTHlwciqnLORAAKFBlHsrca+lirX4HhBF9nNY2akh+9j476C
 BWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788984173; x=1789588973;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XfRMQpOLAVE9+T0lTgcOZDux6EKDc6MP1lhQd9tFPAI=;
 b=Ao7IJziVGFBmEl5mhTrA8xh8ge9xs4mztSyexyQSYHlR/T0kNG6tfZ8+06gKMylMam
 6SF/8lBL4QT91KILqlWDvVOVXGpER0UOtUSMvkOPeGIyFaB0cNyAdnHvtuQebFpYbox1
 KtYFwuAIr0+vEwNVKCMTVNpYQAO9RCGtrWlhZLxBstqPLOqJkD1xVT2C4bas2jQEEr1b
 Dy3vbkx1l7/bL1SLRqMf/7d5o/OxYfO2t5yJg5wWdfxB6v9dp/1cqAqblqhpdoV5J0oS
 /siU9/Rn4kdxQ1OKtIwjDuu5MMTcrF5d4ex6Xr9SZgsuDYmSPV5r+mOsuSQI80SUL6s8
 ZHNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZL0bjZcXGeNTwvuG1sb8cidwCYveRSAIZWqCvm3GZqYoOAuLAuU3TEAVWwFm9XhGDdASt5z+DIpMx@nongnu.org
X-Gm-Message-State: AFuF++lalPe8AW2h9U1syThMQHo7wjhhhz4s2XbCxKbRYuj028ecY7x6
 /VxhVesFM8ZGpbh7C0gC9gn/H0M7E1qy5YONGY6SKGfHUXNYnkrBxiFKhiw3qm4AX58N/dEQse2
 0IQ8HFKKH6ZHke5N2+2EZbElrcyK3FRqvZ4OUgvgu5spCvydAuwoZELVunw==
X-Gm-Gg: AYBFou2S/7AKCOfTtZO6f04U5wKF114jLxB+UbG8SvxuvPYkXpq63FmGYWtIEHSNvAg
 YadlSIPBBDJIhksNjnQ1xH/YdHdBfsqySHaF80MsIxr0cHpdDR45Wy07402lAXmRjdBpwl2ocgN
 aQaNGf0nhZJa+OPSd6E+eUmWtdy44hqWWouW8sF9kvrZocg4ZaLM5XX+E7fIqqLhHT3ocjj5USe
 CGWPWmkyDbLQZpaXMJA4C+EhWaU6o2lBoCDYYUGSGnPD9HxBVveoDy4GNFwiHKINqg8dpLeAY+s
 gtyQPjTmGiAZ8rEUpC96lEivpHod2rRBj+Q2l7sth06t6mvS2+mgr6Pb7Mwa0HuTOAVe9+Fwh2v
 U53mBfkY69nOWLUqycqxhH7dRdYDvTdGgTVI=
X-Received: by 2002:a05:620a:3941:b0:92e:4927:2002 with SMTP id
 af79cd13be357-939d4a8ebb0mr553971285a.39.1788984173314; 
 Wed, 09 Sep 2026 13:02:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3941:b0:92e:4927:2002 with SMTP id
 af79cd13be357-939d4a8ebb0mr553961985a.39.1788984172777; 
 Wed, 09 Sep 2026 13:02:52 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939b0493142sm758134485a.13.2026.09.09.13.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 13:02:52 -0700 (PDT)
Message-ID: <6bbd55ed-90ab-4740-9585-66d9fdb291e8@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:02:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] target/riscv: require read permission for HLVX
 accesses
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260908124755-v3-0-wangyang25@otcaix.iscas.ac.cn>
 <20260908124755-v3-3-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908124755-v3-3-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa1bb6e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=UUCCqBSPgqXJescDracA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WimRLDs2Gllg15nvjMLts1w4Du3C9C1l
X-Proofpoint-ORIG-GUID: WimRLDs2Gllg15nvjMLts1w4Du3C9C1l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIyNCBTYWx0ZWRfXw6jCjeqETfVk
 Rgu4T9Q+Zi9dsRg/ZZ6h+4QmG2I2I6tb88/nBpWFjwnG4cVeNyW3QzN5Es7OOP5lvkIpWB5X4Nz
 xQKwK8cIft/olfqCzy2Bv+nBecXtJJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIyNCBTYWx0ZWRfXwTRUW2WOTNrP
 E1v3oa2s8HayPMzb28O70hfHh2wDpMtmNe2QQVZrTnSkqq+t8fkyAggOZeuOzhmEVh/MOO8VVAh
 TeTTI5pbEEeQGxAiUci2voC1qcI8iZlq5FcAb9O4foLi93YFVlcfQ8Pwh3es5RViY6X20+owcMO
 RJcFbf8dKm+l0DSYqAAkhCkb/ewAnHm/8rSztrFkdmOxRXZRA8aARZ5wS2gvexLxLQE7lBYGUiY
 vKd6vAJ2NuDCiZKXCU0tFUvReaHtqqFfRe3tdfyPzSipnYtgpAW567mJ4O9OKEuMD0Hflg/38GE
 57aJH52p2bKhdCR0D3r6qVFHdo+Km17s3kAldOJWE7WTKHHHcANFcSRexfxTiF2LOcmjmqjT3bh
 7+PdXUI/7UGYHx42UCqbqQF5Whh+ZVadQgVGt2Lp6/5aRKB2qbqP+ThUMhoNxe5WIjtsVqRGUNi
 cc3oiDpBn9dDRKu2WUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090224
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



On 9/8/2026 1:47 AM, wangyang wrote:
> HLVX address translation uses execute permission, but the final PMP
> check on the supervisor physical address must also require read
> permission. Carry the HLVX operation through the MMU index and include
> PMP_READ in the final check so execute-only pages fault.
> 
> Tested: RV32 system-mode RWX, HLV, and HLVX.WU PMP test cases.
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4414
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

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


