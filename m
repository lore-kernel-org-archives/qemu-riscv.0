Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNNR7-0005VQ-BA
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 19:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNR5-0005Ur-1A; Wed, 01 Feb 2023 19:26:43 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNR3-0000QO-1G; Wed, 01 Feb 2023 19:26:42 -0500
Received: by mail-ua1-x92c.google.com with SMTP id j21so99743uap.5;
 Wed, 01 Feb 2023 16:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KsDT4GEekMBFkZtTeSJNwa387dz+Oy7Ide01f9SfzEQ=;
 b=ausIUZuMkKtwFd/DIrJD0BOGIhwVOpM+zLumeoCc0pwnLTj4CLDYSu+cNN5KOpFavx
 WmDEfglXAgVWoNYcWaq9JOoeTTKerGs14Tc7frBpEeCzIVkXg5gAQ8+Caw6PUB3XxUeK
 ao4IlKxUgFJLyOt0v5UJseyVcuLhdtlC96v5Fd7wbw3DTJY5fCCKmEHGxhyR/c+M91SZ
 TQ11Sw0vPr1a/z+ps/PKhCTJpSiJJaYrQQm6/d130VnTjwYFDghVPVgHG5VGwQk6pO9H
 KkArEsutsT4mk383OHcV92jWZOniyk48V5rBheU0SD/nkUWifNxqazW0ABDXHIuwnDC7
 FJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KsDT4GEekMBFkZtTeSJNwa387dz+Oy7Ide01f9SfzEQ=;
 b=4JL0LF+7lg53k+XKSjhk1ZDZZwOuvyHoaGyN0UWfS9u+xUi02ucjbVQwM71wjPJRQe
 n8mtWGxwX5N5sced6lQAoQcZOJvyMDxp4EVaG9RTK6CS3vwf5h9MliGA0NM7wBUZrOfn
 diVXlnt3Ls1nCWTbR+rlGegQ+d9mF8fQMem1+fQpI9KBGbR2qy7DWwx5ElAOYkib3Vz4
 KaYWSEDKmvCaDAvFgBS9JPb6Nx2Z7XYLePPpLHLJHVMHl8hLfWjiWdtyeitVeFMGxCsI
 idppzfwv9k8xE8qN4hDCoFFqsoBGWrrzuJK/TlHoSYishqXOVZNkUt1UNVDfC4EFTaY2
 9z3g==
X-Gm-Message-State: AO0yUKWIarw2/t1XZCXEXCXXUEzfaSGwSV0JnfcQySGOuOJ6OnBWiVFT
 OHQfsLuUnfbpIHXthrLYE6QrofEsSqotqdMJGQ4=
X-Google-Smtp-Source: AK7set8mOEFsGkCIGOCRbDJCpGI+Y7E15r8ZLAZPd2r9CtbaWHMs2zBMb3mXD3NN8fTR/C6AXwlYValbzvVeZoYmnT0=
X-Received: by 2002:ab0:7842:0:b0:652:d333:f305 with SMTP id
 y2-20020ab07842000000b00652d333f305mr691921uaq.11.1675297598924; Wed, 01 Feb
 2023 16:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
 <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
 <CAEUhbmWozgB_u=dPkK0ExMLG69W660qEOgc+BDVgMGpgntM0JA@mail.gmail.com>
 <CAKmqyKNYp=NhHAA6M8vDUvjw1TkRSh2u6Sy42GgaSDiahePfag@mail.gmail.com>
 <CAEUhbmV2+g3GVoyJQ7ye-+oV3+YC5Vo4biq=yrK7m7q344a_2g@mail.gmail.com>
In-Reply-To: <CAEUhbmV2+g3GVoyJQ7ye-+oV3+YC5Vo4biq=yrK7m7q344a_2g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 10:26:12 +1000
Message-ID: <CAKmqyKOGS3iffEHo3_spvaRaMrd0zqhMPvqK9jhSHscr+pP7Tw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 02 Feb 2023 00:26:43 -0000

On Tue, Jan 31, 2023 at 10:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jan 30, 2023 at 7:19 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Jan 26, 2023 at 10:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Tue, Jan 24, 2023 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Tue, Jan 24, 2023 at 11:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
> > > > > <alistair.francis@opensource.wdc.com> wrote:
> > > > > >
> > > > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > > > >
> > > > > > If the CSRs and CSR instructions are disabled because the Zicsr
> > > > > > extension isn't enabled then we want to make sure we don't run any CSR
> > > > > > instructions in the boot ROM.
> > > > > >
> > > > > > This patches removes the CSR instructions from the reset-vec if the
> > > > > > extension isn't enabled. We replace the instruction with a NOP instead.
> > > > > >
> > > > > > Note that we don't do this for the SiFive U machine, as we are modelling
> > > > > > the hardware in that case.
> > > > > >
> > > > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > ---
> > > > > >  hw/riscv/boot.c | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > >
> > > > > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > > > > index 2594276223..cb27798a25 100644
> > > > > > --- a/hw/riscv/boot.c
> > > > > > +++ b/hw/riscv/boot.c
> > > > > > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> > > > > >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> > > > > >      }
> > > > > >
> > > > > > +    if (!harts->harts[0].cfg.ext_icsr) {
> > > > > > +        /*
> > > > > > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > > > > > +         * run the CSR instruction. Let's fill the address with a non
> > > > > > +         * compressed nop.
> > > > > > +         */
> > > > > > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > > > > > +    }
> > > > >
> > > > > This is fine for a UP system. I am not sure how SMP can be supported
> > > > > without Zicsr as we need to assign hartid in a0.
> > > >
> > > > Yeah. My thinking was that no one would be using a multicore system
> > > > without Zicsr as it's such a core extension. If they are running
> > > > without Zicsr they have probably hard coded a lot of things anyway and
> > > > don't expect this to work.
> > > >
> > > > In general I think it's pretty rare to even run a RISC-V core without
> > > > Zicsr at all.
> > > >
> > >
> > > As QEMU implements Zicsr anyway, and there is no way to support SMP
> > > without Zicsr, should we disallow user to disable Zicsr in QEMU?
> >
> > I feel like we don't need to do that. Here's my thinking:
> >
> > Zicsr is a RISC-V extension, the RISC-V spec splits it out so that it
> > can be disabled. In theory someone could build a multi-hart CPU
> > without Zicsr in hardware, so QEMU should be able to model it.
>
> Correct. But if Zicsr is not present, then the standard privileged
> architecture which qemu-system-riscv currently supports, is inherently
> not present, either.
>
> If a user chooses to disable Zicsr, current QEMU system emulation is
> useless then.

I wouldn't say useless. If a user does disable Zicsr then effectively
they have disabled the priv spec.

>
> That's why I believe we shouldn't allow users to disable Zicsr for
> qemu-system-riscv.

We currently support disabling it and it appears that people are using
it, so I don't think it makes sense to remove.

I agree for a standard use case Zicsr will always be enabled, but I
can picture users running experiments/tests/benchmarks and wanting to
disable the extension.

Alistair

>
> > As well as that Zicsr is enabled by default, so a user has to know
> > enough to disable it manually. At which point they probably know what
> > they are doing, especially as no standard software will run without
> > Zicsr. If that's what someone wants to do then we should allow them
> > to, even if it's a bit strange.
> >
>
> For qemu-riscv, disabling Zicsr is feasible as long as the codes does
> not touch any CSR, e.g.: timer, counters, fcsr, etc.
>
> Regards,
> Bin

