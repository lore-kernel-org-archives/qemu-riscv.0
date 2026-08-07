Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D4C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:39:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsNbJ-00008U-OL; Fri, 07 Aug 2026 12:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNbH-00005Y-Tm
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 12:39:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNbG-0003Qi-7Q
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 12:39:15 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677GOcZ61224873
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 16:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zfbbJ9R83COrdPTxLGowC8v4XsbBmjNId46+n6rpieo=; b=dZpdYfdYtfMwVGfS
 BWapaFVlahSSUnnOsDhQ8t2XJsOp78v8o2I/KUSbZduX3rlG3570dz7l6ycti38v
 0W8t/AMcmsJ5DnKp5MTCp5e+8nz/gvHdZEnQuxXiU2PCe6pVctVqvZ910UWSwAIN
 ruYRofP8OwrHRt+IQ0AAlGmGvywAVVQqUsXlkTdtQTiXThSlPaGQMWl2LfDoi3Kc
 vYYFJwUB9p8WMde0Xa8HB0dDl1uU6I8HumoCWwwq1ECSTqMX9pmuviOPn3zXNDLT
 1PyQyOWcrRq0pIWaXKnavvH1IzhEBF6e4XsdTXAp6itEQjZ+ol/5Jrpw1n8EsY7M
 POA/iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem8rdh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 16:39:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so28284221cf.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786120752; x=1786725552; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zfbbJ9R83COrdPTxLGowC8v4XsbBmjNId46+n6rpieo=;
 b=MpFBYoGVi2LpDx0wXSnkc+Qnwqea+yaswgCyNuGYda/Qd3A+7BQ6Tf7Ea8maWv2nMV
 P/nd1apIeUNArHg0ds17kNU2LW0PUNs/6Rj8bZjLD66yOyAq+l1ZQZVBe+2290qZw4/S
 nBEYBAGlNz5tSQ7ZlHW2xZnqVHlidHqIpSieF4Yh85mT1xeQbRZ1Fbk6C/+od6BQ8tLb
 nEVl9UQjfznSSYSxVn9C4/ngzOWBsmhKPDk1u0BM8/NcebkcV4xgOQTZzivFcF4feG9M
 wwzOmUMonHeLr2Q7PB+dIu4Gu5klFuFd1aq2ZXbjlKrlFBvqnE8qRbQQ8KSEUHeLcHRD
 ihjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786120752; x=1786725552;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zfbbJ9R83COrdPTxLGowC8v4XsbBmjNId46+n6rpieo=;
 b=NoeZdKD73W1ACNk004k03Q7dvhRJ7RirARWl+Zd+yZvdO+dEoG/fZV8RP9KIVjjgq3
 sIfydwsagx0fgqfVnViv3CvJgE05Zw31B/Vy81eQ1Uodr6MCv0gSlEAagMkzlZ8gefGu
 gkuu9kiGXAnVB/0VWBcy20L9zjhitXvHjI88jYLtCLWyScNLWEv4qaa7TNGqlZ+wqBrz
 vcGPQON7KXpIFJ8p6igWxaoncL4QD/vzC7Z2UR0DTJRaWvWRa0LSrUs3+Ttdocm4rU2k
 zJzHxJFK1/f7UO6J0pebIIF6RswzKBZnNKyS4AwlEDF42xdMOhqkjgiAiXB8A39XNxh8
 0reQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoP5BvXiHto6pgwVabzhvx0FuootynNmSaXW+3bHck/kb+jqNOUCnb8w05Nnn3DkrTGh3j6RZrrHXD9@nongnu.org
X-Gm-Message-State: AOJu0YxtKk6L4ou0yb+/Cn0e5ktVle8MNntmGtr78mT5kOF0pZIwjfoI
 dxpng1eZDV2ymXbQjS6uzTHZfLAP9xJC6tSdm52ZazJQuQHXwIDw0YNTyTBXGcEnq1dwrTstTzt
 N+h2VqrtsslyNqk48f1t+fwZ4vmOh4Xs79M5IbpN7x9ncrLEkRw8H36+7Mg==
