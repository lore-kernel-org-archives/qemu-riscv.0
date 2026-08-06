Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B599DC56208
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 11:49:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrwaT-00072Y-AS; Thu, 06 Aug 2026 07:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrwaS-00072P-7C
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 07:48:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrwaQ-0007bL-JB
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 07:48:35 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6769ncPS1580570
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 11:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JFepXyNTr9YGzCIWdOTUK8chG8iP69v5+6Ox8XREm6g=; b=Vikd1oFz/btht0NK
 0BWj2nPXpVmx2uwcyWIJGtCc69PWKLCCoKRl/ZYOoZ938OnkTAZSOW9f1jBMX0pI
 iwXUaHlkKleB2sgk0EICQ2OFoy3PyBUNmya1Bvung/J65mY8kWOqmrnCdpdclwK+
 TY4ilVQ2QypLac7gFVandJTOtpCd1RjBdpK7epXER8kxiErLBExY7U3ZzW/DtnlM
 sEwH5+xVF/5YYB5bJAvf5yEbCYlFlkrx78A1OYs6ZHRCK+KejSeZBJOT0V+UP5hE
 o//cQk9AI9oz0IAdeWDJXQDytjz8XD/E+b3oPre/0ShWK8JbRg78DCEjTLndNwif
 Aw43wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjhfhq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 11:48:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e62e3459fso211415685a.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786016913; x=1786621713; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JFepXyNTr9YGzCIWdOTUK8chG8iP69v5+6Ox8XREm6g=;
 b=eUkSi4Y7HS52WdZHisT0cPUghXyjPpf8pH+N1dd07tWtg9yxHz/TDrfiwHy0Rhddss
 9TdkNd0TS80mrsoZfRfExrk2PJT050v4/LW9wUL80XCLS/iNlEd6cFekT0tPPKNv6tLj
 uJN3aSFbGnGDwBARDgba40NPUEpnLn8Q8laBCFbQPV7nYlq4LkeE5jsVUbiLdU8RXYU9
 bwaVekrmnmwAGmKZcqJjTWgw+6z4HzVwiFDgMgOI7rc07uXWXdM1i/IpmNmFuXBblrX3
 IB+ZweWi1Gt7KLtv7SEfskZGhIKrELRu2qEmeXDJlbnYghakjutIyCbkvqEQungNuLiZ
 2e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786016913; x=1786621713;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JFepXyNTr9YGzCIWdOTUK8chG8iP69v5+6Ox8XREm6g=;
 b=XyDJDOPDcchPiHdQFDVzS+Gp5XAwkKhDd1UUIYixj8LV6EBk1DJCknKvBlV9pzu80i
 j2b9CJt+5GsiQfMH10AuCVVGIr+6nmORAT5C+pMR/sNnThdn7XiLS1Xek8t5ChN3530z
 02j8OsummCMcsKWP0vNLOh5Ki/nkYkjtVIEW5hZxOkf9GF36oaFr3+5+c7L7kjj+AMZ2
 2ds0xYWVUQ4LBxgZYbfxOTkjqSnwrIMUC9CdTM6LD4CR7XUVLUHNh0aRJ6mmNabQwlYZ
 /8dD1klOuGCSe2GIYuM3G/8gagt+PubnbUmv9DCtPGkl7/U4gUZjvggZyL9Kbn5nbRCS
 XAPw==
X-Gm-Message-State: AOJu0Yzj08oke1npidUBJeTRJNmTkbzyCWyIB1/MMC1LcPYjm7Oondac
 K+QWirUFNmXChVd389Hyl09zHOuMuN3dI24dyzFvzyDgw9bA6xvf3AOCcR5yFG0svAgFssIuhBT
 C39pNQMyP1qPxmY5BOWaPr3moa4pUJrURH1Obkq8yuQnWb7qwYMHm0+VaiA==
