Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2mAT-0005Qn-AS
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mAQ-0005QJ-A1; Tue, 06 Dec 2022 23:36:22 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mAO-00069M-LG; Tue, 06 Dec 2022 23:36:22 -0500
Received: by mail-vk1-xa34.google.com with SMTP id r3so3126337vkq.13;
 Tue, 06 Dec 2022 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLjrn7IBUfvP+lb4fdZhRhof0Jg0nVmbesdWAZwaMfY=;
 b=OPoFbgZjTTBJwW7GW0iLRziaqtDjH1g3y+kqOZt22MLJWezPgNoLe7EEmc4bJYese2
 Ox/w1HbKX9R7W8rZFGEjwFOsMSzT91p0HhJzTI0yIx+HSyL+ptVoDEF1SAcfXJ9iLo8U
 Eeze3rtJM52QONMKGOwJrHYUsyMBzVKyZSU1XmAk0R0S/GHhzEJvTLiVOXUrPUSFi87x
 6nHudlc9B7ROAMc/n6B0H8a1PFPn5MJhR77nq8njZLFf4IXsZTLSlYtpWBUJZJThKCiK
 aFewAm8yI3NdhQjqBD2o0MelQadBRajKYNdqisgyUurXpYThEzy0xgMP/vyT/RHPxjJu
 EjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLjrn7IBUfvP+lb4fdZhRhof0Jg0nVmbesdWAZwaMfY=;
 b=6q+ljw1VBwalYi9bPJen0y8G/ZQmTRWhtdJY6GD5doyEj26+8fi3nSsjV7hjtCmVZQ
 IELkjTDrPghdWPqXELVvR5azcQx9mB4fYhyMVv1OG9qPU4KtPUR/Iuab0Lyn4ErNI6QU
 yfbTR6HO79MTNolusya9ewQjJVsBdDHw2Vl4N1W1EgB7apL6KsV9Hpn3S0o2q5fY42zA
 wuciK4JPRbW8wn0iRy6UzGoz7DOIqn/StXSbpiCzjJfDEZrKL/36+RCYV2bZmFPXaTUd
 Ci0N+S2Jj3kqivopmxDaW1f+TtK0DZhKlsiluObfWo4CE+J4UNwQVtGJ1zdj/0tEeXrF
 NUQg==
X-Gm-Message-State: ANoB5pn1x0/lR1VGAiqHjOBWGDbPeFOF4VCtsTwXGMYTX2l9eJu5vwlb
 9kF+hCQE/wv9TQJRJ8nFJs6Pbwe10I6yHxfuYtw=
X-Google-Smtp-Source: AA0mqf7Fjar332l5g/vSIkIhD7PRApWzLqoYame7yhhhRPU+59xh4frbVW/qv66rk154v9LAd7wLb03jmoD2dEb5AtI=
X-Received: by 2002:a1f:e3c6:0:b0:3b8:ba98:bd43 with SMTP id
 a189-20020a1fe3c6000000b003b8ba98bd43mr43049873vkh.34.1670387777974; Tue, 06
 Dec 2022 20:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-12-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-12-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:35:51 +1000
Message-ID: <CAKmqyKP2Z+WgtfqoZMy+WZWU6PWthQe26AXArsBBuxnC8j9+JQ@mail.gmail.com>
Subject: Re: [PATCH 12/15] hw/riscv: virt: Fix the value of "riscv, ndev" in
 the dtb
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:36:22 -0000

On Fri, Dec 2, 2022 at 12:11 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> Commit 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")
> changed the value of VIRT_IRQCHIP_NUM_SOURCES from 127 to 53, which
> is VIRTIO_NDEV and also used as the value of "riscv,ndev" property
> in the dtb. Unfortunately this is wrong as VIRT_IRQCHIP_NUM_SOURCES
> should include interrupt source 0 but "riscv,ndev" does not.
>
> While we are here, we also fix the comments of platform bus irq range
> which is now "64 to 96", but should be "64 to 95", introduced since
> commit 1832b7cb3f64 ("hw/riscv: virt: Create a platform bus").
>
> Fixes: 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/virt.h | 5 ++---
>  hw/riscv/virt.c         | 3 ++-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f..7c23aea4a0 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -87,15 +87,14 @@ enum {
>      VIRTIO_IRQ = 1, /* 1 to 8 */
>      VIRTIO_COUNT = 8,
>      PCIE_IRQ = 0x20, /* 32 to 35 */
> -    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 96 */
> -    VIRTIO_NDEV = 96 /* Arbitrary maximum number of interrupts */
> +    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 95 */
>  };
>
>  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
>
>  #define VIRT_IRQCHIP_IPI_MSI 1
>  #define VIRT_IRQCHIP_NUM_MSIS 255
> -#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
> +#define VIRT_IRQCHIP_NUM_SOURCES 96
>  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
>  #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
>  #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..c4ee489a80 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -468,7 +468,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>          plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
>          0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
> -    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
> +    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
> +                          VIRT_IRQCHIP_NUM_SOURCES - 1);
>      riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
>          plic_phandles[socket]);
> --
> 2.34.1
>
>

