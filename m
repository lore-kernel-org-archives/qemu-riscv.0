Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6E7C5B572
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:18:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvX0P-0006tn-0q; Sun, 16 Aug 2026 05:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX0N-0006sv-7K
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:18:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX0L-0002IC-6C
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:18:10 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71tDG2412003
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=; b=KGqvvBdB/TS3Fxaq
 +L/0duWBM0FPECxNFpqtk5u6PofIjJ8DJDSemu4urCdJCEY6z/Z5jBpeEJ021cp8
 b7OPh1iWKM4vQqFtMKIZWDNRZ/Z106fgsbxBD6clM0hA71+8MXP1Bwpdzh/Tk/C+
 8Xbq2wOJSwOt5IdO0DmP75yz2e8JVe9PAwaRE9SVV4YbMAW8iWrd4zbQhCvmLGyC
 5JtGcr9jD/ElImBYqx6rHtRKsp3nsgkhn2HO1W1PXJFizBSYvAJhtsHI1Q921B6F
 03iqgaeCYrHrODimAXzkrsqAYLYiO3zVFnPVacvtCO/9wVGZwCYx1yjtdo3iKNrF
 1aNlgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g322q8t0f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:18:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0408254aso50554911cf.0
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871886; x=1787476686; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=;
 b=CSgyAd8aGwNwc2o8/7VMPbhdQh/ryswqjivPcSBjYqtkmN51ZiHOFBXWYsstN6OBNE
 dboCiTidWoX8cbcERUs1RnsHtIxnIIc8WVG5cooQFpRRVmTi30j3eDDC50YGbtbAFWH1
 GeLAYv6GofbAuEFlghk3wPdRhJZ7cfFSYlSfpG+VEsLnUi+GfGAGwt4Wk2kU7OLcvs1Q
 lBSzwfamuEtw0QbHliYcd8ovu4AkLXhu2W3jNkxdJaszAMJUvZC/6alXTbneSznZf6ZG
 LQOVBYKjeCn1UL4u2otZX3wemtS6nO6b68oSZKrxUW+ALtOlZWabPnXhGpRo2B5rB4p9
 Om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871886; x=1787476686;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7RTG1hWtdZCwI55uStqWT0Wn3l+D8+TrqBtstTu3HKM=;
 b=LQdMuRjJyRipuyGRvq/wdkwZePw6tG712BzGuPTT5I6r7DpzbeSJRiRIsTehxfiDGK
 VUfo33Ty2IhOh4Vh7IE0bbKMZoUqY2Kw00tg+yMfZWhCKvVKtBnDQnHBAPMIfYzNM8b7
 WYcF27AejS1ATDqIOeijIrK/oUHKVrDInBSIWF8a4FnT7QH2rzPL4pkMFvJuGhOpos0q
 Cp5C12CYGgLW935rnKiaQcRScoZlBvOLyuvltLMU9wTlxX7HQXuEpRa/hzO4jDEdcqzI
 ITNOMaPNLk4p7czXLvKfx9+J6Sw+3WLjMUoGZKTyBS+ayhzSiMr6K5wsikJ18EObsxYM
 Eqzw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro4wQMpjlY0YpKSj+lFXulFLjnVZXz+09wXY91ffcT1iT/CGGwAZjvmnprvVoQbJvMRPvxtY4yt8Pet@nongnu.org
X-Gm-Message-State: AOJu0YzGGtCELvDvZedNmgPtj52se1HVoSF6cSf4T7ucFIEa4hiMpUKP
 yxcuXXA0c9KgDlSmbgO8y5amnWtjsPoUmKgmntMo7iWskZCmzuM4ydLKpVF4sI40I+BmmEtoDH7
 oHOeNgNSt/GI9M1MvLn4TiscmpzuLllwobGi0zvTv3FoRCJatBZI5YXNKxA==
