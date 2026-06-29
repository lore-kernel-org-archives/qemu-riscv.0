Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20918C43327
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 01:43:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we11d-00020O-IJ; Sun, 28 Jun 2026 21:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we11b-0001zg-P6
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:43:03 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we11X-0001J5-LT
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 21:43:03 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-697bd41a4ecso3402684a12.2
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 18:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782697378; cv=none;
 d=google.com; s=arc-20260327;
 b=NVmIQ0WOPmx2jYMTTWnqIXb/BZ4DfBBSg5dXvg+/TI0ooY38vpb6VUizYDBRnKw4nj
 7INBPhWIorbHBtfcvIY8mqtrjXba8mh1K1EWkYpO7+cM/vMu+2ifWxjwgA6LBZeJosCp
 tR8Uosx7aDJLIihueSjkCmYmVTQIzI3hhLEKJEjiOL1gKYVamiFLwotIJ2Dc6mWB4KoY
 hY3jpwNHOojrwdLHHeLyurRjiFiThx60/gXc0eq/46CtUGg7kmmk/el8KRtrVyuLlGZn
 WBlz8yZAf8ww0ndPMcL474xSO+ollPHJtFrRKusQsNEIrXyZmoFfVDcjb+3UPP3Xc7k9
 +K6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UnBa8TpavQAcZH+/w3Tajs8go9HHy+Uk6/cmInc5J7w=;
 fh=0TIDG5gethW8Rs6BKPNDo3IjLss7cm3SsxSTYSFWo9U=;
 b=nLba9AbEMwOkxlcVQBMrEgsNSA6hZKL9cMDF2ddOCvrcAKd4HK27GOYMmMrv9zi80+
 T0gx8LM3L/LDKkBtfmH1HaSfMROYKiOL2wz/D3HWzVlo6VQT3OMm+S1ZHThsacud5+wl
 sw55vSZmqu9QZQ5VBAXVDe4S4+oOgncwSoN/qOiA2bq7PV35KDWSBgdTpHYEK/uZ54aG
 ABhMtw6/FdSR3FYsp8GmFKC+Y53w2aM3HIQWs533/X2bqsK4fOB1LMLtRR4CBxiftLHD
 MrY4R/RFPrU2T9JhlFpvavj0WTdKIH7FFKJ5DiEADefc04evRlrqhtTc38ZMN9/4Ld59
 AWQQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782697378; x=1783302178; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnBa8TpavQAcZH+/w3Tajs8go9HHy+Uk6/cmInc5J7w=;
 b=Uqx25MHvPLIP4AaHzr6JkBWpu4QvNS14+5WGPJtdUyG2H3wBXwGa9nbH+6khp79Byw
 HETxNvGQXP5CbceJpqH35WigAtvQfMhoHsx2VNuQcp3taB9JTE7CGOOQgxjE34dupO5/
 AXLyi04VeRIP1b2EGgBYnI2uhpRNPU1AXbBwqtH18AExOiTFHB0irSwTK/+NqRtlB8hY
 PaaXeHgZaQ+m0D7OGZzxUbZBuqu2r328bc+GDHPbZjPPZ6BSXg50T2fb+xKk2Wcc0q9G
 Nmc1ByFjn2LmobW/sgcjHd8iyXsm1Rzak/e1+YLV5FSvrIYwRqAQadY5/Kv3J+oj69NN
 paxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782697378; x=1783302178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UnBa8TpavQAcZH+/w3Tajs8go9HHy+Uk6/cmInc5J7w=;
 b=E1joxmGaw0IvlJdpVTaAuwNq18pVsYxU33nPG6CNmlutSJidoQjCnlKv2ni/VjfX+4
 HD9kHMeZwDuZ6h+gDjPfbmQNU1HJ8kzqovXCZCCeG86dNZ7/Z2utKNhQ8ffIQXn4Fvx6
 cM1VyZNEhyknl/D3Pu0h25+QOjeZ9j3fPVQszygaGQg/1YWcosd+BXT/kCGJ9J6I8Mjy
 oEXFYMHv4s/NHxSmvw4eM2cGNpvV/y5fAWej/I4dCOuyksym/ajI+JFjlJqYB0pOwAye
 VTpbVKoWTJXZNct+1Ih17K4hZRy4XWaj0LMZOJ6W6ZsR8J7YTGNacHVuO5b1deufQ7w0
 tJ5w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+9mv4OPuodEPd6G0XUL0pxMSrYIcGYtbqKVgOpXJ0YCzXvDeNAbCzG66fL5OCRLeynDN0tyTiKIn1@nongnu.org
