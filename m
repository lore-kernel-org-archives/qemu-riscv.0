Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F8606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9znpmww;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XeZaHqpX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJWR8-0001Bc-KZ; Wed, 21 Oct 2026 09:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJWR6-0001B5-OE
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 09:32:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJWR4-0005mC-Fv
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 09:32:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LDNAU8402915
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 13:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9pLF8mIHWOk5zqg++YoP18PKV2FEaBQenve5hwcvq44=; b=G9znpmwwkJUJrK8R
 Iztbu/IqbYMIIDvTKzyJEZWKOTxqhxwR8+Tl85y15W+WJhC7BXCrXh23vzFeVIKo
 hM4Fc0VvAM/8kYV85DQwhDoNIC83Xi/Dto+I7TZIXZOODFEfoNxzLdzkHD1IKSnH
 Cn/OFHR6uoT4CriCXNWmXNhobE8DHthlrlw5ZdDDuxZevPm8fJVq4JMuEoXUl7z+
 Du3hfMQlVIS1dHdm+vwRvJpLY/JUgZGy3/jfXhy4mpX7e0Ibu64gIF0IwhuOMEff
 xwXKf0mYNwlKhZY7M7ubXg4d7fBGrpTfo829d7MROpFZJJwo2yrm73QohZHJ6wLg
 LvFLXA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr1ss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 13:32:53 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-8b0cfe694c3so9473387b3.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792589573; x=1793194373; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9pLF8mIHWOk5zqg++YoP18PKV2FEaBQenve5hwcvq44=;
 b=XeZaHqpXTimVl5HvCZmJXB8nKL8wtj3P0r7hc7uHIAzioA9GENcRe3xIQIBfW/DOtc
 zLHL3bC74QxORh9MtdEYgbP6ojNsQC2gT1N64kCfJMihOm2/7Pgqk7sVfb6suSm/HeeZ
 NeuTDD32A+MyVx+JLebAZjFNLHpZmTq03VvccboFlMDxr+O5Ff+GbL45emGzNtuEAobu
 Vi37a+tdLN+ZUN2z+/JiW6yMpqpL0OmYvoJsZY5937DLSe0iv/8GjPGzM5GOX9Nl6K/j
 oSVIJHLOg0mpjGx8xJI9BWeGrNUcqOiWkW7owwAvyJa/bRzPxAerw93G+knPbGytwGPe
 nclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792589573; x=1793194373;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9pLF8mIHWOk5zqg++YoP18PKV2FEaBQenve5hwcvq44=;
 b=DV5LGj0WByAwAmGE9pVbTiECi8AUqrvR5RAF6SCebvbfGOt4BswYVfNAVLRRmlWQ1Q
 OMgBMCTdK7lLZXjdSRT6jnUcCWI2TXED0NQMD2f4S6pbma9Fur19imjRLcD1JDtCwJK4
 0ExVkXi/y4lxQviDEZWckXMYuySuSG2BWeK9goFyyXPWyP+t78Cll5KMIJ1oauPsb+MD
 JyumnY/CHHAH/NtuS4yfOKK9qjyWw7xcodz7MJfxL8qnu8up7lM9RDrciuHDimnScV2p
 HRT1i49W0Z4rPme1FhSVjZxnzTO3NQPYlVhtwuZ53fHoEImas1hy6GAsGmnCS37yCEDi
 Zxrg==
X-Gm-Message-State: AFq9FYLVaxB51C27JmSfdHarH0nKVbVBc9YfD1iTNW3C2r3ByHavdEbg
 l1ezE399moksZmNTUTPlIaveF7Q7v5sGb9ZvBZtyN/6OLAYu048A4DawokNdXCtEIqnEKCMV+Nl
 H6nyyXwkFZ1wfM4TI+OxPATBPF0s71nBiKakgyk7RvsELhzaVN5kPvHPB5A==
