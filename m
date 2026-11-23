Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0C606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QKxar+mB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/woBh/U
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVaI3-0006Bo-2y; Mon, 23 Nov 2026 15:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaHy-00066t-96
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaHw-0002DJ-K5
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:22 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJuFuL3332533
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BoMnSgKCuyqwgoFZJ4WBn7Kvl1YNqVVxk85wmsIXcY8=; b=QKxar+mBwAdPnHoJ
 V2NTXGMcv5JTnv0rx02w2zF7Pws8fOpVadT6smdRq/tVfim9NMilfV2rurDaN8vU
 UJMA/7L4rrUUnfpFWn4+CUU1sxnhXmjxQCKT47805dtQ7dv/FQJunoUJm/bOWvxi
 A1rDOu5QUg0poH/ocsC3xAR0TTTa0GQlikyJob0f6RvyzD0OFeyRQd8j/Ok1peVb
 2GHhf0BbocpJGbKyIfUJO6Fh6Kc8F+CQUwgWmzgWeMek6xoEwEFNVt63diwBB3kV
 ublzumkAxXAoyJVFpPa2YfUFyrhnkDyiFOK4KgCw45iFwc5TcM0exKBwIGrSAO8r
 xxcQJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr8d3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f2373e9b4so404179485a.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795464319; x=1796069119; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BoMnSgKCuyqwgoFZJ4WBn7Kvl1YNqVVxk85wmsIXcY8=;
 b=D/woBh/Ui+mCmZNalFiaoWClGQLGzKKaTDMalqTXKn18gPrDEd+MYXEE7Mmd/0tK0b
 6a00pr/y3a+fHha4MihuWqx2tUaMcWbEUECvwWmVxrd/THh2MHqJZVel9M7QCASqDCQa
 wO4gJb2q082bQoAuOr40TrpQDllqLYhooSgPI1WPxAC0XwiFMYJuJM0y2H6uZXIcNT/+
 sNHI0Oq5FvwYM+UMRCE4+JjbZIrisCC8wFG3nIcxXmDvXh4jti2GtxM0oW4lTeUiwj/f
 DIp7mgopEkV39Rk/4AFmMW9H22jWrZEiyQaFuYy+LE2r9z8iLfCVO2rqFou3f6dsvrDv
 xgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795464319; x=1796069119;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BoMnSgKCuyqwgoFZJ4WBn7Kvl1YNqVVxk85wmsIXcY8=;
 b=SPgCRraktDfht1/GHlgrDdMcbqOJNqnAT+M3Wpl3l4OO4+dSvRXEBpl0lljDJFphWs
 JDIatki6vNMZxhV+1AjPN45RWUHS9aMhfK33R7Hh3kpXN6ZQ3MkaQSo/JYWWVU/7BzZr
 Xm6gN06x/7GOSUNSt9b+CkeZGG4zGFNVIUZ8F9hF0gzJzPkCzFS77BMA+TbTQ2ralepg
 vNVC2nBsMTCu4HY2KYCIqqJ5TuWCGFMgUPj3ASJyMDzuJz+CseuP8ISNpxtZ0IZMfG0Z
 9ab9UZ0KR+nGtqKDGrxtuLhKNXqw/KdbghB7CVleByTAtUMVS8qt8nqLtHW29c0Tt61P
 YwrQ==
X-Gm-Message-State: APuU4Z8669+EQJzu8l/0B56eX+0meyK4Y15rSk/iBFAZfjtTBjLRIgxW
 V2LcZ6SfZjhXSt6LxK3KcjjuJ+XS8kQaxvNbMbfJsk+b+Li33nJ3wjjWOMKis72Iz8ahqSUvDme
 eoMC+B7nQJpR1JkCkbVMM9lWon0/kHK6McESxK0ACCdxk0vC0IEc98eCf3Q==
X-Gm-Gg: AZFdTZdVW7gpL9aiYVJX+X5KVTLbBjo20GDTAr23vsYiwyXh6NVzOFDuZ1/hFUuj5pE
 M2urQage0qLvkFKzBT2DVgjSM2NSQyBy7ozS2Gi+MeGwqk5mOqS9DzFemtVFeZCAyV+5S2qbAYd
 hhL55Ay9/vQ9/5TjcbcB5nirqjHOca3h0AIw/+0AS0T8ENkELfm20oHeilkO5PPaDh48GrLOsY8
 x62klcXNWjK682/KdFvy+ZITK+DJEgW2XNC0J31eur7irPHezAAM59AiLM2QLD5QfBg06bscYsI
 /HhTYWAEyhjy9zamjlI09RV/Xk+LWzDhyAjWeEqE6L4x3Wi5Z3PwdmQMAKaBSp5TCgHxK5lDNly
 NcoU7oOA8HNJkjCHRihepobnuA8rApjwGJmpBLD3mJchDr1jEe67KTmZKa6JXyPQoeAVUyrwQVU
 IsH0OJRraZ
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id
 af79cd13be357-949bac80948mr2177807185a.79.1795464318587; 
 Mon, 23 Nov 2026 12:05:18 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id
 af79cd13be357-949bac80948mr2177803685a.79.1795464318058; 
 Mon, 23 Nov 2026 12:05:18 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949ca6a0693sm668728685a.20.2026.11.23.12.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 12:05:17 -0800 (PST)
