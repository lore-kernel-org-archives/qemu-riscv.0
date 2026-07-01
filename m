Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D318CC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:39:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weuDw-0004My-QI; Wed, 01 Jul 2026 08:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weuDr-0004M3-Nu
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:39:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weuDp-0003iS-Qk
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:39:23 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 661A8Xms681092
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 12:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OdyZzWtHdHZob15svkDOtCfqXSYb341ej/iRPpS+jXw=; b=lGDGTYkAAIC0icRy
 /rGnxkb5mn3PgRDWV4lBZKaZs4h9ZLTDa5ynAYNyEb3tA0JuLzLZ880pTRwMJ5x7
 2eIWHNnesIWLAaaI2uShs37vygIRTzB1qq8/TgSF/skNk/kuFuBXy83QokJHRIO/
 OvR+V5tFl2YDji5Q/ibaaYEONUSRw7wTqqVcHF6Y9yziBvo9wDqNlWe9nFeXnAQD
 bVIb55qkHNAjIMd7hvw6gcL33mLkpTV5/jV4tjUZsczTiDwq6RtEsA4wcLYz9eHq
 FlF8R/mNLB9xfVn94cBNtkO/IUdmlDXXIDpcE5dAUd7gtY+PIPQYctbv9+yO0wff
 /gG5qQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sm6mn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 12:39:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1e6f602cso10050681cf.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782909558; x=1783514358; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OdyZzWtHdHZob15svkDOtCfqXSYb341ej/iRPpS+jXw=;
 b=VUKUvhKynTGAh0k3ERtbWSo0Lb6fOfm+etdea5wb0RbmHlzWfGSAWTNxMx8XsHLT6p
 BAlePz7ZskZ/UNuMEM6swg0HeeQYdwTdk9WNRLjLdD545uiVEj41s97fJWZlnUpIQU/U
 Qkh5RxMvTH6s8obNKtY1BClnJSrxLDeNAuD0veXVGNw9yyaRpKfZrYkNhP5zp121Lenw
 6d3mKwNdq8dcbGbh7Uwb437nKCoGttP+0LwLACPd1Vwg80mk2QQwLfqx8fY7xfHZjVS+
 i6MshfMQl1NsC4Oh8KPBkXxdg0X/0GLd/H4oY4n+fcjDT2y98s1ILo3S0+DuTl4wcPQK
 tLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782909558; x=1783514358;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OdyZzWtHdHZob15svkDOtCfqXSYb341ej/iRPpS+jXw=;
 b=nvLuwd7T/ZIyGUzOSbeOsJbXi2hs6VMojFaONv0jfjhOa0BMVv7iApNmVoB7rpJaGU
 R+TWis4w0p5oNWO6RmJn+4U7ZQmzZstaTeSDzvKap87Fbo8TcP3rj6mSYlSu6S/gka/D
 xacqQju2dGyOCC+yqtzc7vD0yI3nbfPA60L7t2alYmoeF2oBHFio55SA65LveSM7umt4
 V/AhE2pdVqY0/DULh/tkMXY5AmvfvTujgKvFm3+WUqBNkypvSeufx5szx4iUTGM2OZBX
 momrIwLxD7iKnChLz5yJQvGx2VuQi5/TdiZOr+WyA6rHOM5DmKUxiRJLj5Zk1pdW4UiB
 8yFg==
X-Gm-Message-State: AOJu0YzMb+5YumkwyzwQT9CYslTYwK2JStLk2UItwUy3OygwtP+SW/Xt
 xW/LlvHN6ywnELM525QPSGuY3IaPUnU6mHe3sshUK6sQBqfgDb5yaxzvFY/poR7mzsD9AedB4fk
 lURJzu/OoBd5eQ7snyXc6uegyL7ZIpojmt799v/nVimVcm1izq/KBh9cFew==
X-Gm-Gg: AfdE7cnHzDbS+k6chu+FXBCOgN2Kucr+C8Z7pTaEcmJr+1J7KNp91yzLmEiiiJOIBQl
 aG6ZUG2GTZ1nFj1lvai8oojfjecPUA2LBNCfBMwFYjaNL+o7nYhH9MuFEu60jirPsmxAyoqKyJq
 9MufZ0K96xJw15s2V65ZPruLCRscFUI45wEFtidDbTEEZCMR+rF1lUA6nig/K9bvYHjjWKa++70
 QEeRQU0+DUdc0QAHBrIUeUM/sr+4OfWE0KtqeiQkgcsfel+vxnDlqWJjhu5TH4ANdF7tOYVtOXc
 OV4ZjxmsAI7LKukez5mhfsuNobd2AaecRa8IgZR0LjGPhI3jckG5His0zytsf3Vvf6U6utU6Cos
 mYKZ1GMvMmDHmldxWMk4QlK7huKnSF6uf3+KRKlTV/c7r
X-Received: by 2002:a05:622a:5805:b0:517:90d2:598b with SMTP id
 d75a77b69052e-51c2aece364mr5750131cf.39.1782909558483; 
 Wed, 01 Jul 2026 05:39:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5805:b0:517:90d2:598b with SMTP id
 d75a77b69052e-51c2aece364mr5749851cf.39.1782909557965; 
 Wed, 01 Jul 2026 05:39:17 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c1084812esm44848631cf.7.2026.07.01.05.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 05:39:16 -0700 (PDT)