X-Gm-Gg: AYBFou3kDDcPkqc1ETJfkHDn59ruj1JSE4/sb1IWs67ciQnnFdSFgLfhf49OF/+OuyM
 Q/T+ziipVgyCJXEdnOhX7k4eLi1buutU1JrBWaPkGaI17NCjS3pRFavjrqke1a/SF4jYHntRK3w
 ydO38sYEzFNPRGnWajVdiZlCpnoasjt+4e+ziN+VpnHHnqLEh3m51hv0sTohQ7DJihvBUgQeVD9
 nBUnO2J3XBetcE4Ol6pC9duMGZiSmpzsB52hmXxVJ/Sk1m7eTdj6UeDb9Lh8wgwSxQM7dOCq4Yh
 lyGxRqVGVuep1V2JMTmdMq5T39paWpSEkTgHLeo2OKcodguquSLcZLnondSNmZ1+SfTBh3Q1w6N
 cRRaMo0OOFqkKkx2yCK288QFHnMy8D93KIsZZWZ208cQ7Tnb07GBxspOZ1+aoypcEI+h/mFpI
X-Received: by 2002:a05:690c:660c:b0:8a8:6fac:21af with SMTP id
 00721157ae682-8b133c99130mr12106467b3.12.1792589572609; 
 Wed, 21 Oct 2026 06:32:52 -0700 (PDT)
X-Received: by 2002:a05:690c:660c:b0:8a8:6fac:21af with SMTP id
 00721157ae682-8b133c99130mr12106207b3.12.1792589571968; 
 Wed, 21 Oct 2026 06:32:51 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b12ff04e1asm10944037b3.1.2026.10.21.06.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 06:32:51 -0700 (PDT)
Message-ID: <5576bebb-3c2a-480b-ada0-bbbbf3fe6b7a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:32:48 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 3/3] hw/intc/imsic: Add in-kernel imsic save and
 restore function
To: liu.xuemei1@zte.com.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, peterx@redhat.com, farosas@suse.de
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260602143335139vSrlCbb4GSWlGSnOMETFs@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260602143335139vSrlCbb4GSWlGSnOMETFs@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EayMo8oiWPORytb5nmJFczA74SGrWWS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX1Zy6zR6wvdG0
 Gjr7ExirfUc78Mb+Uazn0vinemUiW6dKTBtBwYIbnBeCyWyvu2YfF9kzjB7AZRG3Rqk+YmF2ZZ/
 4l31s4mBATYEQp88Ob+FVf69PWzeEVY=
X-Proofpoint-GUID: EayMo8oiWPORytb5nmJFczA74SGrWWS2
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8bf05 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=1RTuLK3dAAAA:8 a=twNBsePXMh2ZGtmFprsA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX8VcDBuDCnQ4a
 W9jDdN8mHaHoKQToNIkJderfcuqosBeaREr5JSsDYctfwX4YjCo3oYKwZHemlSHwy8garKwRFPI
 BZtrnh2jsnXAI4xKUxS39z8b4LcSvaRa8SoGV3+kwjJrS3Mz7umV0A8UUCdNw5v0XWj5xPcchs7
 XyELwm5cM51JSSyliP6t5XVpcG9eiQNKmX9ScGIUE/XB4Ueu53eJaeCaVeuW9s1KVSH5Ql3klrF
 OLnzhpj8bTo4dFiguSmvjkjQZhrNbmsBUJFZbXvh7ZeQpjasKKYQXiu6wmIo4nkYhI/SQ9RWfNB
 yiOXuk1wwy2LD7i0L5RWD8XgX6jC1yOxA40Aa+DHqFHCevbPzkYA5CvR3quFzHe0thKVi9lnycn
 iUyEVxjjMuB/QL5AOsywXf7q/Gmy7ggymhWebbh6xCkPrIV40PcTM8Oh8KK31Qi8GBCjIfUKd+D
 sUTyfyAb8hxJ76QekMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210053
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



