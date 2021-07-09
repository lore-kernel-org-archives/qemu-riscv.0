Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hXs-0001bX-Od
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hXq-0001Vs-90; Thu, 08 Jul 2021 23:51:18 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hXn-0000dV-Ht; Thu, 08 Jul 2021 23:51:18 -0400
Received: by mail-il1-x131.google.com with SMTP id a11so8908192ilf.2;
 Thu, 08 Jul 2021 20:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oi8O8R4PmeFWxV+mH57fenw9sCQ75ic9+a8GmXZ9kSU=;
 b=UuJn60SwVWVMVkANcJTGIUEWQcXY8UDHcVCA4gD8mcJghR1Y2auXawaGwSnecYxqzO
 UFfDKX9h6uviNVP2QtuXHPoC38CIS2gsXIjuOekAqCn7osjpNsDRyzsZWzR7BRbUkr+x
 rIJydoTZrQNjl2HDbmLCODoLbAW3VxHfSsswba14IMAnUVXNN8xIT9gdT4Rrzx7BUOBD
 LrBt6RFv4se36uHWD5o0LaZKT904FXdm4+eVJQj6NxyRpzIoPnCKb0vcEr7ovq4NGxPz
 vHp5/Om4H6ahh4JKCSV26SO91a27eApOjUevPHqE1xNpNckQd8DPzL4JfHSCcJ9XpriM
 RW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oi8O8R4PmeFWxV+mH57fenw9sCQ75ic9+a8GmXZ9kSU=;
 b=CE2bdu0Ro2bzrQrvjbTD9PjAWvAq5n0nVNTjPPLi0MH8wNxPA+VqrG+lKUDVxrr4hf
 +6n+bFnt3EcauHkmfeUFYtY1i/PBD2aeE7FZX5hGa8sWknZpYM0LCKoibhQ0LnluN4sT
 zJ89yPu+AIXZ+gHflXMG3WDQa2TVR1FgCBJv4C9fcHp4iVwZUUBl08N/3zlE6XmHpB2b
 dQpSsJ4xb0VQ6MztPgmxThhgsf/H8iOVzNS1KYx2PJ8FISWpACRcCi7AU43matiQPE5j
 neaEE7mnXJhXUOc5Ums7dNh8Z9UHAGMab1aYwB1tT7PWCpTfFGaiNFlyUOqDDID4D0sN
 M3BA==
X-Gm-Message-State: AOAM5302GyX9FfiarttlAs9n/+8KNJwXyt7t3OmGqhbvridX3mIWNdKS
 Nd0UHWVbRsAOC3DiHUV7zFEKJvj0IaQdTYTl4Z8=
X-Google-Smtp-Source: ABdhPJyMUpgBkcHlV6IWRjGpM0NPhS2c29iwnEYcn41/IgzGwvyamVpzlJ2sBLGX9dxBDdPaPtJflAbiCK0wloYBuLA=
X-Received: by 2002:a92:c886:: with SMTP id w6mr24606340ilo.227.1625802674151; 
 Thu, 08 Jul 2021 20:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210706102616.1922469-1-bmeng.cn@gmail.com>
In-Reply-To: <20210706102616.1922469-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Jul 2021 13:50:47 +1000
Message-ID: <CAKmqyKMjSrKkV+-yCA4EE1-33OuX1LL7+W9xGxK6_ydOw=GHhQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Correct the CLINT timebase frequency
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 03:51:18 -0000

On Tue, Jul 6, 2021 at 8:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the CLINT timebase frequency is set to 10MHz on sifive_u,
> but on the real hardware the timebase frequency is 1Mhz.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 273c86418c..e75ca38783 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -62,6 +62,9 @@
>
>  #include <libfdt.h>
>
> +/* CLINT timebase frequency */
> +#define CLINT_TIMEBASE_FREQ 1000000
> +
>  static const MemMapEntry sifive_u_memmap[] = {
>      [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
>      [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
> @@ -165,7 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        CLINT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -847,7 +850,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
>          memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
> -        SIFIVE_CLINT_TIMEBASE_FREQ, false);
> +        CLINT_TIMEBASE_FREQ, false);
>
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
>          return;
> --
> 2.25.1
>
>

