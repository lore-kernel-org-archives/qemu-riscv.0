Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F5CA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:35:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEN4w-0004DR-EE; Wed, 07 Oct 2026 04:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEHl0-0006Ra-0E
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 22:52:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEHks-0004HQ-En
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 22:51:47 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6963A4XO2818096
 for <qemu-riscv@nongnu.org>; Tue, 6 Oct 2026 03:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m6prDDp1Ty8pVkta/0HFr7usV6lk3i24zCFr2cPUtBU=; b=SXv4UvJY89aUsJoE
 E22rwOX4faJN8yjOZ9xC62JsoTkLQQ0lpamBQMdBlhtZzgXJ6tKzbGttAIU70f+Y
 QjEsVXr1y/mUldRGVHpKYaXrzeUHzPHJ8VIRYbAGSQxlfSzi250mkZ9qbHf8FdpB
 7hUpoutePP1kmCDjnuPDEDDRqkXrMxR2cVDyTW27l1jG8GZYE8b8elmrrEO6pRgK
 h0J0R4ru7fP8fhh9OdUDQXiLojZ2MZV3qiCMIXTQw+qye2UQVT0qjB4sMUasdPOD
 5xWGCkjd7KBtjh2+uKpNZ102K3qWi06uPTxfBNtsyR3XqzFQ4AQHzIPGz2KuoCmg
 uNAV/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkuj0sn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 03:31:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5338f659170so37506111cf.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 20:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791257489; x=1791862289; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m6prDDp1Ty8pVkta/0HFr7usV6lk3i24zCFr2cPUtBU=;
 b=RNa7aqC2pTkgnKszy3/uagaXKojWs+invS2pP2mb2W8j4jdA78IfquAbOyrEMYDKzY
 0biuGASt0Eo2KmRmpeRcj640L+0lXIf17rWevcD59ST5bdOESi8AeK8i3IyKx7vJ93A9
 ILztvQOnMyQJH0ZtI9X3/+00tS+hv1vMrabv6r5n8aBob+w4BggbpiptRiBjlsDwS1Oq
 1LTon+bYEqfRNlgYWiKmMbgjpm3KlqX0Y2m3n0NGOYZFmb1LQkjQCSpNYAPgsJ6y7Hhd
 R67qBVyUVfYQf9dzE6g2KXRv/tnSlOKf7X1Hw3rhemJiwynnObpwZG/TNJ8hALstIqf5
 1F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791257489; x=1791862289;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m6prDDp1Ty8pVkta/0HFr7usV6lk3i24zCFr2cPUtBU=;
 b=EiV4vY487oJfyDYuwbUxWN23gG+tNRSracaJxhxbzetIJC/KJFT3Kg79gjrzTUCiAO
 x09rbP9RuWT/u/fyupSiwqmmah+4loR8eF68OiPo4/Env4i6T6/ITp8UYqUweIvikTOc
 fbx7e3BVbBmj0QP2iPOVngyfzijmgARhoZy03iQOMYlBoA/cA6eDRvsUp9Z3gBnpkBWp
 xwxMolvYoMNwnCa6gNGw93adXnB1bh+7P153zQtyxMyHiDxPTCcJga/F1YMYg0rHq27F
 vExQBZ25XAEdviM0o6PUXILgIjiBg26zPDlPlRU0uwnOfMoTa+rD3RE7oBZoMwYZRmBa
 73gw==
X-Gm-Message-State: AFuF++kNEyIW0XL+bbRBYB6YQ2wgOQ0AChr0kEBV3bMo1s5EPaRVpucK
 psatRm8ABIh/Hi3tDAb87bcAQ8nCP0mN6iezfeT9xUVYUufb7eoz03fAs+dOQIE12f87K5l786W
 VD2Utlllu5w/mDcSRbvyB4RZVXi8kdlRtzxkcJvq39x/ddewyEP98T1TwKg==
X-Gm-Gg: AYBFou2jiAd4P7vpe11YDvp2VC2DfOncu5Muw9+ModBfyl/9t1oA8KpH4T6XieNxfKO
 qCqQWmbXVkXn6FRwdFkzg7Rs6Fsgs7TEjiUfp5MNztSIO2kPAb/E+5/FDDyFGb7+vCA18Dc6hKR
 U6eDXEE02Ed3Q5yR9sdGrowo8NDRsfIQ+gfuNGsOu9FmRQl6a5cXELtMejm8LBcVjRUFj4om8lo
 WK3DLzAZ2pCo/NwzxZNOVwKlqiaCcJ6tmzapebufx31wmkmsKSIH4osenkLBcB7rUn3xqw65xZ3
 UUqhFbKvQ45sdWJLXqtwWz1CGFjdFo4mFH2A8yQhDjeMjc5HNzfVXemtNiiwvL8LGrdpF/8wLdU
 M5sVq5JNEZ0XlEj/SD9EDSfJbhe1MK819mT+s