On 6/2/2026 3:33 AM, liu.xuemei1@zte.com.cn wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
> 
> Add save and restore funtction if kvm_irqchip_in_kernel() return
> true, it is to get and set IMSIC irqchip state from KVM kernel.
> 
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> ---
>   hw/intc/riscv_imsic.c         | 171 +++++++++++++++++++++++++++++++---
>   include/hw/intc/riscv_imsic.h |   3 +
>   include/qemu/bitops.h         |   1 +
>   migration/vmstate-types.c     |   1 -
>   4 files changed, 161 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 6dbbc152a2..bfce181af9 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -34,6 +34,7 @@
>   #include "system/system.h"
>   #include "system/kvm.h"
>   #include "migration/vmstate.h"
> +#include "kvm/kvm_riscv.h"
> 
>   #define IMSIC_MMIO_PAGE_LE             0x00
>   #define IMSIC_MMIO_PAGE_BE             0x04
> @@ -382,11 +383,16 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>           qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
> 
>           imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
> -        imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
> -        imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
>           imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
> +    } else {
> +        imsic->nr_eix = 2 * BITS_TO_U64S(imsic->num_irqs);
> +        imsic->eie = g_new0(uint32_t, imsic->nr_eix);
> +        imsic->eip = g_new0(uint32_t, imsic->nr_eix);
>       }
> 
> +    imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
> +    imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
> +
>       memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
>                             imsic, TYPE_RISCV_IMSIC,
>                             IMSIC_MMIO_SIZE(imsic->num_pages));
> @@ -417,23 +423,17 @@ static const Property riscv_imsic_properties[] = {
>       DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
>   };
> 
> -static bool riscv_imsic_state_needed(void *opaque)
> +static bool riscv_imsic_emul_state_needed(void *opaque)
>   {
>       return !kvm_irqchip_in_kernel();
>   }
> 
> -static const VMStateDescription vmstate_riscv_imsic = {
> -    .name = "riscv_imsic",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> -    .needed = riscv_imsic_state_needed,
> +static const VMStateDescription vmstate_riscv_imsic_emul = {
> +    .name = "riscv_imsic_emul",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = riscv_imsic_emul_state_needed,
>       .fields = (const VMStateField[]) {
> -            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
> -                                  num_pages, 0,
> -                                  vmstate_info_uint32, uint32_t),
> -            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
> -                                  num_pages, 0,
> -                                  vmstate_info_uint32, uint32_t),
>               VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
>                                     num_eistate, 0,
>                                     vmstate_info_uint32, uint32_t),
> @@ -441,6 +441,149 @@ static const VMStateDescription vmstate_riscv_imsic = {
>           }
>   };
> 
> +static bool riscv_imsic_in_kernel_state_needed(void *opaque)
> +{
> +    return kvm_irqchip_in_kernel();
> +}
> +
> +static int riscv_imsic_in_kernel_pre_save(void *opaque)
> +{
> +    RISCVIMSICState *imsic = opaque;
> +    RISCVCPU *rcpu = RISCV_CPU(cpu_by_arch_id(imsic->hartid));
> +    bool is_32bit = riscv_cpu_is_32bit(rcpu);
> +    uint32_t inc = 2;
> +    uint64_t attr;
> +
> +    if (is_32bit) {
> +        inc = 1;
> +    }
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        for (uint32_t i = 0; i < imsic->nr_eix; i += inc) {
> +            attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                                  ISELECT_IMSIC_EIE0 + i);
> +            kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                     imsic->eie + i, false);
> +
> +            attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                                  ISELECT_IMSIC_EIP0 + i);
> +            kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                     imsic->eip + i, false);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int riscv_imsic_in_kernel_post_load(void *opaque, int version_id)
> +{
> +    RISCVIMSICState *imsic = opaque;
> +    RISCVCPU *rcpu = RISCV_CPU(cpu_by_arch_id(imsic->hartid));
> +    bool is_32bit = riscv_cpu_is_32bit(rcpu);
> +    uint32_t inc = 2;
> +    uint64_t attr;
> +
> +    if (is_32bit) {
> +        inc = 1;
> +    }
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        for (uint32_t i = 0; i < imsic->nr_eix; i += inc) {
> +            attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                                  ISELECT_IMSIC_EIE0 + i);
> +            kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                     imsic->eie + i, true);
> +
> +            attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                                  ISELECT_IMSIC_EIP0 + i);
> +            kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                     imsic->eip + i, true);
> +        }
> +    }
> +
> +    return 0;
> +}
> +

