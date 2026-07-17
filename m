Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1086AC4451C
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:55:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wki5g-00065O-S4; Fri, 17 Jul 2026 08:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wki5S-00064v-5K
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 08:54:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wki5M-0003Fm-L3
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 08:54:39 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HCTHYA1589947
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 12:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yXZaMSWvkwDTFlrh4bGQRX0djyThMJWVgduAgswL2rs=; b=jkWUbyCZ11veVMhv
 jUd/+ywWp1mPCRHmK2Pf50s5t2RZ9VzjJc1a+bSb3ZvKCt9GNP3SVI63qe0CgqSf
 bf8UfzaLMqahL5vort2s3LGopQ+0STz92S9NNeZ8PAarNOGjpMNKCrTVKil3GnXj
 oLdYUYZmZxPmmTl3gRFNsxeChJPmgnGhTnPRuHVdltnXsh6ySG0ec0Lw5RpEbZaF
 3PC7l5GwZgGmpzD5o21i/Iy3G0CLJT46XKSC/wYnqnxAZCC9yocR/hRvM4U2U66b
 eA0olMsKreRmjfQrg+5UiC5rdqIRS9MnQxFuJUyrV7fmP+SQ/1i8gIJIVqKKlx4E
 hg5HhQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8krr3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 12:54:34 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-81e735bcceaso89565357b3.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784292874; x=1784897674; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yXZaMSWvkwDTFlrh4bGQRX0djyThMJWVgduAgswL2rs=;
 b=OJArvfV2ABxuK9QgW48dbxltaw9CChNfBp7Q9wLCPY/2Lz5RjT3Gh6KUVqSARG1M23
 ktFAtMdL7ZnWAlqXG3rzJT9ne4BQO70njYL6D8KZlL37pRYKEJN/rUfPLY6AzS+/jffU
 Wr/qa7YQm9oF1xlD+TArDEfTdT6OsirJM4gN67vLP8ebYV5VavchYOA9mb4O1KI+KUQY
 lDuACj4lif9tJVfopq23gZ6kN3UZybUTTFgKViEZv6uiOeWMskDJDROu1flD2eFcGKdX
 9iIlUdYOnRAdOHdpnCcIIWIpLo4/L/7PTqYzp54B6vENoNkC6jBgOb88DyOUfG6qZjJO
 Rmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784292874; x=1784897674;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yXZaMSWvkwDTFlrh4bGQRX0djyThMJWVgduAgswL2rs=;
 b=IGZuzSp33RS2qfxT8VLI6E4wIZKG7Sdo7VAxeSfGWw7M3T4hw9mIvLwQuOh862SDXt
 2ZgUogfhxYz0Z9czYfQJfiaXMPz011vXSocVbOMGDehHWDtc6wDGJCc+wmYvMm8TzCQP
 cEEtTSBRevvK8vGF2RDP2Ag3Drp3adLYyjC/VToW988qW22CPBMJFKkQsyx8ulvJpslB
 ucKMFwt11FtP8GptITLrrjZj7N6diGFQVpLBVZR7nd+HAkZ/EVCGscJj65ikOh3+Q5F7
 4jgHV1KrS5iSeOAs+5LhxKL/D7clmF4bM4nr+RQIZuP7Lxd5NZP4wXUFp5urtwAmuKpe
 wKRg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpfYOSMyyDdXfjdIo6HfcRzMgIWllMr0w6XI6uNUpAMk4STDrItB9JARHOrcMm5ec3Dj+zLP4uijPcq@nongnu.org
X-Gm-Message-State: AOJu0YxNRpdbhUUxvz/sV55UeffTCmDlX0RLv/e+cqK1NMzxCQ+cBdKH
 oKvqSZCLakbXyqnhUjiXD8YcKm1IZ35CIBMMDaU3NbaxDiHEHfhDjGGxxnAJX/IaAUXgVyaYmOO
 ocuBpG7RBbXlUhSONaFZFGznp+x28Bip98+ElZIfXYlRVKmQIy3yFg5blTg==
