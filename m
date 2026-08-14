Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9EFC5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wumWf-0001NE-87; Fri, 14 Aug 2026 03:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumWd-0001Mi-CT
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:40:23 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumWb-0000zz-ON
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:40:23 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7dbcb505578so7059687b3.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 00:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693220; cv=none;
 d=google.com; s=arc-20260327;
 b=gkOIhVkc8DHK7PtPi5akUmTv79MhB93p1iTQeuUfM7zpkVbNADDSIaJi0sGgBoxrKi
 UMoNKiL1d1CKkm05ScM6BHvNroKa+opOxiISdGD0SvK0UrrAZBXq7vZNW7NUummqvhVI
 p98drlUjsIH2ltZpG9Y/oXFIJeCLW5DXQk1NHPyQ6+ZI6d/gZmeflT1K4xybGccMyg/2
 7k+n0Qwid4a/0TnxCSFls/EA7yvO/pGMeA7kmrgroJnUQj1jlpxQzLsiM8o+KPlA0Eft
 aooTj/XebMzS9/rj37176vTNQoQmuLDvbVAJUrdTjCdxC87ZjLnYj/z2Kslct9Qi9IB5
 bc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QBG0l42S9x7k9pnpvs2DMZ8cQHbVJuyC90D/A1NKk3c=;
 fh=GuTQrihMmDgPm2FntTaIe1KlLVipO+5OOhsdWtA82zc=;
 b=QdQTINjOh6lWbadbt9aaakpEppWOUSUBTA/g57AGPqXs12FuyLUhq2+oFVKcgNpfnC
 Gfz9p+hy8l8RlEsmczwN8mju79s+1Ai7prZlv7fiajt0L7P//Y9VU34h2V2aNO56uPQB
 0kcTGeYXWeSXBT4O9mqlzzbqHG7LZzqn2GAZvw7gvDwdah1sds5D6ZgtkmGtQQ4EzY5A
 d7CrkNY7hb+aFrLkW0qRsqcHrrU/TYi9mDGXcnX3QcEf9C62IvDsf3qFh+41P2iZUyWr
 zACMkPrZp+2hU1Rxfp7CgMNQ30QLezkCqQcECpl3u8bucQbz/qAtXkyEbLNkRlHWddNm
 WLjA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786693220; x=1787298020; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QBG0l42S9x7k9pnpvs2DMZ8cQHbVJuyC90D/A1NKk3c=;
 b=sZDrhfw0DL+4nzjC5pIL4D1D4ZUjz8mso61DDKiLWEBo6oPxJJg1b1JmvunQl5ikVi
 mkobon3dMe2nWDhtfZv1DCAACVC36zplJVcVCape3uCpR66PdQ+Basx2HO8jtx9apsFC
 MKC5Kp15XvofxaWi4D48C7dyUGNYnAJCgDFlTDjkZRGZqBddXLX1IeU0RaxqjTXRkvgF
 hOpwicW1L0uRTqYoMfL8wzvwHkDr3NyWBJLjbdUqQV+gWzSXU0RhEgB2YbgFvnnWABfP
 fUsvb9k/IC+4l0mD69tAzJ/O7wdP7DdLU1Ta4mwExJIb9Ic4C4H4or+y5UUqrdox2l3e
 N1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786693220; x=1787298020;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QBG0l42S9x7k9pnpvs2DMZ8cQHbVJuyC90D/A1NKk3c=;
 b=qLWe9paBGolYaQGNQ4QECx325gRNDkQOxQETECF8TccgDnJV/uhRPXM4eHuMBqGbGr
 1Kx0cUWCEafFfnl0BzQQYJaBD0CoUUTygFtsFcPkCC23SzeBhTR3B+GvOzIheS3crcXq
 OoJ/aV771ySCwiz2pQyE1PW8NVwVJ4nIoKy/++KD2Rwwh2vlGkFxFfmMKF7IcTS/BGco
 5pOMxZ0oe+La6HWS0N33bpLdLCA5iw/HDb9pNAuKaJg7qr5kazuuc3r7Y6rrze13YhMA
 5XZbi3e7PC6RZTYtjyNYBAtMpg9CaltRgyvgZRdzo+CeazAsNaQ5opilINJjT5vtj5cn
 Y4EQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp03uxqgtAnCishAn8fYW87VeulpocCz9rvJ+4oZDBnAgKjZ5iwNje887nI1sa5xBnr4vJWuJDc1eIG@nongnu.org