This has the same build problems as patch 2 - we need to filter out the KVM
specific builds when doing a TCG only build.  Using #ifdef CONFIG_KVM will
also work here.


One more thing:

> +static const VMStateDescription vmstate_riscv_imsic_in_kernel = {
> +    .name = "riscv_imsic_in_kernel",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = riscv_imsic_in_kernel_state_needed,
> +    .pre_save = riscv_imsic_in_kernel_pre_save,
> +    .post_load = riscv_imsic_in_kernel_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_VARRAY_UINT32(eie, RISCVIMSICState,
> +                              nr_eix, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(eip, RISCVIMSICState,
> +                              nr_eix, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int riscv_imsic_pre_save(void *opaque)

Both riscv_imsic_pre_save() and riscv_imsic_post_load() are KVM specific load
callbacks, so I suggest renaming them to add "kvm" somewhere in the function
name.


Thanks,
Daniel

> +{
> +    RISCVIMSICState *imsic = opaque;
> +    uint64_t attr;
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                              ISELECT_IMSIC_EIDELIVERY);
> +        kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                 imsic->eidelivery, false);
> +
> +        attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                              ISELECT_IMSIC_EITHRESHOLD);
> +        kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                 imsic->eithreshold, false);
> +   }
> +
> +    return 0;
> +}
> +
> +static int riscv_imsic_post_load(void *opaque, int version_id)
> +{
> +    RISCVIMSICState *imsic = opaque;
> +    uint64_t attr;
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                              ISELECT_IMSIC_EIDELIVERY);
> +        kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                 imsic->eidelivery, true);
> +
> +        attr = KVM_DEV_RISCV_AIA_IMSIC_MKATTR(imsic->hartid,
> +                                              ISELECT_IMSIC_EITHRESHOLD);
> +        kvm_riscv_aia_access_reg(KVM_DEV_RISCV_AIA_GRP_IMSIC, attr,
> +                                 imsic->eithreshold, true);
> +   }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_riscv_imsic = {
> +    .name = "riscv_imsic",
> +    .version_id = 3,
> +    .minimum_version_id = 3,
> +    .pre_save = riscv_imsic_pre_save,
> +    .post_load = riscv_imsic_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
> +                              num_pages, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
> +                              num_pages, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * const []) {
> +        &vmstate_riscv_imsic_emul,
> +        &vmstate_riscv_imsic_in_kernel,
> +        NULL
> +    }
> +};
> +
>   static void riscv_imsic_class_init(ObjectClass *klass, const void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
> index fae999731d..2206d82e0c 100644
> --- a/include/hw/intc/riscv_imsic.h
> +++ b/include/hw/intc/riscv_imsic.h
> @@ -54,12 +54,15 @@ struct RISCVIMSICState {
>       uint32_t *eidelivery;
>       uint32_t *eithreshold;
>       uint32_t *eistate;
> +    uint32_t *eip;
> +    uint32_t *eie;
> 
>       /* config */
>       bool mmode;
>       uint32_t hartid;
>       uint32_t num_pages;
>       uint32_t num_irqs;
> +    uint32_t nr_eix;
>   };
> 
>   DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index c7b838a628..a7f86f2ee0 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -20,6 +20,7 @@
>   #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
>   #define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
>   #define BITS_TO_U32S(nr)        DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(uint32_t))
> +#define BITS_TO_U64S(nr)        DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(uint64_t))
> 
>   #define BIT(nr)                 (1UL << (nr))
>   #define BIT_ULL(nr)             (1ULL << (nr))
> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
> index ae465c5c2c..7e6f37f8c4 100644
> --- a/migration/vmstate-types.c
> +++ b/migration/vmstate-types.c
> @@ -597,7 +597,6 @@ const VMStateInfo vmstate_info_tmp = {
>    * is an array of 'unsigned long', which may be either 32 or 64 bits.
>    */
>   /* This is the number of 64 bit words sent over the wire */
> -#define BITS_TO_U64S(nr) DIV_ROUND_UP(nr, 64)
>   static bool load_bitmap(QEMUFile *f, void *pv, size_t size,
>                           const VMStateField *field, Error **errp)
>   {


