Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbGe1-0008GU-Bg
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbGdz-0008EB-Cf; Fri, 15 Oct 2021 02:24:39 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbGdt-00045D-IW; Fri, 15 Oct 2021 02:24:39 -0400
Received: by mail-io1-xd33.google.com with SMTP id e144so6573860iof.3;
 Thu, 14 Oct 2021 23:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KaNhqK4LTCu9QncA5c6PGTCJtl8j3QEyZBFuAxeofMQ=;
 b=hpZtl7Mh9tyVSZi6TdmSl+1GfHlAdwoxoCH/pblFyoaYA1rJ68t4lUITvvl/8o4Vu4
 l5mgvEn2cdqtVkuJ5ZL9JioKu9Ljplcs5KnXTorg8Rq/mqteuGg7KHOHAwDUgfitApko
 N/uB+J+3oZNWs+F4TbaM8l7L9BU1XCXuIDD5lssAC/Ukl2MkaqG8MMJ/ZELuAABw1Jzv
 9G4QYb6EI34yjyWZvaPHCuFLXWnGr7FwVZ6VPc5b7xO2riDMkebzvLRT9fD4G0f8tYNf
 9n5L0LWTYPCs6gjREpifNGLn9gNegEy2f3yVE1g9FTITKz3IBqfcvxEcV7X9bJqnXocD
 IeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KaNhqK4LTCu9QncA5c6PGTCJtl8j3QEyZBFuAxeofMQ=;
 b=rvdFHVrZWbG5ZgxEmtCRx9ewmZp/W0PD9+U9JXZOdHoFTMGDZALQUvWLGxT2nB6gT3
 oUJ7nAk2Xts+0C2zoPlHVevlKf9Z67q7XsYNSFBezJPl+v+kOG0kqiMCJgKrddbbtHnO
 KgcwEqOyFEsQHctshOSVXv0CFT79jAOURgF7qApCycPxkun9U03Z3/7ezdQsj6H47g8U
 yDEAmUxmz9/fEqsYLS28hxqLBC0usQSsp1JeOtZzmZp+bQjIbTgCVAjro20uWVEWBeLL
 WJSoSyoz+DlcmORnifpOJ/DSmy2Ky5vjsA4b1gHHKMD/PxEJb/7kidV/rotye4fmDl+I
 eCtQ==
X-Gm-Message-State: AOAM532qs3dNepvyh3uAyfIC2T0FaQq+rdFGizYGBludjwpelSKZiowH
 vuQDrJVGrvZc6f2TB4NzSIfJSy88+joOLsFQ2iU=
X-Google-Smtp-Source: ABdhPJx/T6FJG1CcbRULSnZ+zlbPtRZ+bF6CFOX2TMIuBHu8wlExkKgsKLykly1EzAc1j3ZChMYAVvwacUGCh76nafs=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr2537929ioo.90.1634279072218; 
 Thu, 14 Oct 2021 23:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
 <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
 <CAKmqyKN8MeKKS1h-eu+3QEuubbgW+kYAVR6-T750xvW-4HYq+g@mail.gmail.com>
 <CAAhSdy3yDLmGMofZxocoPBydfQbXy_qNJUsQ7MWsL=0eWpx6QQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3yDLmGMofZxocoPBydfQbXy_qNJUsQ7MWsL=0eWpx6QQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 16:24:06 +1000
Message-ID: <CAKmqyKPqYoRvo-u-XiM3r=EXnwQWEo_gBEF+Vpzwj9gHQzx_2g@mail.gmail.com>
Subject: Re: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 06:24:39 -0000

