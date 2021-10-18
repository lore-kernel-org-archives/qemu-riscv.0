Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcbXg-0004vB-Dz
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 18:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcbXe-0004uv-J2; Mon, 18 Oct 2021 18:55:38 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcbXb-0004bz-J0; Mon, 18 Oct 2021 18:55:37 -0400
Received: by mail-io1-xd30.google.com with SMTP id 188so18143365iou.12;
 Mon, 18 Oct 2021 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAW8SRRi9Jdr9x2ZE0UGtzpXsWZ6iHLCgkK7tf7iBmk=;
 b=TZUanW9JU5IsA6xdezByyoQSi70lE7NhwzQFLDmKbbZx9/uyNuOfes8lMFnP0Zs1gO
 VE1SoX43tjiE4WE53AGW+RiwrfPv7vsPtBIEFn7kiGL0aWmCLJHGyt/t1+p//pQ4+DUe
 XRz7wnDcc1WiNTUlUd5Rmj4///A2oKEfJ/7gLmLVEhC7e1XizBq4/HEXRWaOm4X3KYGr
 lIHKb0AxzeDGtpzCGmIYaeninj7upl6KDjj1/ELqqXY8kdIdZctJUZxuWaUFcjlUCNf6
 5Nv9tBCTWKokexB2njviQKouMmTC6q/Rx6VMZyviIOQdXmoroKqNeMBwWIr/wphPFVcn
 V0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAW8SRRi9Jdr9x2ZE0UGtzpXsWZ6iHLCgkK7tf7iBmk=;
 b=0XvbNAgOcZI8kl6GP43l10h00zwkasOdeiIgQoxFZnXE+xsWoeZ0XAfUUpfeJ6nd83
 PsmupRJnldAJNspZYmpbAPOL+p3SGBnqJL3+KmoEGHJ3HBMDuywI0ZE5bxbydJsJCXA6
 gjPCbgwV0AHzrGSeuTD9tnC09PaDq+kekCF0uWUpRjpFzExKA/M7zcM1zsm2bLZHpzvk
 LIaopADvozU910r5ArcsfZbF92eqATxRU85wMypt+lemeODjuBqoSYM3lTzj8mbYMLLc
 hvZ1uLp9Pf0RB7dYsQXcIwsE93Zqhn3JVdMLxO8sCoKpUx+qd+TautZ0u6SI55gs8esx
 QBnA==
X-Gm-Message-State: AOAM5333emlQWWKdzBBTBEaF9kvoS21U9HVzBRukPZ2dmqs4QNj1LmBS
 j6/1ivjrwvOsXE0X0LCm5iMufbodefjReHNhMvY=
X-Google-Smtp-Source: ABdhPJzCdc0Hx5cXp+FwG0Nh+/FvjF0rT4bJ9bq2fjJWv/bvTH5VbjUqIV+pJnRcOuLn2UizctYtoJQRULrRz1MRqlw=
X-Received: by 2002:a05:6602:2599:: with SMTP id
 p25mr16447779ioo.90.1634597734008; 
 Mon, 18 Oct 2021 15:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
 <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
 <CAKmqyKN8MeKKS1h-eu+3QEuubbgW+kYAVR6-T750xvW-4HYq+g@mail.gmail.com>
 <CAAhSdy3yDLmGMofZxocoPBydfQbXy_qNJUsQ7MWsL=0eWpx6QQ@mail.gmail.com>
 <CAKmqyKPqYoRvo-u-XiM3r=EXnwQWEo_gBEF+Vpzwj9gHQzx_2g@mail.gmail.com>
 <CAAhSdy36BLy4QVALv0SOk37XacpT6q-BYOVA-KiXxtuMey0Qog@mail.gmail.com>
In-Reply-To: <CAAhSdy36BLy4QVALv0SOk37XacpT6q-BYOVA-KiXxtuMey0Qog@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Oct 2021 08:55:08 +1000
Message-ID: <CAKmqyKOSNQeWbDAocDKGV3heeqdx7CfAGtz4_vyv_VrJ7c7_OQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 22:55:38 -0000

