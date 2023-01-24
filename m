Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK8Ke-0003tS-BR
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 20:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK8KY-0003t3-17; Mon, 23 Jan 2023 20:42:34 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK8KW-0008I3-BT; Mon, 23 Jan 2023 20:42:33 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id 187so14999963vsv.10;
 Mon, 23 Jan 2023 17:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FU7jGxZFLK8s7TG/kSqqFuKrnDJwir6nsjwswJ5QelI=;
 b=GZMyRraVmiRzabG8i9WBS4OP9CqvOSNRtx0K3Cjjlddm/yecDY6EDiZXh3awdD80hA
 Nw2S4RhO6V+NWgLCIk/Y4hRqASqO7E8nVqOP2Gc5nJoCCDwlq0OHWJWgaBSomUIEhfij
 1Je4jVzwK+5b22VJk1nYEK69Gz6t+pTkNmslYklDk3CF+a5/WMRbillFOfi/GkyoRqxX
 utUuTeZwY01rrD+ihRjjoMth1kUQDtqO75kc/0VMsJBDMUrPPS1QS5uFPzQXovCJANsG
 AW/eK3b3ZW66GdOcFO8ROn1rKcQx9SimjpPLcw8Cn5eXDNJi2T7GOlBZ5+ah4PsqKgbQ
 HmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FU7jGxZFLK8s7TG/kSqqFuKrnDJwir6nsjwswJ5QelI=;
 b=poRdSArpu+uaI2NrXZJQqw2mj2rMWcp57jVlGH3+aTUkERwMgCtCg0nhn5Hr+L3ArM
 TJKnI/0ipNKpH23M/LC1/tcDS8V7LJh8LldBINafgyZ+iWvJktdIVJc7QPyQy6IfJHZi
 bcoS8Ym6zopadWDkNIiijGf6Q31CTpqc7Lpv0AlFTfqt8VDr+FePCgAkIsgmjOOfxRPn
 fNgYnf+B7vo92yo8qMyUeP8elFmxGsU7w7+u25MsPxA25fHozmcxF0yh2491MThaOwbQ
 TBdRZhYZvOy8SYDAquvAHknWDHEDpclfC96ZzNqEFa9XMi8uDulpJf8a7QJhlAAdhclY
 5k5Q==
X-Gm-Message-State: AFqh2krkWHYD0V24EC1exqDq412IDyyjLSIx/8vtlrfR/ZzESDG4pS9J
 TrTq0Q9kBEryCK7CqR/GsF40CqnFe6AOoPM6xcA=
X-Google-Smtp-Source: AMrXdXv+aaxL1/fqoVmUs9V+DeKmgBy8c3N2VEAV/aH4WdUNteY3U8V/qoRGnmk8sERJWM7vMraGuFOEJwBV90uMJsc=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr3535517vsl.10.1674524548266; Mon, 23
 Jan 2023 17:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
In-Reply-To: <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 11:42:01 +1000
Message-ID: <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 01:42:38 -0000

On Tue, Jan 24, 2023 at 11:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > If the CSRs and CSR instructions are disabled because the Zicsr
> > extension isn't enabled then we want to make sure we don't run any CSR
> > instructions in the boot ROM.
> >
> > This patches removes the CSR instructions from the reset-vec if the
> > extension isn't enabled. We replace the instruction with a NOP instead.
> >
> > Note that we don't do this for the SiFive U machine, as we are modelling
> > the hardware in that case.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 2594276223..cb27798a25 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> >      }
> >
> > +    if (!harts->harts[0].cfg.ext_icsr) {
> > +        /*
> > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > +         * run the CSR instruction. Let's fill the address with a non
> > +         * compressed nop.
> > +         */
> > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > +    }
>
> This is fine for a UP system. I am not sure how SMP can be supported
> without Zicsr as we need to assign hartid in a0.

Yeah. My thinking was that no one would be using a multicore system
without Zicsr as it's such a core extension. If they are running
without Zicsr they have probably hard coded a lot of things anyway and
don't expect this to work.

In general I think it's pretty rare to even run a RISC-V core without
Zicsr at all.

Alistair

>
> > +
> >      /* copy in the reset vector in little_endian byte order */
> >      for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
> >          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > --
>
> Regards,
> Bin

