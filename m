Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C8E606A31C
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gUXbT1Bt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHrw/Lga
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQp1t-0006VC-FU; Tue, 10 Nov 2026 11:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQp1r-0006UH-OS
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 11:49:03 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQp1q-00088B-2t
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 11:49:03 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAF09ZM3183158
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 16:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EGt2a+6+itQ120AA2JwJpyxVIGSChVKYj1ZsEtvzrvA=; b=gUXbT1BtronY2vUj
 mOwMNNWcwkAQaq0kla8YUV7PXmB+VIZoro2NbdEyo7owdXHCYiLKXbKPGYSKn8/p
 ar7X7NQUlia1r/43AaR4E3w1cInTGMOT0/S8Srbx3yuW60vlYy6GzWebvh+uMACL
 64/clVE53XFq9Vxx/+nEJYj8arNkL9/h2oB6KUdk/I0VlM2jlEzC/CxcMujUK+wv
 evw6y7A1j6iWQeCp03XRCf+dZ79eG9T89JaT30YqIYxH/XD8neuxohAdqOTGxuCt
 2PPK6/WT2edq0JTLWAjavK5j8N+ucFh5iVHhBQMtwASEyny7Y9zJRfxHV74mOYWR
 O8WVAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp2xeh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 16:48:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-946038e22f5so530142785a.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 08:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794329339; x=1794934139; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EGt2a+6+itQ120AA2JwJpyxVIGSChVKYj1ZsEtvzrvA=;
 b=UHrw/Lgaoqnf1ZHJQWugsLcBi+gxgrCi9w2XG6T/j9uoiW/KV3jFA6X6GRWOA+5YPj
 /v1jfroIM3K7Ziav+Veex4PBjra3RXXFo/7g6cnHG/S1sBR7p/nnyoFMbCELerv+FuDQ
 E1tHZ1U+gV3anZHq/DV9/yTjsM4CNsSSgHNOAQ0sghzVHduopfiR8GRzNZ7+5NvWrMwC
 VZeIG4u/lBohegWta2ff1+7d2iHZUKrdizlhA04wCnXEH1UGewbHmjKJ7NEO48xG7M4n
 cgjPQ8V0sC+dMPVcnV8edN+pQGP57l91XscNyKXGDTYftYgj+9U6QdifWtRjSSyPKqpO
 qNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794329339; x=1794934139;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EGt2a+6+itQ120AA2JwJpyxVIGSChVKYj1ZsEtvzrvA=;
 b=o6YnY9ndN3rHYko9SGtBIPuhE3xUiGSicIK/Tlo7J0/aPnI1PNtSzYCrWp0bbCwGqT
 m0k8gj5t03kOT7YGze0Hf5h23PMccf3qqErtnaSM+X16bK7jb47y4rVAD04CB0w45WgQ
 lolz1dZlIW7gh/ov6p+DrIDMqaqlzDxqaWesCl+pXfco7A81c0SOczbf5yVrDt598ZYH
 5DNOUChV2/lvT9094UbdcItEuuX4fixvusyMIyVtXrss7n8X35rjUx67m05R90N1+Xnt
 Z0heh6kjnLyFwDk71+vqyW/Pwzo/bEbDsBGCDABgycTDX8qWyPkG/otto6ENYs+h1zBg
 uHNw==
X-Gm-Message-State: APuU4Z+XYSuj1Vye67FlS3Lev29ndEqmFanWvaZ4wT13ytiaEl+3WU0W
 Z5IWETcsl4zweq5EI/kkQhPXqRNPSisO+ye5b2S/n8W09REFVK7947DpxV9yXIYq8HHubxuP1CB
 RZPH1uhPvRfDF483EUCnhEvvzomeiWA5Nf+YhCvw9e37kMvgYTHWsr2XChw==
X-Gm-Gg: AYBFou1ZiWr1D5Ag+61dR7NyiStCMYc7KT0aHV1tAOGIAAdvhIUCJs9SDnqFjZpafEw
 pw6NZglDzmcVtwlKfsxujJez9Kk8y1csQP41IoA/IisNoLRQU3JgYV1WtaKrC/DdPonzk9QAvrn
 ykorSm/GNWULSVCAQcqy6WYKE12cHIU0/+mnpsfDNU+AUQvLDChbvlWKG5VVUUI2Mn6DqqGrHf+
 IqycrMbAxiNcNP2YB+YpzN7+D/2BxzVC0N7d+1mPZomLXr3R28LX/vqwsS7n2w19a0Tu515QmMQ
 YetPNyJwWiEQBftMXqe9dEdu83xWcZE2UbyD3cgKqjl2BanPo2qylMFl1QWY4smpsdqb3k6/axq
 y/fT1V9c6itQd90clSM2m0iRVR2mThjcMjnCu9KU75FvsRq51pQRKDQP+l61j3PkcL0uKRAT+3S
 7aDyPsvLVnIA==