X-Gm-Gg: AR+sD12NXOz5APv/QRiRdSgyHnqYsw6AAVVUvHoPE/1BAnTi8H4TFJed3pxq6+wZqeA
 WFgPq0bDyzjxucqOvLbWDwpmA/omfYHwGVKBvHRXWWF0cEVgrW/NUAVXn8lSE0vx4H2+tVGRkoX
 NacXqUDzTm4y/Gur8ao/Xr0bSIeVgmZgGIsO0kTTX10Z4TeWAxQ/LlBrMEhWp/2F7nBQlbpoiFe
 ezL7Q3eHZ5CzH+3JnsnTK5mF7Zu1g2wdD7L3xRVhHE49zz7JsPzd8uoDfs/JPb+6+5NAkT9FvTU
 u9UzuDjA7ZGyJDIJn1wByydmQhMI+GILA1qjYxFkA1eeDcmTxB7GhZbHkSfd1Kq5Y+UGzAUeeXa
 T5VruNE3cxe903HIhYH1rEyoYyX9WwkGOkGf0
X-Received: by 2002:a05:622a:428c:b0:51f:636c:8eae with SMTP id
 d75a77b69052e-52ce5ff21c5mr151631671cf.14.1786016912900; 
 Thu, 06 Aug 2026 04:48:32 -0700 (PDT)
X-Received: by 2002:a05:622a:428c:b0:51f:636c:8eae with SMTP id
 d75a77b69052e-52ce5ff21c5mr151631051cf.14.1786016912420; 
 Thu, 06 Aug 2026 04:48:32 -0700 (PDT)
Received: from [192.168.15.12] ([177.196.135.131])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52ce87d09casm36378041cf.8.2026.08.06.04.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 04:48:31 -0700 (PDT)
Message-ID: <92b88bd5-c220-40b2-b366-d34a6616c416@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 08:48:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] hw/riscv: k230: add decomp gzip in K230 board
To: Tao Ding <dingtao0430@163.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 farosas@suse.de, lvivier@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 caojunze424@gmail.com
References: <20260727155702.36484-1-dingtao0430@163.com>
 <20260727155702.36484-6-dingtao0430@163.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727155702.36484-6-dingtao0430@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a747491 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=TqADvzrrTdHTq19dv/zLaQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=x2GlTaQBcllRsYBM52sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4-zOZ1k3ZM2O7EDPuCWKnRHzApktWOVK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MyBTYWx0ZWRfX7wCxURLIud37
 txOgOyHnkoVsRbirzpNT+WRJURGTDjKIRnqd3ICRp8X/wZ1X6+JXys3W50LwzeQo/FNvLmyJuI4
 q1lsDvFNoWn9e+tI6DPrLTJtoGY5G8c=
