Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCVeS-0007nI-SU
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 19:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCVeQ-0007jV-UU; Sat, 07 Aug 2021 19:22:46 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCVeP-00057Q-Cp; Sat, 07 Aug 2021 19:22:46 -0400
Received: by mail-io1-xd2e.google.com with SMTP id y1so20310249iod.10;
 Sat, 07 Aug 2021 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=udEyjpnTy5oFsfLKzYpD09hfAryNDTWYHdtmOPpxxb4=;
 b=EHjEEr0LCtfAbEn4m6sd3kSYU9e7rBtsifEQ5q1BLxYVVoTQKmAW+y61y/MLeO4C/Z
 WlI6EfFpNgEOSbfOc/KNlbZFUJ6JxBKpJYZj1Gq5OEi1WN9rbRLHuopWLRGUjvo9SCmE
 YuqJgOrprcyP+3+qAi843BYn1NwYeODOWmxV1M1fzkS/ZGar9MVKlw0IzLndTezm/02Q
 sVzeLr1daDgoweItAfG8OPJ7iBKKG6GOPnyusNpp5ne2MK1HvseLvUFdiPIrCZ4duW6/
 vChRx99ofWjzMS4Snylu3FNgGIwpaJQPXG4S3W7scftEexMde57vN/y/m/aXE3oX9mfC
 wuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=udEyjpnTy5oFsfLKzYpD09hfAryNDTWYHdtmOPpxxb4=;
 b=WmZbE6l9SlDWe54FPQudetOHhOwWs/BJYSEicHJHj0ebzmfSvaOmxwtFBWk0js6M1t
 YSUynmGUwPEtGk9/hXU+pZgSCyEmpedo04GY5kX3DOXkwTjLBzKfyc16YuZ38jgKk4KV
 NgeC89n4+qaL+DA/FV5MWYWbex8Cm09zDsIXfl2B0PnKp2TIGAc1JBKCB4VEk+G/CFh8
 jLjUGWhucYZiWaM+fw1/yCtWu0VoLwD/on991Mi90MTlDS0Om//lNEz550BkWycSZteY
 kB5JK3oqPMb9L2D8TtYd93B36AXprIQzEOI/S3QSR4imnUaeyoEpg9RVvKqocQZs38Az
 TW4A==
X-Gm-Message-State: AOAM533EWoo3vJ4Ze4Tr7qi1IkmtZTGIQ89WeI1KKLYu82YuKeXCwW5w
 HAoqib5wJlEJqGBDMMNziQBe4RPz8EpyUzqOW4w=
X-Google-Smtp-Source: ABdhPJz5prXZtVLrvwdAC8YJeKGWKIzBrhFhQX+Bb4b4qc8AGGHW8Tka5zWPBcqWXkw8Ohj8oxq5sHxyD0v5/GVjy80=
X-Received: by 2002:a05:6e02:12c9:: with SMTP id
 i9mr493431ilm.131.1628378564245; 
 Sat, 07 Aug 2021 16:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210807035641.22449-1-bmeng.cn@gmail.com>
In-Reply-To: <20210807035641.22449-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 8 Aug 2021 09:22:16 +1000
Message-ID: <CAKmqyKN1AgHndPjJP8=Dyz4k7xsX9drwTu8CK6aXEgH8Ys6Stg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Move flash node to root
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Sat, 07 Aug 2021 23:22:47 -0000

On Sat, Aug 7, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The flash is not inside the SoC, so it's inappropriate to put it
> under the /soc node. Move it to root instead.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a..89fb607c47 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -455,7 +455,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
>      g_free(name);
>
> -    name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
> +    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
>      qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
> --
> 2.25.1
>
>