X-Received: by 2002:a05:620a:2a06:b0:93f:e53:a55c with SMTP id
 af79cd13be357-9479f431b59mr513929985a.78.1794329338738; 
 Tue, 10 Nov 2026 08:48:58 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93f:e53:a55c with SMTP id
 af79cd13be357-9479f431b59mr513924085a.78.1794329338169; 
 Tue, 10 Nov 2026 08:48:58 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e770d7csm264404785a.17.2026.11.10.08.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:48:57 -0800 (PST)
Message-ID: <c06f0de3-0db7-4aa5-9c01-04f5155ae3ef@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:48:54 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: Synchronize IOMMU FCTL state after MMIO writes
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20261107131510.102469-1-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261107131510.102469-1-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IQJJN6REAeQ1avNS0EBpGn3PbYzh4r_2
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af34afb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DhXwvBVPlDEisQGbXycA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX29R8scWmDvs2
 Qu/ePO5hc5IP8S9gByrh/AUORKmf588kbSlIsutKtck4b3JD5fQaQgVlIGJ89IbiYnoYsIQ+UwS
 EUS6k6ndAlh6KkLX7GUyFBcuZ0VvtSw9vW0d7pcsBbaHA41ja0jSb6Fwh4lrERvPzlJat7A5kZs
 pkTY4nSF0/n40FDck0Xeuk9gFF6uK9kp5WXqYEd1UJkoAlqvDovQgr7yy2qXwaEIB8PqlYCZDOp
 w/IrlHRFGm0QI5q+/kWt4BdWN+nmr0fgHP8ZPJwO0C19QpPMeYK4SFnC2aKuI4sY22aD3TcKsst
 d0z62dXmvok+962hcdTuvZLLmtRjxHoNEEVw0QSZuISOR60ArC842iR33Q+LOpHxTjaETlCWVOo
 ELpVJ9CdX0jB4pnMoHiElDbPC8RMPPGHCSgWTwjXBmraZDjYDBnqMk5B4vNcnFtkxaFV7mavbhi
 nh5qUTQnWQIqx8uftag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX1oNUYTT47zfd
 W1F7HyNVAXB+dLZBKKFr0OARYmifOBcuv71oQXtjyLkcG28KOgqWRVC3fmwNjn++BJUMxfobQ9r
 RBx4MWeKVEO+THfyOjRFxJfOa6jlkCA=
X-Proofpoint-GUID: IQJJN6REAeQ1avNS0EBpGn3PbYzh4r_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066
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



On 11/7/2026 10:15 AM, Tan Chi wrote:
> MMIO writes to FCTL only update the register storage, leaving
> s->fctl unchanged. As a result, setting FCTL.GXL does not enable
> Sv32x4 translation in the page-table walkers.
> 
> Synchronize s->fctl with the guest-visible FCTL register after
> MMIO writes, following the existing register processing mechanism.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 3f999bf292..6ef2e3ae6f 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2398,6 +2398,11 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState *s)
>   
>   typedef void riscv_iommu_process_fn(RISCVIOMMUState *s);
>   
> +static void riscv_iommu_process_fctl(RISCVIOMMUState *s)
> +{
> +    s->fctl = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_FCTL);
> +}
> +
>   static void riscv_iommu_update_icvec(RISCVIOMMUState *s, uint64_t data)
>   {
>       uint64_t icvec = 0;
> @@ -2538,6 +2543,10 @@ static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
>   
>       /* Track actionable MMIO write. */
>       switch (regb) {
> +    case RISCV_IOMMU_REG_FCTL:
> +        process_fn = riscv_iommu_process_fctl;
> +        break;
> +
>       case RISCV_IOMMU_REG_DDTP:
>       case RISCV_IOMMU_REG_DDTP + 4:
>           process_fn = riscv_iommu_process_ddtp;


