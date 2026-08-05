Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D3DC55ABF
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 20:03:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrhpj-00041W-FK; Wed, 05 Aug 2026 16:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrhpZ-0003zh-Gz
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 16:03:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrhpX-00058B-Mb
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 16:03:13 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 675HSKfh3561186
 for <qemu-riscv@nongnu.org>; Wed, 5 Aug 2026 20:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XR10QZzNm4Vl16+RhWmWxk1SacnYYvZaYdlfDiGaqkk=; b=V4qsM2vDXJ4irQdx
 3hT2awTII8eSdIQBCulbzzqseWMlZCDV3tY+6lXJ8LYBRvy9ss7bkFpzWhLpYZyv
 z2m35SBbFjcNTtl9c2YkmvFV45BynerrLimeX5xlNP9ZvgkBBj8xzrOav+yaeb1f
 nL4WAK8wdiWKvaoCNhBBoCTX7oD5lWBJM1IgCEOxZCrDBRkbTOt6kKQjmak0wl6Q
 qsZz43defwNlq6pJ0mANvIZZ/mvvNsbZwTUAUKztkfjCchg4e+PyYSHJVVtU/Fpz
 pby/t2RW28sizttdyxRl4YdAAxtn3OEKOt7knqPEBWwp21yA4llQ+lbhxOakAcv3
 /5yKCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5swyq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 20:03:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so147211285a.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785960182; x=1786564982; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XR10QZzNm4Vl16+RhWmWxk1SacnYYvZaYdlfDiGaqkk=;
 b=ju0ErRDA2SF89OebaRPxqikxRFZeIOeD5CV4Td928gVODLNBLXIL/E5q/HP0HR7915
 9K26hprm6e6KhI0/TyALAbs8MJU/RaeCjGNOE7IK9hqeNGKw0Of8UIdqYw5MiCTl2lMU
 y+JRP1+90MJ5AuOgq9bA2WCweGojqxndwC6LcZSFSDaiR4ljIAxnGaIDEUsIfvbKRo8/
 2oS3lFlCjs2mLWtRnO7YlpgR3m9f9ChRY7ZyQSD65TuwkX2CvWGQAsWS1szgp4ZQOVVR
 3Ss02eoyB6Wwf3eEaCACMNc9Z0vFYdU4h38x/CVgANHSezDHnr+utZjfSyh9EffFIfhg
 3xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785960182; x=1786564982;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XR10QZzNm4Vl16+RhWmWxk1SacnYYvZaYdlfDiGaqkk=;
 b=sq1LvTCTS2v7JquIcvZe39VoDj0nJPvtLgidzFu5z2OLCqbLrV81t9mcuErbf68G/7
 ND7byt8d+sRW1rSEXTIBV9/tmaq65fUBKemTMezaYTk4t2MtezLbPzpseZvaWm7wB+UC
 Ro5aWPXtDQOO352YYFyK8abfY+Plsi8tuFZXtmOwKxc9Yykl+4j3MCrDaNYSO8kd6pdY
 gfBBPPILgKC+Owj/wOfkYfBu38f08jkFq65Ft0AGZmqCNztVn+2meXnic1CRcK3w0HiJ
 CVCqXQsBPfjOhgaiqEQW4fA5jkbwN3B9yR3JOy2C+Qptv+/Ip7CUxCpLi/rizKaJjIvO
 O/9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlBStEs+48UkcIau9wJmX2Q70oceJN3OCAPzaeEIMLKWJUmo4SPgj8a4XzNQitpksb8NHza7m+SONx@nongnu.org
X-Gm-Message-State: AOJu0YyPO7mB5oWnJdCyVNpLk2eb0UzVvp6A47re556ZuB1QoJjcMDQ+
 zU50O7TeqIAhuLxabFRog8VlF/5E+cwWs4kAnT++KbkamzUho2XTksym/1/o3QBcqjkSSRBzhNj
 rQBioHo6UzF9PBj3AJ4ns3+EJGABhCoZfdcaf05E5WRNOZGFlIBGAKBfQ9Q==