X-Gm-Gg: AfdE7cmIY1UGd+Sw+bpMA5Zs7e2OS1YxrKBHTpPE7KsY8KtpLS1FLEJpz1qwZYVwv1n
 izBMWriCOY66K8QRBMdquYM5WpgybwMx/ty3GqByLwkiT275Fng6Gejh/4f/kuyU3ETwGXdottZ
 UpUyVgfrbuWwkD7xtGYht4c08gFY72XXIfy90aX/aHALzBA2q2LTiA0UqobOnWpQb8wJzD1K4in
 xKofQuO9YuWhGcW1GcnnjC0QYG38ePwlQMcKoL/gIucrwjG2hg86crgPC4PS38xWABs5r4nINxU
 /uwRtOsitCj4CsU+NVQCYpt/6kf5d1F7vGVJibA7TcInd8N4himVW17SM9f/DXdffHN2zyMDUvQ
 QfrNk/AZHIN7Fz249PMt+EcZrYhv8al83RQe+Lg==
X-Received: by 2002:a05:690c:7408:b0:809:19db:2b2b with SMTP id
 00721157ae682-81ef25e0e43mr8607767b3.47.1784292873697; 
 Fri, 17 Jul 2026 05:54:33 -0700 (PDT)
X-Received: by 2002:a05:690c:7408:b0:809:19db:2b2b with SMTP id
 00721157ae682-81ef25e0e43mr8607517b3.47.1784292872774; 
 Fri, 17 Jul 2026 05:54:32 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-81ef42bf11csm8200577b3.37.2026.07.17.05.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 05:54:32 -0700 (PDT)
Message-ID: <767b4e5e-7a24-4b5d-bc59-4a21006e9ed2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:54:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] hw/misc: add RISC-V RPMI transport and Base
 support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-3-subrahmanya.lingappa@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260714075659.2258023-3-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zfF_FbkhEXMJIV7WJ_mmTYaSuToT-5C6
X-Proofpoint-ORIG-GUID: zfF_FbkhEXMJIV7WJ_mmTYaSuToT-5C6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfXwr3PcptFI049
 ir/usR78Wj1nA9nTuVI7sJTNeXiL9VB7Y0IGuYcdY0g7RrsqKHijFBT29DC/hIv7v/nk6f+OfXi
 9GAIXz2biRqIdnQ7VKs2WMx0XvgE8YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfXyYQ4QAxLAsf2
 xs4jdQ60GgXEr+i2vp4Q+VvwG1sCLgZ7AHnvl1E0g4FW3JCFo8xLeTezI93aXhLfy2rkg8URdzT
 bkIznBKuvNNs6xXZDX11R/naJGf6yAp35g7Lly693dDS+0Tc5T+Q/UWsL1GAVmAlOlB1MhNz24Q
 jHa6aL5Imj4VgyyXng9mLqH3q/UtSZz/LgZQwzlMuL9HtKoLVb491GxMJrDOFIEFXQ5lwECzG9g
 Dy1JtNP+/xrK9KVbfcsQvWmoRKLu5ChbdPwvKLOCh6SAFwIXQRJNeQlq7RPH0AoxaHYK+YqT7j3
 WcVu6NC3SodXYuFTiuJlbqjM2AHnKUgjkJ5X2W+CQLOAjupoxTZCiAXL82a70ZghE6iBKRmCEV+
 BkTZGEVHskWBeCz/vRr8xIotgkpat8+Yxfd0wXuqawUW4MY6iymuhYfAy0vAGX3MYu4t6wsfRzP
 8J5dYXLZ7ObZvqYBDFw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a260a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=V1jnuoLLAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=fXvTguGbZRMLBUxMf2kA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170131
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

Hi Subbu,

