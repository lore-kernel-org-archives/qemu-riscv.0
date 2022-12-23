Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8Yb7-0007HN-UG
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8Yb6-0007H3-It; Thu, 22 Dec 2022 22:19:48 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8Yaw-0003Ez-D1; Thu, 22 Dec 2022 22:19:43 -0500
Received: by mail-vs1-xe34.google.com with SMTP id m2so3475129vsv.9;
 Thu, 22 Dec 2022 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YMeICoaABifER8ncBwj1Ia/yU4N05iJ40CGgYEUQ9Z0=;
 b=k+TKULjaoXoiS0vcqAISYb+BQSrqDqIkRrsCOtmWtRVFBGeAfwISuc0QD6dcoejeQS
 EAisVob0BmgM03PczA0SwpSRIzgob3eP4aEnkxlGwk/S55EGeJOsHMVmVkNsZwi8ofLA
 /ryKSwcqJqFp16ht9/Aw7oF1xM0JIPeQVXxmFC+20Ae/TaAfGyUBaMMXu9A3D3fv/KfG
 c1kItfeTtY9cBjRHVTq3nb6MDQ4h5hT32XleU6kktnH9VMeVGMczoCIqFZVLD4Svehdy
 lqb/SJ4Ezh4FJvttY3PDUn9SRj042QkkrW3P7f6LkNovKOiGh6yymq6mQ5m/CWuV+DgY
 DnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMeICoaABifER8ncBwj1Ia/yU4N05iJ40CGgYEUQ9Z0=;
 b=IWbwAcPymVWWQrDuIKSrV/XNH0439vP2xF7e/PcKPA1D4B7gJK1bd4bIUpwUizvGxC
 nuCr8jZy+n6ssC7b6p7Q+SMwU1xAdMNkbsewauawMxZv9P4ne2GyQrv/RLcJ/A1cPmaU
 46rRnYE5jlY+5FYOzb0KYmCwk4NBJx7bySuCpqDkxdLZ7GB3i7RYv7AtOQHqjVyK4Hu+
 S/KI5BpzDlaNANXQ9ptngNK87dP7Yt9OXOanfUvQmV7VletZJPrSyxoAfD9BohzMR4bu
 LTGGCHl6euuBDCC9XhxJF7cHly8uCQLkHR5fPd4W8ymNukBRCwAIA3orECAwqwbuAAqV
 PvNQ==
X-Gm-Message-State: AFqh2kqn2pX98YAg27Jie2Or19y4XesXZ97he4nx8+oI9yE8UJEFci4w
 f5AqyNaFKwDEff0g31yQ+HLH9L6+Y2vjrf15/V67ZKVYbudjMA==
X-Google-Smtp-Source: AMrXdXsHfWradt1AUnA7HH/DFsYk+pqIiZmf8cPSjoINR7RLa+XjgC4cfyBomAD1udoyL84jbfu/15SjGG3+q94lnFo=
X-Received: by 2002:a67:e208:0:b0:3ba:8fa7:5f9e with SMTP id
 g8-20020a67e208000000b003ba8fa75f9emr833233vsa.64.1671765576980; Thu, 22 Dec
 2022 19:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-7-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 13:19:10 +1000
Message-ID: <CAKmqyKOpKZ4anXZS4XA3do+C_LgSeg-kx5sdBqj57Y000oa2sQ@mail.gmail.com>
Subject: Re: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 03:19:49 -0000

On Thu, Dec 22, 2022 at 4:28 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This will make the code more in line with what the other boards are
> doing. We'll also avoid an extra check to machine->kernel_filename since
> we already checked that before executing riscv_load_kernel().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 43341c20b6..f37a9bebbf 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -257,6 +257,10 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                  mask_rom);
>
> +    /* Create device tree */
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> +               riscv_is_32bit(&s->soc[0]));
> +
>      /*
>       * Not like other RISC-V machines that use plain binary bios images,
>       * keeping ELF files here was intentional because BIN files don't work
> @@ -275,6 +279,17 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
>                                           kernel_start_addr,
>                                           htif_symbol_callback);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> @@ -283,22 +298,6 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> -    /* Create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> -
> -    /* Load initrd */
> -    if (machine->kernel_filename && machine->initrd_filename) {
> -        hwaddr start;
> -        hwaddr end = riscv_load_initrd(machine->initrd_filename,
> -                                       machine->ram_size, kernel_entry,
> -                                       &start);
> -        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                              "linux,initrd-start", start);
> -        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> -                              end);
> -    }
> -
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
>                                     machine->ram_size, machine->fdt);
> --
> 2.38.1
>
>

