Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLPd-0006Za-NJ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLPc-0006Yd-7R; Tue, 28 Sep 2021 18:17:20 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLPa-0008Aa-N8; Tue, 28 Sep 2021 18:17:20 -0400
Received: by mail-io1-xd2c.google.com with SMTP id e144so579836iof.3;
 Tue, 28 Sep 2021 15:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nrJY0JRH7gkHHw9GVSAfXD+rUKakb48GEAi83Y2zjAc=;
 b=a80+6RNNzC87asus7OY7XH6sIOUCdf13q9BoFSMaRCjJTE+WH9yRIMoHJPxVv18WIT
 PKw7tffmR/3139/TiaE9/bnI7b2bMHZgWOfp8kPlCkHVqKS42XPBip8KVDCfmwtYtGsC
 1NdwL0z27ARn5JQhN4SOxlH7Z7f6Obwm07K6ZRnpj2mF6ibb6N8M2x6/kQim2hQLtcsZ
 RhqYsFAYdKPnWKpIg4zz240ofAYkQYmtuLcoIRK4DWnYcuT7HixmTTWKs9GlCwZyOFzm
 1ZcYJbcV+UIdkTXnMTce3J6PY8D8RZ5IZlYhfLfcQwJM2oc8o1eLm4iRQ98sQQO5sTtn
 TlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nrJY0JRH7gkHHw9GVSAfXD+rUKakb48GEAi83Y2zjAc=;
 b=Jj9VUswbAvEPl0v9mzIvKqvPJKeHt6k/HRzjfub8ydZHCbwWFP+CnTfbvMoLSYbGqf
 w2eQqxvggv1qX554EVcAYNvixYXMk25ENpJ75iffQji0Wp8O2i6FcsU//fT/AT2M/BKj
 lYvQCa1csO9errm2/G00A4qcIl0DjE5SQCUTNYDLgfNRhYkVJPzm82UQkRWrUFnmQcgK
 M1Oe0aAJ+5MKpNN4XmWiOGBtOEQF1Ml5sUBusJbQlLa49W8mtdf4VH/f9WjiC6VU8DBh
 RukeRbhpXJBiPj39Bk6EscpWpdKZIUjYMi7AswQ4qz+hm3Tr3rLxvjgQHpFn9Mg5twgE
 4S7A==
X-Gm-Message-State: AOAM5328wl1TPYi51Ufc/U7F4aYvp0521HkfRvkl5uv/RC+9s9kePpyG
 O4zUNSbyz7YUKWrZ9j8b+eYIGRkCSeL84SG0HBQaGGVol1gDvi4b
X-Google-Smtp-Source: ABdhPJwiAjUZvNmXSwMYf7pdWRV0u/dj5YwBqkOZGDaF5I8MuBcO64ulHzrkvSw9Z+TBc12AI6MDhDPZk6HCKkhfpZc=
X-Received: by 2002:a05:6638:1483:: with SMTP id
 j3mr6475641jak.63.1632867437419; 
 Tue, 28 Sep 2021 15:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-2-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:16:51 +1000
Message-ID: <CAKmqyKN_FvSf72uWRffe2H3hJvQmFtzqzJu1GzP3D=rCn89+UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 22:17:20 -0000

On Sat, Sep 25, 2021 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> The current MCHP_PFSOC_MMUART_REG_SIZE definition represent the
> size occupied by all the registers. However all registers are
> 32-bit wide, and the MemoryRegionOps handlers are restricted to
> 32-bit:
>
>   static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
>       .read =3D mchp_pfsoc_mmuart_read,
>       .write =3D mchp_pfsoc_mmuart_write,
>       .impl =3D {
>           .min_access_size =3D 4,
>           .max_access_size =3D 4,
>       },
>
> Avoid being triskaidekaphobic, simplify by using the number of
> registers.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  4 ++--
>  hw/char/mchp_pfsoc_mmuart.c         | 14 ++++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
> index f61990215f0..9c012e6c977 100644
> --- a/include/hw/char/mchp_pfsoc_mmuart.h
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -30,7 +30,7 @@
>
>  #include "hw/char/serial.h"
>
> -#define MCHP_PFSOC_MMUART_REG_SIZE  52
> +#define MCHP_PFSOC_MMUART_REG_COUNT 13
>
>  typedef struct MchpPfSoCMMUartState {
>      MemoryRegion iomem;
> @@ -39,7 +39,7 @@ typedef struct MchpPfSoCMMUartState {
>
>      SerialMM *serial;
>
> -    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
> +    uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
>  } MchpPfSoCMMUartState;
>
>  /**
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> index 2facf85c2d8..584e7fec17c 100644
> --- a/hw/char/mchp_pfsoc_mmuart.c
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -29,13 +29,14 @@ static uint64_t mchp_pfsoc_mmuart_read(void *opaque, =
hwaddr addr, unsigned size)
>  {
>      MchpPfSoCMMUartState *s =3D opaque;
>
> -    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
> +    addr >>=3D 2;
> +    if (addr >=3D MCHP_PFSOC_MMUART_REG_COUNT) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=3D0x%" HWADDR_PRI=
x "\n",
> -                      __func__, addr);
> +                      __func__, addr << 2);
>          return 0;
>      }
>
> -    return s->reg[addr / sizeof(uint32_t)];
> +    return s->reg[addr];
>  }
>
>  static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
> @@ -44,13 +45,14 @@ static void mchp_pfsoc_mmuart_write(void *opaque, hwa=
ddr addr,
>      MchpPfSoCMMUartState *s =3D opaque;
>      uint32_t val32 =3D (uint32_t)value;
>
> -    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
> +    addr >>=3D 2;
> +    if (addr >=3D MCHP_PFSOC_MMUART_REG_COUNT) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%" HWADD=
R_PRIx
> -                      " v=3D0x%x\n", __func__, addr, val32);
> +                      " v=3D0x%x\n", __func__, addr << 2, val32);
>          return;
>      }
>
> -    s->reg[addr / sizeof(uint32_t)] =3D val32;
> +    s->reg[addr] =3D val32;
>  }
>
>  static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
> --
> 2.31.1
>