Message-ID: <6b9a3884-393e-4f3a-9b47-e7a19438d3da@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:14 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/riscv: iommu-pci: Add migration support
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20261119024251.280765-1-tanchi25@mails.ucas.ac.cn>
 <20261119024251.280765-3-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119024251.280765-3-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXzccj/wiaO1cL
 gf7sDkzn5CHXN3HUqP4KI2AZcaR4zQRP4yulc6xHRvFt45B0LNKuA6dyq93+vU3erHpReOKuKLi
 Q/QnilZG7ojnuyBbtC771QxUXJoPTZa/bh90qpiTFQpg31uPN+MRzU8FuLMMzn+8SYOC7QvgEn2
 RL2qj5oxtRVX1RHvqjY8YyDyaXeeZHWHG2X4SfUal3LUDOgOUsDFOn9A812jDAZhI1H9Yhl+P/h
 ZIELcpkS3sXQoebwnxCaH8FDTw4zXdV4QH1aoOy2/UkmNoNpUHIO9bb1IXCMiDnJ8RV+YjVOn9B
 p4V5tel1efSRh6rf9sSWg6ORopsG7YFfIq00ElbL0GX3yAJa3nN26d1YmoG0pYC1ZoP4ruJmH7s
 fEgL2XgZ+29/EdrGNiLpnUKjiJuH81n4DQvZssNWgPmoam7O7HguppHikffj6ngMo5FjjZuM6Jy
 fs3BkWiyN93ovYUsfWw==
X-Proofpoint-GUID: Lw50mkesJE1u3vyBysFPQAVpN0ajztbb
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049c7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bAV9XMTbiyrS9rdrDgIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Lw50mkesJE1u3vyBysFPQAVpN0ajztbb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2/dUojbINRUc
 ca+o3dv2qbG5chSdgpgEUZ/vrj0s12gm8bigFj9ZpLP+NWejoe8fBd9i1FZG2ZGsZrlCUtOGsF+
 yUFYdhth7Ub8/a0/Vny/8fFWSWUG2xY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 11:42 PM, Tan Chi wrote:
> Replace the unmigratable VMState description with one that saves
> the PCI configuration space and MSI-X state.
> 
> Use the existing PCI migration helpers to preserve the MSI-X
> table and pending bit array when MSI-X is present.
> 
> The common IOMMU state is migrated separately by the embedded
> RISC-V IOMMU device.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu-pci.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu-pci.c b/hw/riscv/riscv-iommu-pci.c
> index 14dd5f3857..d149032cd1 100644
> --- a/hw/riscv/riscv-iommu-pci.c
> +++ b/hw/riscv/riscv-iommu-pci.c
> @@ -143,9 +143,23 @@ static void riscv_iommu_pci_exit(PCIDevice *pci_dev)
>       pci_setup_iommu(pci_device_root_bus(pci_dev), NULL, NULL);
>   }
>   
> -static const VMStateDescription riscv_iommu_vmstate = {
> -    .name = "riscv-iommu",
> -    .unmigratable = 1
> +static bool riscv_iommu_pci_msix_present(void *opaque, int version_id)
> +{
> +    RISCVIOMMUStatePci *s = opaque;
> +
> +    return msix_present(&s->pci);
> +}
> +
> +static const VMStateDescription vmstate_riscv_iommu_pci = {
> +    .name = "riscv-iommu-pci",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(pci, RISCVIOMMUStatePci),
> +        VMSTATE_MSIX_TEST(pci, RISCVIOMMUStatePci,
> +                          riscv_iommu_pci_msix_present),
> +        VMSTATE_END_OF_LIST()
> +    }
>   };
>   
>   static void riscv_iommu_pci_init(Object *obj)
> @@ -193,7 +207,7 @@ static void riscv_iommu_pci_class_init(ObjectClass *klass, const void *data)
>       k->exit = riscv_iommu_pci_exit;
>       k->class_id = RISCV_PCI_CLASS_SYSTEM_IOMMU;
>       dc->desc = "RISCV-IOMMU DMA Remapping device";
> -    dc->vmsd = &riscv_iommu_vmstate;
> +    dc->vmsd = &vmstate_riscv_iommu_pci;
>       dc->hotpluggable = false;
>       dc->user_creatable = true;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);


