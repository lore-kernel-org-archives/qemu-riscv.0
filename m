Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70588C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 10:54:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXjg-0001Jb-AF; Thu, 27 Aug 2026 06:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXjd-0001IF-9g
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:53:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXja-0001oN-S1
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 06:53:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9Gtqo027270
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /+pBUL78aL6jR5JQt1qGGicqOnD9HNZjaq0DKQ87DGw=; b=Nmixq/C3xun3eGXG
 CGVG1tlmGBh07KYH+F9goeeBwj/PwpYxW/zjfYILVzj0xHGeZFYW4CbCeaoyfPTp
 +4pgum4mju6bS07aTZRrOOjXoby6v6j4DdvDiinNGKAdOm32e1ncxGhji5LPlhH3
 EmrY8TrEKA5FaFmfuCq3OtHhz7bsNi2DRdkyMG3SOkil7arkHf/qkfszVa7k3s29
 EXw5oHhlL9SLA8WH7gCg4HLuBcUvs+oCOoJdweOT/cFrgQUAZcHM2wLRpnGB9sOr
 vY2AgRqG7qvIYz59mbN2dqibnfxXG9jbmvh/e6rRVN3/Ob+JcN+58fZuzcl6Phtk
 +oyYtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbva7t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 10:53:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e538afe65so73540185a.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787828004; x=1788432804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/+pBUL78aL6jR5JQt1qGGicqOnD9HNZjaq0DKQ87DGw=;
 b=PQW0yMaP/n3R0PTysjGBQpsZE/qVOVi9ON28zSIcx1I2pMZI0GVmASr/opL6kee6P7
 KFlTYBJyrm8glBvl2AEXd6owJ7FmkBL/jFJVCRcYHNolTsXfY+Qy8sctU1wp3aktJdsD
 UNevC1XGTz7rUSyq/v+4g7ClncbSy1V64uTPrMvdZb8hZm9qtW2hExGROUQNbK4LyJgn
 +EiOJK+DeQtYr+wt+vJAuCIBniU0uNu96zcxdkq/uyng+jeKtO1K+bs7HlzVxsqI+1oz
 rdHSywtRSi8tq5WqOALBA6AbwoKWWTHS88Q5t+0vjXLBd5eMQULX03dNqrUYrR65ajvs
 CSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828004; x=1788432804;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/+pBUL78aL6jR5JQt1qGGicqOnD9HNZjaq0DKQ87DGw=;
 b=Ey7qbPMAMdTegiWSMY8VdQ9zYD4Hv5qmxbdLky62/nLTBbeSI8fHszrrI4DwYpSRVw
 wboK4WYaC0p12+RaWfSpJTMrABLcv2e89GPBWjR3M7y0cs/f2h0zYFXrIf02XwlNUZ2L
 Ug14mVhmzfDUJgbYDARBnTqBVwCTsaYGSG423FrF5qYOXQHOxNfjQF1XzG71gkOt/zbu
 Fnkw22DwVP5r0IYn1FuTT85i90GKbIa2L7sw9RSN7BPw0mEwK9n5DcHvWPwbyCMBd2g6
 RBPCkIOwLcNWWFBZ/GUzL8LYpxjR6ypryjgUaeXRKUnqqQSVmfCiEZSLbdtFehN0vrQ1
 Tf7A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFpMv9qGODsikLab22uzn26R0KRxO7UbVlnok0T4lfAfQQfMGmLQ9q1rlvHI4fZMGjjGOe1CNeLYJg@nongnu.org
X-Gm-Message-State: AFuF++l+c76uTKHDkTmjcSoxx6nhOO8Jn/gQxU4bEyp2CwspE7i6lzgj
 4RQJvrzKTC1CxJHblUDRDiK6O2O0a7j4NmfU+szS7yClnFtKDZQk4YV0TCOSyZ9rcE2xMce/Oq7
 zKTebUMfEkQ/x4ZtnlNLA/6DVxuO/LyHdfzdaoiXKvx5BYDHhkxAUBEmCHg==
X-Gm-Gg: AR+sD12T1s+FSSf12SxtnEto2h6CJoyRd0kCOAAiN+iIiDCkNI3WtQf4PRZwBPN6bux
 Q2oB52TQ0plJUp8I9NwpoRQj4qsoIeDLIU0LBj0O6oFUxp9Xqvs9OUEmY5yI2b6MHddq715kyDY
 cOV/DuBodpv1ucPQzYbuHBLm+yJFDd7YYL9w5QeoXQTauLIn67rQqUeofja260VxZ5X1vFZECSt
 ihz+gDIF1BLgWdNlGDtjoVQ3utCullzwF1ontiIle8XVoQw9psSf3yeDU5g2Akk1KOnkT4XCieU
 QV/SBiMy0EryN14SwldJL2eoYZsEn72Y+uOrWfoNYvx4T//VvjcQFIwnwNHZKz3BBwFamOEgNnS
 N4KX40j46yKAcKNtFYbhs8eHlO+0TtIzIqFHA
X-Received: by 2002:a05:620a:618f:b0:923:7821:dc0d with SMTP id
 af79cd13be357-93780446b68mr1490489685a.33.1787828003912; 
 Thu, 27 Aug 2026 03:53:23 -0700 (PDT)