X-Gm-Gg: AR+sD137H5OgbTyeaREIGe5qDFRv7RhdqodcjwZG7kL0iFCWXap8T2SbOYCu0FloWAi
 09SkFEAz8phNt6IQOjtCJ983oN9j1M0YqlDTFFXa0kaIJ4TLf0Y0vzTEppfmp/YlQLK+YGkHa/U
 2OGwJ2hzJt57bKZ+R252PG1KoU8j0JpyYSaTiPW3tFL1d6Tj3bYFf2iRH46ZLUa6UHTvvRpqy/4
 P3O1PWYSiuOK89BopWRrza8+K+NzLsAMPj+/fLjm79YHBJ3XH8QcrVxS9TwTOpu69FQ+hyYVhrR
 W/eNbWEhNGvj8UFv3CIm/dVl8/ImlqMlSQb+ku4rsyc4P9L+iLJpCxoJqImdmZO5wHwlTdp5ptj
 K7KCL3M+PWnjPzeiEIOmgUxQSnLV9gtMuCbKJ
X-Received: by 2002:a05:620a:13cf:b0:92e:76a1:96d3 with SMTP id
 af79cd13be357-9364929b239mr685825085a.34.1785960182424; 
 Wed, 05 Aug 2026 13:03:02 -0700 (PDT)
X-Received: by 2002:a05:620a:13cf:b0:92e:76a1:96d3 with SMTP id
 af79cd13be357-9364929b239mr685819885a.34.1785960181963; 
 Wed, 05 Aug 2026 13:03:01 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a58d356sm226710285a.41.2026.08.05.13.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 13:03:01 -0700 (PDT)
Message-ID: <7a8a14f9-f501-499e-b4b4-1de92a161beb@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 17:02:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/3] hw/riscv: k230: connect DW 8250 UART
To: WX Chen <wxchen0913@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
References: <20260725-feat-k230-uart-v2-v2-0-d5fe82c47c28@gmail.com>
 <20260725-feat-k230-uart-v2-v2-2-d5fe82c47c28@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260725-feat-k230-uart-v2-v2-2-d5fe82c47c28@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lYMnHKwk62seVYDLPA-cDKoQbfxZIsYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE2NCBTYWx0ZWRfXzHRhpGw6upPN
 cEHeWC5LUXZXJ9DId9gU8ebf0hoViutrlQRUzbW79hPh/aD1gjlbbttgO2w5WgjEbICyiyBvf68
 lUK0G9jR2b8crwZTmnBVSfYv4Nrc4ZTFWH0ucPn9NjrQgjAez8CNcROViKXiVeH+Q4mrBnrxluV
 kU3SB/dcUD9VkdW2DA28JCrTSF2365qCMmp2ZSszbxTS3t9WmgFBOniPfE8KIbwH9yqIWa5o8ZL
 YidsSIWpDFinQgZ9fnvt6qvKjiJn/zmygpMH8yZT2SN1SAjwwFDG7Vwj55qP/nFdvwQaHB1Im2N
 Ae7D2Ap+DMwKOkM+ewv7gdPDPdeTe2zgazY2Ibg7IEUYYJjxKPn9nrHo2MFglzQQqVWvkYb7it2
 l7jTj8hzOyL1SbwVHtAWUzYs3/MdQN1mfezwhycEIxjf9vG56SRvItNjPrhHFHLiIrodDoM4D34
 GQqj6WT/FhNxjeBXlvA==
X-Proofpoint-ORIG-GUID: lYMnHKwk62seVYDLPA-cDKoQbfxZIsYz
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a7396fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oS42Cadbgcrl33LgFjoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE2NCBTYWx0ZWRfXw7cYywrjUYYs
 FDBMg736dWJ61HpVH4IOAvvR3WEst/QBh/1MgqR93fgKe7do8qK907aWuPljuRDyyFM5H6mS+5q
 F0mJhDTDKdO1VO0jdFLVXhqy0l5+ACA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050164
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



