Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIId9-0006Ct-Tq
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 19:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pIId8-0006CO-4c; Wed, 18 Jan 2023 19:18:10 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pIId6-000879-D5; Wed, 18 Jan 2023 19:18:09 -0500
Received: by mail-ed1-x529.google.com with SMTP id s21so882867edi.12;
 Wed, 18 Jan 2023 16:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+DqgKN+dpFMI7BIqNAfDTo6vv6Byh9zdB353uCpjEM=;
 b=fDpxdTbWqpWMhfy9bsD8GZkluE+msIYzKxJAFFzhGQoHe/7Oxj5/SS4W9Ho26im8V9
 nDFci/mFIXgyHbKvUQklaEVd/eZup+fhBZOofVl5CCeyTh6yMlk/Tm9MG3ks/5xnfDz/
 DwyENe48uqvAa+vGqUpf6Zr7X6vh8wnM1cgTdcx0GX9OnmlERJFo8Ks+jByAHi/10gNN
 jNPJ4sQ6o0tejCWGsxFtosjAwQpXxrQmEbQYFsk/v1u7sCFxP8cT0Qbt5SySQd78d5W7
 typNFsAysaJws8D/VblLJNt2RWD9aklho9xBdm79LTKd3IfpBQcmURxAXudMD1l8EW0q
 auqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+DqgKN+dpFMI7BIqNAfDTo6vv6Byh9zdB353uCpjEM=;
 b=5/FkUP6x9AhzVLXKs4G5BEwFj5IA0Bj5sjFbTPy4SZlQWPKVN3SIxwou7AwpWrSUmH
 efbj2NDS6Z8q4OEbQr7k+jLp62J59rbgFIO8aZ2NkdeCtwAM3dqfPV+FRnLEmXCw2mWe
 4JxP8kwSpmI21+sjjJS8jS+eWBGZb3hSIs7IZJyT2bgMhGK61sD2abCB0xGp+nAEU6GS
 inCVFPXf4fbHy2eOUTsiX3cuPzl4rESdT9/adPls4eVGFRa3H02X9mLU5GLcrIOk2x8Z
 Lm6jFOpAVGtMkwzHYo9/fS1TJeLfpIkLxcf9lZyezKXwpqZSqhKcGL8+k6t7eTJI3qu9
 pIrw==
X-Gm-Message-State: AFqh2koBFAAJtBdV1ZGG4tesW9dfhT1yh8/bmF6fwFa2+DJN3gQPHwfn
 UXhqVxwYYDTjAH4UwqVmmgvMLAi+PDpUHwhrAe8=
X-Google-Smtp-Source: AMrXdXuE0nlfnMeha4h04Qi/4QGVzJ9dfXuEWLoZnfjc5cVsEFhWHzZL6FI8614+MScO+/HF2Y6u9YXX19UlsdOV4Zw=
X-Received: by 2002:a05:6402:2054:b0:498:216:ee4c with SMTP id
 bc20-20020a056402205400b004980216ee4cmr892296edb.29.1674087485595; Wed, 18
 Jan 2023 16:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-4-dbarboza@ventanamicro.com>
 <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
In-Reply-To: <a4b7fd13-4bd0-0e7a-4650-7164e1a76053@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Jan 2023 08:17:59 +0800
Message-ID: <CAEUhbmVspyMZ38n0cEpXNrvMSt5CnpW8zBuSahL1fVRzzcYpwA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 00:18:10 -0000

On Mon, Jan 16, 2023 at 8:37 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 16/1/23 13:29, Daniel Henrique Barboza wrote:
> > Recent hw/risc/boot.c changes caused a regression in an use case with
> > the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> > stopped working. The reason seems to be that Xvisor is using 64 bit to
> > encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> > sign-extending the result with '1's [1].
> >
> > Use a translate_fn() callback to be called by load_elf_ram_sym() and
> > return only the 32 bits address if we're running a 32 bit CPU.
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> >
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >   hw/riscv/boot.c            | 20 +++++++++++++++++++-
> >   hw/riscv/microchip_pfsoc.c |  4 ++--
> >   hw/riscv/opentitan.c       |  3 ++-
> >   hw/riscv/sifive_e.c        |  3 ++-
> >   hw/riscv/sifive_u.c        |  4 ++--
> >   hw/riscv/spike.c           |  2 +-
> >   hw/riscv/virt.c            |  4 ++--
> >   include/hw/riscv/boot.h    |  1 +
> >   target/riscv/cpu_bits.h    |  1 +
> >   9 files changed, 32 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index e868fb6ade..0fd39df7f3 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -213,7 +213,24 @@ static void riscv_load_initrd(MachineState *machin=
e, uint64_t kernel_entry)
> >       }
> >   }
> >
> > +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> > +{
> > +    RISCVHartArrayState *harts =3D opaque;
> > +
> > +    /*
> > +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> > +     * it can be padded with '1's) if the hypervisor is using
> > +     * 64 bit addresses with 32 bit guests.
> > +     */
> > +    if (riscv_is_32bit(harts)) {
>
> Maybe move the comment within the if() and add " so remove the sign
> extension by truncating to 32-bit".
>
> > +        return extract64(addr, 0, RV32_KERNEL_ADDR_LEN);
>
> For 32-bit maybe a definition is not necessary, I asked before
> you used 24-bit in the previous version. As the maintainer prefer :)
>
> > +    }
> > +
> > +    return addr;
> > +}
>
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 8b0d7e20ea..8fcaeae342 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -751,6 +751,7 @@ typedef enum RISCVException {
> >   #define MENVCFG_STCE                       (1ULL << 63)
> >
> >   /* For RV32 */
> > +#define RV32_KERNEL_ADDR_LEN               32
> >   #define MENVCFGH_PBMTE                     BIT(30)
> >   #define MENVCFGH_STCE                      BIT(31)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Isn't the problem in the ELF loader?

Why does it return a 64-bit signed extended address given the 32-bit ELF im=
age?

Regards,
Bin

