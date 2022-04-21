Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhLuq-0008OU-Bl
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 21:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhLum-0008I8-QQ; Wed, 20 Apr 2022 21:47:24 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhLul-0001MF-4x; Wed, 20 Apr 2022 21:47:24 -0400
Received: by mail-il1-x135.google.com with SMTP id t4so2155560ilo.12;
 Wed, 20 Apr 2022 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+uxHmdUF72vfsbsb+nYetakHZ+OSZMapatuPOxAMs0=;
 b=D7ggzVd1yDgrKembvRsVpmac3gsqYLw4V/OQXx+3nZSKSXOx/st7i1hOiimbve5Slh
 QTxWDvgKwWxh2PSZ+ca5yJWml3GU8dsBInAx6XkbamVQz9UJIzKK6btFkFecUegJ21bE
 kflT3zNiaIyruWuAPJJFXo36u8KawCaE523+yAoSCEoUXp0Gxb2xBuZYy066aa6OjML0
 XDoDa6jPAZNIcZWhVw8VQ7WQts09efIapKTp9DhhY8N5MymNgeJNMFENltmo98IqVqwl
 BAaSoW/ced8ARsAmZ3gKGAK/23vGqXSW/4V8xC+b+eFASFVhyN9D4WEKRv/AcQkcRJyV
 3bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+uxHmdUF72vfsbsb+nYetakHZ+OSZMapatuPOxAMs0=;
 b=wS6YibITtsDLQiq1jbVGPOlwp8AFeW0p8eIQzfCZ0xHzSa4LIQgvPVJDldsR3aj6at
 rn34vC6oP1njM1JGC6lC9i9dvGTfwetyWJfiJLpTKQeTJCPgY4e/UR5aHhv2ycxiti0O
 9C0ESvv+5aETh/2/a5TrfqWmp9fc22ewRzUwLblYA45ceWfPFdBTDv/0jBp4FyDYlfos
 F5JZUZ+f0MjVR4ePMA9Fetdd4e/iGOFVNIZawWjBbw3JItFAv08WEVE5YYcagBoTBi7G
 cWeZK79e313rtI7q/JQY4d5gEYEoirLnAjd7lC6v5n6wgwvxyA0piQSegIqgR8CnmCJ3
 tLfQ==
X-Gm-Message-State: AOAM531Peas6ap34PS0fb664niulP8NoEanXIdq3b378/jZz/0c/XKQF
 ZBXr/IXUhVfvp7GRB7KcQWyX59t9VNHiCx88U2bXTPotyKLwyA==
X-Google-Smtp-Source: ABdhPJxnykMFhy6upaz2U1gvSwnVcvqBjh6IbsZU7zA9tr234WaeocKt2Jvrk3+qhrreGjPMX/KmW3lKL5sJTgAHptw=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr10065913ilb.86.1650505641082; Wed, 20
 Apr 2022 18:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220419115945.37945-1-dylan@andestech.com>
In-Reply-To: <20220419115945.37945-1-dylan@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 11:46:55 +1000
Message-ID: <CAKmqyKMMEqhGJCULzMLht0vLdRgVu-JSovdrfLeUPC_VykA+SA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Support 64bit fdt address.
To: Dylan Jhong <dylan@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, x5710999x@gmail.com, locus84@andestech.com,
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 01:47:26 -0000

On Tue, Apr 19, 2022 at 10:03 PM Dylan Jhong <dylan@andestech.com> wrote:
>
> The current riscv_load_fdt() forces fdt_load_addr to be placed at a dram address within 3GB,
> but not all platforms have dram_base within 3GB.
>
> This patch adds an exception for dram base not within 3GB,
> which will place fdt at dram_end align 16MB.
>
> riscv_setup_rom_reset_vec() also needs to be modified
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c         | 12 +++++++-----
>  include/hw/riscv/boot.h |  4 ++--
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 519fa455a1..852aa92bbe 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -203,9 +203,9 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>      return *start + size;
>  }
>
> -uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> +uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>  {
> -    uint32_t temp, fdt_addr;
> +    uint64_t temp, fdt_addr;
>      hwaddr dram_end = dram_base + mem_size;
>      int ret, fdtsize = fdt_totalsize(fdt);
>
> @@ -220,7 +220,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>       * Thus, put it at an 16MB aligned address that less than fdt size from the
>       * end of dram or 3GB whichever is lesser.
>       */
> -    temp = MIN(dram_end, 3072 * MiB);
> +    temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
>      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
>
>      ret = fdt_pack(fdt);
> @@ -276,13 +276,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint32_t fdt_load_addr, void *fdt)
> +                               uint64_t fdt_load_addr, void *fdt)
>  {
>      int i;
>      uint32_t start_addr_hi32 = 0x00000000;
> +    uint32_t fdt_load_addr_hi32 = 0x00000000;
>
>      if (!riscv_is_32bit(harts)) {
>          start_addr_hi32 = start_addr >> 32;
> +        fdt_load_addr_hi32 = fdt_load_addr >> 32;
>      }
>      /* reset vector */
>      uint32_t reset_vec[10] = {
> @@ -295,7 +297,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>          start_addr,                  /* start: .dword */
>          start_addr_hi32,
>          fdt_load_addr,               /* fdt_laddr: .dword */
> -        0x00000000,
> +        fdt_load_addr_hi32,
>                                       /* fw_dyn: */
>      };
>      if (riscv_is_32bit(harts)) {
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index baff11dd8a..346441e369 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -48,12 +48,12 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>                                 symbol_fn_t sym_cb);
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
> -uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> +uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint32_t fdt_load_addr, void *fdt);
> +                               uint64_t fdt_load_addr, void *fdt);
>  void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    hwaddr rom_size,
>                                    uint32_t reset_vec_size,
> --
> 2.34.1
>
>