X-Proofpoint-GUID: 4-zOZ1k3ZM2O7EDPuCWKnRHzApktWOVK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MyBTYWx0ZWRfX3Q/aEpx3bLkR
 WP79MgZ7ew40jgSR/j+Mk4QjBoXr7NIs7wE7233qLxnpAWRAPgEkIqMeHanczyZeZYuLw0QpJrS
 Z+eteejAiDhABVX78vfJPpGC+c+pIUOToGuvQDLVwxCBHruhVUAjD6Xaa9egtx2e8Qo5bO1IMN1
 XQ7OphbrL8rGUzl/XoDZ0Bs8uhbhwqiX4aQ6i7q0Dyz9xn5zUbsiFrv581KHkbrjQLWHAQI1P0L
 k/eEqGtv0YNsvGKMch3gPNBtS3xC81N/t1gfHa18mn87xlDxclhRVyf68VGwNFf5lXBRnmirX+e
 l4BbDzi2JPoIWc4+t4fciQGRi3tYiMDUFZ16a+rxZSQXSHQM31s+1Gex8jDvTTK47c67CwuRiJT
 oQams9IGx28yDQACL8iCFghxkuNPHrJQ7tfudd5fyVBN/GbGU7WbZdjnf6oJkryh7l6H2XZJkta
 sYI4BdaUD6bpOIMMLHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060093
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/27/2026 12:57 PM, Tao Ding wrote:
> This commit replaces the unimplemented part of Decomp_gzip in K230.
> Connect to the handshake interface of GSDMA.
> 
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> Reviewed-by: Junze Cao <caojunze424@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/Kconfig        |  1 +
>   hw/riscv/k230.c         | 23 +++++++++++++++++++----
>   include/hw/riscv/k230.h |  2 ++
>   3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index d28ac06043..d06ac26648 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -163,3 +163,4 @@ config K230
>       select UNIMP
>       select K230_WDT
>       select K230_GSDMA
> +    select K230_DECOMP_GZIP
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index c80bd65694..7fd1ec4c25 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -111,6 +111,8 @@ static void k230_soc_init(Object *obj)
>       object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
>       object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
>       object_initialize_child(obj, "k230-gsdma", &s->gsdma, TYPE_K230_GSDMA);
> +    object_initialize_child(obj, "k230-decomp-gzip", &s->decomp_gzip,
> +                            TYPE_K230_DECOMP_GZIP);
>   
>       qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
>       qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
> @@ -215,6 +217,23 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->gsdma), 0,
>                          qdev_get_gpio_in(DEVICE(s->c908_plic), K230_GSDMA_IRQ));
>   
> +    /* Decomp gzip */
> +    qdev_prop_set_uint64(DEVICE(&s->decomp_gzip), "sram-base",
> +                         memmap[K230_DEV_SRAM].base);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->decomp_gzip), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->decomp_gzip), 0,
> +                    memmap[K230_DEV_DECOMP_GZIP].base);
> +    for (int i = 0; i < K230_DECOMP_GZIP_NUM_GPIOS_OUT; i++) {
> +        qdev_connect_gpio_out(DEVICE(&s->decomp_gzip), i,
> +                              qdev_get_gpio_in(DEVICE(&s->gsdma), i));
> +    }
> +    for (int i = 0; i < K230_DECOMP_GZIP_NUM_GPIOS_IN; i++) {
> +        qdev_connect_gpio_out(DEVICE(&s->gsdma), i,
> +                              qdev_get_gpio_in(DEVICE(&s->decomp_gzip), i));
> +    }
> +
>       /* unimplemented devices */
>       create_unimplemented_device("kpu.l2-cache",
>                                   memmap[K230_DEV_KPU_L2_CACHE].base,
> @@ -233,10 +252,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>       create_unimplemented_device("dma", memmap[K230_DEV_DMA].base,
>                                   memmap[K230_DEV_DMA].size);
>   
> -    create_unimplemented_device("decomp-gzip",
> -                                memmap[K230_DEV_DECOMP_GZIP].base,
> -                                memmap[K230_DEV_DECOMP_GZIP].size);
> -
>       create_unimplemented_device("2d-engine.non-ai",
>                                   memmap[K230_DEV_NON_AI_2D].base,
>                                   memmap[K230_DEV_NON_AI_2D].size);
> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
> index 156a386edc..a12d36965a 100644
> --- a/include/hw/riscv/k230.h
> +++ b/include/hw/riscv/k230.h
> @@ -19,6 +19,7 @@
>   #include "hw/riscv/riscv_hart.h"
>   #include "hw/watchdog/k230_wdt.h"
>   #include "hw/dma/k230_gsdma.h"
> +#include "hw/misc/k230_decomp_gzip.h"
>   
>   #define C908_CPU_HARTID   (0)
>   
> @@ -35,6 +36,7 @@ typedef struct K230SoCState {
>   
>       K230WdtState wdt[2];
>       K230GSDMAState gsdma;
> +    K230DecompGzipState decomp_gzip;
>       MemoryRegion sram;
>       MemoryRegion bootrom;
>   


