Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxMUx-0001EN-EV
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 01:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxMUv-0001Da-If; Tue, 22 Nov 2022 01:11:09 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxMUq-0008Jj-M9; Tue, 22 Nov 2022 01:11:06 -0500
Received: by mail-ua1-x933.google.com with SMTP id y24so4620495uaq.3;
 Mon, 21 Nov 2022 22:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C3yJO/7bPCepdMxeX5CUNWrqwOslRhbCz+NeUFhvguY=;
 b=DKfvCmj47P/yHislx9k6RLV6FeeNY/uU6TDQ0yoQEb8bG1TVFHqun5nl5iOP5Ghnx6
 SqzhLXT856JWLA0F0/GdcWC7rvSRNn53LQelw4mXk9oclkG5vPcaqnbDd+rRp6FDZ/xt
 V0AoiZmruX7mWFKEi6+waai7d9ialj48W6z3PB8/ySZOv/HPbOXvPpZZVJ+52ms1m5J0
 QFa7z/VxnB+X373OINk6wLD81B6v3DtpynbES9d+1AdSfw/c1BrbmPVo5PH70N9E9b00
 RfTEmH/o4oAPRlEpTEpa4YT8YNo3RErnYJOacdA9wGDgUHm5pb5RGoAsOXrwmSbnJOpT
 04Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C3yJO/7bPCepdMxeX5CUNWrqwOslRhbCz+NeUFhvguY=;
 b=A9P0Nuym1PlibSygWK15hSdKuiWfPSlUrFQeCwb02zvT604pnXQ3BQwNggK8V+/BwO
 80WsAe+b6fbFMlBqeX6fzPVU30Ay4eOCSAwkpHqxUMZFbak9ayo9n43g8dQ4NhDcZQJi
 3znlj/dxlBv6PgzaD2Xa70Imf65izPqWASAIwNtRTT78Een34hAuAZrQRt7DGZmsyC53
 gw0faKsGzrX8HFZlhDVuZH8g1fCCrAj0lr9o+Cm6v2Sjtg34leBWP5zDbqiPjEhbzkYV
 Fpu3PBHUBx5Z36gNWO8UJ1QkiJBSo4wvpacJdTlbrCwfXF7zTGOh59EDZSJzoJHJGhji
 lB8w==
X-Gm-Message-State: ANoB5pkE9FS9dXe8U1yJALavaNW9pNwXjXLT3VxtJyr88NoyDDk73hiS
 noTgwsf60WzUnliyv5749M4P83+S/EObCBFvw5g=
X-Google-Smtp-Source: AA0mqf6mDmkSdH6dW25+9Lc/axa8p7b1NyYpByaoLxLDKTbjjCtGmhpL8LaqBRRspDgmtTQ3P2BZWqVBtRvJjO2rxxA=
X-Received: by 2002:ab0:2a53:0:b0:3d8:d599:ef49 with SMTP id
 p19-20020ab02a53000000b003d8d599ef49mr1695849uar.96.1669097461887; Mon, 21
 Nov 2022 22:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20221113095101.3395628-1-atishp@rivosinc.com>
In-Reply-To: <20221113095101.3395628-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Nov 2022 16:10:35 +1000
Message-ID: <CAKmqyKP-+5hOjn7p_30MfYgK1ANx9P_Y0SE7+NSq6T-GMpYyFg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 06:11:10 -0000

On Sun, Nov 13, 2022 at 7:52 PM Atish Patra <atishp@rivosinc.com> wrote:
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
> ---
>  hw/riscv/virt.c         | 2 --
>  include/hw/riscv/virt.h | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b412..0bc0964e42a8 100644
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
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f71..62513e075c47 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -93,7 +93,6 @@ enum {
>
>  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
>
> -#define VIRT_IRQCHIP_IPI_MSI 1

This is used elsewhere with a different "riscv,ipi-id" and this fails to compile

I have dropped this patch

Alistair

>  #define VIRT_IRQCHIP_NUM_MSIS 255
>  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
>  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> --
> 2.25.1
>
>

