Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jsrZx-0000n2-5G
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 13:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsrZr-0000kk-1Y; Tue, 07 Jul 2020 13:40:19 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsrZl-0005j0-SM; Tue, 07 Jul 2020 13:40:16 -0400
Received: by mail-io1-xd41.google.com with SMTP id d18so1986028ion.0;
 Tue, 07 Jul 2020 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aKDMKwRke8+k+W85RPGTuTS5XI7W+XwYXnxwITWFUts=;
 b=gHUoYdj0eDswe8lJYaJlJyTdOnLWCvhKtkn9zXpRgHHFbXyMumgbe3iz1XKSa6utOL
 Z2fCQEpxnHFdwxjCu0eGRJ1OFtOSVSgrc+nyvuZOxkCqxD8kVCZmnlch9A90kK+2Y4ni
 0ERL5SHm1O8HYPcYvYQ38p8VFCmSyg4fqPBxPm2QiMaOaGjRCy1GS3h+W+qN/2+UBpiL
 jLfIltXuKjtqVoyPr+6Ri7HevFolvYMJIbAQdAi/raLt/VwqohSw6a7hJXW4GIceRc6O
 vT+g8uxjTRyInGDp7mq/5NtuJVe+DsF7N4EsLK9n4cYmCqoZvWnsQW9JfwjhGW0LdVfT
 2PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKDMKwRke8+k+W85RPGTuTS5XI7W+XwYXnxwITWFUts=;
 b=nTCHFWxsQhvrMhyQW3KjHFmW9D+RfB5a79515rhHGzgoLH23+gajP0pEmUc+bzJcz2
 Ul2eTPk6BdUEZpIUAILrJ/5iipRB8VHJY/2uitiT0NpFzUrHyZP7FFxwRsV2FvZXbfPw
 RbXwAWrMCtUMPjSl/COAdK0it2DIijAt6rL0/cxV6s3wzTu+gIizx+Fg5E8S5poxHVGR
 i+m5JyeM8LStPR3dEwGZca6C+Xk0gKu8nD+RZzv4FLAHTZ+Xot6SVw2Hr9f9VC9NMh/9
 /fKru0g8F/iNG/lOAoCX74qgXaoAqefnm2J838BtLGyvvfEqC7V6Tx2JBMbm1fja+K2p
 Ljlw==
X-Gm-Message-State: AOAM531tz0Q+eCQPbiqN63u2fTkuFxKV2CbOiQwaGcEmFK4x9QPLzczz
 iVBlG1W8Iqym/EqabnAKR6JRp+ti6/mmlUku3UI=
X-Google-Smtp-Source: ABdhPJyHpMK5JIWSYFONsS2mjt9gY1WCTlidhk8x0fHkKb7sSvIoJPJDNJlpQZTjTHZfMTZf+GV1Z9da3o7E5/OG43M=
X-Received: by 2002:a6b:8dd1:: with SMTP id
 p200mr32411198iod.118.1594143611991; 
 Tue, 07 Jul 2020 10:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200701183949.398134-1-atish.patra@wdc.com>
 <20200701183949.398134-5-atish.patra@wdc.com>
In-Reply-To: <20200701183949.398134-5-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Jul 2020 10:30:23 -0700
Message-ID: <CAKmqyKNRnW2WqR+ow+Scc6_m9mpAVhrjH9KsU82D-nEfAka6jA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Support 64 bit start address
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
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
X-List-Received-Date: Tue, 07 Jul 2020 17:40:21 -0000

On Wed, Jul 1, 2020 at 11:40 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Even though the start address in ROM code is declared as a 64 bit address
> for RV64, it can't be used as upper bits are set to zero in ROM code.
>
> Update the ROM code correctly to reflect the 64bit value.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c     | 6 +++++-
>  hw/riscv/sifive_u.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index feff6e3f4ed5..4c6c101ff179 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -226,7 +226,11 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
>                                 uint32_t fdt_load_addr, void *fdt)
>  {
>      int i;
> +    uint32_t start_addr_hi32 = 0x00000000;
>
> +    #if defined(TARGET_RISCV64)
> +    start_addr_hi32 = start_addr >> 32;
> +    #endif
>      /* reset vector */
>      uint32_t reset_vec[10] = {
>          0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> @@ -241,7 +245,7 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
>  #endif
>          0x00028067,                  /*     jr     t0 */
>          start_addr,                  /* start: .dword */
> -        0x00000000,
> +        start_addr_hi32,
>          fdt_load_addr,               /* fdt_laddr: .dword */
>          0x00000000,
>                                       /* fw_dyn: */
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 901efab9d5bd..3aaee82f1f28 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -378,6 +378,7 @@ static void sifive_u_machine_init(MachineState *machine)
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
> +    uint32_t start_addr_hi32 = 0x00000000;
>      int i;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
> @@ -460,6 +461,9 @@ static void sifive_u_machine_init(MachineState *machine)
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DRAM].base,
>                                     machine->ram_size, s->fdt);
> +    #if defined(TARGET_RISCV64)
> +    start_addr_hi32 = start_addr >> 32;
> +    #endif
>
>      /* reset vector */
>      uint32_t reset_vec[11] = {
> @@ -476,7 +480,7 @@ static void sifive_u_machine_init(MachineState *machine)
>  #endif
>          0x00028067,                    /*     jr     t0 */
>          start_addr,                    /* start: .dword */
> -        0x00000000,
> +        start_addr_hi32,
>          fdt_load_addr,                 /* fdt_laddr: .dword */
>          0x00000000,
>                                         /* fw_dyn: */
> --
> 2.26.2
>
>

