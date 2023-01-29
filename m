Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMGx9-0000om-Sn
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 18:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGx7-0000oV-QJ; Sun, 29 Jan 2023 18:19:13 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGx6-0005vT-2k; Sun, 29 Jan 2023 18:19:13 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id i188so10775760vsi.8;
 Sun, 29 Jan 2023 15:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cH+miPkzbGDTbf0TElGPqQol+Y6u3aLOc3n01pQi59o=;
 b=HIRjxsbg8vGSvn2FDh4G2WkK8sjaTYjt/D64aCiLYjtX38ZSdXVzDvsjkqlKTrdt8N
 1ZCwm2wCD01l8uV3wwtKZ//MHDM9Q/EqEgP0//+lakYlyMg4ECEilsAp/zsr1CG6lOJ4
 0VwdPaSaSURlqsSXjMEJKjmtnX7wqlGLMkoRPBn7J08M52DfqqFvzFRPtd7nXOmpigEY
 nJx1np9oxVzaWfkLjwj+ch4j7T0N3MHOW5XUcEvGU+gC+YZm2BnQBN5MpQHsawGIBcqt
 IDuYanALL6KZ63q6w22FvmF3VtV5JM+aVcwAHUfdcOFsufqKqse3tZFd+OukHHQXnobq
 ExKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cH+miPkzbGDTbf0TElGPqQol+Y6u3aLOc3n01pQi59o=;
 b=DLzRhVpQ6lcAFZhGhery1zbl2mf7ul64WSy3Wyt4ql0m2VdsccqDYQ/A6WpMQWBLl0
 +661B/wcg0+b4RTjOVDKAZbDw005ecK7LhEu2jnBDMDkbT3PNbiVUysSX1Xiqb/7ECa0
 P7MSy86ABP88SpuQQeLudiXTzAfOQo0CKS7Y0Y7WLfJJYVCyp0ZlTkdrPNXr529QUmcJ
 MCdQ4daMexXwxjQK7BO2YMYpNG+ySeG6mgnl0PNJEkZ1CA7HtepDBD7PfkkXMdSQyStX
 uSZ0SPKcJ/7zIbyae0ZGs+FoOMkzX3qeo1Gyb9494OrjTnbX0sXIksUlyZOGp/NLoW+T
 DMIQ==
X-Gm-Message-State: AO0yUKXkBDVg5iJqsrI853zh71EvwoeIZyA9J5oyRFdRNosVNaAJYLLv
 BAen211Q7XRKLqiLm1s+dkX7OYIhEfItkJjRvIIFIMpOL4iXdA==
X-Google-Smtp-Source: AK7set8HWAIXxuPRgacse35G3WsNIe1R9bmRYaqi1tnfJcyge+wmoQ67KS9nQXhcw5ArJBViJR7FZDQ6kn+hfb05PJA=
X-Received: by 2002:a67:e101:0:b0:3f0:89e1:7c80 with SMTP id
 d1-20020a67e101000000b003f089e17c80mr796810vsl.72.1675034350837; Sun, 29 Jan
 2023 15:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <CAEUhbmUisvp3QFhnz0Ty74=7zn-h4UpdC_b9E3LNr8B7Bp8Y1Q@mail.gmail.com>
 <CAKmqyKNQ5php2gdJsmL6cmRKkjggHcdoo2Lfw4Z9goQAHtLVQg@mail.gmail.com>
 <CAEUhbmWozgB_u=dPkK0ExMLG69W660qEOgc+BDVgMGpgntM0JA@mail.gmail.com>
In-Reply-To: <CAEUhbmWozgB_u=dPkK0ExMLG69W660qEOgc+BDVgMGpgntM0JA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 09:18:44 +1000
Message-ID: <CAKmqyKNYp=NhHAA6M8vDUvjw1TkRSh2u6Sy42GgaSDiahePfag@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Sun, 29 Jan 2023 23:19:14 -0000

On Thu, Jan 26, 2023 at 10:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Jan 24, 2023 at 9:42 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Jan 24, 2023 at 11:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Mon, Jan 23, 2023 at 11:58 AM Alistair Francis
> > > <alistair.francis@opensource.wdc.com> wrote:
> > > >
> > > > From: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > If the CSRs and CSR instructions are disabled because the Zicsr
> > > > extension isn't enabled then we want to make sure we don't run any CSR
> > > > instructions in the boot ROM.
> > > >
> > > > This patches removes the CSR instructions from the reset-vec if the
> > > > extension isn't enabled. We replace the instruction with a NOP instead.
> > > >
> > > > Note that we don't do this for the SiFive U machine, as we are modelling
> > > > the hardware in that case.
> > > >
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  hw/riscv/boot.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > > index 2594276223..cb27798a25 100644
> > > > --- a/hw/riscv/boot.c
> > > > +++ b/hw/riscv/boot.c
> > > > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> > > >          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> > > >      }
> > > >
> > > > +    if (!harts->harts[0].cfg.ext_icsr) {
> > > > +        /*
> > > > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > > > +         * run the CSR instruction. Let's fill the address with a non
> > > > +         * compressed nop.
> > > > +         */
> > > > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > > > +    }
> > >
> > > This is fine for a UP system. I am not sure how SMP can be supported
> > > without Zicsr as we need to assign hartid in a0.
> >
> > Yeah. My thinking was that no one would be using a multicore system
> > without Zicsr as it's such a core extension. If they are running
> > without Zicsr they have probably hard coded a lot of things anyway and
> > don't expect this to work.
> >
> > In general I think it's pretty rare to even run a RISC-V core without
> > Zicsr at all.
> >
>
> As QEMU implements Zicsr anyway, and there is no way to support SMP
> without Zicsr, should we disallow user to disable Zicsr in QEMU?

I feel like we don't need to do that. Here's my thinking:

Zicsr is a RISC-V extension, the RISC-V spec splits it out so that it
can be disabled. In theory someone could build a multi-hart CPU
without Zicsr in hardware, so QEMU should be able to model it.

As well as that Zicsr is enabled by default, so a user has to know
enough to disable it manually. At which point they probably know what
they are doing, especially as no standard software will run without
Zicsr. If that's what someone wants to do then we should allow them
to, even if it's a bit strange.

Alistair

>
> Regards,
> Bin

