Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGHL9-0002NU-Gn
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 05:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGHL0-0002Md-MT; Fri, 13 Jan 2023 05:31:11 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGHKy-0007Pr-MQ; Fri, 13 Jan 2023 05:31:06 -0500
Received: by mail-ej1-x62d.google.com with SMTP id v6so8267401ejg.6;
 Fri, 13 Jan 2023 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6qrn/zWQrhD5PIOBLhjVXgOsoJ6B2+uxbzYQSooNaAs=;
 b=Y0YCvWo/JE9mXQna7OorEEyeWvGvKHWULX5dPmLoZUwgzsjKxkJ6WeKsFJ8nzobOTk
 Qxp0OnhhojIbtVXPdVDICNQRpkLVxN2pm6l7lXi6NE4C0znO2xwfl7ymh4SilO94fQfm
 IPA2WwsPcPjh4SnPMdY/6LlvDD8+m903Wk6W/IZr/PC+ZhtsDzGGs+IayaBXRLTKa4sv
 QO+y4KjR0nQ84z8zVgSSU9X+jCopfL6nA4+ETurqEWOFnx+4OrbsOGHUIQ790S6VNVJw
 F8Bl03jgMlKYKgoRvr0lnJU5c20GkKFzBjjQgWwZlyAcWbqs81KEDp/iuF1jio30T/Tk
 G9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6qrn/zWQrhD5PIOBLhjVXgOsoJ6B2+uxbzYQSooNaAs=;
 b=UA+7XKra+TCB5ZCKboZEIOmRwUeplfris7lRGAESjYV6cIR/eOZwm9RyTGVnIkD0Fg
 dtl3siqypBYhS0GYWhixxyhR8zAGwgCNcV8/6J0qZ9dZ+QPuzy+mK4aOcWf7knKkiZek
 F8ruogpxdByPOo8qQCLm6SEmztMM/xcXTCxMJKxaCBA0o4wft92YGLMpZOOwK22304SY
 DUlaz5ZPGjUeGf8/d7pkIcTNRKszcuESPZAMowIioIza+Y4Qb5D3Cn2kVG61aAm5y/Hg
 Nixu0nR0jRSHA1KgYVvyfw4YQ0xar5aeXxozD7Oji2Z3ANoqxCdLRiGJyRMdaejSjsnl
 RLmw==
X-Gm-Message-State: AFqh2krKPp9QXNNt+2fzySo424hmp0O7Pcc+5RYElG7VYUHy+TJ30BKW
 ABwwCKjjD59SthvisEZtFGBTEebFa6ztkyvmXH0=
X-Google-Smtp-Source: AMrXdXuT44KBmeejHuFfZ/DEN35/2hRbRBxJGWf5yUGepuv6L+Owisu2DvKn9XAbRJWNInTY6C8EnumJnTMthSY6rvo=
X-Received: by 2002:a17:906:9f25:b0:84d:49c3:51ea with SMTP id
 fy37-20020a1709069f2500b0084d49c351eamr1773337ejc.13.1673605861716; Fri, 13
 Jan 2023 02:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
 <b5cab84f-4bb9-694b-80e9-0b5aeac9de6c@linaro.org>
 <0ba72b27-0c3d-2d3d-adec-899717f40594@ventanamicro.com>
In-Reply-To: <0ba72b27-0c3d-2d3d-adec-899717f40594@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 18:30:49 +0800
Message-ID: <CAEUhbmV0KKKxOWDqNxiNz0ohR_EPPU_q+uMoukCA=UznZRFrvA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 10:31:13 -0000

On Fri, Jan 13, 2023 at 6:23 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/13/23 04:16, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/1/23 01:34, Alistair Francis wrote:
> >> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
> >> <dbarboza@ventanamicro.com> wrote:
> >>>
> >>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doi=
ng
> >>> the same steps when '-kernel' is used:
> >>>
> >>> - execute load_kernel()
> >>> - load init_rd()
> >>> - write kernel_cmdline
> >>>
> >>> Let's fold everything inside riscv_load_kernel() to avoid code
> >>> repetition. To not change the behavior of boards that aren't calling
> >>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() a=
nd
> >>> allow these boards to opt out from initrd loading.
> >>>
> >>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>> ---
> >>>   hw/riscv/boot.c            | 22 +++++++++++++++++++---
> >>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
> >>>   hw/riscv/opentitan.c       |  2 +-
> >>>   hw/riscv/sifive_e.c        |  3 ++-
> >>>   hw/riscv/sifive_u.c        | 12 ++----------
> >>>   hw/riscv/spike.c           | 11 +----------
> >>>   hw/riscv/virt.c            | 12 ++----------
> >>>   include/hw/riscv/boot.h    |  1 +
> >>>   8 files changed, 30 insertions(+), 45 deletions(-)
> >
> >>> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *ma=
chine,
> >>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> >>>                            NULL, &kernel_load_base, NULL, NULL, 0,
> >>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> >>> -        return kernel_load_base;
> >>> +        kernel_entry =3D kernel_load_base;
> >>
> >> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
> >> we get a value of 0xffffffff80000000.
> >>
> >> Previously the top bits would be lost as we return a target_ulong from
> >> this function, but with this change we pass the value
> >> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
> >>
> >> This diff fixes the failure for me
> >>
> >> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >> index 4888d5c1e0..f08ed44b97 100644
> >> --- a/hw/riscv/boot.c
> >> +++ b/hw/riscv/boot.c
> >> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machi=
ne,
> >>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> >>                           NULL, &kernel_load_base, NULL, NULL, 0,
> >>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> >> -        kernel_entry =3D kernel_load_base;
> >> +        kernel_entry =3D (target_ulong) kernel_load_base;
> >>          goto out;
> >>      }
> >>
> >>
> >> but I don't think that's the right fix. We should instead look at the
> >> CPU XLEN and drop the high bits if required.
> >
> > Ah, that is what should be done in load_elf_ram_sym()'s missing
> > translate_fn() handler.
>
> Interesting. I'll try it again and re-send.
>

If that fixes the problem, it should be a separate patch.

I still don't understand why 32-bit xvisor image has a 64-bit address encod=
ed?

Regards,
Bin