X-Gm-Gg: AR+sD11uISEDOlF7PepFGHWnzcByhSAOetcdZPYzWUYA8QYZqR6zHQzdxsgj0FRh4uv
 qCZi9JZehid0VgTqgHRgrfxw5e5pD7JXtq7aQ0ByohmI/hLNAQjRdljdR8rWP9hGmy22YPAG1O6
 F+35EiADQ9Ai49m64Q/kBtE/hsR9zQZwssiqyjZN+a0gaCQYgiBLvzmaHXwtHxkDF85Mg43JbSU
 6j+7TqeVh4sZvr0AvDXYXP/GosmC//BKFD75axaOk9AZ/TnMjTIOzi6tPFXe9vJ86tt+P/S7ESo
 zok3cSvNv0JoHjoF/LxYWp7mFVNxtSzMuXsJ2mp6nxCBHxxNjOL4VM55T5wxcaow73ttUScKQaY
 CKOFe4HvKABxXCfpATfc8+F3t2l94vuoEQEs=
X-Received: by 2002:ac8:59d6:0:b0:51c:d1c:10e2 with SMTP id
 d75a77b69052e-52d74b470f7mr240097611cf.12.1786871885610; 
 Sun, 16 Aug 2026 02:18:05 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:51c:d1c:10e2 with SMTP id
 d75a77b69052e-52d74b470f7mr240097351cf.12.1786871885128; 
 Sun, 16 Aug 2026 02:18:05 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1a91sm21977413f8f.21.2026.08.16.02.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:18:03 -0700 (PDT)
Message-ID: <8f347a98-8b6d-4d1c-83a9-d767760f54f1@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/18] accel/tcg: Replace size with first/last in
 probe_access_flags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX1Wvb6AQ/4k/t
 zwSUUYMER/Sr9aKIT81aSo6SL1/KkdMcYaQ+fPfV5i+Ds5/S8TeIdrdNcbJqTHwECSde1WN8Lph
 OV5nGZYI5rgO5MF8z0HMLVfqjg/om2Y=
X-Proofpoint-GUID: 269vDoelPvDvGipSc_WpRYQFMiL85FtM
X-Authority-Analysis: v=2.4 cv=C5PZDwP+ c=1 sm=1 tr=0 ts=6a81804e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RUurspf9fpIRbrhlMEsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfXxvr0WEWnSsfK
 BBHuvnM3ooEWxiwMP/Datt6XPBuIk9S8SHexhKWe1TUd+DdRfLdIG/nOn/fDThAcs3W38L1AhCo
 BRssrLNw6u3lrRI7NmV96bIdnIy6kW3KBrvAindvtdQm7YKZ9k1Xzc7QYgAsN22H1ZMrZUW84b5
 601Lsvpcb2fEi9q83Abg+6czIoNpiMQqv7ZreV5Gnq3M/slrjpgmVKRT7T5L457XCKRND0G/9x7
 EnrrHA06ulwbv7hqaN8Eptznw/8pt4tW8SKMKgpQUtOr0V5VoNg1OoYOAkt1cVTLET/3+2KTGRg
 ykP/YrZbTIm+iCPYbGEblIXfz0HrPWHALKGs3SZFtNYADTRdMNVdj7pvsJXWo6brealpjJ2jBTN
 Ep0oMFe5UIr/oCpdP3g9ezTMgh3wsbAQHp3VpWt/26wgQgnVDyYeOrM6bc3BNTjmRayUK0NhTkS
 uKRuzyUo53GIK05NJfQ==
