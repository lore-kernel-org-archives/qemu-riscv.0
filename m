Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIHCD-0007yT-Oq
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 17:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHC3-0007y4-Fo; Wed, 18 Jan 2023 17:46:16 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHC1-0003AS-Dh; Wed, 18 Jan 2023 17:46:07 -0500
Received: by mail-ua1-x92c.google.com with SMTP id b18so65198uan.11;
 Wed, 18 Jan 2023 14:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMGl6hsKo5zTS2425qcXcGNrK0asc0kQJsgGh3YNCWc=;
 b=iLXono22mFEwi6Bt6jAr0RlWaae4GAkrZ+nrLKq/koTqRx+sTzXACrtTqH85b4m/iy
 ZjiMZbCGy2zccMpy04/l55apw58P+J6n0VAk9FyjfPxh6ZOn/oIuVgZvShKxYt5KncVs
 MhfguOVzS+InHsdM2iClJ+0SG3wdMBDVSjESugC+z8bMXrPatLuAvD7E2KdzyXw6KZ+r
 6AooyTPUO/GpG/1ODf8+rI3j+te9tXjqwjlZmKAyn9Ty+jUZeCubfzupRrPLw6EoYvUe
 qVtHyAy0BiOVcE80k+CO1kQGW0cCACgAG14rG3cgUvD/BkL7QONmxJN3WmGe0H7krydv
 ZPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMGl6hsKo5zTS2425qcXcGNrK0asc0kQJsgGh3YNCWc=;
 b=uB1sCRvCYonCL4JrJnhCC5SIqm/0Pff01mUUCa9uEQFSQtOM3kV19p9P0bgoh+Uonn
 2YJqEWZLxLtE/XQ+oG7UbNNoowh694bZVkincR7YfaBejSIfLIvL3RTKWflZ206xYDHN
 Gcz9Mord0oc/ewSa3ym9pzVDnisF69wADIFrmFBgi7jWbtmuy+q6xgnVf+hE10KeugnR
 erv6pz/yKeMijnb/Kz2hGXS5Y+CpZCqovbWiRYQ9S+mCJnpXs7pzM8dUFDUa5SniFOvS
 HcqRnjDGEVOi97sMJJPM4vTPnutHicdXzX5qUaaWy0Ham7OBzT97PhtNu+4v1venudv/
 nBEA==
X-Gm-Message-State: AFqh2kroG2lBLLkYKilq0f0g/tgx8U/qBWPsM4dJKzvBEwHkTg7zWnqj
 HXH5eM8ogSkQug4ukgb8Ks0oyNxMgiqgPSxGCc8=
X-Google-Smtp-Source: AMrXdXtIxvhW9qW26+pjCFqbTZ1uWJdy+h0CCQ15Ln+U6QTMlZbzXF+OAQ2chCv09ZfU1ZAoxYJtBQyRXPC8XWcpFnY=
X-Received: by 2002:ab0:318d:0:b0:5c7:f152:3f4a with SMTP id
 d13-20020ab0318d000000b005c7f1523f4amr1145594uan.23.1674081964248; Wed, 18
 Jan 2023 14:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
 <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
 <61fd483d-5d3a-587b-5c98-4b81afe21d7d@ventanamicro.com>
In-Reply-To: <61fd483d-5d3a-587b-5c98-4b81afe21d7d@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 08:45:38 +1000
Message-ID: <CAKmqyKMaG0x1qtKc_HBjfZyLmR==Tg3-DdzPgzDhm0utmrRMOA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Wed, 18 Jan 2023 22:46:17 -0000

On Mon, Jan 16, 2023 at 10:46 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/16/23 09:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 16/1/23 13:29, Daniel Henrique Barboza wrote:
> >> Recent hw/risc/boot.c changes caused a regression in an use case with
> >> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> >> stopped working. The reason seems to be that Xvisor is using 64 bit to
> >> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> >> sign-extending the result with '1's [1].
> >>
> >> Use a translate_fn() callback to be called by load_elf_ram_sym() and
> >> return only the 32 bits address if we're running a 32 bit CPU.
> >>
> >> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.htm=
l
> >>
> >> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   hw/riscv/boot.c            | 20 +++++++++++++++++++-
> >>   hw/riscv/microchip_pfsoc.c |  4 ++--
> >>   hw/riscv/opentitan.c       |  3 ++-
> >>   hw/riscv/sifive_e.c        |  3 ++-
> >>   hw/riscv/sifive_u.c        |  4 ++--
> >>   hw/riscv/spike.c           |  2 +-
> >>   hw/riscv/virt.c            |  4 ++--
> >>   include/hw/riscv/boot.h    |  1 +
> >>   target/riscv/cpu_bits.h    |  1 +
> >>   9 files changed, 32 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >> index e868fb6ade..0fd39df7f3 100644
> >> --- a/hw/riscv/boot.c
> >> +++ b/hw/riscv/boot.c
> >> @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machi=
ne, uint64_t kernel_entry)
> >>       }
> >>   }
> >>   +static uint64_t translate_kernel_address(void *opaque, uint64_t add=
r)
> >> +{
> >> +    RISCVHartArrayState *harts =3D opaque;
> >> +
> >> +    /*
> >> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> >> +     * it can be padded with '1's) if the hypervisor is using
> >> +     * 64 bit addresses with 32 bit guests.
> >> +     */
> >> +    if (riscv_is_32bit(harts)) {
> >
> > Maybe move the comment within the if() and add " so remove the sign
> > extension by truncating to 32-bit".
> >
> >> +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
> >
> > For 32-bit maybe a definition is not necessary, I asked before
> > you used 24-bit in the previous version. As the maintainer prefer :)
>
> That was unintentional. I missed a 'f' in that 0x0fffffff, which I notice=
d only
> now when doing this version. It's curious because Alistair mentioned that
> the patch apparently solved the bug ....

I never tested it, I'm not sure if this solves the problem or not.

This patch needs to be merged *before* the initrd patch (patch 1 of
this series) to avoid breaking users.

>
> I don't mind creating a macro for the 32 bit value. If we decide it's unn=
eeded
> I can remove it and just put a '32' there. I'll also make the comment cha=
nge
> you mentioned above.

I think 32 if fine, I don't think we need a macro

Alistair

>
>
> Thanks,
>
>
> Daniel
>
> >
> >> +    }
> >> +
> >> +    return addr;
> >> +}
> >
> >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >> index 8b0d7e20ea..8fcaeae342 100644
> >> --- a/target/riscv/cpu_bits.h
> >> +++ b/target/riscv/cpu_bits.h
> >> @@ -751,6 +751,7 @@ typedef enum RISCVException {
> >>   #define MENVCFG_STCE                       (1ULL << 63)
> >>     /* For RV32 */
> >> +#define RV32_KERNEL_ADDR_LEN               32
> >>   #define MENVCFGH_PBMTE                     BIT(30)
> >>   #define MENVCFGH_STCE                      BIT(31)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> >
>
>

