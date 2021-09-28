Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLoZ-0006jD-LI
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLoX-0006i8-AP; Tue, 28 Sep 2021 18:43:05 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLoV-0000ET-NR; Tue, 28 Sep 2021 18:43:05 -0400
Received: by mail-il1-x135.google.com with SMTP id x2so729606ilm.2;
 Tue, 28 Sep 2021 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lfa1z9uxZw6CbX+ivcmdIrQiDHgsy1s8i6oWk5JfJf0=;
 b=oPX4JUQm9/VvUuGd8d9WXAct5KcmI4uAk7BXRxYEwfGypuSOWVl1rqdWCuP7ytUMb5
 mmXjNnpSdM+22KSTcW5DLiINYf6C+xd3dWYZB2HKdoiD8qamLSubqvblKkynPuSzITb8
 ARgApDcWFtuRXWZIRlE9i1Roku0FfnTr5MDJo5FszGYRhlbNUT7EbxENpvDjWEnDUcCi
 j5JKuHFTAOPnlc1MzeouqMNiKfmt2ScketuUOLzL8DIxpSiffX9EoQ+ZKzT1Q6Xl0XYI
 1xGN9HyqtZMtMvwcqgpH10auYnYtS0RROSmGta3ayEDRnjA2uKHEmU9RNeHCXSdlTpqE
 c4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lfa1z9uxZw6CbX+ivcmdIrQiDHgsy1s8i6oWk5JfJf0=;
 b=cUYt9rbr1U6JpYqvTGN+xKd/G5CHh6XaLN8u7rV4C/bOUg7fG+cmNTlNgooxPLJyco
 5c/vRmLYJnP7yYO2UeyUt2Fp9WjuaWNNEY4xMBKAb5Ot0Xu6QQtafJioZ+qWeu3jevZm
 HYr8lJ5tIA2vdBRWB6Vf42OYs1G6IS4/M/k+IqAsTTFp9YVPWxHPqh7cPEc0DEQ0H1yh
 b1hL+cIb3/4CrVxLBHxLJLUIbcsOgZkugAuXdEcqcN6QmP9gP/GK7HritBa7zJXSspRN
 8vqey2ePSVOVbskI8AGif+4LzBoN0iBlUaICo627shaxRRv4ffF9L40mHqHsXseMtbTs
 C+fQ==
X-Gm-Message-State: AOAM533Qkm1tYlQF524Mi/Jvytfr+mCuhkBW4JPGp/tFl6Cla7xjwM7t
 oLEFvyfYZX7Ino+dSj2G3jj0dY7J+4I3uDpYZFc=
X-Google-Smtp-Source: ABdhPJz4YgJ7t1r2Xg4LlTyChaQadsSY5b4kTJglJI/E2l1J/ViERk9Qvt7bOjjsAwj0gt6ocuvw0mD5Z7wjoRTtELU=
X-Received: by 2002:a05:6e02:2145:: with SMTP id
 d5mr6157128ilv.208.1632868982128; 
 Tue, 28 Sep 2021 15:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-2-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:42:36 +1000
Message-ID: <CAKmqyKPXJALOhEVyn9+r+8XSUSat1_wJYXMnN4akfmd8Kk=FpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 22:43:05 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

