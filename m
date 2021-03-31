Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRcyb-0004Uo-5l
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcyZ-0004Ss-Sb; Wed, 31 Mar 2021 11:41:47 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcyT-0007vD-Bn; Wed, 31 Mar 2021 11:41:47 -0400
Received: by mail-io1-xd2d.google.com with SMTP id e8so20570334iok.5;
 Wed, 31 Mar 2021 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cKSeFIa6dPdyzP2HMf8c4pU7IDq4rjDrVIleXb7wbgY=;
 b=TXqmAgRsoHsZgyRaHsUXIUTPfTFoFeyNWVOvWaCc+DiB/N4AXRN4SsT9R090czUmFS
 4UcdOAHw91YrY/mlEJt7jDy8hYdI6lesDNSqI/cDU08997a1OhsnMnYVhvHi7qfpHh3o
 LewG61uFwCljN0Ybdu5T0gKV9QGKBrLRPpLCOG5qL/+6D8v8mu7pA/VGn2yK4sXmHiFc
 HcDLTSfwRaW8HaVWhzSfCqny2z3C/ginGLR+Byx+pzh9JiRMpzvnlrJ+0yElxWFeQi6e
 hb7QgpMByZyu4K3A8TD5qpvXWcMdf8zedXL3gR8w3Jm2U5QXHdK966Ex3hei6ffNF7aa
 usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cKSeFIa6dPdyzP2HMf8c4pU7IDq4rjDrVIleXb7wbgY=;
 b=q2e7WUTi/RKwG33vbUQe3XIFyz41kmJdm3UsNzNPeIt8vLNVwB40CZ9D7tuNSwVNFU
 xnL3CWC9do8M1iMx78Oamjs2ZOF2qN1wqlJLCcnlHqoP55MINdpFt3GyAfWD06KnY6P/
 qCTos1TWZWRZL+OWS/hXXsLWn8xRpS4J0ioAZn59+bIcm0jrL4nIIsxBVowHji+mDERr
 hQ0jrtw8oHtDVmiAKnaYPs1U6QCpVjsiJCBoguXGNWnpnKWZBfH4cPLQUCmUd0MP32JB
 scmuNld/lq1MpH/iSWR8Y/0lxbvrtge4MordHvqAVr3OMIrZ4uJEmICbpzRoZqHHIlhX
 EQig==
X-Gm-Message-State: AOAM532vjglM6PeVSNpYWe//SygTGnEvMSdW0tkSUN7cb1MGSmxbvlTr
 2RBn912ZYj5w77j3SWzf7OR3eEyfOqW/e7ZPC9fY3gEcEGw=
X-Google-Smtp-Source: ABdhPJxifcSU1QTEKF3TIpc9pq/7OZ4CBjTZnRajbgVjk5d21kAl67PL7NP4+0THOkukkhqX2L8bEC+PNhiwE2sgQBw=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr3554626jap.106.1617205299092; 
 Wed, 31 Mar 2021 08:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210321050917.24621-1-vijai@behindbytes.com>
 <20210321050917.24621-5-vijai@behindbytes.com>
In-Reply-To: <20210321050917.24621-5-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:39:28 -0400
Message-ID: <CAKmqyKP8YQ-H7ayNK2vhYGJsm9HW+qcZyX+POoPsXHAPDEzcyg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: Connect Shakti UART to Shakti platform
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:41:48 -0000

On Sun, Mar 21, 2021 at 1:09 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Connect one shakti uart to the shakti_c machine.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/shakti_c.c         | 8 ++++++++
>  include/hw/riscv/shakti_c.h | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 45d0eedabd..6174136ffa 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -126,6 +126,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
>          SIFIVE_CLINT_TIMEBASE_FREQ, false);
>
> +    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
> +                    shakti_c_memmap[SHAKTI_C_UART].base);
> +
>      /* ROM */
>      memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
>                             shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
> @@ -144,6 +151,7 @@ static void shakti_c_soc_instance_init(Object *obj)
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

