Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL0yz-0000P4-D4
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 07:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pL0yp-0000NI-AR; Thu, 26 Jan 2023 07:03:47 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pL0ym-0003pp-Ng; Thu, 26 Jan 2023 07:03:46 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lc27so1964109ejc.1;
 Thu, 26 Jan 2023 04:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C78Y2wLegElMiPR21V4AQ/YAdK/APTuKrnrrG7kRAZg=;
 b=aKfop7iCPpw0MJRdluvV1MCgRK2XVFISOHVa1GhU4Vbxn2ltkhQVGeZM7WrqBf+DSr
 MxC375MzuF1F7Fwhd4/04uWjMErKHo8OFxTuAELx6uxhGnopqUeNPbop8SHDph47bm9d
 GqsgYzActL8kerBKNxfJ8Fxl2yYesSiBDn8JBn6UcTLbpynl72ymX3XzPbOibzV4nbr4
 nKCUsMfephQCqRpuNYK1IElvRhh8sy6dEpNSNBOSO0IpRqDXp5MEN5udUIC2qg/eZCdZ
 LYMb/KTmeSqnBado1BLKarAQa5BGGaMff2zYwINdER7h2mlaMQqkfmxvGofeWJVHDG1Y
 uXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C78Y2wLegElMiPR21V4AQ/YAdK/APTuKrnrrG7kRAZg=;
 b=AaoLc+qmpd2B+lu+tUQaF0RQG5xokExz1WnQw5aJ/eCzo84o0lrg6MJACqVPovGZD8
 BepFWOVNm8GsLb9/VA5xPugN+fO2GlOi0oUOkhcWh0HDjqx0ppWRi6QNGd8YQap5WXUz
 q0WWN9cKGmauan9T0su2OALOfsiNxGpqojN/6X9c7N3TNErcLJQPIx+gztGPfcgDGwaF
 Gg7efsHWXjNNDoLRlfCdrCfKCM36nL2hQMMGZCFZ+YOPCck7ex467b1xmYkDT73VDim1
 1bZZKUSTsdWJ6SDj6up6b7m5tzqrrETGA6aAFks/766OojlfTJ9U/IqziXKkasRpTjQ6
 OhHA==
X-Gm-Message-State: AFqh2kp8x/d7qZd+mVkgYfbrxwDKYdiUFY+Tj4bVozXRLePDI29SPHyK
 aHBN4WPmP+D6kcGK6Pvrm9YK0oCsFXwXrAiTA78=
X-Google-Smtp-Source: AMrXdXvnAOtWDj12d5QsV4t6QDgIE5/4+OVHbGlFOh7HM3bIYZHBsB727PqJYRaQdlXNBqcAZd228k0AXnfZgABBU/M=
X-Received: by 2002:a17:907:a2c4:b0:877:5ff6:e340 with SMTP id
 re4-20020a170907a2c400b008775ff6e340mr3918361ejc.163.1674734621929; Thu, 26
 Jan 2023 04:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
 <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
In-Reply-To: <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 26 Jan 2023 20:03:30 +0800
Message-ID: <CAEUhbmWozgB_u=dPkK0ExMLG69W660qEOgc+BDVgMGpgntM0JA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Thu, 26 Jan 2023 12:03:48 -0000

On Tue, Jan 24, 2023 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jan 24, 2023 at 11:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > If the CSRs and CSR instructions are disabled because the Zicsr
> > > extension isn't enabled then we want to make sure we don't run any CSR
> > > instructions in the boot ROM.
> > >
> > > This patches removes the CSR instructions from the reset-vec if the
> > > extension isn't enabled. We replace the instruction with a NOP instead.
> > >
> > > Note that we don't do this for the SiFive U machine, as we are modelling
> > > the hardware in that case.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  hw/riscv/boot.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > index 2594276223..cb27798a25 100644
> > > --- a/hw/riscv/boot.c
> > > +++ b/hw/riscv/boot.c
> > > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> > >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> > >      }
> > >
> > > +    if (!harts->harts[0].cfg.ext_icsr) {
> > > +        /*
> > > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > > +         * run the CSR instruction. Let's fill the address with a non
> > > +         * compressed nop.
> > > +         */
> > > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > > +    }
> >
> > This is fine for a UP system. I am not sure how SMP can be supported
> > without Zicsr as we need to assign hartid in a0.
>
> Yeah. My thinking was that no one would be using a multicore system
> without Zicsr as it's such a core extension. If they are running
> without Zicsr they have probably hard coded a lot of things anyway and
> don't expect this to work.
>
> In general I think it's pretty rare to even run a RISC-V core without
> Zicsr at all.
>

As QEMU implements Zicsr anyway, and there is no way to support SMP
without Zicsr, should we disallow user to disable Zicsr in QEMU?

Regards,
Bin

