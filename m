Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlCx-0001Pp-QZ
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlCw-0001MX-14; Mon, 16 May 2022 20:37:02 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlCu-0001ws-Em; Mon, 16 May 2022 20:37:01 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e3so17771456ios.6;
 Mon, 16 May 2022 17:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbUqW6sYjIeAcBGZ8Yp3/yjoJBHGfHZy8K5t5TV7ZGw=;
 b=HcwdyUBSRBejtWO/KM/Esjh5d4065Tq5cLfwEJfJdjS7ArI54el6lvZ9gJYESgMTAM
 3u0PSguZ7ELT0jDuEE/lj5Hn3YiXmZNLSwZPEqx0jQKNS4al3xhGdTThnnppNZt6t95H
 zjXATzpVXqoSM0w7sNxu7sHwDeCHErm0gBNnLbDuYVS40jojRBUVmTY2z/zoG5x6yRrE
 LILCY1W2r0FWWJ6ZqNilHmfmxsVGMV8/T60+4rOsc5KWxfrdfz3jn2v6gNlUUNftPzn6
 FZoudN1p5fMtxlxMfM8g1UbhdZ9s4t/Ms8Kd2Rw+cJd/3E/6z8+yad4roYIYnmkoMx6H
 Epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbUqW6sYjIeAcBGZ8Yp3/yjoJBHGfHZy8K5t5TV7ZGw=;
 b=mOxmasyPKNHDMXNrMRBKTAg8M0saT/b91zn3yzxzNmHlX5FUdiu5xGxqlYvORA/qgL
 5xBcjN7ORz0864d0MHbLPi897Uv9/gQH3Qr7YKYpU3Hai17rNBIVrIUknYZTBUBjvNqw
 vRTWZpI9xH/Mnz4LLdkelrBuKL6I+OpBrJ2zG63yUTG7V9RsbpH6jVP81y3pO2f9rwoZ
 dvOLZf59HajLySPuC9ZWH+pFda3vdtD30PBHirHj9kC3hExEZNW6JchtOYuwgQUwmpqH
 QfFPjXpBs7i552UTOdLUWv0rLa3eJ1MD2WnsdQSW+eiABL+09ooI/VKrjAtwktSIxsAu
 0odg==
X-Gm-Message-State: AOAM533sMl/H4Z04Nq0WHpvC4aubQXQKStfvkzVDcrXk92XL88oYJ6Ul
 7Ck7jjenbNs3z2ZfT/YPGLYbO9tbgJA4mRI5kgk=
X-Google-Smtp-Source: ABdhPJxWO78Opj1xpNxXE/D4mfXN9TUrJcfEXRpkTrQpTZ5h+4H0njRy5fIlho+MGfhPnOKM/bmGWAT3Zwhayd5j600=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr10647769jaj.66.1652747817556; Mon, 16
 May 2022 17:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
 <cover.1652509778.git.research_trasio@irq.a4lg.com>
 <09e61e58a7543da44bdb0e0f5368afc8903b4aa6.1652509778.git.research_trasio@irq.a4lg.com>
In-Reply-To: <09e61e58a7543da44bdb0e0f5368afc8903b4aa6.1652509778.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:36:31 +1000
Message-ID: <CAKmqyKNJ6pyubqDDJJSaTVtvWqxV40jy6U1Nb0NjTGSQOCWLdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv: Make CPU config error handling generous
 (sifive_e/u/opentitan)
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 May 2022 00:37:02 -0000

On Sat, May 14, 2022 at 4:30 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> If specified CPU configuration is not valid, not just it prints error
> message, it aborts and generates core dumps (depends on the operating
> system).  This kind of error handling should be used only when a serious
> runtime error occurs.
>
> This commit makes error handling on CPU configuration more generous on
> sifive_e/u and opentitan machines.  It now just prints error message and
> quits (without coredumps and aborts).
>
> This is separate from spike/virt because it involves different type
> (TYPE_RISCV_HART_ARRAY) on sifive_e/u and opentitan machines.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c | 2 +-
>  hw/riscv/sifive_e.c  | 2 +-
>  hw/riscv/sifive_u.c  | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 2d401dcb23..4495a2c039 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>      object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
> -    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
>
>      /* Boot ROM */
>      memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index dcb87b6cfd..d65d2fd869 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>
>      object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
>                              &error_abort);
> -    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
>
>      /* Mask ROM */
>      memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index cc8c7637cb..a2495b5ae7 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -830,8 +830,8 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
>      qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
>
> -    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
> -    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_fatal);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_fatal);
>      /*
>       * The cluster must be realized after the RISC-V hart array container,
>       * as the container's CPU object is only created on realize, and the
> --
> 2.34.1
>