On 7/14/2026 4:56 AM, Subrahmanya Lingappa wrote:
> RPMI (RISC-V Platform Management Interface) is the RISC-V non-ISA
> platform management specification. It defines a shared-memory transport,
> message protocol, and service groups for platform management.
> 
> Add the QEMU transport backend and Base service plumbing for virt using
> librpmi.
> 
> This implementation targets the RISC-V Platform Management Interface
> (RPMI) Specification v1.0 Ratified:
> 
> https://github.com/riscv-non-isa/riscv-rpmi/releases/download/v1.0/riscv-rpmi.pdf
> 
> The librpmi backend is maintained at:
> 
> https://github.com/riscv-software-src/librpmi
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---
>   MAINTAINERS                   |   2 +
>   hw/misc/Kconfig               |   4 +
>   hw/misc/meson.build           |   3 +
>   hw/misc/riscv_rpmi.c          | 476 ++++++++++++++++++++++++++++++++++
>   hw/misc/riscv_rpmi_internal.h |  24 ++
>   include/hw/misc/riscv_rpmi.h  |  90 +++++++
>   6 files changed, 599 insertions(+)
>   create mode 100644 hw/misc/riscv_rpmi.c
>   create mode 100644 hw/misc/riscv_rpmi_internal.h
>   create mode 100644 include/hw/misc/riscv_rpmi.h
> 

[ ... ]

> +
> +static void riscv_rpmi_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = riscv_rpmi_realize;
> +    dc->unrealize = riscv_rpmi_unrealize;
> +    dc->vmsd = &riscv_rpmi_vmstate;
> +    device_class_set_legacy_reset(dc, riscv_rpmi_reset);


This is something that I noticed yesterday with another work and I didn't point to
you earlier - we shouldn't use this legacy API.  In include/hw/core/qdev.h:


  * device_class_set_legacy_reset(): set the DeviceClass::reset method
  * @dc: The device class
  * @dev_reset: the reset function
  *
  * This function sets the DeviceClass::reset method. This is widely
  * used in existing code, but new code should prefer to use the
  * Resettable API as documented in docs/devel/reset.rst.


Unless this device has an exclusive reset procedure you can do like riscv-iommu-sys
does:


     ResettableClass *rc = RESETTABLE_CLASS(klass);

     rc->phases.hold = riscv_iommu_sys_reset_hold;


In this case you would do


     rc->phases.hold =   riscv_rpmi_reset


You can ignore the extra ResetType argument in case you don't need it.


The rest of the code LGTM.  Thanks,
Daniel