X-Gm-Message-State: AOJu0YwtpOmmUbqpPLyuDl9tSgc+wn2dUpweIwPxqzB50xL1//348ikH
 YYm3K70ZFWWWmOFiVxJw8SSH12Fq1C72hqSlxNcBbalaKVPRw4eKAPQzAJuzsDy/xgA3zOIqy/8
 sqzwJDHbEeuVZfHCxufU/8ULXiwltCVo=
X-Gm-Gg: AfdE7cmDA9DFiuj4Sm+2Tl2Q5l4ASli9aPF0DlmzW1bCwJFlcFEMg4eVlZbJFn0TPwf
 r0fsEoxHnAEVKlP1FT5nmYZTnIQcc94dyCj9zOCrKThSC56X4TRXigC/A9x5bnMMh32R/705N3P
 nBRIzApFywAyetO+p8ZkF3/udxgHKOIqi+96LC/UQE+zxkaBXRA0t8A9Ld4oYSA0Iu3N0KDgJb3
 IOlcAksehOqryv10A1ZZ/Zf8SfSv1D4cVKz+uMipOosvMuYWtjsO/mwnGyqcCue3Ddlf3GIFQbr
 4tfNbvSmvZp2V7XzxA5xal7bNrQ=
X-Received: by 2002:a05:6402:4314:b0:697:8365:7e63 with SMTP id
 4fb4d7f45d1cf-69810a5cdebmr5723760a12.7.1782697377995; Sun, 28 Jun 2026
 18:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-4-visitorckw@gmail.com>
In-Reply-To: <20260616190147.1286316-4-visitorckw@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 11:42:30 +1000
X-Gm-Features: AVVi8Ccos0PzA-kIb0_-OMASRsb8p2HVOYHATcBEqflruErK-Y1ch6PdGSGNIQI
Message-ID: <CAKmqyKP=OfV+sxoFbtoB415=+RHaVq7BV_zeqp6svgVpMJFS=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/riscv: Add Sophgo CV1800B SoC support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
 marscheng@google.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Jun 17, 2026 at 5:04=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> Add the Sophgo CV1800B SoC, which is the heart of the Milk-V Duo board.