On Mon, Oct 18, 2021 at 10:55 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Oct 15, 2021 at 11:54 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Sep 16, 2021 at 11:42 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Wed, Sep 15, 2021 at 6:19 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Tue, Sep 14, 2021 at 2:33 AM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > On Thu, Sep 9, 2021 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > > > > >
> > > > > > > The guest external interrupts for external interrupt controller are
> > > > > > > not delivered to the guest running under hypervisor on time. This
> > > > > > > results in a guest having sluggish response to serial console input
> > > > > > > and other I/O events. To improve timely delivery of guest external
> > > > > > > interrupts, we check and inject interrupt upon every sret instruction.
> > > > > > >
> > > > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > > > ---
> > > > > > >  target/riscv/op_helper.c | 9 +++++++++
> > > > > > >  1 file changed, 9 insertions(+)
> > > > > > >
> > > > > > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > > > > > index ee7c24efe7..4c995c239e 100644
> > > > > > > --- a/target/riscv/op_helper.c
> > > > > > > +++ b/target/riscv/op_helper.c
> > > > > > > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> > > > > > >
> > > > > > >      riscv_cpu_set_mode(env, prev_priv);
> > > > > > >
> > > > > > > +    /*
> > > > > > > +     * QEMU does not promptly deliver guest external interrupts
> > > > > > > +     * to a guest running on a hypervisor which in-turn is running
> > > > > > > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > > > > > > +     * every sret instruction so that QEMU pickup guest external
> > > > > > > +     * interrupts sooner.
> > > > > > > +     */
> > > > > > > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> > > > > >
> > > > > > This doesn't seem right. I don't understand why we need this?
> > > > > >
> > > > > > riscv_cpu_update_mip() is called when an interrupt is delivered to the
> > > > > > CPU, if we are missing interrupts then that is a bug somewhere else.
> > > > >
> > > > > I have finally figured out the cause of guest external interrupts being
> > > > > missed by Guest/VM.
> > > > >
> > > > > The riscv_cpu_set_irq() which handles guest external interrupt lines
> > > > > of each CPU is called asynchronously. This function in-turn calls
> > > > > riscv_cpu_update_mip() but the CPU might be in host mode (V=0)
> > > > > or in Guest/VM mode (V=1). If the CPU is in host mode (V=0) when
> > > >
> > > > The IRQ being raised should just directly call riscv_cpu_update_mip()
> > > > so the IRQ should happen straight away.
> > >
> > > That's not true for guest external interrupts. The target Guest/VM might
> > > not be running on the receiving HART.
> > >
> > > Let say IMSIC injected guest external IRQ1 to HARTx which is meant
> > > for a Guest/VM, so the riscv_cpu_set_irq() will call riscv_cpu_update_mip().
> > > If HARTx might be in HS-mode or HARTx might be running some
> > > other Guest/VM then cpu_interrupt() request queued by riscv_cpu_update_mip()
> > > will not result in any interrupt being injected. This further means that
> > > QEMU has to check and inject guest external interrupts to target
> > > Guest/VM when HARTx makes a switch from HS-mode to VS-mode. By
> > > calling riscv_cpu_update_mip() upon SRET instruction we are ensuring
> > > that if any guest external interrupt was missed then it is injected ot
> > > VS-mode.
> >
> > Ah ok.
> >
> > So the problem is that an interrupt can occur for a guest, while that
> > guest isn't executing.
>
> Yes, that's right.
>
> >
> > So for example a CPU is executing with V=0. `riscv_cpu_update_mip()`
> > is called, which triggers a hard interrupt. That in turn calls
> > `riscv_cpu_exec_interrupt()` and `riscv_cpu_local_irq_pending()`.
>
> In this case, the hard interrupt is actually a guest external interrupt
> which is tracked via hgeip CSR. The hgeip CSR is updated immediately
> but `riscv_cpu_local_irq_pending()` might be called while V=0 hence
> no interrupt.
>
> >
> > This results in the guest Hypervisor receiving the interrupt, which it
> > then doesn't act on? Or is MIP set but `riscv_cpu_local_irq_pending()`
> > returns false due to the enable checks?
>
> Here, hgeip CSR will be set and it will be reflected in mip.VSEIP
> bit only when hypervisor schedules/runs the Guest (i.e. V=1 and
> hstatus.VGEIN pointing to the appropriate bit of hgeip csr).
>
> >
> > That either seems like a guest bug or that we need some functionality
> > in `riscv_cpu_swap_hypervisor_regs()` to trigger an interrupt on
> > context swap.
>
> This certainly is not a bug with Guest or Hypervisor but rather an
> issue of invoking `riscv_cpu_exec_interrupt()` and
> `riscv_cpu_local_irq_pending()` at the right time.
>
> Your suggestion of checking and triggering guest external interrupt
> in `riscv_cpu_swap_hypervisor_regs()` is a better approach. If you
> are okay then I will update this patch in the next revision.

Yeah, let's do that instead.

Alistair