X-Gm-Message-State: AOJu0Yx5hU9zOwBLdOgHsoeWLCfj+PNxRrqjWH2UavZDx5UhPNUneJ/8
 2oYe1t1a9fgx47A42P91H+tE4l1gIsTABwfrAY/DSla2yGujwLQ6CcS9tV4/2y72XZ+OVCmdJ+D
 Pdjtvo5ERou0JxPmlHNTqX114yM8IBqc=
X-Gm-Gg: AR+sD10SCbxfR8gQgJ2AVQn+qWI2EfXJSRfHmbKM1f9UvkWKxTVQ14oAHyPtuXEhNqq
 apluQytLSd8aafIaGI0iARpLCnQZUpe5dvVEoYB6ch/y4afj0ZhZd5DGOc1e3OTHGzFUTVd7WVD
 s1U+9ZK6ZcigjuidhX54D/803n+jydts6SHsSHpvhNgf8wBktD+Ax6XVrCcZs3RNsco9dJ6eCqK
 waA538ZUfBlo0BFRou57gBP5d9+vNI/V19z7sIjgEQnSZoLnprZrKjRy90DPtVfDh0uG5idDo3T
 3PQitxMH8hmoQwhmTitdqNe0vJ4piO0uvG1IY1vpj6tSBd7UxdcXZjAJ
X-Received: by 2002:a05:690c:103:b0:836:e0bf:e86e with SMTP id
 00721157ae682-8370d9ea065mr15870777b3.13.1786693220378; Fri, 14 Aug 2026
 00:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260813133643.20380-1-rao232328@gmail.com>
 <20260813133643.20380-3-rao232328@gmail.com>
In-Reply-To: <20260813133643.20380-3-rao232328@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 15:40:08 +0800
X-Gm-Features: AUfX_my2RJtJXWWpLXsvxZyQ8-TO3x69EJ7-h3USeaoOeArvMgseN-VG1XeF-rw
Message-ID: <CAEUhbmV5biKom60BZf9QD+gTCJ67Dw+iW4sBoVWj8Oa+8q0mZg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/riscv: add DesignWare APB timer to K230 board
To: raoyi <rao232328@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com, 
 philmd@oss.qualcomm.com, pbonzini@redhat.com, lvivier@redhat.com, 
 farosas@suse.de, caojunze424@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 13, 2026 at 9:37=E2=80=AFPM raoyi <rao232328@gmail.com> wrote:
>
> Wire up the DesignWare APB timer to the K230 SoC with
> num-timers=3D6 and a 6.25 MHz clock. Connect timer IRQs
> to the PLIC. Remove the previous unimplemented timer stub.
>
> Signed-off-by: raoyi <rao232328@gmail.com>
> ---
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/k230.c         | 33 ++++++++++++++++++++++++++++++---
>  include/hw/riscv/k230.h |  8 ++++++++
>  3 files changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index de37c08cae..c2c01af6ee 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -162,3 +162,4 @@ config K230
>      select SERIAL_MM
>      select UNIMP
>      select K230_WDT
> +    select DW_APB_TIMER
> diff --git a/hw/riscv/k230.c b/hw/riscv/k230.c
> index 656f28190c..78a05492ad 100644
> --- a/hw/riscv/k230.c
> +++ b/hw/riscv/k230.c
> @@ -24,6 +24,8 @@
>  #include "target/riscv/cpu.h"
>  #include "hw/core/loader.h"
>  #include "hw/core/sysbus.h"
> +#include "hw/core/clock.h"
> +#include "hw/core/qdev-clock.h"
>  #include "hw/riscv/k230.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/machines-qom.h"
> @@ -37,6 +39,9 @@
>  #define K230_DIRECT_KERNEL_ADDR  0x8200000
>  #define K230_DIRECT_DTB_ADDR     0xa000000
>
> +#define K230_TIMER_NUM_CHANNELS 6
> +#define K230_TIMER_DEFAULT_FREQ 6250000

The TRM says the timer frequency is 50MHz. Where is this 6250000 coming fro=
m?