>
> The SoC features a T-Head C906 CPU along with integrated PLIC, CLINT,
> and dw8250 UART. The memory map and interrupts are configured according
> to the CV1800B datasheet. [1]
>
> Several peripheral blocks are included as unimplemented devices to
> ensure that drivers can probe successfully without causing errors
> during boot.
>
> Link: https://github.com/milkv-duo/duo-files/tree/main/duo/datasheet [1]
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  hw/riscv/Kconfig           |   8 ++
>  hw/riscv/cv1800b.c         | 168 +++++++++++++++++++++++++++++++++++++
>  hw/riscv/meson.build       |   2 +
>  include/hw/riscv/cv1800b.h |  52 ++++++++++++
>  4 files changed, 230 insertions(+)
>  create mode 100644 hw/riscv/cv1800b.c
>  create mode 100644 include/hw/riscv/cv1800b.h
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 54e41a6afc..299baed4a8 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -149,3 +149,11 @@ config K230
>      select SERIAL_MM
>      select UNIMP
>      select K230_WDT
> +
> +config SOPHGO_CV1800B
> +    bool
> +    depends on RISCV64
> +    select RISCV_ACLINT
> +    select SIFIVE_PLIC
> +    select SOPHGO_CV1800B_CLK
> +    select DW8250
> diff --git a/hw/riscv/cv1800b.c b/hw/riscv/cv1800b.c
> new file mode 100644
> index 0000000000..c6749e1202
> --- /dev/null
> +++ b/hw/riscv/cv1800b.c
> @@ -0,0 +1,168 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Sophgo CV1800B SoC
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/riscv/cv1800b.h"
> +#include "hw/core/qdev-properties.h"
> +#include "target/riscv/cpu-qom.h"
> +#include "system/system.h"
> +#include "hw/char/serial.h"
> +#include "hw/intc/riscv_aclint.h"
> +#include "system/address-spaces.h"
> +#include "hw/intc/sifive_plic.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/boot.h"
> +#include "hw/sd/sdhci.h"
> +#include "hw/misc/unimp.h"
> +
> +const MemMapEntry cv1800b_memmap[] =3D {
> +    [CV1800B_DEV_TOP_MISC]     =3D { 0x03000000,      0x1000 },
> +    [CV1800B_DEV_PINMUX]       =3D { 0x03001000,      0x1000 },
> +    [CV1800B_DEV_CLK]          =3D { 0x03002000,      0x1000 },
> +    [CV1800B_DEV_RST]          =3D { 0x03003000,      0x1000 },
> +    [CV1800B_DEV_WDT]          =3D { 0x03010000,      0x1000 },
> +    [CV1800B_DEV_GPIO]         =3D { 0x03020000,      0x4000 },
> +    [CV1800B_DEV_UART0]        =3D { 0x04140000,     0x10000 },
> +    [CV1800B_DEV_SD0]          =3D { 0x04310000,     0x10000 },
> +    [CV1800B_DEV_ROM]          =3D { 0x04400000,     0x10000 },
> +    [CV1800B_DEV_RTC_GPIO]     =3D { 0x05021000,      0x1000 },
> +    [CV1800B_DEV_RTC_IO]       =3D { 0x05027000,      0x1000 },
> +    [CV1800B_DEV_PLIC]         =3D { 0x70000000,   0x4000000 },
> +    [CV1800B_DEV_CLINT]        =3D { 0x74000000,     0x10000 },
> +    [CV1800B_DEV_DRAM]         =3D { 0x80000000,         0x0 },
> +};
> +
> +static void cv1800b_soc_instance_init(Object *obj)
> +{
> +    CV1800BSoCState *s =3D CV1800B_SOC(obj);
> +
> +    object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY=
);
> +    object_initialize_child(obj, "clk", &s->clk, TYPE_CV1800B_CLK);
> +}
> +
> +static void cv1800b_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    CV1800BSoCState *s =3D CV1800B_SOC(dev);
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    uint32_t num_harts =3D ms->smp.cpus;
> +    MemoryRegion *system_memory =3D get_system_memory();
> +    char *plic_hart_config;
> +    DeviceState *uart, *sdhci;
> +
> +    qdev_prop_set_uint32(DEVICE(&s->cpus), "num-harts", num_harts);
> +    qdev_prop_set_uint32(DEVICE(&s->cpus), "hartid-base", 0);
> +    qdev_prop_set_string(DEVICE(&s->cpus), "cpu-type", TYPE_RISCV_CPU_TH=
EAD_C906);
> +
> +    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec",
> +                         cv1800b_memmap[CV1800B_DEV_ROM].base);
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
> +
> +    memory_region_init_rom(&s->rom, OBJECT(dev), "cv1800b.rom",
> +                           cv1800b_memmap[CV1800B_DEV_ROM].size, &error_=
fatal);
> +    memory_region_add_subregion(system_memory,
> +                                cv1800b_memmap[CV1800B_DEV_ROM].base, &s=
->rom);
> +
> +    riscv_aclint_swi_create(cv1800b_memmap[CV1800B_DEV_CLINT].base,
> +                            0, num_harts, false);
> +    riscv_aclint_mtimer_create(cv1800b_memmap[CV1800B_DEV_CLINT].base +
> +                               RISCV_ACLINT_SWI_SIZE,
> +                               RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
> +                               0, num_harts, RISCV_ACLINT_DEFAULT_MTIMEC=
MP,
> +                               RISCV_ACLINT_DEFAULT_MTIME,
> +                               RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true)=
;
> +
> +    plic_hart_config =3D riscv_plic_hart_config_string(num_harts);
> +    s->plic =3D sifive_plic_create(
> +        cv1800b_memmap[CV1800B_DEV_PLIC].base,
> +        plic_hart_config,
> +        num_harts,
> +        0,
> +        CV1800B_PLIC_NUM_SOURCES,
> +        CV1800B_PLIC_NUM_PRIORITIES,
> +        0x0,
> +        0x1000,
> +        0x2000,
> +        0x80,
> +        0x200000,
> +        0x1000,
> +        cv1800b_memmap[CV1800B_DEV_PLIC].size);
> +
> +    g_free(plic_hart_config);
> +
> +    uart =3D qdev_new("dw8250");

We generally want to create the device in the init function and then
realise it here, like you do with the clock for example

Alistair

