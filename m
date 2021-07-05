Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0Hua-000695-Q6
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 02:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0HuY-00067I-Bb; Mon, 05 Jul 2021 02:16:54 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0HuW-0006oR-Ns; Mon, 05 Jul 2021 02:16:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r135so27462972ybc.0;
 Sun, 04 Jul 2021 23:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pftsnnMzLGQjqqPzFY8DkmRHI+tvZnOzE0YYMWdfR5M=;
 b=Ys4yZWZK7LXPy7jL69xvRjr4qbaVwxjKEgHYEte91JRgvvY46OTVuEUgnvxKHhDZlt
 CBjKms7QAE+myu/KYDA66rFmrOvjEWpo71zZH0fbDyj1UhZURB/YZxpmua0j5KGrcjHI
 B1H6nTpITNqEW6I3c26wSaHZvn5GXt+3cbKrj88dy1Vit/lh1rI+e4kEbN0kfTvt1Jfb
 QwkQcU110gsT/hYTVF5fz30KHnoCIrGeiO/5zlRqeOYHaEk17yOABGikZuBggjHdfbas
 IJF96gW4HbBuSS9AImf/f9WJxC94yDNtAIaT3ZLzdSl2fDbA8r0c6NecktLijm9GNYOB
 r3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pftsnnMzLGQjqqPzFY8DkmRHI+tvZnOzE0YYMWdfR5M=;
 b=qBH2IX04XsgdYu1vENvsmHogmx0LPA6oF+suVqB2br4KtYoO80SAHyzI6O3LgU5VM0
 FYFnwCbxP4faPFiukZ0tgjwVbhc/xGCRLT+ae+ryRZ9bOiPLaCnvwOb4iHSpUEGXNIkf
 r7rqFKQdLaagmrCE4poVUm52mZwk1uAzZigcPaQ2jaQu3IAoByFq4U96D/OX/8IcCIZm
 OEi0FjkXsViNwKssHbxFBSczQvNuJ3LtdEPJDzBo32m8Zir5CKOsFMZ/cWXue9pIDkNJ
 kIQkqG7PRO44U3W/EIWtKqo2GN3f9isOl/tfTYyq2xKxJqKy3qqTUY3Sjb4v5H5f+efA
 5Zzw==
X-Gm-Message-State: AOAM533WYklDvRMqeUdlvt+cY+auwHIpL0mCyntHxjTcyBMULLpj4Asp
 FJsb/J+nGbAWBD4gK+aHpWFWOr8Yr1VYaqPUii0=
X-Google-Smtp-Source: ABdhPJz2PSLTDXqAkMeEvRubWYLy3WnfAaAbiXWp2kp61OUCvQvqdNAHmeks8AU8gl9k6/uSy0ok0LBad8UBylOUKMA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr16472238ybk.239.1625465811457; 
 Sun, 04 Jul 2021 23:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625202999.git.alistair.francis@wdc.com>
 <ee1dfb6bffc5e7f59da0b7de549d5f8b7eccad2e.1625202999.git.alistair.francis@wdc.com>
In-Reply-To: <ee1dfb6bffc5e7f59da0b7de549d5f8b7eccad2e.1625202999.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 14:16:39 +0800
Message-ID: <CAEUhbmXTs5udNh2MQdOOXJ0GfnziRfGDJrD43QewVc+aceZrbw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: opentitan: Add the flash alias
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Mon, 05 Jul 2021 06:16:54 -0000

On Fri, Jul 2, 2021 at 1:20 PM Alistair Francis
<alistair.francis@wdc.com> wrote:

Could you add some commit message to explain this alias?

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h | 2 ++
>  hw/riscv/opentitan.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index a488f5e8ec..9f93bebdac 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -40,6 +40,7 @@ struct LowRISCIbexSoCState {
>
>      MemoryRegion flash_mem;
>      MemoryRegion rom;
> +    MemoryRegion flash_alias;
>  };
>
>  typedef struct OpenTitanState {
> @@ -54,6 +55,7 @@ enum {
>      IBEX_DEV_ROM,
>      IBEX_DEV_RAM,
>      IBEX_DEV_FLASH,
> +    IBEX_DEV_FLASH_VIRTUAL,

Is this virtual address? But it is still physical?

>      IBEX_DEV_UART,
>      IBEX_DEV_GPIO,
>      IBEX_DEV_SPI,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 933c211b11..36a41c8b5b 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -59,6 +59,7 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
>      [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
>      [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
> +    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
>  };
>
>  static void opentitan_board_init(MachineState *machine)
> @@ -134,8 +135,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>      /* Flash memory */
>      memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
>                             memmap[IBEX_DEV_FLASH].size, &error_fatal);
> +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> +                             "riscv.lowrisc.ibex.flash_virtual", &s->flash_mem, 0,
> +                             memmap[IBEX_DEV_FLASH_VIRTUAL].size);
>      memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH].base,
>                                  &s->flash_mem);
> +    memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH_VIRTUAL].base,
> +                                &s->flash_alias);
>
>      /* PLIC */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
> --

Regards,
Bin

