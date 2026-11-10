Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46D606A320
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWx+sNHI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUxVQJlw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQq98-00058p-Tg; Tue, 10 Nov 2026 13:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQq96-00057w-J6
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:00:37 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQq94-0007rE-FN
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:00:36 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAF0XVv3725834
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ShpN89LBMVVV+LVkQNYEVu0VHsQJJmcxA48myNKptlY=; b=FWx+sNHIOhMCGfII
 A6fQ5VtbCegeyrxJX7mdLz1GY7jH85WmFJ/YFS6dXR13tSGBadR37OrMjSztDwyR
 R4U9Z0ZiD/5GpDF1IZV1I361E5DcT7MwrYl/iiogCCn3oQBRE9XjWGozazajXHBT
 hOrylZgOYdLlp9dEGtfz5QKUXf6pt6Kv+/NphTfMR/GzQT1kEs1IR+mItSpj8jG7
 d6liWN9rA3gt8T1aYkBNz297RK2LjHyjvVZs2MExJ4isrZCalf9t6QZZSJd1jdPX
 wB8hFf35JbcP1iAgNx+35LIkJkewULSccTcCZoJipQFYh4Qq30xJGjBpRbowL0zX
 mfon3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5daa99-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:00:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-947a607ec40so76989285a.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 10:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794333631; x=1794938431; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ShpN89LBMVVV+LVkQNYEVu0VHsQJJmcxA48myNKptlY=;
 b=DUxVQJlwZki1hOJ5/pygtHyPg6+RsBY1YLnzNctQ2u9lgiW/L2DPxqUW0sbRD6MkLy
 GS/4zMukAViwkmqgAwwYMAN0jSC0hl1M2uuymMU6noVetOCvFv82kFWzkt7CY/YMTB4K
 6xbhzZATjk8F9zWyfqyiNU9U1Q7+hOGxLljWyGO8KGCT3Bj7C3yKXWGZfMRr7H7o1amV
 w8YWxkVkbz1JrKf+raCCLnBuR7FOew58OiNMnuf2U4MoTg6aTbYZZKijJvrHCRUDybb0
 CPHEM6Im7KA1o+rtPmuA6fIkdOI5LewzrMRg6aNEp4fPy0dXMjqLNReL7uGfEmt2ru2r
 LbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333631; x=1794938431;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ShpN89LBMVVV+LVkQNYEVu0VHsQJJmcxA48myNKptlY=;
 b=Rfux8wKo/2o+moRMJCzEWPlOPYKZDdQ5vOWxid1I/4MdAzeBWBcIzJYpB5cEyqzYju
 2+QWloVefNru38jzjDOS6zBENUczDAsXdUqkyOjzzB+eFG5uwfz9wWPeF6xfsy3zrUuj
 iapnEU74rsblZ4rvDM55pYAU/2dJGqdyeQk3oiVWerUtEVANXdCaFQai4vDJoTYkcR2M
 X/TbJJgdEJX0QRnvNRhbRFwmsXp4p9PlnGVMcP9BZqLCKyx7AirJG5soY8cvNyxLFjrV
 RkEwFqGRrx71cp9sUbQABpeC8cUN6FEw+ISR7Wgrkfs3BnH+AtY5P0cH6Wokv5MbPgOZ
 SiIA==
X-Gm-Message-State: APuU4Z9oWDzUfAZuDCObxy+BYcL3YcXLdW7C80RrQdu7tfCXcHRITpNy
 cQ+D8ZFioAbByLZI/3Ur5lR71twzI6XPiHmdRqT8/44st4XKRG9fmC0V5b7LH1j6oj1C1BBJR0W
 AuX8fPEzGrzYsYXXvaUVbY+3ERKLeZPa1uMajhLqRbJmkE2TEYeFTKS52yg==
X-Gm-Gg: AYBFou1MV3lpVllAaJLX9lGeRT1Ava30uM1oKP1rcZCpfL0unJyIqZQuJPbPVDZFUBO
 6UvHHYdFJlXiKBBhoRoG7Vr/uuIFwZCQGELezzVC/JkXw6RAGRMLAE1dhXN3hemabaWr33rhann
 wOi16bNII9THJANRGQv+X6s66B+mDm4d5vUQthAKKsuU+X92QKBxl5c5hu5816fwSmND9UmZKQ+
 T/ChLZemx8CDCSdsrR8brYMTnhywgxGPt9351hIZHGFPNypOpn+HlFUQJMU04ehEAfsAey9HNhW
 E8v2ajGdv1seJCRPuu8ReJAWRJuex8CMraAB+QZyxsWf5KnuaU/7a45b5CFBrNHlqx8vfLKu+Yp
 SlYhs+qrdyOh8NVWsXwZwx/S0eDUQQLgPCJW1c81dLXVrFYFAXty7ifSE8UoJaCPz+7UBCuIk8u
 WAOY6rEm+HIA==