X-Received: by 2002:a05:622a:2510:b0:533:a8fe:e430 with SMTP id
 d75a77b69052e-53566911522mr244411cf.14.1791257489311; 
 Mon, 05 Oct 2026 20:31:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2510:b0:533:a8fe:e430 with SMTP id
 d75a77b69052e-53566911522mr244101cf.14.1791257488824; 
 Mon, 05 Oct 2026 20:31:28 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53398aa0baesm111419181cf.13.2026.10.05.20.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 20:31:28 -0700 (PDT)
Message-ID: <05c2264d-4af8-4e2d-bfc8-7dc6b67efc68@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 00:31:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/riscv/riscv-iommu: fix entry leak with ioatc-limit=0
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-stable@nongnu.org
References: <20261005111523.277550-1-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261005111523.277550-1-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac46b92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=lUCqZKV23m20s0B5ic4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: MiOZLH_fg-UPuIWpqVbDPd_ogL6ayDtD
X-Proofpoint-ORIG-GUID: MiOZLH_fg-UPuIWpqVbDPd_ogL6ayDtD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxMyBTYWx0ZWRfX7JCyvp3VPrQ1
 fpG7Lp7ulIKCGBisM5+2FSU+E/PueykG/Q1XhYBXfYeQzkCrI6VzVYcdd2B8UdGC7+YNc/3zj/6
 JdJb9KC9oJhipJ1ElZv1r4CimBrTQJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxMyBTYWx0ZWRfX8I8f7P+vgAUN
 ahiaD3YRe4/oswO+DKl1ROy0wQWhvM2FhkFXxxmKPDYH3DqRUPSrOqfKYCh6Rv/y9OFC1E8KYbf
 /k9jNITmoCQPzaAJup357VrBLgU6mN3X9Zjp8RtJh+3cUN53MwUg+7Kgq8Fm+Voobi90Lsc+PbI
 89qoE547vOpfnyYpttfBm+aNljgnnLB9v0ecNStA5OZ2h+HvWYsdnWORBzb9asE817sCsmEJ6g1
 gCD7Jhr1/Q1yrUA4yl/86Tg3VdLh3fCm5/Y8VNM6AI2HIe+IKjGVCAjwSi+3clMbGiKkDwzj72x
 lnbU69I1Cq6K7ET5aof3K1gr4ajYAKkywrDsySDupH6SP633CJeaNxN8+YIk/dd/z7ksx/c8O78
 RgjBF7PnUYArXvfJTtsjR3kM07BKu7mBdk5EJkkePz4XpUzi8guaOkwn65f01ebsJgw4OD9umYe
 8DrP6gxBn9G6D8Qefug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060013
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



On 10/5/2026 8:15 AM, Tan Chi wrote:
> riscv_iommu_translate() allocates an IOATC entry before passing it to
> riscv_iommu_iot_update(). The update helper normally transfers ownership
> to the hash table.
> 
> When ioatc-limit is zero, however, the helper returns without inserting or
> freeing the entry. Every cacheable non-identity translation therefore leaks
> one RISCVIOMMUEntry.
> 
> Avoid this by disabling caching at the caller when ioatc-limit is zero,
> so riscv_iommu_translate() does not allocate an IOATC entry in the first
> place. This avoids special-casing entry freeing in riscv_iommu_iot_update()
> and keeps the ownership semantics simpler.
> 
> Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Fixes: 9d085a1c3cb2 ("hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> v2:
> - Disable caching when ioatc-limit is zero instead of freeing the
>    allocated entry in riscv_iommu_iot_update().
> 
>   hw/riscv/riscv-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 323a041b4a..866f49cc39 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2919,7 +2919,8 @@ static IOMMUTLBEntry riscv_iommu_memory_region_translate(
>           /* Translation disabled or invalid. */
>           iotlb.addr_mask = 0;
>           iotlb.perm = IOMMU_NONE;
> -    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb, true)) {
> +    } else if (riscv_iommu_translate(as->iommu, ctx, &iotlb,
> +                                     as->iommu->iot_limit > 0)) {
>           /* Translation disabled or fault reported. */
>           iotlb.addr_mask = 0;
>           iotlb.perm = IOMMU_NONE;