X-Proofpoint-ORIG-GUID: 269vDoelPvDvGipSc_WpRYQFMiL85FtM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/probe.h        | 24 +++++++++++++++++-------
>   accel/tcg/cputlb.c               | 15 ++++++++-------
>   accel/tcg/user-exec.c            |  7 +++++--
>   semihosting/uaccess.c            | 10 ++++------
>   target/arm/tcg/sve_helper.c      |  5 ++++-
>   target/riscv/tcg/op_helper.c     |  4 ++--
>   target/riscv/tcg/vector_helper.c | 21 ++++++++++++---------
>   target/s390x/tcg/mem_helper.c    |  4 ++--
>   8 files changed, 54 insertions(+), 36 deletions(-)
> 
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index e3068a79de..06faf1269d 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -49,23 +49,33 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
>   /**
>    * probe_access_flags:
>    * @env: CPUArchState
> - * @addr: guest virtual address to look up
> - * @size: size of the access
> + * @addr: virtual address
> + * @first: beginning of virtual address range
> + * @last: end of virtual address range
>    * @access_type: read, write or execute permission
>    * @mmu_idx: MMU index to use for lookup
>    * @nonfault: suppress the fault
>    * @phost: return value for host address
>    * @retaddr: return address for unwinding
>    *
> - * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
> - * the page, and storing the host address for RAM in @phost.
> + * Probe an access for [@first, @last], where @addr is somewhere
> + * in that range.  Normally @addr == @first, but some targets have
> + * accesses which are forcibly aligned after an initial fault for an
> + * inaccessible page (e.g. Arm DC_ZVA, where [@first, @last] will be
> + * the bounds of the cacheline containing @addr).
> + *
> + * If the access does not satisfy @access_type:
> + *   - if @nonfault is false, raise an exception at @addr
> + *   - otherwise return TLB_INVALID_MASK.
> + *
> + * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
> + *   - host address for @addr, if direct host accesses are allowed,
> + *   - otherwise NULL.

This If/Otherwise block sounds like implementation detail leaking into
documentation API contract, but I don't mind.

>    *
> - * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
>    * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
>    * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
> - * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
>    */
> -int probe_access_flags(CPUArchState *env, vaddr addr, int size,
> +int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool nonfault, void **phost, uintptr_t retaddr);


> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index b7b3805a6d..87f2196bc7 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -704,7 +704,7 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t msize = nf * esz;
>       uint32_t vma = vext_vma(desc);
> -    target_ulong addr, last, last_in_page, page_split, elems;
> +    target_ulong addr, last, last_in_page, page_split, elems, adj, adj_last;
>       MemOpIdx oi = vext_oi(desc, log2_esz);
>       int mmu_index = get_mmuidx(oi);
>       bool first_active;
> @@ -759,10 +759,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>        * Test whether the first page is accessible.
>        * If the first element is active, it must succeed.
>        */
> -    flags = probe_access_flags(env, adjust_addr(env, addr),
> -                               MIN(last, last_in_page) - addr + 1,
> -                               MMU_DATA_LOAD, mmu_index, !first_active,
> -                               &host, ra);
> +    adj = adjust_addr(env, addr);
> +    adj_last = MIN(last, last_in_page) - (addr - adj);
> +    flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
> +                               mmu_index, !first_active, &host, ra);

Something in this function (on the pre-existing code) bugged me,
confirmed by your cover letter (I haven't looked at the RISCV
preliminary series).

>       /* Get number of complete elements in the first page. */
>       elems = MIN(page_split / msize, vl - i);
> @@ -853,8 +853,10 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>            * We have not yet advanced addr to the next page.
>            */
>           target_ulong next_page = addr + page_split;
> -        flags |= probe_access_flags(env, adjust_addr(env, next_page),
> -                                    last - next_page + 1, MMU_DATA_LOAD,
> +
> +        adj = adjust_addr(env, next_page);
> +        adj_last = last - (next_page - adj);
> +        flags |= probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
>                                       mmu_index, true, &host, ra);
>   
>           /* Stop if invalid (unmapped) or mmio (transaction may fail). */
> @@ -873,8 +875,9 @@ vext_ldff(void *vd, target_ulong base, CPURISCVState *env,
>               host += addr - next_page;
>           }
>       } else {
> -        flags = probe_access_flags(env, adjust_addr(env, addr),
> -                                   last - addr + 1, MMU_DATA_LOAD,
> +        adj = adjust_addr(env, addr);
> +        adj_last = last - (addr - adj);
> +        flags = probe_access_flags(env, adj, adj, adj_last, MMU_DATA_LOAD,
>                                      mmu_index, true, &host, ra);

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


