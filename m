Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8YZg-0006Yr-RV
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YZT-0006YG-QU; Thu, 22 Dec 2022 22:18:12 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8YZR-0002zg-Pz; Thu, 22 Dec 2022 22:18:07 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id l17so1778033vkk.3;
 Thu, 22 Dec 2022 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OqOem32B1m2M3WKCMeTdAkJhQcT1LI3Uyv5rNnGqCK4=;
 b=DUSYmoqj68n+9t6bZFkpb+LsSPQSW6wg/ODTWiVk8HI3C2QZQShIbX/dKJ8Ns+56+l
 dg1O832wX670TXsHXYeTZpoBN5FZ/wlsUQj35ifwmTaXAiOidCdFF7Sh5ALKHyh3Rb1w
 tEd4SoOXFSNGZe45B2EjH4fLkRsAOy6V3niV1cR8DfJyLv6vCRhcJ2xWTA3yWJxZb59V
 Og/2hIpcDqlNl/YJJ3WbMz7EOs24ivLp84Mla0AABxdOUTbtVvZnnVS+07/KKgVAyDW7
 um03PXP0P+la0tq7NC2p+5Pq0BB/irPdz+q88HqGXLFNJP1HM4cVQekjf743QosYXf5M
 nbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqOem32B1m2M3WKCMeTdAkJhQcT1LI3Uyv5rNnGqCK4=;
 b=w5fxHCxKWitEaJL8bkys7gFWksPUKNFoBREZTE2367vj0e5ldtZNfyWo7We7Iv9iPE
 dmKdKjAa39zUYMMPKY+gSh+AAUxLklJMwD6jbQ8WUlPoNhCx24TexPeljCjaVpZHO0Lp
 tFIvkWCbbmbxadRMKEedYUGO+p7jGkt/D3vmYtV7ILrgD1V6HxYfsOWb7PJvDFX3oS+2
 MUbHjDG3D1WMu2I5Zx5ixM0smwtlXykaP+8upPX5ZW3r7vLmDBQdiyovek2FJg62rzKf
 7jlNojcjTMOt4spUdqv31zbnxcAnR3mMv7d9Cg2Hs/P0GdixqP6dQoBdnpsISn5bEr8e
 YZvg==
X-Gm-Message-State: AFqh2kpLKAMpocPE4olfJsEqddC7GrfzEp/zFetg6uSC74bZKSq6Ipy0
 LtxqwzKvGBJOOv6TT56SIK5Ce1n8D8HRN/ci3SJdipW2DjVGvg==
X-Google-Smtp-Source: AMrXdXs4ezjjSAzCHJRFWJQG9cIE2zYMiWmzdIhA6PHrW9GM4aPyiblX4ODS6pA3SEm8RTwJfuJ2pYpFzbschOpwUPA=
X-Received: by 2002:a1f:f2c8:0:b0:3bd:3aeb:3006 with SMTP id
 q191-20020a1ff2c8000000b003bd3aeb3006mr846325vkh.26.1671765484391; Thu, 22
 Dec 2022 19:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-6-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 13:17:37 +1000
Message-ID: <CAKmqyKNzTMtngW9NmScXuyZkY=8yPwiLLkTYv80t6M5v-BXE_w@mail.gmail.com>
Subject: Re: [PATCH 05/15] hw/riscv/boot.c: introduce
 riscv_default_firmware_name()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 03:18:12 -0000

On Thu, Dec 22, 2022 at 4:28 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Some boards are duplicating the 'riscv_find_and_load_firmware' call
> because the 32 and 64 bits images have different names. Create
> a function to handle this detail instead of hardcoding it in the boards.
>
> Ideally we would bake this logic inside riscv_find_and_load_firmware(),
> or even create a riscv_load_default_firmware(), but at this moment we
> cannot infer whether the machine is running 32 or 64 bits without
> accessing RISCVHartArrayState, which in turn can't be accessed via the
> common code from boot.c. In the end we would exchange 'firmware_name'
> for a flag with riscv_is_32bit(), which isn't much better than what we
> already have today.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c         |  9 +++++++++
>  hw/riscv/sifive_u.c     | 11 ++++-------
>  hw/riscv/spike.c        | 14 +++++---------
>  hw/riscv/virt.c         | 10 +++-------
>  include/hw/riscv/boot.h |  1 +
>  5 files changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 7361d5c0d8..e1a544b1d9 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -75,6 +75,15 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
>      }
>  }
>
> +const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
> +{
> +    if (riscv_is_32bit(harts)) {
> +        return RISCV32_BIOS_BIN;
> +    }
> +
> +    return RISCV64_BIOS_BIN;
> +}
> +
>  static char *riscv_find_firmware(const char *firmware_filename)
>  {
>      char *filename;
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9cf66957ab..ddceb750ea 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -533,6 +533,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> +    const char *firmware_name;
>      uint32_t start_addr_hi32 = 0x00000000;
>      int i;
>      uint32_t fdt_load_addr;
> @@ -595,13 +596,9 @@ static void sifive_u_machine_init(MachineState *machine)
>          break;
>      }
>
> -    if (riscv_is_32bit(&s->soc.u_cpus)) {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV32_BIOS_BIN, start_addr, NULL);
> -    } else {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV64_BIOS_BIN, start_addr, NULL);
> -    }
> +    firmware_name = riscv_default_firmware_name(&s->soc.u_cpus);
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
> +                                                     start_addr, NULL);
>
>      if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index d96f013e2e..43341c20b6 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -191,6 +191,7 @@ static void spike_board_init(MachineState *machine)
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      target_ulong firmware_end_addr, kernel_start_addr;
> +    const char *firmware_name;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      char *soc_name;
> @@ -261,15 +262,10 @@ static void spike_board_init(MachineState *machine)
>       * keeping ELF files here was intentional because BIN files don't work
>       * for the Spike machine as HTIF emulation depends on ELF parsing.
>       */
> -    if (riscv_is_32bit(&s->soc[0])) {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
> -                                    htif_symbol_callback);
> -    } else {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
> -                                    htif_symbol_callback);
> -    }
> +    firmware_name = riscv_default_firmware_name(&s->soc[0]);
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
> +                                                     memmap[SPIKE_DRAM].base,
> +                                                     htif_symbol_callback);
>
>      /* Load kernel */
>      if (machine->kernel_filename) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 94ff2a1584..408f7a2256 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1237,6 +1237,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      MachineState *machine = MACHINE(s);
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> +    const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>
> @@ -1256,13 +1257,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          }
>      }
>
> -    if (riscv_is_32bit(&s->soc[0])) {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV32_BIOS_BIN, start_addr, NULL);
> -    } else {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV64_BIOS_BIN, start_addr, NULL);
> -    }
> +    firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
> +                                                     start_addr, NULL);
>
>      /*
>       * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index c03e4e74c5..60cf320c88 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -37,6 +37,7 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
>                                            hwaddr firmware_load_addr,
>                                            symbol_fn_t sym_cb);
> +const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
> --
> 2.38.1
>
>

