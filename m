Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNFVf-0005AO-Pz
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFVe-00058H-Mh; Fri, 19 Mar 2021 09:49:50 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFVd-0008BS-1k; Fri, 19 Mar 2021 09:49:50 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r193so6137248ior.9;
 Fri, 19 Mar 2021 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJRso0dYhAE/AkfzPdVUEaet7iAN0gow10UI1owp3R4=;
 b=n39AvQtfaxwgvHUO9PPYd8enlb5XIAjuaDdKOEZPlp0uRj3q6Y/wfeQ/XqMtbpjZx+
 OZXONbjSxZiWwizWwZ4h/ZfUKHpUyjWzsxJVtAbYAhdCgM0T9WlpHoL0O3xZfLXQ6QW6
 VwOoXAYYS+CO3NnJTlTcuxWqWKKNas9yQovzRVkiGE14Ms+CO0v/E9cyuuERK9ycL3ny
 lM5bz3uC1YoDUKLJ+LxJczc5JTu1CegRBX6fbEt7HuOnuAoHztTpI5GiWvMIvi/XpyXK
 KLeqq1+Nvf3Q+QcqJO+E+mcZYnLxEz1m8UYL+h3r1Gvr4ra+VDCexALKjuqA+o49iyz6
 F7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJRso0dYhAE/AkfzPdVUEaet7iAN0gow10UI1owp3R4=;
 b=e6ADloMpkdgN4Wszvbj2pv1KcJzThDaWAjs2v4R90XlR2fOWHGGdqP682phhUKhaOW
 vOnJIRYL5+JE18vlP3Pv5TCBGZGLAcfjgwwY6XtJNNrkHfrKO6fEnRLt7GBw7nnmHdaW
 Y6JEwDDikTNFQkzQqlLKGNHtjTaCzocLzm+RWuHHNvUDA0rwspVO8GNzOCybAsxHB4TP
 Zpvb0FT5q7jEQSPSTwGdvK83n+jfoxR7uuDppBG92xIKkgZAA+LTVZhqHJDmmmta5z2J
 mSSRzG8V3NDYG3mzQP2urib29+FQUUgYIZNNMAwsDnCFeZEy59vSHRS0Yhn+d1UIGA9T
 kyOQ==
X-Gm-Message-State: AOAM533m6WYwRCdyyPs8AAh3KGxIf2pfZP7grEKpaKf9gstuIJrv5vQ5
 m8sriuvCM9QfzbA8yE1filTtax1QBFO4ZG+CfAk=
X-Google-Smtp-Source: ABdhPJxG48f+KMAslRyYuK3jrCOrLlaMtGI9rmpS6Ot20qEWWT56x8kjqoQkvEZo+NnYC1UTLN2b4j1KT8wGX3Ckz7U=
X-Received: by 2002:a05:6602:14cb:: with SMTP id
 b11mr2895550iow.175.1616161787556; 
 Fri, 19 Mar 2021 06:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210314083936.76269-1-vijai@behindbytes.com>
 <20210314083936.76269-4-vijai@behindbytes.com>
In-Reply-To: <20210314083936.76269-4-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:47:58 -0400
Message-ID: <CAKmqyKOJ43cf__vXXpEQANPRfyyNFT5WVEcc-hnkfWAPg2kt_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/riscv: Connect Shakti UART to Shakti platform
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Mar 2021 13:49:50 -0000

On Sun, Mar 14, 2021 at 5:11 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Connect one shakti uart to the shakti_c machine.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
> ---
>  hw/riscv/shakti_c.c         | 7 +++++++
>  include/hw/riscv/shakti_c.h | 2 ++
>  2 files changed, 9 insertions(+)
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index e96436a3bf..07cc42a380 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -133,6 +133,12 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
>          shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
>          SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
> +                    shakti_c_memmap[SHAKTI_C_UART].base);

Are there no interrupts?

Alistair

>      /* ROM */
>      memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
>                             shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
> @@ -151,6 +157,7 @@ static void shakti_c_soc_instance_init(Object *obj)
>      ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
>
>      object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
> +    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
>
>      /*
>       * CPU type is fixed and we are not supporting passing from commandline yet.
> diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
> index 6c66a160f5..3abb080d3c 100644
> --- a/include/hw/riscv/shakti_c.h
> +++ b/include/hw/riscv/shakti_c.h
> @@ -21,6 +21,7 @@
>
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/boards.h"
> +#include "hw/char/shakti_uart.h"
>
>  #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
>  #define RISCV_SHAKTI_SOC(obj) \
> @@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
>      /*< public >*/
>      RISCVHartArrayState cpus;
>      DeviceState *plic;
> +    ShaktiUartState uart;
>      MemoryRegion rom;
>
>  } ShaktiCSoCState;
> --
> 2.25.1
>
>
>

