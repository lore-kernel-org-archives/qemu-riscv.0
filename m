Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0940CA5FBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:13:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBu7W-0003yz-Jv; Wed, 30 Sep 2026 09:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBu7B-0003x5-7Q
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 09:12:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBu74-0002Uj-Ev
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 09:12:48 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UB7kAP2678603
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 13:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 idHeu+NRsWnTer0zeNh49fOIAt7+IU/RgHdY22A6iSA=; b=D9/ty4NYdzkpCs+q
 ScOdHqJhztAbBHXNSlrI80W4FSJtyM0IeBATogUBNLPbJ1rY/m4/rp9gFhCvrF0I
 mHVTIGUXoEe4uEpugRexs/1y8dCXvGCi+oL95xQo79cW9bqeUo2AHawU+xV+ZEl1
 Ov1biw6qcdEvqKqU5LY28MAxRXdYJOGclSjvp3iCgcGIN9s/FXvF3ZvTIf7bcL1e
 maUMhLdOI+Dmhd3Brnu4GkByWWa/EE6rYQHjTMzLyD3iwGdhz9vE0hHqSfwEAjRd
 BEqE+JDruanmpz373x76R0XBCQipLMtHqjWGv9YraT8KmEpoGzQhFP86o9wbElEE
 YVC+CQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjjp3b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 13:12:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ae8e7e546so1050544285a.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790773961; x=1791378761; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=idHeu+NRsWnTer0zeNh49fOIAt7+IU/RgHdY22A6iSA=;
 b=e2GTwjUadx4W6jKsmyvwYta/tGcOLZwT3JbSyqZPAor50FbARdUjldC5IqppTIk1AK
 Zv7WAj98ZkRgR25y4IWKHf1R6yeBeAqiD8/uRGXuDUi0aOAuj8VywNUk4tBvBT9SJDXp
 zXBPIHzDfF+3hs3ZSdmJsgPEdavbfdj9dEtt//oBbQAFMjGLcS7kJr6jzdQJoWp/olDU
 9DZrZ6PKjH/kWkd/EPGTRCpUr59HqMmXFwEc4bM/zb0yaR7QDFox2n9IsLUD6N4qSbDK
 pMIiYD+ETWdjVs7jDi8bO4zojYkqYfDzddFaMnDMHOCw4jfLd/hSHBZcppj4v1It/LXa
 D4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790773961; x=1791378761;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=idHeu+NRsWnTer0zeNh49fOIAt7+IU/RgHdY22A6iSA=;
 b=wCZhgSARhjanY6s0rRVF8zKO1Qp607rF7nQ5EzAOFDWX+B0iJTnv0g7d1n9dx754O4
 2N0+euz06iO5VRFZ55+CddYmsIX42YdM9l+7sutqL+l0KB08H8TLZSgEPvPKFjvgMVwO
 xkzc08tYesX5Agrvf9j5+Cd0kSJCKVeP0uvJP3kL4b/H+6h1DdmdPF7QhEQoz0lDNvRN
 VlR4SHWAbVdPRHZKp1EurdMFz47F5kMZyiKRyl7QFDKadCtrFwSkjwL285lQxiXplmdf
 UdXdXFrOIsMMs19MUKI8aJxMVKXCGmmrkAvLmtmdal2WWDvChiF8WwqaQJ14pOs63KqP
 mzlg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzM/RJRmEV+WtMeUJT6FKzxf+vu9o69M9lACmie3H1aXKZ4vQl4+DohDMCno1eW12GrKMNOv3QZUMWw@nongnu.org
X-Gm-Message-State: AFuF++mu0SeUIIYYAiKOwbWE3VUyIBQAzor5Rk4VO3WfE8pmX+4EXbWx
 gTQo1ATXQhLggUhy1KGNR91DesUE+dfsj7jZqvh/UWZkT/xBym4jWLStjjIwTAtSSrV+Bw/KQGj
 3sjetZamF7COV7Un/ehz4TofpkuxNvJE8gHfaVKag1wtf7u4Wnt4JgLI1bA==
