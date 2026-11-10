Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D20606A31C
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eAvQ2svU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aXSt8Jch
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQqCM-0006LP-JS; Tue, 10 Nov 2026 13:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQqCJ-0006L0-8E
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:03:55 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQqCG-00088m-N9
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:03:54 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAH5jlv2900763
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bM1ddLmYyc16ICnYUtXVFs0QCJ1gfHHLdo9p9PMGz1w=; b=eAvQ2svUarz1ClFR
 lcLHW0LHybpyRt11cdJpPIiFiSVLPwQt/pOji9Av2b1d1p0nbXDBIouWgfik095C
 wyM+lPJj3eUM+lLj86UJYNlv/nx38MWsphI3KlDhkroEIj1Nf98uo05lCx1X4SBt
 +cPrV3pnTwMl7Z1hgU88FkQQyM9K/17q3C1z59E2tNPZok5dtxnxDFtvU3mjGlyE
 D2Gq/xW7nVhFdVUsEIMkcavKu72R3UHndMnKWlkbseTp01uPXkWvJH0yU0sjbq7H
 kLWrE2CyQRN77pC+Ybv5rSQ7sFr5QtO3OfYlqZyylkh+TlfQ8YRm8LKKKALINsSJ
 db0dOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5g8kx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:03:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91e987a4099so48316246d6.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 10:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794333830; x=1794938630; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bM1ddLmYyc16ICnYUtXVFs0QCJ1gfHHLdo9p9PMGz1w=;
 b=aXSt8JchD+IrJ1QiLAq45qdaTnp6TQZVc9pgv27YwRDHvC4OmTJ6BZ/E2yEJgZt1jK
 rkiIc5NcRGDpq4KwSOguJfMZh4HjYYYi/6ACBCTK+lu7pKMXTOTiap5Vq6vAuc9kvZQa
 7cPnJ79K7q6SgRaEZijPHEl3og64KIdXR6bWuQJ7ly5fuYqrtWbROs52E0bR6H/q8+LD
 oPOrf1+ZLojKN0uAaqAfM+jzV3B/00uNVMEyB10oQMz+fT177bvcUtjlx0vPXK2NGl8F
 BBjTL/leOuFNPiGGaounxrE7JDqtCNpai7UJgqrWkQPepqeZ/gsXLzprJ3bwZ6K0MYcI
 4IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333830; x=1794938630;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bM1ddLmYyc16ICnYUtXVFs0QCJ1gfHHLdo9p9PMGz1w=;
 b=OhQ9KPYxSS0/uB5zW5gVGEOAmvdkT84W1hVDY8okOL3eztOSn8HNab7/NnvQjbz+Pg
 ERWvvVw/zD1mklg4CgRKj6Bc98akEeuWZzYPcC5+OJ2Jby9PZ/rrcUNrIJT03pPJgclo
 Ijy1j1qoeWxFzYNSta+swT5lFSAR96ZHxuTR7vkUH7OqnCX00VBlc27k/ZegFGGtEujg
 yzMjgV5nd1IWE00uz+NlbDYbSNSyeNpibzTaX0DuujWmkk9Th+4+Twi62C7fW0g5s69U
 RRwHgJkCPTfuKeFFHMr9dHBTMZ6wRV60PA0g3oCne59Xy+YzXdLPPCzQEVXJq/5dfNQC
 nnyg==
X-Gm-Message-State: APuU4Z/mSLDoccZgMffRgyBBHEMCUnh8+Jrw+x3avVS3wRnr2ebFa828
 eOuoN1y0AOoXkWpkbrctLak/bDjjGFQdfZlDQrCXJArIx8hF2HP7ORKfHldYM3bwhXMXVKaYlCw
 6jp7eJbHGEwx7qS1Fj7ZJilpqL+Ink1YXmN5aA4FaKnL7G4nCWac3MxBnkQ==