On Thu, Sep 16, 2021 at 11:42 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Sep 15, 2021 at 6:19 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Sep 14, 2021 at 2:33 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Thu, Sep 9, 2021 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > > >
> > > > > The guest external interrupts for external interrupt controller are
> > > > > not delivered to the guest running under hypervisor on time. This
> > > > > results in a guest having sluggish response to serial console input
> > > > > and other I/O events. To improve timely delivery of guest external
> > > > > interrupts, we check and inject interrupt upon every sret instruction.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  target/riscv/op_helper.c | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > > > index ee7c24efe7..4c995c239e 100644
> > > > > --- a/target/riscv/op_helper.c
> > > > > +++ b/target/riscv/op_helper.c
> > > > > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> > > > >
> > > > >      riscv_cpu_set_mode(env, prev_priv);
> > > > >
> > > > > +    /*
> > > > > +     * QEMU does not promptly deliver guest external interrupts
> > > > > +     * to a guest running on a hypervisor which in-turn is running
> > > > > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > > > > +     * every sret instruction so that QEMU pickup guest external
> > > > > +     * interrupts sooner.
> > > > > +     */
> > > > > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> > > >
> > > > This doesn't seem right. I don't understand why we need this?
> > > >
> > > > riscv_cpu_update_mip() is called when an interrupt is delivered to the
> > > > CPU, if we are missing interrupts then that is a bug somewhere else.
> > >
> > > I have finally figured out the cause of guest external interrupts being
> > > missed by Guest/VM.
> > >
> > > The riscv_cpu_set_irq() which handles guest external interrupt lines
> > > of each CPU is called asynchronously. This function in-turn calls
> > > riscv_cpu_update_mip() but the CPU might be in host mode (V=0)
> > > or in Guest/VM mode (V=1). If the CPU is in host mode (V=0) when
> >
> > The IRQ being raised should just directly call riscv_cpu_update_mip()
> > so the IRQ should happen straight away.
>
> That's not true for guest external interrupts. The target Guest/VM might
> not be running on the receiving HART.
>
> Let say IMSIC injected guest external IRQ1 to HARTx which is meant
> for a Guest/VM, so the riscv_cpu_set_irq() will call riscv_cpu_update_mip().
> If HARTx might be in HS-mode or HARTx might be running some
> other Guest/VM then cpu_interrupt() request queued by riscv_cpu_update_mip()
> will not result in any interrupt being injected. This further means that
> QEMU has to check and inject guest external interrupts to target
> Guest/VM when HARTx makes a switch from HS-mode to VS-mode. By
> calling riscv_cpu_update_mip() upon SRET instruction we are ensuring
> that if any guest external interrupt was missed then it is injected ot
> VS-mode.

Ah ok.

So the problem is that an interrupt can occur for a guest, while that
guest isn't executing.

So for example a CPU is executing with V=0. `riscv_cpu_update_mip()`
is called, which triggers a hard interrupt. That in turn calls
`riscv_cpu_exec_interrupt()` and `riscv_cpu_local_irq_pending()`.

This results in the guest Hypervisor receiving the interrupt, which it
then doesn't act on? Or is MIP set but `riscv_cpu_local_irq_pending()`
returns false due to the enable checks?

That either seems like a guest bug or that we need some functionality
in `riscv_cpu_swap_hypervisor_regs()` to trigger an interrupt on
context swap.

Alistair

>
> >
> > Even from MTTCG I see this:
> >
> > """
> > Currently thanks to KVM work any access to IO memory is automatically
> > protected by the global iothread mutex, also known as the BQL (Big
> > Qemu Lock). Any IO region that doesn't use global mutex is expected to
> > do its own locking.
> >
> > However IO memory isn't the only way emulated hardware state can be
> > modified. Some architectures have model specific registers that
> > trigger hardware emulation features. Generally any translation helper
> > that needs to update more than a single vCPUs of state should take the
> > BQL.
> > """
> >
> > So we should be fine here as well.
> >
> > Can you supply a test case to reproduce the bug?
>
> Just boot Linux Guest using my QEMU, OpenSBI, Linux, and KVMTOOL
> having AIA support patches. If this patch is not there then lot of Guest
> external interrupts are missed and Guest gets stuck at random places.
>
> Regards,
> Anup
>
> >
> > > the riscv_cpu_set_irq() is called, then the CPU interrupt requested by
> > > riscv_cpu_update_mip() has no effect because the CPU can't take
> > > the interrupt until it enters Guest/VM mode.
> > >
> > > This patch does the right thing by doing a dummy call to
> > > riscv_cpu_update_mip() upon SRET instruction so that if the CPU
> > > had missed a guest interrupt previously then the CPU can take it now.
> >
> > This still doesn't look like the right fix.
> >
> > Alistair
> >
> > >
> > > Regards,
> > > Anup

