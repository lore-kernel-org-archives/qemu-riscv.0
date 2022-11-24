Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyM4p-000508-1p
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 18:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyM4n-0004zu-Bu; Thu, 24 Nov 2022 18:56:17 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyM4l-0003Pt-Kt; Thu, 24 Nov 2022 18:56:17 -0500
Received: by mail-vs1-xe29.google.com with SMTP id 125so2754489vsi.9;
 Thu, 24 Nov 2022 15:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y1mBf5triP3zWEFFVpDp3q1CyHenr1kg6xykpSbi/Qs=;
 b=qxyg95eGoxYEqIAnL109mY/koDU5lUL8/r0xpi/WXZZgyYoOMhH74L/4hsJj2k/j6s
 cbh5/2POVyy7yAk1Tct09nRLNN1du4gHBM+V2ftepGS7QeeSFtTTpOqyh4I4cJS/EnDx
 t3e23g3gg/hrGwp4nJpHeP/LvLAnd+V9+tWzmSvr+IwI6V6Zu6czOFDzAHPy56GVPEr3
 6JwL2dnIngXrHsx9jtdKSasWfTtRf1tXQBtJcqRJf2rehKYbHZtmZBrXltNhMD5+2+P+
 S0QCibwtyos2Trmn7Yeac2NszYX0hnGRwUP2WUTPjpreOzAQDOuGbiCMBfnwlEw7jCBe
 OUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1mBf5triP3zWEFFVpDp3q1CyHenr1kg6xykpSbi/Qs=;
 b=YOEh9TyNukbYJoC73J5X9HnnQ4VuKfV/wI+Y4ndLoPQW8ovd6cOzOPB5PCJN+clzzw
 bHC4GD5fYQJwy9iD2xKYouzYPe9ubC5tpexULRoSqEHdQlNcpVWyglR24MbrAKFfSBSo
 f+RxwhAyMB9ukpGjSp0cpULh9SKQKrytIUiLzhb5jaYVoswip3OV8IfZ1heldVrnj3w3
 5ed7fdt2X+sUqc0ATecNvaS1KzQ56+BmSufV+mwLNHR0QwO1BRFYm6XF276PIlBG2ZIb
 OSl65pRQY2VuaqQxl5NXUM856PUi3YunSR+plqkG47BMclJeJfuFZT30XXyHh5O7xmxg
 xNYA==
X-Gm-Message-State: ANoB5pnDaiw8cXpJyE5hREA8Z1tXAUB7pd/BayeA3MUjHeg52u6OEUp/
 2smhXZmhZQ+9QHyt8vk9ehDyMasMAacC9cJlNJU=
X-Google-Smtp-Source: AA0mqf7G4B543C47hSXXokkdHMGQexPrP0sCDCr3NQER6QCQWzctN5qiKa1JSqLdr4DJz1qEFAAKb879uuwfi+qzLjY=
X-Received: by 2002:a67:fe52:0:b0:3ad:c930:b9bb with SMTP id
 m18-20020a67fe52000000b003adc930b9bbmr10826924vsr.10.1669334173815; Thu, 24
 Nov 2022 15:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20221122080529.1692533-1-atishp@rivosinc.com>
In-Reply-To: <20221122080529.1692533-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 09:55:47 +1000
Message-ID: <CAKmqyKOTsEP64N2nO8L7hA9QhoHLbRwiX8unvUNyLZ3YEZfs8w@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Thu, 24 Nov 2022 23:56:17 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