X-Gm-Gg: AR+sD12fugT0jtKoNEU5gdMRl0Onc9r0xPegAN623Laxz2RveVI1JJ510Xl7+eh93AR
 syNmEBUL7zwVi1u49MwtueOZEMglerOdE4UCnP7TtxQroASWrkh3sm1NS0LBiMzvB+/OjJC6376
 2vlNSQEDl20Yu0dsmHapGDtOBBDHYbXZb1gJEA0+iTij3/dJYV5SrwVrDXx+UFww/CRu2nenHEF
 RtUV5zdc8jPTbyZAtY1yCoIK2m5CbAiqiHSIm8Ly9zpIGL4kDk63hbT47YvpNw/5Dkx9Ng0xqK2
 0lWzqDJ6Xezffvwvy4y+g7Pz2pUbZsYuCpcZIF1ECxEcli8fQfMyniWZ7/l6SlDs774iOqecYte
 ipqPHMl/1HdoyMa1kRjQvX0mA8+8yKNvmC5rv
X-Received: by 2002:a05:622a:1484:b0:519:e020:6087 with SMTP id
 d75a77b69052e-52ce5fb8b85mr250345281cf.11.1786120752341; 
 Fri, 07 Aug 2026 09:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1484:b0:519:e020:6087 with SMTP id
 d75a77b69052e-52ce5fb8b85mr250344641cf.11.1786120751863; 
 Fri, 07 Aug 2026 09:39:11 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908a918eb4asm13057396d6.7.2026.08.07.09.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 09:39:11 -0700 (PDT)
Message-ID: <bb8cf7a9-f761-48e7-bc4c-d10b82076616@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 13:39:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/riscv: instantiate K230 I2C controllers
To: Wang Zhongyu <wzy15515798875@gmail.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20260807152830.6833-1-wzy15515798875@gmail.com>
 <20260807152830.6833-3-wzy15515798875@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260807152830.6833-3-wzy15515798875@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hig8evK5ljejYaP9qxbWaPBUtq4-xCba
X-Proofpoint-GUID: Hig8evK5ljejYaP9qxbWaPBUtq4-xCba
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX/Dpg3A15pADZ
 +Btqfynofoi5X7PPS/wgmro5BTMz9JQ19RxQ9znVTmtyztebYtjg7RNwgEbPsO2rOTc5jK0ZYlP
 JcTo1xi6UbrjNahxrZ6eVenAk65g+pI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX2qWrCpkh8fJv
 po7cWQVHu4ipUqLTipPC1FHh9UFQFTCQGQKvaVzWunNmOAgEBZ1VyHiI9ynxckhKYe4nbqg+YhQ
 bptr+TZnL1PhOah40MFi3SE459Vdx0ADPGrUoZmbzEnAPtPn2OQn85USHl9K7NzKJqvwMvXuy14
 dqX4Rmoni/+SuAj5e7otKzMCHVkMnOqTj/0H/yw20BlM4X1Cqa6orHHtap6IT40LOEOoapSOIsz
 DJ7wO8+Ve8FUHlFC2VKvU6FazNdLGwkLQWx7ReydXZtBfkaDqmdCy5ApUJzx8m3S0gc9awjGi7g
 eqqSVJTE+gFVrErVLPTFa8gIdbaWwpMj4ZOVedsLV5RgjY3dcoskpBbzlkO2lzm/249zPCdnsiZ
 6TtlRMfqTgGs7N235HSkxR6kKnCTG6ioNtYqZcmgiuta6NhFlHm2M9nPEbHfWJZ5MB4r3cL7mqg
 T8ctStjBk+wnKcUwUtw==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a760a31 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=D47K7NXmnVvAYYZL0Z0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070130
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



