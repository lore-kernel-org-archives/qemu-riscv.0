Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhrP7-0004br-Lh
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 06:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhrP4-0004ZS-8d; Tue, 02 Nov 2021 06:52:30 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhrP2-0005um-3F; Tue, 02 Nov 2021 06:52:30 -0400
Received: by mail-yb1-xb34.google.com with SMTP id s3so18685797ybs.9;
 Tue, 02 Nov 2021 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9qjlEZpZ3NsqWuuMTo8GqcWbKC0GteySBbXn4jbtRc=;
 b=W3keOvrGbeHMHDFuUYWK8kXJMYe0fhfOskIv639h0GQzwfFCQ8ElPiHH2LcTH/NVyW
 AU6GN7rFy5RW5nR5zvFTou/U5szKorgP1ic5gudd9D5atS7NhPPZb8LcwEQUJY89NtIA
 GiZUVfQ12VTT1VGOh0AwTZailVSfq9PvcWn51HyPFzNZRTEncVk3WflN1ncp0phJSOXn
 fDzrvaxxPfwr748QWrV8ZL9KL3u2r4jdGiVMPf+UxQupaUIVf2OMxQM17nGsGngcAupi
 kVygA5Mi2cdbPxBF8FlB2vd6dtiW4BzM2GvLF+Smyi4lI1Jx3Js/BjyMVBzbin86MfTU
 wr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9qjlEZpZ3NsqWuuMTo8GqcWbKC0GteySBbXn4jbtRc=;
 b=vZIiIwWCdTB8wwqloS0w+2dEoOTYjuE3v2ea8YCP570ANAVU3b3/VCbL/TSRisbT8U
 rTAnJpzDggf0wmK+NaS8ZRQGZX96a74VrDVOZlZVhYPZ9BAr6S4Z7PBZP+bU1pMlC5F5
 UsT/YZxDtjIDXgSNEfPg2fO3fpIdgkmU4gfvTfQwo4tcDGQ11OZCE0lVZmmIhOQvPAYU
 CNgUTw3Q9pT223TM/VJ372F8gHHWlb934LUrViO+OKO39dv/Bafxnic06+ATZCDgVF+i
 8IG+tAzT0tn6XiShKbCiJQrj1vgtxuvHIleFj4ILxOUWV1Adv5OHn6YLsIDps/rfJwu0
 PJrA==
X-Gm-Message-State: AOAM533SrEWSVZgDLtOfnRBe11X+PdZ6ewoXgzAIfOIrzZ7HFADszSmt
 Lxc2QdUt/BJS04h5QOHi6u5GcF/eu07BlpVgMP4=
X-Google-Smtp-Source: ABdhPJzmqxtwdFUfpzvFdmukR41k/uPjW3SMI6JAPAH3+i5Ad1mn5JnGyNGvFHIg3Ya7SkfJ2DwZ3eUn5EH7FF/aQlU=
X-Received: by 2002:a25:cc8e:: with SMTP id
 l136mr34761286ybf.293.1635850346553; 
 Tue, 02 Nov 2021 03:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-3-anup.patel@wdc.com>
 <CAEUhbmX_XFTTGZBnRACrdOh27Hddj2Ho-RUL8xmf=2YG=Fw0OA@mail.gmail.com>
 <CAAhSdy0_Zg0ALHyOvP32fA=kbVjwhwxip1vRU-OsT1F2U4Fr0g@mail.gmail.com>
In-Reply-To: <CAAhSdy0_Zg0ALHyOvP32fA=kbVjwhwxip1vRU-OsT1F2U4Fr0g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 2 Nov 2021 18:52:15 +0800
Message-ID: <CAEUhbmVVusTTipsTGp75XpsdmCWvw-En+D0F+-oNfWrf4wn+KQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/22] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Tue, 02 Nov 2021 10:52:30 -0000

On Tue, Nov 2, 2021 at 6:24 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Nov 2, 2021 at 12:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Oct 26, 2021 at 2:43 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > A hypervsior can optionally take guest external interrupts using
> >
> > typo: hypervisor
>
> Okay, I will update.
>
> >
> > > SGEIP bit of hip and hie CSRs.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu.c      |  3 ++-
> > >  target/riscv/cpu_bits.h |  3 +++
> > >  target/riscv/csr.c      | 18 +++++++++++-------
> > >  3 files changed, 16 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 788fa0b11c..0460a3972b 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -365,6 +365,7 @@ static void riscv_cpu_reset(DeviceState *dev)
> > >          env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> > >      }
> > >      env->mcause = 0;
> > > +    env->miclaim = MIP_SGEIP;
> > >      env->pc = env->resetvec;
> > >      env->two_stage_lookup = false;
> > >  #endif
> > > @@ -598,7 +599,7 @@ static void riscv_cpu_init(Object *obj)
> > >      cpu_set_cpustate_pointers(cpu);
> > >
> > >  #ifndef CONFIG_USER_ONLY
> > > -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> > > +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
> > >  #endif /* CONFIG_USER_ONLY */
> > >  }
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index cffcd3a5df..8a5a4cde95 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -498,6 +498,8 @@ typedef enum RISCVException {
> > >  #define IRQ_S_EXT                          9
> > >  #define IRQ_VS_EXT                         10
> > >  #define IRQ_M_EXT                          11
> > > +#define IRQ_S_GEXT                         12
> > > +#define IRQ_LOCAL_MAX                      13
> >
> > The IRQ_LOCAL_MAX should be XLEN long, not 13.
>
> The IRQ_LOCAL_MAX here represents local interrupts
> standardized by the RISC-V privilege spec. This value

The standardardized IRQ number is 16.

> will change only when more local interrupts are
> standardized by the RISC-V privilege spec.

We should leave room for platform / custom IRQ as it is already
defined by the priv spec.

Regards,
Bin