> +
>  static const MemMapEntry memmap[] =3D {
>      [K230_DEV_DDRC] =3D         { 0x00000000,  0x80000000 },
>      [K230_DEV_KPU_L2_CACHE] =3D { 0x80000000,  0x00200000 },
> @@ -110,6 +115,19 @@ static void k230_soc_init(Object *obj)
>      object_initialize_child(obj, "c908-cpu", cpu0, TYPE_RISCV_HART_ARRAY=
);
>      object_initialize_child(obj, "k230-wdt0", &s->wdt[0], TYPE_K230_WDT)=
;
>      object_initialize_child(obj, "k230-wdt1", &s->wdt[1], TYPE_K230_WDT)=
;
> +    object_initialize_child(obj, "dw-apb-timer", &s->timer,
> +                            TYPE_DW_APB_TIMER);
> +
> +    qdev_prop_set_uint32(DEVICE(&s->timer), "num-timers",
> +                         K230_TIMER_NUM_CHANNELS);
> +
> +    Clock *timer_clk =3D clock_new(OBJECT(s), "timer-clk");
> +    clock_set_hz(timer_clk, K230_TIMER_DEFAULT_FREQ);
> +    for (int i =3D 0; i < K230_TIMER_NUM_CHANNELS; i++) {
> +        g_autofree char *clock_name =3D g_strdup_printf("timer[%d]", i);
> +
> +        qdev_connect_clock_in(DEVICE(&s->timer), clock_name, timer_clk);
> +    }
>
>      qdev_prop_set_uint32(DEVICE(cpu0), "hartid-base", 0);
>      qdev_prop_set_string(DEVICE(cpu0), "cpu-type", TYPE_RISCV_CPU_THEAD_=
C908);
> @@ -191,6 +209,18 @@ static void k230_soc_realize(DeviceState *dev, Error=
 **errp)
>          k230_create_uart(sys_mem, DEVICE(s->c908_plic), i);
>      }
>
> +    /* Timer */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[K230_DEV_TIMER]=
.base);
> +
> +    for (int i =3D 0; i < K230_TIMER_NUM_CHANNELS; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), i,
> +                           qdev_get_gpio_in(DEVICE(s->c908_plic),
> +                                            K230_TIMER0_IRQ + i));
> +    }
> +
>      /* Watchdog */
>      for (int i =3D 0; i < 2; i++) {
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
> @@ -283,9 +313,6 @@ static void k230_soc_realize(DeviceState *dev, Error =
**errp)
>      create_unimplemented_device("iomux", memmap[K230_DEV_IOMUX].base,
>                                  memmap[K230_DEV_IOMUX].size);
>
> -    create_unimplemented_device("timer", memmap[K230_DEV_TIMER].base,
> -                                memmap[K230_DEV_TIMER].size);
> -
>      create_unimplemented_device("wdt0", memmap[K230_DEV_WDT0].base,
>                                  memmap[K230_DEV_WDT0].size);
>
> diff --git a/include/hw/riscv/k230.h b/include/hw/riscv/k230.h
> index 592e1c26bf..42a36664eb 100644
> --- a/include/hw/riscv/k230.h
> +++ b/include/hw/riscv/k230.h
> @@ -18,6 +18,7 @@
>  #include "hw/core/boards.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/watchdog/k230_wdt.h"
> +#include "hw/timer/dw-apb-timer.h"
>
>  #define C908_CPU_HARTID   (0)
>
> @@ -33,6 +34,7 @@ typedef struct K230SoCState {
>      RISCVHartArrayState c908_cpu; /* Small core */
>
>      K230WdtState wdt[2];
> +    DWAPBTimerState timer;
>      MemoryRegion sram;
>      MemoryRegion bootrom;
>
> @@ -127,6 +129,12 @@ enum {
>      K230_UART2_IRQ  =3D 18,
>      K230_UART3_IRQ  =3D 19,
>      K230_UART4_IRQ  =3D 20,
> +    K230_TIMER0_IRQ =3D 101,
> +    K230_TIMER1_IRQ =3D 102,
> +    K230_TIMER2_IRQ =3D 103,
> +    K230_TIMER3_IRQ =3D 104,
> +    K230_TIMER4_IRQ =3D 105,
> +    K230_TIMER5_IRQ =3D 106,
>      K230_WDT0_IRQ   =3D 107,
>      K230_WDT1_IRQ   =3D 108,
>  };
> --

Regards,
Bin

