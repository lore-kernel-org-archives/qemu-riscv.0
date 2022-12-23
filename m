Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8YUV-0004ub-65
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YUP-0004tu-94; Thu, 22 Dec 2022 22:12:53 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YUK-0006Pp-3G; Thu, 22 Dec 2022 22:12:49 -0500
Received: by mail-vs1-xe35.google.com with SMTP id q14so2857188vsr.1;
 Thu, 22 Dec 2022 19:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BsyDDBQcJgUCyED0ZrXp6mx5E0o6xaXwgRS3sl6h3E4=;
 b=AOPpCiIToES1i06E56ElK5RFfMItcsm4BfqRwCsVW0lb3AGt80RpAyT2NnFHMYwZe7
 BXY8/5O48gMeKUsHKTrt55jvVS01PtvMCxZDu8+oFWqirVx0Zu7MglpKy6jGrR/1Oeyr
 h/qMzBkNhdt4//3k+ynQbpZclotRgo8j5Jb1uavGhzWWPRjCBdW9mx+RNtHjNXxQaumT
 YjgRBq+vepdkKahKuabRPStgQ927Kl1N/KAbzdobHalCvHH/TJe5ZbAsg4x0wjx2Mdqi
 kbXWUp9IwXZZ+fJ1hzQleWQvSzav/E/RmcNfIdwhmN3Mk3XrucfETpCLcsDJRcvVGnTa
 GyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BsyDDBQcJgUCyED0ZrXp6mx5E0o6xaXwgRS3sl6h3E4=;
 b=TOIeB/zf4+zyko4JbjUsmfKQ8Htv44BFGZFTO3AQMUorTXRkgcOzCCLdlvLIX2DTnX
 P+b3H+/BrsyxFz5QTJfVmIJrmfR6eQIRZubsRXcQPiMM8za0USVSCIaGlrgm482N9+0B
 T+CkXWCYXJdFPmZKvQnYOpIaL9SrCceWcns0TKjGC3UUGzFKyjRgz9ffF5WL2ixtR50d
 cHwDhDs3wFLikEVXrtSBF0ss4zoNg6qAsq2xEKaPHBefNEMZS6GjiSxEjEbAU5D55/90
 Nv9DFrN0f0KPzKmCS6IE613A1FAUuAZRhFOHdfqMWM0v1NKb20dUP0MbDOJJSoM7Hyui
 HqbA==
X-Gm-Message-State: AFqh2ko5BQUKBU87/lvRCScHTVckVdb/Bs5qwxl7mfeTzcqRb4jNikTC
 cXU5MACdgbtMtyBTLhrGZ/pskDjTxQm+hS4SRSw=
X-Google-Smtp-Source: AMrXdXsonYS+yVzOZ+dcjyePaZmaU2apy+QxR69wt4vYgJZ4FQISmYbaYQ9clq9u/PR3vtEbr4yRwHNdN+BYazBq7Yg=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr937897vsb.10.1671765166672; Thu, 22
 Dec 2022 19:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-4-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 13:12:20 +1000
Message-ID: <CAKmqyKO_S=KO4mTGbPzCZ+o_AKAmsJvSPCCPfbsmbcSmofzM9w@mail.gmail.com>
Subject: Re: [PATCH 03/15] hw/riscv/sifive_u: use 'fdt' from MachineState
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 03:12:54 -0000

On Thu, Dec 22, 2022 at 4:29 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
>
> Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
> instead.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c         | 15 ++++++---------
>  include/hw/riscv/sifive_u.h |  3 ---
>  2 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b40a4767e2..9cf66957ab 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -98,7 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
>      void *fdt;
> -    int cpu;
> +    int cpu, fdt_size;
>      uint32_t *cells;
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
> @@ -112,14 +112,14 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      };
>
>      if (ms->dtb) {
> -        fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
> +        fdt = ms->fdt = load_device_tree(ms->dtb, &fdt_size);
>          if (!fdt) {
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
>          goto update_bootargs;
>      } else {
> -        fdt = s->fdt = create_device_tree(&s->fdt_size);
> +        fdt = ms->fdt = create_device_tree(&fdt_size);
>          if (!fdt) {
>              error_report("create_device_tree() failed");
>              exit(1);
> @@ -615,9 +615,9 @@ static void sifive_u_machine_init(MachineState *machine)
>              hwaddr end = riscv_load_initrd(machine->initrd_filename,
>                                             machine->ram_size, kernel_entry,
>                                             &start);
> -            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
>                                    "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
>      } else {
> @@ -630,14 +630,11 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
> -                                   machine->ram_size, s->fdt);
> +                                   machine->ram_size, machine->fdt);
>      if (!riscv_is_32bit(&s->soc.u_cpus)) {
>          start_addr_hi32 = (uint64_t)start_addr >> 32;
>      }
>
> -    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> -    machine->fdt = s->fdt;
> -
>      /* reset vector */
>      uint32_t reset_vec[12] = {
>          s->msel,                       /* MSEL pin state */
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index e680d61ece..4a8828a30e 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -67,9 +67,6 @@ typedef struct SiFiveUState {
>      /*< public >*/
>      SiFiveUSoCState soc;
>
> -    void *fdt;
> -    int fdt_size;
> -
>      bool start_in_flash;
>      uint32_t msel;
>      uint32_t serial;
> --
> 2.38.1
>
>

