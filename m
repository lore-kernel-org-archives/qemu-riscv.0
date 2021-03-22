Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOLZo-0004Kr-84
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 10:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLZk-0004Hy-Pm; Mon, 22 Mar 2021 10:30:37 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOLZe-0004J5-Bm; Mon, 22 Mar 2021 10:30:35 -0400
Received: by mail-io1-xd35.google.com with SMTP id x17so2860850iog.2;
 Mon, 22 Mar 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmypr7ivI8Tp3w0vf5KGUu3SE59M5rqWcRqTitRQUh0=;
 b=E3QyVLyk9n+4KHmGyIiCXYTM9ln/TPM9vSO9jMExBmQMBQaiz1hcAzx8iPBWUjdWkY
 hV4ETgFfbTT659m7DQ890HiEjr48Q8+oXK01f9zehg0NVQyULzVHiriak0jnpovA+8E1
 NHmknKnQsRqZ/M0b4+b5l4Muyte2lLhQULHQ85M45bOtcQEqvrLelgcgREnFS+YQy09k
 dltSzKr0mFEzC/t0yl1mZm0yk/BaRW9fVyOBndGdMpLNkRWAUtk2fuwHtSE9ZN0fOi9B
 QJ0JWFAumASP9KkuBS0y9qPAYLrn1evameuRUTfZb3fx+0E0ajB1hksarBi6Sku6LcyP
 HYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmypr7ivI8Tp3w0vf5KGUu3SE59M5rqWcRqTitRQUh0=;
 b=QCxOOtxwpPDxntp8SsVpGFidvl5B+jZ3hQPZkCmVc8r2zp415+xFcqZzfkEWMHE5QU
 TOlO62j5fFVldLnrZB93NeHKd/S0q0vBVvq+M0fBSmHr/OmUrSKO4KjWcUewhxXDWIfU
 IO0zfsEhyviRm30idJzUc479o1ArJpcC8OpnVg4G1bfKIQheu4sJV67rDd5qAqn6cZl5
 oYYg0g3fhZTNbQEwBUhmELTOtTD2hbpDjjpxKt1z+GwtuGXdA1alCk8/66q7/W5Gkgan
 dNTMpbY2RURgeOxqkiHeBbcP+yNqQseRkGCAQRSqLwqILi440+ecFVYptI/4qumb7ICF
 6xrw==
X-Gm-Message-State: AOAM532jEI6KahG8gVSudjETZTZv6YP+M5AzOoMEt1D86I9SWsQhAaf2
 0GOSizYbyVV6WiNVAtzlUMtVgF9b2jDMroRtfGQ=
X-Google-Smtp-Source: ABdhPJyLw9vof8PCkdHKMrwM35PD2s01NuaiWIDcxIXSWBKWfuAW72bSk44UjN7Oao5WbGFa9wZwpqKeNDMoGsQqxBM=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr11281352jap.26.1616423426404; 
 Mon, 22 Mar 2021 07:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210320093509.80016-1-vijai@behindbytes.com>
In-Reply-To: <20210320093509.80016-1-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 10:28:30 -0400
Message-ID: <CAKmqyKMq73Xmq7Bh+2tiqfPC5br-nVVPmhRw+b=jEgbmefxhQA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Drop the unused fdt pointer
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 14:30:37 -0000

On Sat, Mar 20, 2021 at 5:35 AM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Drop the unused fdt pointer in riscv_setup_rom_reset_vec API.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c         | 2 +-
>  hw/riscv/spike.c        | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  include/hw/riscv/boot.h | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0d38bb7426..893e307da6 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -249,7 +249,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint32_t fdt_load_addr, void *fdt)
> +                               uint32_t fdt_load_addr)
>  {
>      int i;
>      uint32_t start_addr_hi32 = 0x00000000;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index ec7cb2f707..0b68710afb 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -298,7 +298,7 @@ static void spike_board_init(MachineState *machine)
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
>                                memmap[SPIKE_MROM].base,
>                                memmap[SPIKE_MROM].size, kernel_entry,
> -                              fdt_load_addr, s->fdt);
> +                              fdt_load_addr);
>
>      /* initialize HTIF using symbols found in load_kernel */
>      htif_mm_init(system_memory, mask_rom,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 0b39101a5e..7c247626c8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -695,7 +695,7 @@ static void virt_machine_init(MachineState *machine)
>      riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
>                                virt_memmap[VIRT_MROM].base,
>                                virt_memmap[VIRT_MROM].size, kernel_entry,
> -                              fdt_load_addr, machine->fdt);
> +                              fdt_load_addr);
>
>      /* SiFive Test MMIO device */
>      sifive_test_create(memmap[VIRT_TEST].base);
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 11a21dd584..27b9569e2f 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -46,7 +46,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> -                               uint32_t fdt_load_addr, void *fdt);
> +                               uint32_t fdt_load_addr);
>  void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    hwaddr rom_size,
>                                    uint32_t reset_vec_size,
> --
> 2.25.1
>
>