X-Received: by 2002:a05:620a:4588:b0:93e:bbda:dd06 with SMTP id
 af79cd13be357-9479f093c44mr600353985a.0.1794333630755; 
 Tue, 10 Nov 2026 10:00:30 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:93e:bbda:dd06 with SMTP id
 af79cd13be357-9479f093c44mr600336585a.0.1794333629861; 
 Tue, 10 Nov 2026 10:00:29 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04ae351sm26469876d6.12.2026.11.10.10.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 10:00:29 -0800 (PST)
Message-ID: <bf2299c3-0f36-414a-9534-dc18fe380b0e@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:00:26 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/riscv: iommu: Fix implicit G-stage page-table
 accesses
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20261108143934.129923-1-tanchi25@mails.ucas.ac.cn>
 <20261108143934.129923-2-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261108143934.129923-2-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UAK5mLGwnDKYTkOphxbW6OFNMzmkZt8F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzs6UNniWwKrd
 Zi4snKBRBFygh/F3E2qfCJ2Pcw62bAFJ1GtRO0rBeUoeMOHRBpbNLv/39C05iK9C2MkcH6or97F
 L6dcYSOr/ieNjW8kDuzc6vKPTex3fmE=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af35bc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=D8qwnNen2OYJ8iRmKIQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UAK5mLGwnDKYTkOphxbW6OFNMzmkZt8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXz+63f6CdmHtk
 yqfQm7EZT+tTxMr8lWCA8jnkUBPEwUDytaQelIf4SsATbYqXX2Br+nt/6v30vfCaGog4NH509xv
 d4U4khbGnWnBZl7fswQ0iBObcxmiXdp8FIMTNO9YliFGqaGJoOpBZa24FQ42O1+wTiUIi8ymZDx
 DJ0K5vsX2Y4iHhb44ZJ/R1+eggTILy4cY36pdPGQYQleD4BxX2DL/+7XZVlcFPH23dzJOZkqldv
 GI2/8BtqNO0Z4ksImYfTPVDU4x8A/uT7TMsgTN0HumXI+hyOrJMFYDGs9/XM9Zz+Mnc1L3B18co
 on73GVpDANQYjsw86RWuMaqmd8J8S/5e0ICxBiDXk8WTD14vsOmnHq9MwCYtH1dWwAwl0eaVWP7
 571jewv8mG/KXBZB0aymfxBWbPbZcBTRfMb5+fVREYcWd6Iwp5sC5wWgCAy3Yg34GKubUsrtpv4
 nR25/xYvVTb2Vn1S0cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/8/2026 11:39 AM, Tan Chi wrote:
> When translating a DMA write, G-stage accesses to first-stage page
> tables are implicit reads. The current implementation checks permissions
> using the original DMA access type, which may incorrectly require write
> permission for these reads.
> 
> Use read permission for implicit page-table accesses while preserving
> the original DMA access type for the final translation and fault
> reporting.
> 
> Also track the fault address separately from the translation result and
> set the implicit-access flag in iotval2 for guest-page faults. Route
> address-range failures through the common page-fault path to report the
> correct fault address.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---
>   hw/riscv/riscv-iommu.c | 60 ++++++++++++++++++++++++++----------------
>   1 file changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 0e6970773a..2dcc528599 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -273,13 +273,15 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn, hwaddr addr, hwaddr *out)
>    * Keeping them separate for now, as error reporting and flow specifics are
>    * sufficiently different for separate implementation.
>    *
> - * @s        : IOMMU Device State
> - * @ctx      : Translation context for device id and process address space id.
> - * @iotlb    : translation data: physical address and access mode.
> - * @return   : success or fault cause code.
> + * @s               : IOMMU Device State
> + * @ctx             : Translation context for device id and process
> + *                    address space id.
> + * @iotlb           : translation data: physical address and access mode.
> + * @fault_iotval2   : Fault address and implicit-access flags for iotval2.
> + * @return          : success or fault cause code.
>    */
>   static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
> -    IOMMUTLBEntry *iotlb)
> +    IOMMUTLBEntry *iotlb, uint64_t *fault_iotval2)
>   {
>       IOMMUAccessFlags trans_perm = IOMMU_NONE;
>       dma_addr_t addr, base;
> @@ -299,10 +301,10 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       MemTxResult ret;
>       bool pv = !!ctx->process_id;
>       /*
> -     * Keep the request permission separate from iotlb->perm.  G-stage
> +     * Keep the request permission separate from iotlb->perm. G-stage
>        * walks translate S-stage PTE addresses before the real leaf is
>        * reached, but permission checks and fault types must still use the
> -     * original request.  A successful walk leaves iotlb->perm with the
> +     * original request. A successful walk leaves iotlb->perm with the
>        * effective leaf permission for the translation cache.
>        */
>       const IOMMUAccessFlags req_perm = iotlb->perm;
> @@ -424,6 +426,14 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>           const dma_addr_t pte_addr = base + idx * sc[pass].ptesize;
>           const bool ade =
>               ctx->tc & (pass ? RISCV_IOMMU_DC_TC_GADE : RISCV_IOMMU_DC_TC_SADE);
> +        /*
> +         * G-stage accesses to S-stage page tables are implicit reads.
> +         * The original DMA permission is used for the final data access.
> +         */
> +        const bool implicit_read =
> +            pass == G_STAGE && en_s && sc[S_STAGE].step != sc[S_STAGE].levels;
> +        const IOMMUAccessFlags acc_perm =
> +            implicit_read ? IOMMU_RO : req_perm;
>   
>           if (ade && !(s->cap & RISCV_IOMMU_CAP_AMO_HWAD)) {
>               /* GADE/SADE are reserved bits if AMO_HWAD is cleared.  */
> @@ -442,15 +452,11 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>                   masked_msbs = (addr >> (va_len - 1)) & mask;
>   
>                   if (masked_msbs != 0 && masked_msbs != mask) {
> -                    return (req_perm & IOMMU_WO) ?
> -                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S :
> -                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S;
> +                    goto page_fault;
>                   }
>               } else {
>                   if ((addr & va_mask) != addr) {
> -                    return (req_perm & IOMMU_WO) ?
> -                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
> -                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS;
> +                    goto page_fault;
>                   }
>               }
>           }
> @@ -499,13 +505,13 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>                * non-user mode leaf PTE and !pv we need to fault.
>                */
>               break;
> -        } else if ((req_perm & IOMMU_RO) && !(pte & PTE_R)) {
> +        } else if ((acc_perm & IOMMU_RO) && !(pte & PTE_R)) {
>               break;                /* Read access check failed */
> -        } else if ((req_perm & IOMMU_WO) && !(pte & PTE_W)) {
> +        } else if ((acc_perm & IOMMU_WO) && !(pte & PTE_W)) {
>               break;                /* Write access check failed */
>           } else if (!ade && !(pte & PTE_A)) {
>               break;                /* Access bit not set */
> -        } else if ((req_perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
> +        } else if ((acc_perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
>               break;                /* Dirty bit not set */
>           } else if (pass == G_STAGE && !(pte & PTE_U)) {
>               /*
> @@ -587,13 +593,22 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>           }
>       } while (1);
>   
> +page_fault:
>       /*
>        * riscv_iommu_translate() will receive a fault and then call
> -     * riscv_iommu_report_fault() using iotlb->translated_addr
> -     * as iotval2.  Update translated_addr it with the latest
> -     * translated addr we have.
> +     * riscv_iommu_report_fault() using fault_iotval2 as iotval2.
> +     * Update fault_iotval2 with the latest translated address.
> +     * For guest-page faults, set the implicit first-stage
> +     * page-table access flag in the low bit.
>        */
> -    iotlb->translated_addr = addr;
> +    *fault_iotval2 = addr;

The previous logic was added as a failsafe to not leave iotval2 zeroed during
a fault (Gitlab #3559).  Now that you're adding a logic to calculate fault_iotval2
based on G_STAGE I think we can change the existing logic to closely match the
spec, i.e. iotval2 is supposed to be 0 for S_STAGE faults.

You can set:

*fault_iotval2 = 0;

At this point and then we'll calculate the right value if  pass == G_STAGE down
below.  I tested this change with Gitlab #3559 and it's still a pass.  You'll
probably want to re-run your own testcases again to be sure but I'm fairly certain
this is ok to do.


All the other changes LGTM.  Thanks,
Daniel

> +
> +    if (pass == G_STAGE) {
> +        bool implicit_read =
> +            en_s && sc[S_STAGE].step != sc[S_STAGE].levels;
> +        *fault_iotval2 = (addr & ~3ULL) |
> +                         (implicit_read ? 1 : 0);
> +    }
>   
>       return (req_perm & IOMMU_WO) ?
>                   (pass ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
> @@ -1740,6 +1755,7 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       bool enable_pri;
>       hwaddr phys = 0;
>       int fault;
> +    uint64_t fault_iotval2 = 0;
>   
>       riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_URQ);
>   
> @@ -1776,7 +1792,7 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_TLB_MISS);
>   
>       /* Translate using device directory / page table information. */
> -    fault = riscv_iommu_spa_fetch(s, ctx, iotlb);
> +    fault = riscv_iommu_spa_fetch(s, ctx, iotlb, &fault_iotval2);
>   
>       if (!fault && iotlb->target_as == &s->trap_as) {
>           /* Do not cache trapped MSI translations */
> @@ -1827,7 +1843,7 @@ done:
>           }
>   
>           riscv_iommu_report_fault(s, ctx, ttype, fault, enable_pid,
> -                                 iotlb->iova, iotlb->translated_addr);
> +                                 iotlb->iova, fault_iotval2);
>           return fault;
>       }
>   


