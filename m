Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyPyO-0007iz-DF
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 23:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyPyL-0007ih-E5; Thu, 24 Nov 2022 23:05:54 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyPyJ-0003AE-F8; Thu, 24 Nov 2022 23:05:52 -0500
Received: by mail-ua1-x935.google.com with SMTP id y18so1153094uae.8;
 Thu, 24 Nov 2022 20:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/J6oDCKqI47SzM85qk2dYOhaahnb9N8PVjjsom+CblA=;
 b=PUA9+MeGq7dwtvcWbyvzaEcAVkF/y1SuU8pqo5CUUJoDYERe38V35CX574+dv0ThQt
 qiPbPcBlhnd95jvSyoiZnaV79L69hO0tf9aah4LzKUfI47M3KO97TBVSGHUsKirGLwEJ
 7KICmBj1MUW5tkolzLDdNALMSwOmp1qtiKUhEo58n1pQH4Mwe/h6/vFb4u9SRJdtLHxG
 I4X8uQ7AaEcWNL+Kk3376G3Vf6/g0iHnGxl5u755aaW7IuzVtOQupuqpN4H/BbltZesX
 IgBVMmbeBEulWApuEdGU+LjNBIal4pU/02Oi12ZbrSYummXNxtHdppCNhhknFM3wybJI
 O+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/J6oDCKqI47SzM85qk2dYOhaahnb9N8PVjjsom+CblA=;
 b=IU/fUxGXSldi1IAW1dlCxABzzu+k39GTH2e6g1G/7rFsNV4OQeHVSekRhO+1pm3zze
 +9vupsMSBaRKYXz7TrBUozUQbaP+58hDf40svcjQNkzi3XTEXwSc41+Fh+pOEcoKNG1n
 pC90gJx+MasOBB+dRQYzGhTX7VEiD+fKxll1+/RyGE3k/szFp38EUL8yuBSIqvyiCu6g
 yv8/j7C3xSABtNmsIfy4R183JsCSA+4xSG3ODIwrjEcag68B2sIIskmCYHYXozIwBl30
 ix+cRfMzv93G27lFp0GaZ7Hq9oD4y4IPwfT6/ZUNZU1/ecHEsOL5Akv3xtLDFkzvf7Nk
 XZVw==
X-Gm-Message-State: ANoB5plIuLmsoZYXFcIBy2ckdJRguigdqNajxoYcP95udlZsC6rskOxR
 tATPddRTxV9rBwhlBRtS6w7jmHmdu7sdIhBGoFE=
X-Google-Smtp-Source: AA0mqf7IV3jn7SCVgpHRXH45zKSFqmFaoDTJyvMfmIdKfHAgsB6Y62Rr+xHMVe30v7GmVxvP1VA07XX5kNSGKbWQNWE=
X-Received: by 2002:ab0:65cc:0:b0:418:f104:2ca7 with SMTP id
 n12-20020ab065cc000000b00418f1042ca7mr5511460uaq.70.1669349149937; Thu, 24
 Nov 2022 20:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122080529.1692533-1-atishp@rivosinc.com>
In-Reply-To: <20221122080529.1692533-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 14:05:23 +1000
Message-ID: <CAKmqyKOPhCWX0p+rt04iMv75Fp-C3dgqY=BuK-8wkw_Y+k83xA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 04:05:54 -0000

On Tue, Nov 22, 2022 at 6:07 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The imsic DT binding[1] has changed and no longer require an ipi-id.
> The latest IMSIC driver dynamically allocates ipi id if slow-ipi
> is not defined.
>
> Get rid of the unused dt property which may lead to confusion.
>
> [1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes from v2->v3:
> 1. Fix the compilation issue by removing the other usage of
> VIRT_IRQCHIP_IPI_MSI
>
> ---
> ---
>  hw/riscv/virt.c         | 4 ----
>  include/hw/riscv/virt.h | 1 -
>  2 files changed, 5 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b412..6cf9355b99b6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>          riscv_socket_count(mc) * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
>          VIRT_IRQCHIP_NUM_MSIS);
> -    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
> -        VIRT_IRQCHIP_IPI_MSI);
>      if (riscv_socket_count(mc) > 1) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
>              imsic_num_bits(imsic_max_hart_per_socket));
> @@ -597,8 +595,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>          riscv_socket_count(mc) * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
>          VIRT_IRQCHIP_NUM_MSIS);
> -    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
> -        VIRT_IRQCHIP_IPI_MSI);
>      if (imsic_guest_bits) {
>          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
>              imsic_guest_bits);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f71..62513e075c47 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -93,7 +93,6 @@ enum {
>
>  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
>
> -#define VIRT_IRQCHIP_IPI_MSI 1
>  #define VIRT_IRQCHIP_NUM_MSIS 255
>  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
>  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> --
> 2.25.1
>
>

