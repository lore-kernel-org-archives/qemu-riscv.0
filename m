Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLLh-0002aI-Mq
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLLg-0002Yq-KX; Tue, 28 Sep 2021 18:13:16 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLLe-0005TO-Uj; Tue, 28 Sep 2021 18:13:16 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p80so527752iod.10;
 Tue, 28 Sep 2021 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hxHQZpw7KWbWMSZPvG1Q9EPOwnlcMA88mtvbOKeLeN8=;
 b=bbZn5zpNgco3cfU7gso5MvKHrEFkz1Zdz+f5oGtAJzyav5d5rk1RI1taaupPwg1HqI
 UV9bJ/PjvYFGazhCNL02UM7B7nINRYLVWgnUUFslLTuLqzggu1ZbyzSfFAz88xMPM4+j
 Kwwr3PNWXFbq8ncC8MG04kIfGHP4TX9fvfFxL5YB1SD5qwQ//KXGGxJq4gLyNbOVAJy7
 cyOFeZwJtw/sbiZ/87JVF1tcSt0t2W9wByLLT8v2pwJspkZ1FCzIeqM6v9ao8HD5nx6Y
 ngZh/LeVRtNcUpx0YgzCQm5g8Xh+p9EoOxg8rg86ZjKS9YrDpOkK/d+HI4/BGMFCHOKN
 sy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hxHQZpw7KWbWMSZPvG1Q9EPOwnlcMA88mtvbOKeLeN8=;
 b=k/l7Z8RR3ap/ykQqsF2kFhnr019YOWyEtG9E8Ryt2DKlCkE3ePOkGJ64JHNuJtVl0u
 W1tI6h60nS02/LY+RK+uOIMPbPJvlUKbYBUkc+hGd88pMAaf10d09lN+5mWDM05GvPqg
 ObcrHaMEUZlMaPiWAEF+Ciduf8Gb9Yk5lEEol/bG0yOrljTHc9XxUiWYlG0Id+ZmUVnx
 q86P55AlQZHMEmny6WZcrU5BsIKieMVe2wE+znoIiq9c/Znx+9/Wpqp/cHxNf06AndW8
 pww978w9H/bH7j+PVzllEvi0uixu+JRPvtMrlVHe5WPkXWe4NHjtr0Sxw67dAqwNJR8u
 F7sg==
X-Gm-Message-State: AOAM53325mo/kL9wQkY6wt9H9LrXOP7R9q6qx+7mDGgu/l3oUvsCGzpm
 98qqSZjlzruAXHpqW5ND1f5Li8gormRI2+SGk0g=
X-Google-Smtp-Source: ABdhPJw4Ag2YSUx2RILyZbNV7s1rYefrTjPLqEp4Z2KyLTejI/GcAFiTr94unzDZCkwdZ+bOupMQc6U9OOnKesYfh1Q=
X-Received: by 2002:a02:2124:: with SMTP id e36mr6481418jaa.35.1632867193348; 
 Tue, 28 Sep 2021 15:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-3-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:12:47 +1000
Message-ID: <CAKmqyKO1+H93rj4p=dT-kW4wvszAX53QeQLAFxn6bW=B-Nr=Pg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion
 container
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
X-List-Received-Date: Tue, 28 Sep 2021 22:13:17 -0000

On Sat, Sep 25, 2021 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Our device have 2 different I/O regions:
> - a 16550 UART mapped for 32-bit accesses
> - 13 extra registers
>
> Instead of mapping each region on the main bus, introduce
> a container, map the 2 devices regions on the container,
> and map the container on the main bus.
>
> Before:
>
>   (qemu) info mtree
>     ...
>     0000000020100000-000000002010001f (prio 0, i/o): serial
>     0000000020100020-000000002010101f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020102000-000000002010201f (prio 0, i/o): serial
>     0000000020102020-000000002010301f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020104000-000000002010401f (prio 0, i/o): serial
>     0000000020104020-000000002010501f (prio 0, i/o): mchp.pfsoc.mmuart
>     0000000020106000-000000002010601f (prio 0, i/o): serial
>     0000000020106020-000000002010701f (prio 0, i/o): mchp.pfsoc.mmuart
>
> After:
>
>   (qemu) info mtree
>     ...
>     0000000020100000-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020100000-000000002010001f (prio 0, i/o): serial
>       0000000020100020-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020102000-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020102000-000000002010201f (prio 0, i/o): serial
>       0000000020102020-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020104000-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020104000-000000002010401f (prio 0, i/o): serial
>       0000000020104020-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>     0000000020106000-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart
>       0000000020106000-000000002010601f (prio 0, i/o): serial
>       0000000020106020-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  1 +
>  hw/char/mchp_pfsoc_mmuart.c         | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
> index 9c012e6c977..864ac1a36b5 100644
> --- a/include/hw/char/mchp_pfsoc_mmuart.h
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -33,6 +33,7 @@
>  #define MCHP_PFSOC_MMUART_REG_COUNT 13
>
>  typedef struct MchpPfSoCMMUartState {
> +    MemoryRegion container;
>      MemoryRegion iomem;
>      hwaddr base;
>      qemu_irq irq;
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> index 584e7fec17c..ea586559761 100644
> --- a/hw/char/mchp_pfsoc_mmuart.c
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -25,6 +25,8 @@
>  #include "chardev/char.h"
>  #include "hw/char/mchp_pfsoc_mmuart.h"
>
> +#define REGS_OFFSET 0x20
> +
>  static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsign=
ed size)
>  {
>      MchpPfSoCMMUartState *s =3D opaque;
> @@ -72,16 +74,19 @@ MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(Memory=
Region *sysmem,
>
>      s =3D g_new0(MchpPfSoCMMUartState, 1);
>
> +    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000)=
;
> +
>      memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
> -                          "mchp.pfsoc.mmuart", 0x1000);
> +                          "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET=
);
> +    memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
>
>      s->base =3D base;
>      s->irq =3D irq;
>
> -    s->serial =3D serial_mm_init(sysmem, base, 2, irq, 399193, chr,
> +    s->serial =3D serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
>                                 DEVICE_LITTLE_ENDIAN);
>
> -    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
> +    memory_region_add_subregion(sysmem, base, &s->container);
>
>      return s;
>  }
> --
> 2.31.1
>

