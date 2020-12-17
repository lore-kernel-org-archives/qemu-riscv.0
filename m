Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpn1g-0000vs-Ae
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 01:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpn1e-0000vd-S5; Thu, 17 Dec 2020 01:44:34 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpn1d-0006xC-4d; Thu, 17 Dec 2020 01:44:34 -0500
Received: by mail-yb1-xb34.google.com with SMTP id k78so24873861ybf.12;
 Wed, 16 Dec 2020 22:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ze4zgdzyo5nyoUMP9kr52mPzVMpR011qR52qegO6CKI=;
 b=Wb7CBkFVDioQ52FMC3JcMblMEPgofleG2XWlkprhEB57a7UVvV1hiMCYkZi0eibnPc
 y3FJigU7M+L59o5mhl72eDtqF59G9nPcGORaJeU6eCLD2Ymx2fCRKtW0hyQVW5h4h7H7
 GOTZq6cjXVOuu4k7/u6mOll+DC3lGwXcSto4u27h84uBTYJTLg8eHE3zt4W3afW6QouH
 ZgRSNMPuc7kdvnMBLASv9wPdlPnpa+qMVKG56sZ3sK8JisyhqMsQrMRnkn7kN1YI2Ws3
 4ovnpKA4ka/c2u3+MUxrD5mBws0/RPhtrfBnCaUxAHTXWjKtwTfwTWTsrIV7eT43ObZh
 BB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ze4zgdzyo5nyoUMP9kr52mPzVMpR011qR52qegO6CKI=;
 b=BG0M4ALy4AYP3PulHRxpvjq2htVqsAfS8WRi87Gh4YCaKd9IHbZ2dhWMNAE+taHCHN
 Gu59yOaFF3pq0KEsRm5DRUwdyBq358bEYMNDcvlNzLgVOBmjlN3nOF2/fNGBPe+gjlKF
 mKJdAj0K6wx6RJ8V/hcyRno0740KjEbduVehyUnEW/s1zJaKJsPaJFq9yMflBrCyQ+Fy
 4GrUVeVzzXkX4xpzMEYEpWKRZ2uFWtxp4FWnI2HySFZDdRrGF1gqgwEU4wiYk2UcQD/m
 38byJyqIBjuj7oMXTI5V+wZWNMH6C5E5KqppR56OLOPfAnliMlkiN93ch1/1f1PD/bim
 UB8A==
X-Gm-Message-State: AOAM531VgPTVsDmvXVItAXI+VRlngYpjEw8wQsVXtnDFZqlE8guSZmKg
 HMrMTrVvyVOue4R4LCCoOVCoH0xDJLr2YXXGRLg=
X-Google-Smtp-Source: ABdhPJzVSm6chFBzNB2My0HtZbnySDfYrP31ZBPHtB0oiSiLbTJhYGIPQaFHbOD4qMFoCC48nTS4ij3jRu5gA8fo2DE=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr57514722ybk.152.1608187471690; 
 Wed, 16 Dec 2020 22:44:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
In-Reply-To: <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 14:44:20 +0800
Message-ID: <CAEUhbmWbCVnEYRAmaQOpfBmnRtOzFrs-85S+g-AfGhy65bTWXQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 17 Dec 2020 06:44:35 -0000

On Thu, Dec 17, 2020 at 2:23 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using string compares to determine if a RISC-V machine is
> using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
> us having to maintain a list of CPU names to compare against.
>
> This commit also fixes the name of the function to match the
> riscv_cpu_is_32bit() function.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  8 +++++---
>  hw/riscv/boot.c         | 31 ++++++++++---------------------
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  9 +++++----
>  5 files changed, 29 insertions(+), 37 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index b6d37a91d6..20ff5fe5e5 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -22,10 +22,11 @@
>
>  #include "exec/cpu-defs.h"
>  #include "hw/loader.h"
> +#include "hw/riscv/riscv_hart.h"
>
> -bool riscv_is_32_bit(MachineState *machine);
> +bool riscv_is_32bit(RISCVHartArrayState harts);
>
> -target_ulong riscv_calc_kernel_start_addr(MachineState *machine,
> +target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
>                                            target_ulong firmware_end_addr);
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
> @@ -41,7 +42,8 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
>  uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> -void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr saddr,
> +void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
> +                               hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
>                                 uint32_t fdt_load_addr, void *fdt);
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 6bce6fb485..83586aef41 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -33,28 +33,16 @@
>
>  #include <libfdt.h>
>
> -bool riscv_is_32_bit(MachineState *machine)
> +bool riscv_is_32bit(RISCVHartArrayState harts)
>  {
> -    /*
> -     * To determine if the CPU is 32-bit we need to check a few different CPUs.
> -     *
> -     * If the CPU starts with rv32
> -     * If the CPU is a sifive 3 seriries CPU (E31, U34)
> -     * If it's the Ibex CPU
> -     */
> -    if (!strncmp(machine->cpu_type, "rv32", 4) ||
> -        (!strncmp(machine->cpu_type, "sifive", 6) &&
> -            machine->cpu_type[8] == '3') ||
> -        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
> -        return true;
> -    } else {
> -        return false;
> -    }
> +    RISCVCPU hart = harts.harts[0];

What happens if something like ARM big.LITTLE needs to be supported on RISC-V?

> +
> +    return riscv_cpu_is_32bit(&hart.env);
>  }
>

[snip]

Regards,
Bin