On 7/25/2026 12:52 AM, WX Chen wrote:
> Replace the generic serial-mm device with the K230 DW 8250-compatible
> UART model added in the previous patch.
> 
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/k230.c         | 33 ++++++++++++++++++++++-----------
>   include/hw/riscv/k230.h |  6 ++++--
>   2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 502281c52cff1dce6febb7487dfdefefe6363e9c..d49fa23448f38dfed45a570eb5bece64519bfe27 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -29,7 +29,6 @@
>   #include "hw/riscv/machines-qom.h"
>   #include "hw/intc/riscv_aclint.h"
>   #include "hw/intc/sifive_plic.h"
> -#include "hw/char/serial-mm.h"
>   #include "hw/misc/unimp.h"
>   
>   /* Align K230_SDK k230_canmv_defconfig */
> @@ -111,6 +110,11 @@ static void k230_soc_init(Object *obj)
>       object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
>       object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
>   
> +    for (int i = 0; i < K230_UART_COUNT; i++) {
> +        g_autofree char *name = g_strdup_printf("k230-uart%d", i);
> +        object_initialize_child(obj, name, &s->uart[i], TYPE_K230_UART);
> +    }
> +
>       qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
>       qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
>       qdev_prop_set_uint64(DEVICE(cpu0), "resetvec",
> @@ -136,19 +140,26 @@ static DeviceState *k230_create_plic(int base_hartid, int hartid_count)
>                                 memmap[K230_DEV_PLIC].size);
>   }
>   
> -static void k230_create_uart(MemoryRegion *sys_mem, DeviceState *plic,
> -                             int index)
> +static void k230_create_uart(K230SoCState *s, DeviceState *plic, int index)
>   {
>       int uart_dev = K230_DEV_UART0 + index;
> -    g_autofree char *name = g_strdup_printf("uart%d", index);
> +    g_autofree char *unimpl_name = g_strdup_printf("uart%d", index);
> +    DeviceState *dev = DEVICE(&s->uart[index]);
>   
> -    /* Cover the non-16550 part of the SDK's 0x1000 UART window. */
> -    create_unimplemented_device(name, memmap[uart_dev].base,
> -                                memmap[uart_dev].size);
> +    qdev_prop_set_chr(dev, "chardev", serial_hd(index));
>   
> -    serial_mm_init(sys_mem, memmap[uart_dev].base, 2,
> -                   qdev_get_gpio_in(plic, K230_UART0_IRQ + index),
> -                   399193, serial_hd(index), DEVICE_LITTLE_ENDIAN);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal)) {
> +        return;
> +    }
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, memmap[uart_dev].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                       qdev_get_gpio_in(plic, K230_UART0_IRQ + index));
> +
> +    /* Cover the non-16550 part of the SDK's 0x1000 UART window. */
> +    create_unimplemented_device(unimpl_name,
> +                                memmap[uart_dev].base + 0x100,
> +                                memmap[uart_dev].size - 0x100);
>   }
>   
>   static void k230_soc_realize(DeviceState *dev, Error **errp)
> @@ -188,7 +199,7 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>   
>       /* UART */
>       for (int i = 0; i < K230_UART_COUNT; i++) {
> -        k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
> +        k230_create_uart(s, DEVICE(s->c908_plic), i);
>       }
>   
>       /* Watchdog */
> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
> index 592e1c26bf8a8f8a1c66653ff9b568fbfe98a3ea..fed0357c2b9e1f5254cb157e0cd4d75d4946d1a1 100644
> --- a/include/hw/riscv/k230.h
> +++ b/include/hw/riscv/k230.h
> @@ -17,10 +17,13 @@
>   
>   #include "hw/core/boards.h"
>   #include "hw/riscv/riscv_hart.h"
> +#include "hw/char/k230_uart.h"
>   #include "hw/watchdog/k230_wdt.h"
>   
>   #define C908_CPU_HARTID   (0)
>   
> +#define K230_UART_COUNT 5
> +
>   #define TYPE_RISCV_K230_SOC "riscv.k230.soc"
>   #define RISCV_K230_SOC(obj) \
>       OBJECT_CHECK(K230SoCState, (obj), TYPE_RISCV_K230_SOC)
> @@ -32,6 +35,7 @@ typedef struct K230SoCState {
>       /*< public >*/
>       RISCVHartArrayState c908_cpu; /* Small core */
>   
> +    K230UartState uart[K230_UART_COUNT];
>       K230WdtState wdt[2];
>       MemoryRegion sram;
>       MemoryRegion bootrom;
> @@ -131,8 +135,6 @@ enum {
>       K230_WDT1_IRQ   = 108,
>   };
>   
> -#define K230_UART_COUNT 5
> -
>   /*
>    * Integrates with the interrupt controller (PLIC),
>    * which can process 208 interrupt external sources
> 