> +    qdev_prop_set_uint8(uart, "regshift", 2);
> +    qdev_prop_set_chr(uart, "chardev", serial_hd(0));
> +    sysbus_realize(SYS_BUS_DEVICE(uart), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(uart), 0, cv1800b_memmap[CV1800B_DEV_=
UART0].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(uart), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic), CV1800B_UART0_I=
RQ));
> +
> +    sdhci =3D qdev_new(TYPE_SYSBUS_SDHCI);
> +    qdev_prop_set_uint8(sdhci, "sd-spec-version", 3);
> +    qdev_prop_set_uint64(sdhci, "capareg", 0x056900b9);
> +    sysbus_realize(SYS_BUS_DEVICE(sdhci), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sdhci), 0, cv1800b_memmap[CV1800B_DEV=
_SD0].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sdhci), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic), CV1800B_SD0_IRQ=
));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->clk), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->clk), 0,
> +                    cv1800b_memmap[CV1800B_DEV_CLK].base);
> +
> +    create_unimplemented_device("cv1800b.top_misc",
> +                                cv1800b_memmap[CV1800B_DEV_TOP_MISC].bas=
e,
> +                                cv1800b_memmap[CV1800B_DEV_TOP_MISC].siz=
e);
> +
> +    create_unimplemented_device("cv1800b.pinmux",
> +                                cv1800b_memmap[CV1800B_DEV_PINMUX].base,
> +                                cv1800b_memmap[CV1800B_DEV_PINMUX].size)=
;
> +
> +    create_unimplemented_device("cv1800b.rst",
> +                                cv1800b_memmap[CV1800B_DEV_RST].base,
> +                                cv1800b_memmap[CV1800B_DEV_RST].size);
> +
> +    create_unimplemented_device("cv1800b.wdt",
> +                                cv1800b_memmap[CV1800B_DEV_WDT].base,
> +                                cv1800b_memmap[CV1800B_DEV_WDT].size);
> +
> +    create_unimplemented_device("cv1800b.gpio0_3",
> +                                cv1800b_memmap[CV1800B_DEV_GPIO].base,
> +                                cv1800b_memmap[CV1800B_DEV_GPIO].size);
> +
> +    create_unimplemented_device("cv1800b.rtc_gpio",
> +                                cv1800b_memmap[CV1800B_DEV_RTC_GPIO].bas=
e,
> +                                cv1800b_memmap[CV1800B_DEV_RTC_GPIO].siz=
e);
> +
> +    create_unimplemented_device("cv1800b.rtc_io",
> +                                cv1800b_memmap[CV1800B_DEV_RTC_IO].base,
> +                                cv1800b_memmap[CV1800B_DEV_RTC_IO].size)=
;
> +}
> +
> +static void cv1800b_soc_class_init(ObjectClass *oc, const void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D cv1800b_soc_realize;
> +    dc->user_creatable =3D false;
> +}
> +
> +static const TypeInfo cv1800b_soc_type_info =3D {
> +    .name =3D TYPE_CV1800B_SOC,
> +    .parent =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(CV1800BSoCState),
> +    .instance_init =3D cv1800b_soc_instance_init,
> +    .class_init =3D cv1800b_soc_class_init,
> +};
> +
> +static void cv1800b_soc_register_types(void)
> +{
> +    type_register_static(&cv1800b_soc_type_info);
> +}
> +
> +type_init(cv1800b_soc_register_types)
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index b70a054579..6c242d77da 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -19,4 +19,6 @@ riscv_ss.add(when: 'CONFIG_RISCV_MIPS_CPS', if_true: fi=
les('cps.c'))
>  riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.=
c'))
>  riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
>
> +riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
> +
>  hw_arch +=3D {'riscv': riscv_ss}
> diff --git a/include/hw/riscv/cv1800b.h b/include/hw/riscv/cv1800b.h
> new file mode 100644
> index 0000000000..a214f7a9f6
> --- /dev/null
> +++ b/include/hw/riscv/cv1800b.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Sophgo CV1800B SoC
> + *
> + * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#ifndef HW_RISCV_CV1800B_H
> +#define HW_RISCV_CV1800B_H
> +
> +#include "hw/core/boards.h"
> +#include "hw/riscv/riscv_hart.h"
> +#include "hw/misc/cv1800b_clk.h"
> +
> +#define TYPE_CV1800B_SOC "cv1800b-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(CV1800BSoCState, CV1800B_SOC)
> +
> +struct CV1800BSoCState {
> +    DeviceState parent_obj;
> +
> +    RISCVHartArrayState cpus;
> +    MemoryRegion rom;
> +    DeviceState *plic;
> +    CV1800BClkState clk;
> +};
> +
> +#define CV1800B_PLIC_NUM_SOURCES 136
> +#define CV1800B_PLIC_NUM_PRIORITIES 31
> +
> +#define CV1800B_UART0_IRQ 44
> +#define CV1800B_SD0_IRQ   36
> +
> +enum {
> +    CV1800B_DEV_TOP_MISC,
> +    CV1800B_DEV_PINMUX,
> +    CV1800B_DEV_CLK,
> +    CV1800B_DEV_RST,
> +    CV1800B_DEV_WDT,
> +    CV1800B_DEV_GPIO,
> +    CV1800B_DEV_UART0,
> +    CV1800B_DEV_SD0,
> +    CV1800B_DEV_ROM,
> +    CV1800B_DEV_RTC_GPIO,
> +    CV1800B_DEV_RTC_IO,
> +    CV1800B_DEV_PLIC,
> +    CV1800B_DEV_CLINT,
> +    CV1800B_DEV_DRAM,
> +};
> +
> +extern const MemMapEntry cv1800b_memmap[];
> +
> +#endif
> --
> 2.54.0.1136.gdb2ca164c4-goog
>
>