X-Received: by 2002:a05:620a:618f:b0:923:7821:dc0d with SMTP id
 af79cd13be357-93780446b68mr1490485285a.33.1787828003435; 
 Thu, 27 Aug 2026 03:53:23 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e30a2e9sm414898785a.2.2026.08.27.03.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 03:53:22 -0700 (PDT)
Message-ID: <4b5ac2bd-b7f3-4992-a85f-609183e06125@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 07:53:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] hw/riscv/aia: Take a MemoryRegion for the created
 devices
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-2-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826220528.54516-2-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mwu6ZePYDskli3i2SEfwv-KhxaptI9dm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5MCBTYWx0ZWRfX2GvefhldRxBD
 pTFHeZ0S7jdEgC2n+s9L3mK/DlmePVFnS2KLUz9VyyA8y85HzRo3MlVJpd2zXm23/hrfcDX/Fqh
 baopABl+vPEFxPg/d9vCC6dBkqkioA4=
X-Proofpoint-GUID: Mwu6ZePYDskli3i2SEfwv-KhxaptI9dm
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a901724 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yi6NrY4SRzBuVuqO5NkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5MCBTYWx0ZWRfX/hfm3VLFeiRR
 ArVQIH6dewy0vGpt8Rme/3l5C00XLzHJAXJNMiykX6ViWusq0myZbmGs+DB9uY66kxpXwO++RUl
 PaTxFKXhgyBmjiB1fH2NHpAQXaFrvYNn7tABnCfWVXlCsdmWKreKkL79/4FYefwo8648eZMGzGh
 CfLtoUDcsrS1vTHEqa4Uxmouk6uxGBrOiAqvUoiQO8ZEGyhNrfdm+jjBSC7Mjm0GTZpWZzcnNPV
 4pWpI8LPNGVruVYzb8xCYjCV+1tg1u4vT5kN9Ig1SL1PGKQSbUeHvgFTY4kVcmld/h5uYyZi2d0
 TdCFljxfEZtw3kM/9307lMZ+1Rc+rXiZXDXwwowejJBtipaOdqI+f19d56Zv0JiMSeA9ifJ3sW6
 KsHEsskMwlTt3hGDH8GowUNDSCKagWxLWR0a3/aTQYQS/x+aR7QaF9LeiG0hszqsb4fGGY+hJlU
 gxRU/lwLmm7dahmV6yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270090
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



On 8/26/2026 7:05 PM, Joel Stanley wrote:
> Add a MemoryRegion parameter to riscv_create_aia(), to be passed on to
> the IMSIC and APLIC helpers so a SoC can have the controllers mapped
> into its own memory container. Both callers pass system_memory, so there
> is no change in behaviour.
> 
> As the controllers don't yet take a MemoryRegion the parameter is not
> yet passed on. Changing riscv_create_aia first avoids churn in the
> intermediate commits.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/aia.h         | 2 +-
>   hw/riscv/aia.c         | 2 +-
>   hw/riscv/tt_atlantis.c | 3 ++-
>   hw/riscv/virt.c        | 3 ++-
>   4 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/aia.h b/hw/riscv/aia.h
> index 3b6d7f962506..82ab601bf188 100644
> --- a/hw/riscv/aia.h
> +++ b/hw/riscv/aia.h
> @@ -13,7 +13,7 @@
>   
>   uint32_t imsic_num_bits(uint32_t count);
>   
> -DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>                                uint32_t m_imsic_stride,
>                                uint32_t s_imsic_stride,
>                                uint16_t num_sources,
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index c1a5982856c5..651552c8f970 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -24,7 +24,7 @@ uint32_t imsic_num_bits(uint32_t count)
>       return ret;
>   }
>   
> -DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> +DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>                                uint32_t m_imsic_stride,
>                                uint32_t s_imsic_stride,
>                                uint16_t num_sources,
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index babce2b680f2..d69851df0a01 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -496,7 +496,8 @@ static void tt_atlantis_machine_init(MachineState *machine)
>                               &error_abort);
>       sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>   
> -    s->irqchip = riscv_create_aia(true, TT_IMSIC_GUESTS,
> +    s->irqchip = riscv_create_aia(system_memory,
> +                                  true, TT_IMSIC_GUESTS,
>                                     TT_IMSIC_STRIDE,
>                                     TT_IMSIC_STRIDE,
>                                     TT_IRQCHIP_NUM_SOURCES,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 329ccdb5a7b6..22a607ed10bf 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1411,8 +1411,9 @@ static void virt_machine_init(MachineState *machine)
>               s->irqchip[i] = virt_create_plic(s->memmap, i,
>                                                base_hartid, hart_count);
>           } else {
> +            bool msimode = s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
>               int imsic_bits = imsic_num_bits(s->aia_guests + 1);
> -            s->irqchip[i] = riscv_create_aia(s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC,
> +            s->irqchip[i] = riscv_create_aia(system_memory, msimode,
>                                                s->aia_guests,
>                                                IMSIC_HART_SIZE(0),
>                                                IMSIC_HART_SIZE(imsic_bits),