Message-ID: <bf976e76-b9d8-41a7-bbc4-87a66be761fd@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:39:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: fix read fault being recorded as
 write
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260630010938.1331641-1-daniel.barboza@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630010938.1331641-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2yQFJmA2Sb-F136IW6l9URId_vsJNG7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX+qbVeLYxMmEl
 dq1+TRBN9t26t0AxIwFnZzuJKdl9axTZbI9b+FaF+dYuZI5gEV8SgbInvDofq0Oa0EDkdMBA1UB
 rjPJCZ7QfdPrhaXVA4as1kPTkSegbEsFIVpw0uZbXsEVb3KKWyUp5dPWeyt0cgqyxWtwPIIXIQa
 lZ95CVm/ehCxuIAgU6r5LXSLqUGzBNglY0TT0mFDz1rTDkwOsgZ7Vka37lQKXoJ24pLLU9ElD7z
 +mNmaliMgai7WQu8X/3Enj+n6eHrEpoKdjnwpRYh97CyTe8u6oIKg+e2TDuvfqxYMyor0z8ODjk
 9QEHPMlyLMeyzqLIlbhBUFCDKxtXFtB54lbjFKz596SdF9/WI4SNQDs0tReJzavhZR2GnSVZaBi
 PnxH/aYbn+9fpI+eDpYkfWJWinsdNRrVdBXytqW8VtZsvTuxG+lNmGHpu9KmN26MwExi+B01brV
 Xukg4+cojYEe2uYYkUQ==
X-Proofpoint-ORIG-GUID: 2yQFJmA2Sb-F136IW6l9URId_vsJNG7R
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a450a77 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=nLOIKhRXE2l4xo0futwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX6fz/Z4AIhWoF
 Cu1vsV2CxsXwuVMSbyZASfoVzS8ApMJ4tX9ue/QNn58gQU7uANjwg0ZFkgI8SzLNYfvb2HYqAHh
 I0wrz5B4ba57kqT/Hv58e+YqSty674Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010134
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

Please ignore this patch.

I just found out that this same code fixes another gitlab bug:

https://gitlab.com/qemu-project/qemu/-/work_items/3557

So I'll re-send it with a slight different commit msg and with a second
"Resolves" tag.  The code will be the same.


Thanks,
Daniel

On 6/29/2026 10:09 PM, Daniel Henrique Barboza wrote:
> Under certain circunstances, like the one described in [1], a read
> operation that faults will be logged as a write fault instead if it
> happens after the translation phase in riscv_iommu_spa_fetch().
> 
> The first problem is that we're overwriting iotlb->perm with PTE flags,
> so an IOMMU_RO access flag can be overwritten by whatever flags
> the PTE has.  This will cause the wrong fault type to be thrown at
> the end of the function in case a fault happens.
> 
> To solve the iotlb->perm overwrite we'll bit_and the original
> iotlb->perm access flags with the PTE access flags, preserving the
> original access type.  So a IOMMU_RO access in a R+W PTE will result in
> a IOMMU_RO perm.
> 
> Second, the resulting fault is received by riscv_iommu_translate(), which
> will then report the fault.  To do that we require a transaction type
> (ttype).  We're prioritizing checking "perm & IOMMU_RW" to set a
> UADDR_WR ttype, and then checking "perm & IOMMU_RO" to set UADDR_RD
> ttype.  The issue with that is IOMMU_RO=1 and IOMMU_RW=3, thus checking
> "perm & IOMMU_RW" for a write then "perm & IOMMU_RO" for a read will
> cause the read fault to always be diagnosed as write.
> 
> Make the iotlb->perm matches more strict: "perm & IOMMU_RW" must be
> exactly IOMMU_RW, ensuring that 'perm' has both flags.  Then we can
> check perm & IOMMU_WO and perm & IOMMU_RO without worrying about
> overlapping with the RW flag.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/work_items/3577
> 
> Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3577
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/riscv-iommu.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..e1ff5eb864 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -282,6 +282,7 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn, hwaddr addr, hwaddr *out)
>   static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>       IOMMUTLBEntry *iotlb)
>   {
> +    IOMMUAccessFlags pte_perm;
>       dma_addr_t addr, base;
>       uint64_t satp, gatp, pte;
>       bool en_s, en_g;
> @@ -509,8 +510,16 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>               }
>               /* Translation phase completed (GPA or SPA) */
>               iotlb->translated_addr = base;
> -            iotlb->perm = (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO)
> -                                                         : IOMMU_RO;
> +
> +            /*
> +             * Do a bit_and between the PTE bits and the original
> +             * request flags to determine the exact permission we
> +             * need, i.e. if the original request is RO and the
> +             * PTE has RW flags the actual perm is RO.
> +             */
> +            pte_perm = (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO)
> +                                     : IOMMU_RO;
> +            iotlb->perm &= pte_perm;
>   
>               /* Check MSI GPA address match */
>               if (pass == S_STAGE && (iotlb->perm & IOMMU_WO) &&
> @@ -1704,7 +1713,8 @@ done:
>       if (fault) {
>           unsigned ttype = RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ;
>   
> -        if (iotlb->perm & IOMMU_RW) {
> +        if ((iotlb->perm & IOMMU_RW) == IOMMU_RW
> +            || iotlb->perm & IOMMU_WO) {
>               ttype = RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
>           } else if (iotlb->perm & IOMMU_RO) {
>               ttype = RISCV_IOMMU_FQ_TTYPE_UADDR_RD;