X-Gm-Gg: AYBFou2YWAkDaTfOyFBvS8fUSMAHxs3TmHZ2lzIGGPPsHN3yURnlSEp4XzDG7cfiWe4
 sNknWPg8wPhcVHL5bae4pR9Cqxmc84c3tk+8feu68xs4+3dt21Wp5nbGenwKUx2I3PXGciWIl/c
 H8cp3H8uqoJHR9xy7sceOSrfRllXGDX/g0UreeHayHjmPdlqau8+MGC2Mv5kPgsjyLI8Elc+X2G
 eJusSgtcnsnfYlEIT1lOvl//oN6oDTq+f4/Xo3VFxv3KMuTdVC9qawg3xF3eUUHDuelHndJYgzK
 KOIey4sBcbR7azWqDVM0XN0TeYW0092orG35LEEo1dp2bKvWUlSeQGPYhh/4hqUv0k5nsDWF2Xn
 r77q2U5aoN5SKJTn7R9GXMJKWoOS2mXp8sg==
X-Received: by 2002:a05:620a:4081:b0:93c:6925:dfee with SMTP id
 af79cd13be357-93ca977a0f0mr219080485a.55.1790773960660; 
 Wed, 30 Sep 2026 06:12:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:93c:6925:dfee with SMTP id
 af79cd13be357-93ca977a0f0mr219073685a.55.1790773960076; 
 Wed, 30 Sep 2026 06:12:40 -0700 (PDT)
Received: from [192.168.68.100] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93ca7913926sm116243985a.0.2026.09.30.06.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:12:39 -0700 (PDT)
Message-ID: <7da68b92-e599-4afc-8b4b-03e44d7e1930@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:12:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] hw/char: Add dw8250 UART
To: Kuan-Wei Chiu <visitorckw@gmail.com>, pierrick.bouvier@oss.qualcomm.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, portias@oss.tenstorrent.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
 <20260927201326.650943-2-visitorckw@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260927201326.650943-2-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfX/jaDR8xKfh4D
 xE/n4K0WCvGJhsY6U6AhW1ioZgn913ZZa8QMmSu4/VmAK4LjNO5trHe7vIaK6zxrqtfx2taEJZd
 BHtZlc8uEWR5zcM6vBLpn6tgplf1WnI=
X-Proofpoint-GUID: 4PO617FaL3_sJp8iUky_Y3RuBKR2sggZ
X-Proofpoint-ORIG-GUID: 4PO617FaL3_sJp8iUky_Y3RuBKR2sggZ
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd0ac9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=t9496tuAAAAA:8 a=pGLkceISAAAA:8 a=JF9118EUAAAA:8
 a=Vyxrb_dYnHV2Sbo5vJgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=4wQ91nGE5lQcD7eh5OX0:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfX31K8fG3cJML2
 XjefXhBSsmE6n3xdY8mlmxowZaf+kgmmueeLsrCYv6WFq0GI2LNygd7IK4cxoh/dD9TZQYZRZbR
 ROiltaxDAIyLOwmyk2LNTFY2p7YH211Zs65iinebV0jeVgJJ0o+KT0qrMEkj0V7rK/85w9Efm+4
 HEswS1yMaIufh6nOAlU0HTkfkCH4qUPF2Sl7m9Xe7qxiAfhtHa+C81sUBfcnKKz7pNbY5y7PfPV
 W2GSn8XHp9ovK0QteSg4HLg0Wz9QG/EHL2i/8MmRlnMzieyAzpsZuvtAr1Vrrk2gLQROeYddd4C
 a00tbRUsHEL91T0mXPu7Ip/N5Tl84Q9tGNuDbKH5Ebl/u61vk+Xo//XIhxDn2oFXeHl6jTm9KoX
 EnjsJ9/uwC1ZVWicvzD+HQBonHAPWX+jJ7OK1s7hdTpe5l8NrFm3LifgiDk7VD0FRcj+sOwXjnu
 6WeecSHmz/pqxjEqV6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300052
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

