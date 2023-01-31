Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMppT-0003DO-DM
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 07:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMppI-0003Cs-JM; Tue, 31 Jan 2023 07:33:37 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMpp7-0005px-28; Tue, 31 Jan 2023 07:33:28 -0500
Received: by mail-ed1-x536.google.com with SMTP id f7so7012770edw.5;
 Tue, 31 Jan 2023 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=343+g5zUBf606CxH8xv2eXqZDYhg3GIX04y6gCLwQdA=;
 b=i+jM3C2vetHZF3nRtPpSgMU3dIofSKgi1X1SYHLJPOFoOvJtWB/zz4WfIUlM/nxH9E
 MdCLO+H9ESKp98/1rRo0eOX8I+cC9qr3IXVXrDxf+mKcCrPchNOnh+nzmQ4h2beCDzBB
 Wc8LJw75hJOukg7HRnpva4VH3iGU2lx3PdyABW3FZt9Mz1st8E5YStdFuCzRylBy6+qa
 CMtFY61F1rHmNi64J8P+83OO0gLvKn8VLb0H7RsYotnjBstZ4hnXaGactbUjXiJuSChR
 /068FdPKHLjYVSJlPR0mwUoMhgUqken1YHed4Fwz/EkD8KrjZVk4i3F48IUpJSJD/hIr
 UANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=343+g5zUBf606CxH8xv2eXqZDYhg3GIX04y6gCLwQdA=;
 b=FJLL44bodZJHVJSJgBcrSxZlvvrogIQMC8jU5Bli8LiGcoaOvPw4ch2G7+WmhrNdkM
 V+SDS/Br/mLHi17y2wHvYfkfszM1Ecc2aZEwxA1z6rrEVVCUgguFlhy+Lk/1pqRr3lvp
 8NsLgx03Y7f5O0RPWp1izqzcTd31pb+JJC6cFMoKWP5wksREONQH6ovLiwTsx8oq1uLa
 oLQlip+FZQ0DKdzn4SP6hiz5hH1KoIXuIWxeMxeZ1g5k7XB+PgSQBC2FqNK6Mr9a5/0D
 JTOqVyiBcgWzTFsxJDvQLO2DYz16kq8WuQGKTskG1jT7LosgTPK8uvfXPZukelQswumj
 61bg==
X-Gm-Message-State: AFqh2kqbNOGUdCpq47DWgfg7Rg5DdrV+7hRtpW5J8lPT4y0w6WFwsMxU
 C47DdJEoZ+oT9rMCEyg4y/PY2FT1c5GcaMdtbeI=
X-Google-Smtp-Source: AMrXdXuHnAEkLM+YabpiqvYOR1begTWcYK6q3x4XD5yK6A8HTpgWiK3j/t2qq/a59S2j4O2BhEdNO3zsQT2UyX+6pxU=
X-Received: by 2002:a05:6402:20f:b0:49c:a68c:8b6b with SMTP id
 t15-20020a056402020f00b0049ca68c8b6bmr10420701edv.84.1675168316685; Tue, 31
 Jan 2023 04:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
 <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
 <CAEUhbmWozgB_u=dPkK0ExMLG69W660qEOgc+BDVgMGpgntM0JA@mail.gmail.com>
 <CAKmqyKNYp=NhHAA6M8vDUvjw1TkRSh2u6Sy42GgaSDiahePfag@mail.gmail.com>
In-Reply-To: <CAKmqyKNYp=NhHAA6M8vDUvjw1TkRSh2u6Sy42GgaSDiahePfag@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 31 Jan 2023 20:31:46 +0800
Message-ID: <CAEUhbmV2+g3GVoyJQ7ye-+oV3+YC5Vo4biq=yrK7m7q344a_2g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 12:33:37 -0000

On Mon, Jan 30, 2023 at 7:19 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jan 26, 2023 at 10:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Jan 24, 2023 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Tue, Jan 24, 2023 at 11:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
> > > > <alistair.francis@opensource.wdc.com> wrote:
> > > > >
> > > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > > >
> > > > > If the CSRs and CSR instructions are disabled because the Zicsr
> > > > > extension isn't enabled then we want to make sure we don't run any CSR
> > > > > instructions in the boot ROM.
> > > > >
> > > > > This patches removes the CSR instructions from the reset-vec if the
> > > > > extension isn't enabled. We replace the instruction with a NOP instead.
> > > > >
> > > > > Note that we don't do this for the SiFive U machine, as we are modelling
> > > > > the hardware in that case.
> > > > >
> > > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  hw/riscv/boot.c | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > > > index 2594276223..cb27798a25 100644
> > > > > --- a/hw/riscv/boot.c
> > > > > +++ b/hw/riscv/boot.c
> > > > > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> > > > >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> > > > >      }
> > > > >
> > > > > +    if (!harts->harts[0].cfg.ext_icsr) {
> > > > > +        /*
> > > > > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > > > > +         * run the CSR instruction. Let's fill the address with a non
> > > > > +         * compressed nop.
> > > > > +         */
> > > > > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > > > > +    }
> > > >
> > > > This is fine for a UP system. I am not sure how SMP can be supported
> > > > without Zicsr as we need to assign hartid in a0.
> > >
> > > Yeah. My thinking was that no one would be using a multicore system
> > > without Zicsr as it's such a core extension. If they are running
> > > without Zicsr they have probably hard coded a lot of things anyway and
> > > don't expect this to work.
> > >
> > > In general I think it's pretty rare to even run a RISC-V core without
> > > Zicsr at all.
> > >
> >
> > As QEMU implements Zicsr anyway, and there is no way to support SMP
> > without Zicsr, should we disallow user to disable Zicsr in QEMU?
>
> I feel like we don't need to do that. Here's my thinking:
>
> Zicsr is a RISC-V extension, the RISC-V spec splits it out so that it
> can be disabled. In theory someone could build a multi-hart CPU
> without Zicsr in hardware, so QEMU should be able to model it.

Correct. But if Zicsr is not present, then the standard privileged
architecture which qemu-system-riscv currently supports, is inherently
not present, either.

If a user chooses to disable Zicsr, current QEMU system emulation is
useless then.

That's why I believe we shouldn't allow users to disable Zicsr for
qemu-system-riscv.

> As well as that Zicsr is enabled by default, so a user has to know
> enough to disable it manually. At which point they probably know what
> they are doing, especially as no standard software will run without
> Zicsr. If that's what someone wants to do then we should allow them
> to, even if it's a bit strange.
>

For qemu-riscv, disabling Zicsr is feasible as long as the codes does
not touch any CSR, e.g.: timer, counters, fcsr, etc.

Regards,
Bin