> +    device_class_set_props(dc, riscv_rpmi_properties);
> +}
> +
> +static const TypeInfo riscv_rpmi_info = {
> +    .name          = TYPE_RISCV_RPMI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RiscvRpmiState),
> +    .instance_init = riscv_rpmi_init,
> +    .instance_finalize = riscv_rpmi_finalize,
> +    .class_init    = riscv_rpmi_class_init,
> +};
> +
> +static void riscv_rpmi_register_types(void)
> +{
> +    type_register_static(&riscv_rpmi_info);
> +}
> +
> +type_init(riscv_rpmi_register_types)
> +
> +DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **errp)
> +{
> +    DeviceState *dev;
> +    RiscvRpmiState *s;
> +
> +    if (!cfg) {
> +        error_setg(errp, "missing RPMI configuration");
> +        return NULL;
> +    }
> +
> +    dev = qdev_new(TYPE_RISCV_RPMI);
> +    qdev_prop_set_uint64(dev, "shmem-base", cfg->shmem_base);
> +    qdev_prop_set_uint64(dev, "shmem-size", cfg->shmem_size);
> +    qdev_prop_set_uint32(dev, "a2p-req-size", cfg->a2p_req_size);
> +    qdev_prop_set_uint32(dev, "p2a-req-size", cfg->p2a_req_size);
> +
> +    s = RISCV_RPMI(dev);
> +    riscv_rpmi_configure_base(s, cfg);
> +
> +    if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp)) {
> +        return NULL;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, cfg->doorbell_base);
> +    return dev;
> +}
> diff --git a/hw/misc/riscv_rpmi_internal.h b/hw/misc/riscv_rpmi_internal.h
> new file mode 100644
> index 0000000000..447c0acb55
> --- /dev/null
> +++ b/hw/misc/riscv_rpmi_internal.h
> @@ -0,0 +1,24 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * RISC-V RPMI internal service helpers.
> + *
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + * Author:
> + *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> + */
> +
> +#ifndef HW_MISC_RISCV_RPMI_INTERNAL_H
> +#define HW_MISC_RISCV_RPMI_INTERNAL_H
> +
> +#include "qapi/error.h"
> +#include "hw/misc/riscv_rpmi.h"
> +#include "librpmi.h"
> +
> +#define RPMI_PLAT_INFO "QEMU RISC-V RPMI"
> +
> +extern const struct rpmi_shmem_platform_ops rpmi_shmem_qemu_ops;
> +bool riscv_rpmi_service_enabled(RiscvRpmiState *s,
> +                                RiscvRpmiServiceKind kind);
> +
> +#endif
> diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
> new file mode 100644
> index 0000000000..cb2658e57e
> --- /dev/null
> +++ b/include/hw/misc/riscv_rpmi.h
> @@ -0,0 +1,90 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * RISC-V RPMI definitions shared by RPMI transport and FDT helpers.
> + *
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + * Author:
> + *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> + */
> +
> +#ifndef HW_MISC_RISCV_RPMI_H
> +#define HW_MISC_RISCV_RPMI_H
> +
> +#include "exec/hwaddr.h"
> +#include "hw/core/sysbus.h"
> +#include "qom/object.h"
> +#include "qemu/notify.h"
> +
> +#define RPMI_QUEUE_SLOT_SIZE 64
> +#define RPMI_DBREG_SIZE      0x1000
> +
> +#define RPMI_ALL_NUM_QUEUES 4
> +#define RPMI_A2P_NUM_QUEUES 2
> +#define RPMI_ALL_NUM_REGS   (RPMI_ALL_NUM_QUEUES + 1)
> +#define RPMI_A2P_NUM_REGS   (RPMI_A2P_NUM_QUEUES + 1)
> +
> +#define VIRT_RPMI_A2P_REQ_SIZE (16 * RPMI_QUEUE_SLOT_SIZE)
> +#define VIRT_RPMI_P2A_REQ_SIZE 0
> +
> +
> +#define TYPE_RISCV_RPMI "riscv-rpmi"
> +OBJECT_DECLARE_SIMPLE_TYPE(RiscvRpmiState, RISCV_RPMI)
> +
> +struct rpmi_context;
> +struct rpmi_service_group;
> +struct rpmi_shmem;
> +struct rpmi_transport;
> +
> +typedef enum RiscvRpmiServiceKind {
> +    RISCV_RPMI_SERVICE_INVALID = 0,
> +} RiscvRpmiServiceKind;
> +
> +typedef struct RiscvRpmiServiceConfig {
> +    RiscvRpmiServiceKind kind;
> +    const char *node_name;
> +    const char *compatible;
> +    uint32_t service_group;
> +    bool has_mpxy_channel;
> +    uint32_t mpxy_channel;
> +} RiscvRpmiServiceConfig;
> +
> +typedef struct RiscvRpmiConfig {
> +    hwaddr doorbell_base;
> +    hwaddr shmem_base;
> +    hwaddr shmem_size;
> +    uint32_t a2p_req_size;
> +    uint32_t p2a_req_size;
> +    const char *platform_info;
> +
> +    const uint32_t *hart_ids;
> +    uint32_t hart_count;
> +    const RiscvRpmiServiceConfig *services;
> +    uint32_t service_count;
> +} RiscvRpmiConfig;
> +
> +struct RiscvRpmiState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    MemoryRegion shmem;
> +    uint64_t shmem_base;
> +    uint64_t shmem_size;
> +    uint32_t a2p_req_size;
> +    uint32_t p2a_req_size;
> +    char *platform_info;
> +
> +    uint32_t *hart_ids;
> +    uint32_t hart_count;
> +    const RiscvRpmiServiceConfig *services;
> +    uint32_t service_count;
> +    uint32_t doorbell;
> +    struct rpmi_shmem *rpmi_shmem;
> +    struct rpmi_transport *transport;
> +    struct rpmi_context *context;
> +    bool has_shmem;
> +};
> +
> +DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **errp);
> +
> +#endif