X-Gm-Gg: AYBFou1Mwz7X0WSLKLiRFfgztVt0Sz762soEWEu1Wbfs6LP8RARyQiU3fiKeahij3B5
 OUv985J3LsVfCqxb3da/85xxWRlwP2q/IgeHAffUTJC3Cm6UjI9DleVjV7hQ9CJfvrSjg+O1QtF
 VRvwCdZjRjT2NhRDWYVYCvfT1OEOQGJmrEw+NoTTb7arfLnP3z8vhCdD1gSJIKJQIQAvF7XIVpo
 iQeNYYz7LVt0EdngI+VVnsObyO0Ff0bY6r9meBlrSgDLbo5IBnVuEeryrVSCc7QBlzz0DiWjxsm
 cepUUDqDHSWvwYXL+rGcutXhs4300fw2OO/xgixovOggjeAqFps0bTR44yPH6rwigHNi/ZVMNjo
 khndYUYC4F1AGXS8Jj0Mwt0p/ajmwTW2liA2nIklAVg8PnSi83PvT8MCAfiZwR7rUJN8f797/iQ
 D7dMwkbKzX6A==
X-Received: by 2002:ac8:59c8:0:b0:536:52ae:d92c with SMTP id
 d75a77b69052e-55527b1cac0mr49843851cf.35.1794333830235; 
 Tue, 10 Nov 2026 10:03:50 -0800 (PST)
X-Received: by 2002:ac8:59c8:0:b0:536:52ae:d92c with SMTP id
 d75a77b69052e-55527b1cac0mr49843161cf.35.1794333829681; 
 Tue, 10 Nov 2026 10:03:49 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-555093d9c3fsm29870961cf.3.2026.11.10.10.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 10:03:49 -0800 (PST)
Message-ID: <7e7d30c4-eebe-416e-9776-eab7fb99bf80@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:46 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/riscv: iommu: Support automatic PTE A/D updates
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20261108143934.129923-1-tanchi25@mails.ucas.ac.cn>
 <20261108143934.129923-4-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261108143934.129923-4-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX/DBT28VVXuon
 wKuZPTRnb3kAZ/1qpqoepm4/lxzaGLs7HCs0fK0wcnbHFQWvbzGLngZ+vgC2ei193wp/vTqaVUq
 bOb5KmCppS0CFxSd67n2cg6qsvt+KQcVSKkn9qTOzvvyJIlFXGRRW4DrYZXx1fYHtUPOvKhVncP
 Xn6ouVAx5zixSiMxRMX5ZSPc6IEFnVD0ESDVaf8Ph7htWU7tWdYpEtSVkS5Ft3QQMoELGqkfg9k
 +HDLKK5gzI0Hnnr0v6FAduaFq3nQiu5vwcYUkLU5XUT3wwiCJ2F83CJmVn+SkPNDfsHrC9nX0vB
 pHL0V9AURpT11sK46qKmL3g3T3eW6B+PvHQPsCILHSil/ihVAgN6zJMpFKGxC/p7oQ0lPAfsLso
 mqB6twjmUs528ztMhMwni0WBX3g0lBKgqSX1vUPqjTuck0p9AI0Bl/+knpOI0hrI5920cx7VJYx
 I3c9WeCGHxGPKRsF3Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX9uPEbHW+SY5h
 7BUPtLZSabOjygfekzo7HL6ZIhjWybn/Enn3PJX4ruw2jVwM0nUkfpAUMXUdAu61Ikgm0toqTUg
 ze7qv0rcIAt/9JEpQaZYyzSVliwmZIY=
