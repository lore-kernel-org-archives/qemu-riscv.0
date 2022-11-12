Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oteYg-0005G8-Ig
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 19:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oteYc-0005Fe-N9; Fri, 11 Nov 2022 19:39:41 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oteYa-0008Ey-6L; Fri, 11 Nov 2022 19:39:37 -0500
Received: by mail-qv1-xf36.google.com with SMTP id h10so4403218qvq.7;
 Fri, 11 Nov 2022 16:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eTEcolD+Pva5e8+WteOkxUV8ymR+9oj49/bupPLJlB4=;
 b=GYW+TeEiB/vzSGisKAkP56ZOm5HT/SxgNp9vKobAtfeHGpMtbEdM194Ya2YIv5pD1/
 bwl/i5jmjyYZdWoRItSUK/1gD4ITjvDccseH5Mh02fopsZw5ykL7V8/K5XVCWe+1M3Kp
 R3FMBYjhIcvneWtuPDdztzF0qJHo8xnjwEqHcWX6d9bcIP3Srr5gxlDbwMqt+cu8w6Y/
 nb1GpvHXdGskTUYOUjK7KXZJnp0VvyrEI3dCUyZYw/PFx4MrbOGsgtrB6yVthleW8VVF
 8tVevrZGGmEvcnpOZ8/HmbO/osSl7WrdSF49THKSErIDNPFbz08ONETZbcmWKrx84j6c
 J6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTEcolD+Pva5e8+WteOkxUV8ymR+9oj49/bupPLJlB4=;
 b=6lUqclkT7hQ44D15yZ5eezJplTnrTg5XSlnAyN2U5FCZ5efVMXzvJyiuUaUSq0z8e4
 LV07LvC5HFStwtdSOxHUOLWPqLmcOYNkRPfIuunSUhyp0NvDG0bxdctNFacKn5XTUXc9
 iW5Gm/FtNcRwhdir9iM1gP3Wh7P8a7wTFCtaBEfrTklkdF2oAlRqSAiv6Ke3j7K3QO5G
 9CelIj10NrevTm5UDaFscy55G1mx/OWaaflVYYC208GWYmEeA+RKd9/ETl0nzy5XoFZd
 tAW2zVv17rQbtZvhvfDwwgQGOEbhyn0zlg4L4W4P5XlALShyGhyBrF3LeOJnwQfF8htS
 kBpg==
X-Gm-Message-State: ANoB5pk6awu5Kf4YQsLSelIbmThUUMKfygu+LJtA6kPnkUGSEuC1XiJ6
 Seam+Ydvftlw5fTLKb06QJe/LEVMHdHIlq/SSB4=
X-Google-Smtp-Source: AA0mqf4epZSsmMFjZ5+6rtmibYWQMkylwIp00w+lw5jhKzSXLiSzUWf8bvRQocWkBT3sHrZ/0MT6FzjHEvXuvb+M2O8=
X-Received: by 2002:a05:6214:2b87:b0:4c6:1edf:39d2 with SMTP id
 kr7-20020a0562142b8700b004c61edf39d2mr4110084qvb.122.1668213574920; Fri, 11
 Nov 2022 16:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20221111201337.3320349-1-atishp@rivosinc.com>
In-Reply-To: <20221111201337.3320349-1-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 12 Nov 2022 08:39:24 +0800
Message-ID: <CAEUhbmV5ZJ0YnrGEtqTJ9PCCdGsLjxpVnK2qHhc7H9XBDHDkhA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove the redundant ipi-id property
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 12 Nov 2022 00:39:41 -0000

On Sat, Nov 12, 2022 at 4:14 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The imsic DT binding has changed and no longer require an ipi-id.

requires

Could you please put a link here to the upstream imsic DT binding for reference?

> The latest IMSIC driver dynamically allocates ipi id if slow-ipi
> is not defined.
>
> Get rid of the unused dt property which may lead to confusion.
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
>  #define VIRT_IRQCHIP_NUM_MSIS 255
>  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
>  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> --

Regards,
Bin