Hello,


Seems like we have a mem leak down there:

On 9/27/2026 5:13 PM, Kuan-Wei Chiu wrote:
> Add the dw8250 uart support. This hardware is a widely used 16550A
> derivative that includes additional registers.
> 
> Without this specific device support, the Linux 8250_dw driver fails to
> probe the extended registers (UCV, CPR, etc.), which are essential for
> correct feature detection.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS              |   6 ++
>   hw/char/Kconfig          |   4 ++
>   hw/char/dw8250.c         | 131 +++++++++++++++++++++++++++++++++++++++
>   hw/char/meson.build      |   1 +
>   include/hw/char/dw8250.h |  27 ++++++++
>   5 files changed, 169 insertions(+)
>   create mode 100644 hw/char/dw8250.c
>   create mode 100644 include/hw/char/dw8250.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6be9c5725b..d4e9cf61ea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2848,6 +2848,12 @@ S: Maintained
>   F: hw/i2c/designware_i2c.c
>   F: include/hw/i2c/designware_i2c.h
>   
> +DesignWare 8250 UART
> +M: Kuan-Wei Chiu <visitorckw@gmail.com>
> +S: Maintained
> +F: hw/char/dw8250.c
> +F: include/hw/char/dw8250.h
> +
>   Generic Loader
>   M: Alistair Francis <alistair@alistair23.me>
>   S: Maintained
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 020c0a84bb..418d99b757 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -95,3 +95,7 @@ config IP_OCTAL_232
>       bool
>       default y
>       depends on IPACK
> +
> +config DW8250
> +    bool
> +    select SERIAL
> diff --git a/hw/char/dw8250.c b/hw/char/dw8250.c
> new file mode 100644
> index 0000000000..ccf05dd9ad
> --- /dev/null
> +++ b/hw/char/dw8250.c
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Synopsys DesignWare APB UART (DW 8250)
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "hw/char/dw8250.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/core/qdev-properties-system.h"
> +
> +#define DW_UART_REGION_SIZE 0x100
> +
> +#define DW_UART_RE_EN (0xB4 >> 2) /* Receiver Output Enable Register */
> +#define DW_UART_DLF   (0xC0 >> 2) /* Divisor Latch Fraction Register */
> +#define DW_UART_CPR   (0xF4 >> 2) /* Component Parameter Register */
> +#define DW_UART_UCV   (0xF8 >> 2) /* UART Component Version */
> +#define DW_UART_CTR   (0xFC >> 2) /* Component Type Register */
> +
> +#define DW_UART_UCV_VALUE 0x3332332A /* "323*" -> v3.23a */
> +#define DW_UART_CTR_VALUE 0x44570110 /* "DW" */
> +
> +static uint64_t dw8250_ext_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    DW8250State *s = opaque;
> +
> +    switch (addr >> s->regshift) {
> +    case DW_UART_UCV:
> +        return DW_UART_UCV_VALUE;
> +    case DW_UART_CPR:
> +        return 0x00000000; /* No advanced features (DMA, extra FIFOs) */
> +    case DW_UART_CTR:
> +        return DW_UART_CTR_VALUE;
> +
> +    case DW_UART_RE_EN:
> +    case DW_UART_DLF:
> +        /*
> +         * Return 0 to indicate these optional features
> +         * (RS485 and Fractional Divisor) are not implemented.
> +         */
> +        return 0x00000000;
> +
> +    default:
> +        return 0;
> +    }
> +}
> +
> +static void dw8250_ext_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write to address 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
> +}
> +
> +static const MemoryRegionOps dw8250_ext_ops = {
> +    .read = dw8250_ext_read,
> +    .write = dw8250_ext_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void dw8250_instance_init(Object *obj)
> +{
> +    DW8250State *s = DW8250(obj);
> +
> +    s->serial_mm = qdev_new("serial-mm");
> +    object_property_add_child(obj, "serial-mm", OBJECT(s->serial_mm));

^ here. s->serial_mm is being alloc in qdev_new() and then during object_property_add_child().

This is being fixed by Portia in another patch:

[PATCH 1/5] hw/char/dw8250: Fix leak when creating child device
https://lore.kernel.org/qemu-devel/20260929031644.1016354-2-portias@oss.tenstorrent.com/


Given that this isn't merged yet I suggest fixing the leak in this patch instead.


Thanks,
Daniel


> +    object_property_add_alias(obj, "chardev", OBJECT(s->serial_mm), "chardev");
> +}
> +
> +static void dw8250_realize(DeviceState *dev, Error **errp)
> +{
> +    DW8250State *s = DW8250(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(s->serial_mm);
> +
> +    memory_region_init(&s->container, OBJECT(dev), "dw8250-container",
> +                       DW_UART_REGION_SIZE);
> +    sysbus_init_mmio(sbd, &s->container);
> +
> +    qdev_prop_set_uint8(s->serial_mm, "regshift", s->regshift);
> +    qdev_prop_set_uint8(s->serial_mm, "endianness", DEVICE_LITTLE_ENDIAN);
> +    if (!sysbus_realize(serial_sbd, errp)) {
> +        return;
> +    }
> +
> +    memory_region_init_io(&s->ext_iomem, OBJECT(dev), &dw8250_ext_ops, s,
> +                          "dw8250-ext", DW_UART_REGION_SIZE);
> +    memory_region_add_subregion(&s->container, 0, &s->ext_iomem);
> +
> +    memory_region_add_subregion_overlap(&s->container, 0,
> +                                        sysbus_mmio_get_region(serial_sbd, 0), 1);
> +
> +    sysbus_pass_irq(sbd, serial_sbd);
> +}
> +
> +static const Property dw8250_properties[] = {
> +    DEFINE_PROP_UINT8("regshift", DW8250State, regshift, 2),
> +};
> +
> +static void dw8250_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = dw8250_realize;
> +    device_class_set_props(dc, dw8250_properties);
> +}
> +
> +static const TypeInfo dw8250_info = {
> +    .name          = TYPE_DW8250,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(DW8250State),
> +    .instance_init = dw8250_instance_init,
> +    .class_init    = dw8250_class_init,
> +};
> +
> +static void dw8250_register_types(void)
> +{
> +    type_register_static(&dw8250_info);
> +}
> +
> +type_init(dw8250_register_types)
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index fc3d7ee506..b2250ee6ae 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -38,6 +38,7 @@ system_ss.add(when: 'CONFIG_STM32L4X5_USART', if_true: files('stm32l4x5_usart.c'
>   system_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
>   system_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
>   system_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
> +system_ss.add(when: 'CONFIG_DW8250', if_true: files('dw8250.c'))
>   
>   specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
>   specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
> diff --git a/include/hw/char/dw8250.h b/include/hw/char/dw8250.h
> new file mode 100644
> index 0000000000..59396ad202
> --- /dev/null
> +++ b/include/hw/char/dw8250.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Synopsys DesignWare APB UART (DW 8250)
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#ifndef HW_CHAR_DW8250_H
> +#define HW_CHAR_DW8250_H
> +
> +#include "hw/core/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_DW8250 "dw8250"
> +OBJECT_DECLARE_SIMPLE_TYPE(DW8250State, DW8250)
> +
> +struct DW8250State {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion container;
> +    MemoryRegion ext_iomem;
> +    DeviceState *serial_mm;
> +
> +    uint8_t regshift;
> +};
> +
> +#endif


