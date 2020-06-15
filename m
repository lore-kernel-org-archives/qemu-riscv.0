Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkrmL-0004fV-H3
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jun 2020 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jkrmK-0004eG-9v; Mon, 15 Jun 2020 12:16:08 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:40075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jkrmI-0003iT-Fd; Mon, 15 Jun 2020 12:16:07 -0400
Received: by mail-il1-x143.google.com with SMTP id t8so15833388ilm.7;
 Mon, 15 Jun 2020 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xpv2aVaE5epWKjUkmopMDNnkHcoKtX1daBYpy1F/oKY=;
 b=kEth8jedm7rtbYtSIm/mmUJJmn5lRNMjNxWovp4XNbHAMqyW2ve3jsgEZoQdkJ0bZD
 D1uv7QeODbqfhxl9d3LdBQGjPsNXMP8i/Nn3UeQ7qiux8X2qVOOVB6Yt7TXAxoykwfiy
 SHYSDQ3bsSEs4lz2wiV3rjNBvgNfoFper7wheEzZl45CfuhFZm3WbQ0rG8KVKTy+d14m
 TXLf3mzd+vTV3IxSzPnApy8XGR0F32XptG+lVVJ6FTrA1e4pEYjQasDqBV60Bl3OrSWR
 e2esmvp6lNV9AR5l+a6/3LVLtDV3MWdHqEcw58XPdUak4R0lltKEPKWgtvBts00Z5bLO
 Lw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xpv2aVaE5epWKjUkmopMDNnkHcoKtX1daBYpy1F/oKY=;
 b=XIA1hS0at1tSSIHFF0w7f1khr1/qBjU75zjxhuOiEfkCy97XBHrysv8bggqOsPO1W+
 w25NpWRwD/B4/UgmV16yh2iZpW6XF9/x8YLObch+cjGMnzv1tjT5zK+nFNjEtvueltFk
 mGM4HEg/FZxXARy7dQKdZczKFjkGqkVaxvc1pgKmAPXOojyaTfB4ygiwd8BVdPQGxSS4
 Fb4wFOICmtQXhZqR6p0LKf0oN+ccLgSZanO/Ykt+DiMxWIbTBv9nff7aY1/wxHPtQJlW
 3qCW1QYy4DzcKNpf2FAi+eQ7GMkYcuTaSn2gNgzEpuRvQINoLnjg7tZDROy+lMsC4fl9
 av+A==
X-Gm-Message-State: AOAM531gsXaM6ydj5Tt48lj8QkO92mt1gBZB8svfHrpuMChBBIk/04AW
 SQTazm2F9eZeLaJ7E1EaVXuoNfUg8BEx5U2JldM=
X-Google-Smtp-Source: ABdhPJwq2Jo3ylp+UoPORCaBe0iCHB4FOUhmRsqS67inAG2upRW9+wf5+XrqGoIZPgvwx00OSKaZcgLKRlW1VXpLLOc=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr27543401ili.40.1592237765387; 
 Mon, 15 Jun 2020 09:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
 <1591625864-31494-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1591625864-31494-3-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2020 09:06:42 -0700
Message-ID: <CAKmqyKNaoDbbrDzHAzKyw5RzsCbgwWQK4NXkkD5R0SPcOurWGw@mail.gmail.com>
Subject: Re: [PATCH 02/15] hw/riscv: opentitan: Remove the riscv_ prefix of
 the machine* and soc* functions
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 16:16:08 -0000

On Mon, Jun 8, 2020 at 7:18 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This was done in the virt & sifive_u codes, but opentitan codes were
> missed. Remove the riscv_ prefix of the machine* and soc* functions.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/opentitan.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index b4fb836..0907a42 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -51,7 +51,7 @@ static const struct MemmapEntry {
>      [IBEX_PADCTRL] =        {  0x40160000,  0x10000 }
>  };
>
> -static void riscv_opentitan_init(MachineState *machine)
> +static void opentitan_board_init(MachineState *machine)
>  {
>      const struct MemmapEntry *memmap = ibex_memmap;
>      OpenTitanState *s = g_new0(OpenTitanState, 1);
> @@ -70,7 +70,6 @@ static void riscv_opentitan_init(MachineState *machine)
>      memory_region_add_subregion(sys_mem,
>          memmap[IBEX_RAM].base, main_mem);
>
> -
>      if (machine->firmware) {
>          riscv_load_firmware(machine->firmware, memmap[IBEX_RAM].base, NULL);
>      }
> @@ -80,17 +79,17 @@ static void riscv_opentitan_init(MachineState *machine)
>      }
>  }
>
> -static void riscv_opentitan_machine_init(MachineClass *mc)
> +static void opentitan_machine_init(MachineClass *mc)
>  {
>      mc->desc = "RISC-V Board compatible with OpenTitan";
> -    mc->init = riscv_opentitan_init;
> +    mc->init = opentitan_board_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
>  }
>
> -DEFINE_MACHINE("opentitan", riscv_opentitan_machine_init)
> +DEFINE_MACHINE("opentitan", opentitan_machine_init)
>
> -static void riscv_lowrisc_ibex_soc_init(Object *obj)
> +static void lowrisc_ibex_soc_init(Object *obj)
>  {
>      LowRISCIbexSoCState *s = RISCV_IBEX_SOC(obj);
>
> @@ -99,7 +98,7 @@ static void riscv_lowrisc_ibex_soc_init(Object *obj)
>                              &error_abort, NULL);
>  }
>
> -static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> +static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      const struct MemmapEntry *memmap = ibex_memmap;
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -159,26 +158,26 @@ static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_PADCTRL].base, memmap[IBEX_PADCTRL].size);
>  }
>
> -static void riscv_lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
> +static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>
> -    dc->realize = riscv_lowrisc_ibex_soc_realize;
> +    dc->realize = lowrisc_ibex_soc_realize;
>      /* Reason: Uses serial_hds in realize function, thus can't be used twice */
>      dc->user_creatable = false;
>  }
>
> -static const TypeInfo riscv_lowrisc_ibex_soc_type_info = {
> +static const TypeInfo lowrisc_ibex_soc_type_info = {
>      .name = TYPE_RISCV_IBEX_SOC,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(LowRISCIbexSoCState),
> -    .instance_init = riscv_lowrisc_ibex_soc_init,
> -    .class_init = riscv_lowrisc_ibex_soc_class_init,
> +    .instance_init = lowrisc_ibex_soc_init,
> +    .class_init = lowrisc_ibex_soc_class_init,
>  };
>
> -static void riscv_lowrisc_ibex_soc_register_types(void)
> +static void lowrisc_ibex_soc_register_types(void)
>  {
> -    type_register_static(&riscv_lowrisc_ibex_soc_type_info);
> +    type_register_static(&lowrisc_ibex_soc_type_info);
>  }
>
> -type_init(riscv_lowrisc_ibex_soc_register_types)
> +type_init(lowrisc_ibex_soc_register_types)
> --
> 2.7.4
>
>

