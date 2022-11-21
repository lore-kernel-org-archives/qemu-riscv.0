Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1owv45-0005iP-HK
	for mharc-qemu-riscv@gnu.org; Sun, 20 Nov 2022 19:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owv44-0005iC-0d; Sun, 20 Nov 2022 19:53:36 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owv42-0001zE-0y; Sun, 20 Nov 2022 19:53:35 -0500
Received: by mail-vs1-xe29.google.com with SMTP id m4so9815622vsc.6;
 Sun, 20 Nov 2022 16:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8wJIn3mQyY4S/+yrbsCXpBkfFX2C44WYPqLK4tvv1Ww=;
 b=o0HZiXaLC4Wnh1eGbB7tg+1BpAXfFHOrVEz/vyZbsC5voSx1g/e+AWvmQfVv2pS5c7
 B72ZUuWWUayBAMJboDPa4iGGTBbU1BOUI3w0c2yjw8WKBM+nXAiGep95PqVOhssskIoF
 qbqXwtKtaLa6IDfQjzaarSKeWCjQrLC4XT6VMXFnhKzN6Vb4GtZhz597Pk7A1nnvlGKX
 LFLhXPbwIYxl5uf8RguN4yxZpxFAGM+6vRluQu0+1SN6rGsYahGM3XnSeHgEHJfXFUre
 ACfmoJI1+HeyHxT0Sq0qayYitoBbWdYqgJhusN+HsjXo4MRBRoIDV7qxs1SN1KwLMYW5
 I0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wJIn3mQyY4S/+yrbsCXpBkfFX2C44WYPqLK4tvv1Ww=;
 b=YaWTYfJPXgSiaYNgJE9M58h3tYVIBKW2mPpQ928tXlOWCui9FR+o0gTKySLLSWIrLA
 zIyxCsDDUqNaU+tJiRIkvv8vxdLtL7ZRSP4HPz/gFKmHxbO+PeVm1Cn0o8xmqMHZo9VE
 qr+nHBiMiqLPujVpZ3iZJT1zXJgVtFcfU7YrQXzP9BLPTejQFytIVeniuYm3AI15oPVl
 06WHgCmk75T0qnZ56oko1nwbxxqWs5oISR/Y4//az+6GFGXJY2PxdeoQamLLPOTnSlHT
 ycUQIUsj4ogPY7uhMpWG1HSs5Crc7LpewKR0UTg4jiRYRqfbZ1AE7tOsF4OOl5jXBJMb
 fyxg==
X-Gm-Message-State: ANoB5plrrYaoiqFJ8MMoXN+A6pYCar05dhYuJ6aW2mk15O9wAw02TgZA
 3mR6RYHUnKCoGrJhdKWkvYxF09jmuq3pL3E4URM=
X-Google-Smtp-Source: AA0mqf4DcPI2uJaW7LHsATPoxdjmoANgymqRZYYXLeWIG8aBNvGaJVQVAxZIaMaLJCcmhqgdRvH45Kst50X0VoZ1o6g=
X-Received: by 2002:a67:fe52:0:b0:3ad:c930:b9bb with SMTP id
 m18-20020a67fe52000000b003adc930b9bbmr38655vsr.10.1668992012278; Sun, 20 Nov
 2022 16:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20221113095101.3395628-1-atishp@rivosinc.com>
In-Reply-To: <20221113095101.3395628-1-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 10:53:06 +1000
Message-ID: <CAKmqyKMn=kFgP6a4zeir-hYfxzfKD462+VZqO0tHgDTwnAq50g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Remove the redundant ipi-id property
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
X-List-Received-Date: Mon, 21 Nov 2022 00:53:36 -0000

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

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> 2.25.1
>
>