On 8/7/2026 12:28 PM, Wang Zhongyu wrote:
> Instantiate the five K230 I2C controllers, map their MMIO regions,
> and connect IRQs 21 through 25 to the PLIC.
> 
> Select the K230 I2C model in the machine configuration and update
> the K230 machine documentation.
> 
> Signed-off-by: Wang Zhongyu <wzy15515798875@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   docs/system/riscv/k230.rst |  1 +
>   hw/riscv/Kconfig           |  1 +
>   hw/riscv/k230.c            | 36 +++++++++++++++++++++---------------
>   include/hw/riscv/k230.h    |  8 ++++++++
>   4 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/docs/system/riscv/k230.rst b/docs/system/riscv/k230.rst
> index cea8202e55..7a011903ab 100644
> --- a/docs/system/riscv/k230.rst
> +++ b/docs/system/riscv/k230.rst
> @@ -19,6 +19,7 @@ The ``k230`` machine supports the following devices:
>   * Core Local Interruptor (CLINT)
>   * Platform-Level Interrupt Controller (PLIC)
>   * 2 K230 Watchdog Timer
> +* 5 K230 I2C controllers
>   * 5 UART
>   
>   Boot options
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index de37c08cae..d2bd41173d 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -162,3 +162,4 @@ config K230
>       select SERIAL_MM
>       select UNIMP
>       select K230_WDT
> +    select K230_I2C
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 656f28190c..a42f896c0a 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -110,6 +110,11 @@ static void k230_soc_init(Object *obj)
>       object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY);
>       object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT);
>       object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT);
> +    object_initialize_child(obj, "k230-i2c0", &s->i2c[0], TYPE_K230_I2C);
> +    object_initialize_child(obj, "k230-i2c1", &s->i2c[1], TYPE_K230_I2C);
> +    object_initialize_child(obj, "k230-i2c2", &s->i2c[2], TYPE_K230_I2C);
> +    object_initialize_child(obj, "k230-i2c3", &s->i2c[3], TYPE_K230_I2C);
> +    object_initialize_child(obj, "k230-i2c4", &s->i2c[4], TYPE_K230_I2C);
>   
>       qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
>       qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_C908);
> @@ -191,6 +196,22 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>           k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
>       }
>   
> +    /* I2C */
> +    for (int i = 0; i < K230_I2C_COUNT; i++) {
> +        int i2c_dev = K230_DEV_I2C0 + i;
> +
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c[i]), errp)) {
> +            return;
> +        }
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0,
> +                        memmap[i2c_dev].base);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
> +                        qdev_get_gpio_in(DEVICE(s->c908_plic),
> +                                            K230_I2C0_IRQ + i));
> +    }
> +
>       /* Watchdog */
>       for (int i = 0; i < 2; i++) {
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> @@ -304,21 +325,6 @@ static void k230_soc_realize(DeviceState *dev, Error **errp)
>       create_unimplemented_device("security", memmap[K230_DEV_SECURITY].base,
>                                   memmap[K230_DEV_SECURITY].size);
>   
> -    create_unimplemented_device("i2c0", memmap[K230_DEV_I2C0].base,
> -                                memmap[K230_DEV_I2C0].size);
> -
> -    create_unimplemented_device("i2c1", memmap[K230_DEV_I2C1].base,
> -                                memmap[K230_DEV_I2C1].size);
> -
> -    create_unimplemented_device("i2c2", memmap[K230_DEV_I2C2].base,
> -                                memmap[K230_DEV_I2C2].size);
> -
> -    create_unimplemented_device("i2c3", memmap[K230_DEV_I2C3].base,
> -                                memmap[K230_DEV_I2C3].size);
> -
> -    create_unimplemented_device("i2c4", memmap[K230_DEV_I2C4].base,
> -                                memmap[K230_DEV_I2C4].size);
> -
>       create_unimplemented_device("pwm", memmap[K230_DEV_PWM].base,
>                                   memmap[K230_DEV_PWM].size);
>   
> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
> index 592e1c26bf..4ea927a63b 100644
> --- a/include/hw/riscv/k230.h
> +++ b/include/hw/riscv/k230.h
> @@ -18,8 +18,10 @@
>   #include "hw/core/boards.h"
>   #include "hw/riscv/riscv_hart.h"
>   #include "hw/watchdog/k230_wdt.h"
> +#include "hw/i2c/k230_i2c.h"
>   
>   #define C908_CPU_HARTID   (0)
> +#define K230_I2C_COUNT    5
>   
>   #define TYPE_RISCV_K230_SOC "riscv.k230.soc"
>   #define RISCV_K230_SOC(obj) \
> @@ -33,6 +35,7 @@ typedef struct K230SoCState {
>       RISCVHartArrayState c908_cpu; /* Small core */
>   
>       K230WdtState wdt[2];
> +    K230I2CState i2c[K230_I2C_COUNT];
>       MemoryRegion sram;
>       MemoryRegion bootrom;
>   
> @@ -127,6 +130,11 @@ enum {
>       K230_UART2_IRQ  = 18,
>       K230_UART3_IRQ  = 19,
>       K230_UART4_IRQ  = 20,
> +    K230_I2C0_IRQ   = 21,
> +    K230_I2C1_IRQ   = 22,
> +    K230_I2C2_IRQ   = 23,
> +    K230_I2C3_IRQ   = 24,
> +    K230_I2C4_IRQ   = 25,
>       K230_WDT0_IRQ   = 107,
>       K230_WDT1_IRQ   = 108,
>   };