X-Proofpoint-ORIG-GUID: W1euFdr9paoXGy47_aPGmieTXIhcMw7i
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af35c87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=e2OcnuQTBostoCPegigA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: W1euFdr9paoXGy47_aPGmieTXIhcMw7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/8/2026 11:39 AM, Tan Chi wrote:
> Add support for the AMO_HWAD capability to automatically update the
> accessed and dirty bits of leaf PTEs when SADE or GADE is enabled.
> 
> Use atomic compare-and-exchange to update PTEs, restarting the
> page-table walk if a concurrent modification is detected.
> 
> For nested translation, check G-stage write permissions before updating
> an S-stage PTE. Restart the walk if the write translation resolves to a
> different physical address.
> 
> Avoid caching write permission when the PTE's dirty bit is clear, so
> subsequent writes can trigger the required update.
> 
> Expose the capability through the new "amo-hwad" device property,
> disabled by default.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu.c | 196 ++++++++++++++++++++++++++++++++++++++++-
>   hw/riscv/riscv-iommu.h |   1 +
>   2 files changed, 193 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 6760699eb8..04d50cd620 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -265,6 +265,128 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn, hwaddr addr, hwaddr *out)
>       return page_mask;
>   }
>   
> +typedef enum RISCVIOMMUADResult {
> +    RISCV_IOMMU_AD_SUCCESS,
> +    RISCV_IOMMU_AD_RETRY,
> +    RISCV_IOMMU_AD_FAULT,
> +} RISCVIOMMUADResult;
> +
> +/*
> + * Atomically update the A/D bits of a leaf PTE.
> + * Retry the page-table walk if the PTE has changed.
> + */
> +static RISCVIOMMUADResult
> +riscv_iommu_ad_update(RISCVIOMMUState *s, hwaddr pte_addr,
> +                      unsigned int pte_size, uint64_t pte, uint64_t updated_pte)
> +{
> +    MemoryRegion *mr;
> +    hwaddr offset, len = pte_size;
> +    uint64_t old_pte;
> +    void *pte_ptr;
> +
> +    if (pte_addr & (pte_size - 1)) {
> +        return RISCV_IOMMU_AD_FAULT;
> +    }
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    mr = address_space_translate(s->target_as, pte_addr, &offset,
> +                                 &len, true, MEMTXATTRS_UNSPECIFIED);
> +
> +    if (len < pte_size || !memory_region_is_ram(mr)) {
> +        /*
> +         * The entire PTE must be backed by a single RAM region
> +         * for an atomic update.
> +         */
> +        return RISCV_IOMMU_AD_FAULT;
> +    }
> +
> +    pte_ptr = qemu_map_ram_ptr(mr->ram_block, offset);
> +
> +    if (pte_size == 4) {
> +        uint32_t expected = cpu_to_le32((uint32_t)pte);
> +        uint32_t desired = cpu_to_le32((uint32_t)updated_pte);
> +
> +        old_pte = qatomic_cmpxchg((uint32_t *)pte_ptr, expected, desired);
> +        old_pte = le32_to_cpu(old_pte);
> +    } else {
> +        uint64_t expected = cpu_to_le64(pte);
> +        uint64_t desired = cpu_to_le64(updated_pte);
> +
> +        old_pte = qatomic_cmpxchg((uint64_t *)pte_ptr, expected, desired);
> +        old_pte = le64_to_cpu(old_pte);
> +    }
> +
> +    if (old_pte != pte) {
> +        return RISCV_IOMMU_AD_RETRY;
> +    }
> +
> +    return RISCV_IOMMU_AD_SUCCESS;
> +}
> +
> +static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
> +    IOMMUTLBEntry *iotlb, bool implicit_write, uint64_t *fault_iotval2);
> +
> +/*
> + * Updating a first-stage leaf PTE requires an implicit write.
> + * Translate its GPA through the G-stage, checking write permission
> + * and updating the G-stage's A/D bits as needed.
> + */
> +static int riscv_iommu_check_pte_write(RISCVIOMMUState *s,
> +                                       RISCVIOMMUContext *ctx,
> +                                       dma_addr_t pte_gpa,
> +                                       IOMMUAccessFlags req_perm,
> +                                       hwaddr *pte_spa,
> +                                       uint64_t *fault_iotval2)
> +{
> +    RISCVIOMMUContext gctx = *ctx;
> +    uint64_t iotval2 = 0;
> +    int fault;
> +
> +    IOMMUTLBEntry iotlb = {
> +        .iova = pte_gpa,
> +        .target_as = s->target_as,
> +        .addr_mask = ~0ULL,
> +        .perm = IOMMU_WO,
> +    };
> +
> +    gctx.satp = RISCV_IOMMU_DC_FSC_MODE_BARE;
> +
> +    fault = riscv_iommu_spa_fetch(s, &gctx, &iotlb, true, &iotval2);
> +
> +    if (fault) {
> +        *fault_iotval2 = iotval2;
> +
> +        if (fault == RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS ||
> +            fault == RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS) {
> +            /*
> +             * Per the RISC-V IOMMU Fault/Event Queue format, iotval2[0]
> +             * indicates an implicit first-stage access and iotval2[1]
> +             * indicates an implicit write. Report the fault for the
> +             * original DMA access rather than the implicit write.
> +             */
> +            *fault_iotval2 = (pte_gpa & ~3ULL) | 3;
> +
> +            fault = (req_perm & IOMMU_WO) ?
> +                        RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
> +                        RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS;
> +        } else if (fault == RISCV_IOMMU_FQ_CAUSE_RD_FAULT ||
> +                   fault == RISCV_IOMMU_FQ_CAUSE_WR_FAULT) {
> +            /*
> +             * A physical access fault also uses the original
> +             * DMA access type.
> +             */
> +            fault = (req_perm & IOMMU_WO) ?
> +                        RISCV_IOMMU_FQ_CAUSE_WR_FAULT :
> +                        RISCV_IOMMU_FQ_CAUSE_RD_FAULT;
> +        }
> +        return fault;
> +    }
> +
> +    *pte_spa = iotlb.translated_addr;
> +    return 0;
> +}
> +
>   /*
>    * RISCV IOMMU Address Translation Lookup - Page Table Walk
>    *
> @@ -277,14 +399,15 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn, hwaddr addr, hwaddr *out)
>    * @ctx             : Translation context for device id and process
>    *                    address space id.
>    * @iotlb           : translation data: physical address and access mode.
> + * @implicit_write  : Whether this is an implicit write to a first-stage PTE.
>    * @fault_iotval2   : Fault address and implicit-access flags for iotval2.
>    * @return          : success or fault cause code.
>    */
>   static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
> -    IOMMUTLBEntry *iotlb, uint64_t *fault_iotval2)
> +    IOMMUTLBEntry *iotlb, bool implicit_write, uint64_t *fault_iotval2)
>   {
>       IOMMUAccessFlags trans_perm = IOMMU_NONE;
> -    dma_addr_t addr, base;
> +    dma_addr_t addr, base, s_base_gpa = 0;
>       uint64_t satp, gatp, pte;
>       bool en_s, en_g;
>       struct {
> @@ -308,6 +431,8 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>        * effective leaf permission for the translation cache.
>        */
>       const IOMMUAccessFlags req_perm = iotlb->perm;
> +    const hwaddr addr_mask = iotlb->addr_mask;
> +    const hwaddr translated_addr = iotlb->translated_addr;
>   
>       satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
>       gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
> @@ -326,7 +451,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>        * means we can't do an early MSI check unless we have
>        * strictly !en_s.
>        */
> -    if (!en_s && (req_perm & IOMMU_WO) &&
> +    if (!implicit_write && !en_s && (req_perm & IOMMU_WO) &&
>           riscv_iommu_msi_check(s, ctx, iotlb->iova)) {
>           iotlb->target_as = &s->trap_as;
>           iotlb->translated_addr = iotlb->iova;
> @@ -413,6 +538,17 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       /* S/G stages translation tables root pointers */
>       gatp = PPN_PHYS(get_field(ctx->gatp, RISCV_IOMMU_ATP_PPN_FIELD));
>       satp = PPN_PHYS(get_field(ctx->satp, RISCV_IOMMU_ATP_PPN_FIELD));
> +
> +restart:
> +    sc[S_STAGE].step = 0;
> +    sc[G_STAGE].step = 0;
> +    trans_perm = IOMMU_NONE;
> +    iotlb->addr_mask = addr_mask;
> +    iotlb->translated_addr = translated_addr;
> +    iotlb->perm = req_perm;
> +    s_base_gpa = 0;
> +    *fault_iotval2 = 0;
> +
>       addr = (en_s && en_g) ? satp : iotlb->iova;
>       base = en_g ? gatp : satp;
>       pass = en_g ? G_STAGE : S_STAGE;
> @@ -540,8 +676,51 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>                   iotlb->addr_mask &= (1ULL << va_skip) - 1;
>               }
>   
> +            /* Automatically update the leaf PTE's A/D bits when enabled. */
> +            uint64_t updated_pte = pte;
> +            if (ade) {
> +                updated_pte |= PTE_A;
> +
> +                if (acc_perm & IOMMU_WO) {
> +                    updated_pte |= PTE_D;
> +                }
> +            }
> +            if (updated_pte != pte) {
> +                if (pass == S_STAGE && en_g) {
> +                    const dma_addr_t s_pte_gpa =
> +                        s_base_gpa + idx * sc[pass].ptesize;
> +                    hwaddr write_spa;
> +
> +                    int fault = riscv_iommu_check_pte_write(
> +                        s, ctx, s_pte_gpa, req_perm, &write_spa,
> +                        fault_iotval2);
> +                    if (fault) {
> +                        return fault;
> +                    }
> +
> +                    if (write_spa != pte_addr) {
> +                        goto restart;
> +                    }
> +                }
> +
> +                RISCVIOMMUADResult result = riscv_iommu_ad_update(
> +                    s, pte_addr, sc[pass].ptesize, pte, updated_pte);
> +
> +                if (result == RISCV_IOMMU_AD_RETRY) {
> +                    goto restart;
> +                }
> +                if (result == RISCV_IOMMU_AD_FAULT) {
> +                    return (req_perm & IOMMU_WO) ?
> +                        RISCV_IOMMU_FQ_CAUSE_WR_FAULT :
> +                        RISCV_IOMMU_FQ_CAUSE_RD_FAULT;
> +                }
> +                pte = updated_pte;
> +            }
> +
>               /* Continue with S-Stage translation? */
>               if (pass && sc[0].step != sc[0].levels) {
> +                /* Save the S-stage page-table GPA for A/D updates. */
> +                s_base_gpa = addr;
>                   pass = S_STAGE;
>                   addr = iotlb->iova;
>                   continue;
> @@ -552,6 +731,11 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>                                            ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO) :
>                                            IOMMU_RO;
>   
> +            /* Do not cache write permission until the D bit is set. */
> +            if (!(pte & PTE_D)) {
> +                leaf_perm &= ~IOMMU_WO;
> +            }
> +
>               trans_perm = trans_perm == IOMMU_NONE ?
>                            leaf_perm : trans_perm & leaf_perm;
>   
> @@ -1794,7 +1978,7 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_TLB_MISS);
>   
>       /* Translate using device directory / page table information. */
> -    fault = riscv_iommu_spa_fetch(s, ctx, iotlb, &fault_iotval2);
> +    fault = riscv_iommu_spa_fetch(s, ctx, iotlb, false, &fault_iotval2);
>   
>       if (!fault && iotlb->target_as == &s->trap_as) {
>           /* Do not cache trapped MSI translations */
> @@ -2732,6 +2916,9 @@ static void riscv_iommu_realize(DeviceState *dev, Error **errp)
>       if (s->enable_ats) {
>           s->cap |= RISCV_IOMMU_CAP_ATS;
>       }
> +    if (s->enable_amo_hwad) {
> +        s->cap |= RISCV_IOMMU_CAP_AMO_HWAD;
> +    }
>       if (s->enable_s_stage) {
>           s->cap |= RISCV_IOMMU_CAP_SV32 | RISCV_IOMMU_CAP_SV39 |
>                     RISCV_IOMMU_CAP_SV48 | RISCV_IOMMU_CAP_SV57;
> @@ -2891,6 +3078,7 @@ static const Property riscv_iommu_properties[] = {
>           LIMIT_CACHE_IOT),
>       DEFINE_PROP_BOOL("intremap", RISCVIOMMUState, enable_msi, TRUE),
>       DEFINE_PROP_BOOL("ats", RISCVIOMMUState, enable_ats, TRUE),
> +    DEFINE_PROP_BOOL("amo-hwad", RISCVIOMMUState, enable_amo_hwad, false),
>       DEFINE_PROP_BOOL("off", RISCVIOMMUState, enable_off, TRUE),
>       DEFINE_PROP_BOOL("s-stage", RISCVIOMMUState, enable_s_stage, TRUE),
>       DEFINE_PROP_BOOL("g-stage", RISCVIOMMUState, enable_g_stage, TRUE),
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index 403d10b321..8cf228f698 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -44,6 +44,7 @@ struct RISCVIOMMUState {
>       bool enable_off;      /* Enable out-of-reset OFF mode (DMA disabled) */
>       bool enable_msi;      /* Enable MSI remapping */
>       bool enable_ats;      /* Enable ATS support */
> +    bool enable_amo_hwad; /* Enable hardware A/D updates */
>       bool enable_s_stage;  /* Enable S/VS-Stage translation */
>       bool enable_g_stage;  /* Enable G-Stage translation */
>   


