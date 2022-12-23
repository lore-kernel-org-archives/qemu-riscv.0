Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8YSV-0003LQ-C0
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YST-0003L6-NM; Thu, 22 Dec 2022 22:10:53 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YSS-0005zL-5a; Thu, 22 Dec 2022 22:10:53 -0500
Received: by mail-vs1-xe34.google.com with SMTP id c184so3483200vsc.3;
 Thu, 22 Dec 2022 19:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ttvdwJVqfsUOwfc+zpLs7RSFjGVYAmds/l/3br/Bn4c=;
 b=dRYC4HOVqnFTB+ptrvKHPbZ2RxV1HT4GpQnTPOBAqOwkFcP0BdE3gN5pW7tA5Dv1Mc
 AjgYRhSq9p87j1j5hKEjBZrrGCD+C9mSvEuGWGc2TYvpY5ffxLBiqAM/Lzq2j7unGIgA
 iZD69N8k28zmClTdf0PCngghgKm3ahoqzw6hyC3KC9hvfmQlOBq7uoA5rFLS+QJd+UcT
 rmdBzHwkqUF/X/ZA2nWXtviqGpRlsgrnvHTxdjLcFPdLKn9vUEWU9dIFWghT6RFBryaM
 vdTqsXpbFAXURw7UhOmyc1qQEPNQCFNZEoYBXeWEoEYPfSF9C6ev80ozB1Lwp+3J7buM
 r8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ttvdwJVqfsUOwfc+zpLs7RSFjGVYAmds/l/3br/Bn4c=;
 b=YPW5LM2bDFzEz/7hdDgwan56fLxjOwPxx0zlhXGR9RM1N6veS+etccvRzdFFeyhSNB
 i8kUxHWgQ1eLGQokpFs+YSVYk4Ehr1JkhDSPqimJnbxM+Hsu5rhB16CYIn0gEIVe/QZF
 a+Yf+TqFO+Om/5UUIfyPsk5aPOGyedLar8U5YhJ9PiVoSHm198c73W3EjrsO2pionDwT
 6kcYsgRDKkYiXfAFcnTJwT8e3qSmBssL7zrWL4W5NC6Z3u13BhC/N6JZ6Zce9ZvgTNWw
 BiB6OtZIU6N3fXID9de4r1T391XZLr49hMukMcJXoZPx7oHhGmVh0gZ6nynr2+YKzWqf
 CJQw==
X-Gm-Message-State: AFqh2kpZhs2FFcfi6SUJGzvNNjQTFT51nuIVimeLFaEzHMHoyDt3fm/J
 hGMMTjqGiEwvCfe5pcratk198DDpfPxL4x8WTaY=
X-Google-Smtp-Source: AMrXdXuI6eemhzZHHoyqBW0d7OPNg4llZE2LwCGAGKAYOaQ5IAmR9lqP7lg9M0OUpsz6o/gH3QByZsVVz0vcDs6ZF2c=
X-Received: by 2002:a05:6102:2453:b0:3b0:f936:788b with SMTP id
 g19-20020a056102245300b003b0f936788bmr886818vss.54.1671765050800; Thu, 22 Dec
 2022 19:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-3-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 13:10:24 +1000
Message-ID: <CAKmqyKPq=SDpXo6oSwZ5W=QeSS6hO2ezKh33odbTMScPCd12tg@mail.gmail.com>
Subject: Re: [PATCH 02/15] hw/riscv/spike: use 'fdt' from MachineState
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
X-List-Received-Date: Fri, 23 Dec 2022 03:10:54 -0000

On Thu, Dec 22, 2022 at 4:30 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
>
> Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
> instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c         | 12 +++++-------
>  include/hw/riscv/spike.h |  2 --
>  2 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 13946acf0d..d96f013e2e 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -52,6 +52,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>                         uint64_t mem_size, const char *cmdline, bool is_32_bit)
>  {
>      void *fdt;
> +    int fdt_size;
>      uint64_t addr, size;
>      unsigned long clint_addr;
>      int cpu, socket;
> @@ -64,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>          "sifive,clint0", "riscv,clint0"
>      };
>
> -    fdt = s->fdt = create_device_tree(&s->fdt_size);
> +    fdt = mc->fdt = create_device_tree(&fdt_size);
>      if (!fdt) {
>          error_report("create_device_tree() failed");
>          exit(1);
> @@ -296,18 +297,15 @@ static void spike_board_init(MachineState *machine)
>          hwaddr end = riscv_load_initrd(machine->initrd_filename,
>                                         machine->ram_size, kernel_entry,
>                                         &start);
> -        qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +        qemu_fdt_setprop_cell(machine->fdt, "/chosen",
>                                "linux,initrd-start", start);
> -        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +        qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
>                                end);
>      }
>
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
> -                                   machine->ram_size, s->fdt);
> -
> -    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> -    machine->fdt = s->fdt;
> +                                   machine->ram_size, machine->fdt);
>
>      /* load the reset vector */
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index 73d69234de..d13a147942 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -37,8 +37,6 @@ struct SpikeState {
>
>      /*< public >*/
>      RISCVHartArrayState soc[SPIKE_SOCKETS_MAX];
> -    void *fdt;
> -    int fdt_size;
>  };
>
>  enum {
> --
> 2.38.1
>
>

