Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQJ7a-0004u6-3h
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 20:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJ7W-0004sc-EU; Tue, 14 Sep 2021 20:49:51 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJ7U-00030W-OP; Tue, 14 Sep 2021 20:49:50 -0400
Received: by mail-io1-xd34.google.com with SMTP id b7so1246954iob.4;
 Tue, 14 Sep 2021 17:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQOILSLiEq00IWL9WUKH7BZ/VBswGFuUP37Ium2/zmE=;
 b=G3anOIRikDuUbFeyPVDMPbXVX0VDCqaiyxbk+4PrFwr1cALk1V6XCJSqpw1Pn7wDCD
 llKXJH2ooSvgJZ+N7xqM8hfSbFQzMEWJDsC8Q5HhqUOz7ceDIsDwLS3xBUTD/1K1fLHM
 6SQO9ghroGoMwyRyliEhQ+4tWJAgheRYTxczfcdibIPDgQ+Vd3VEC13ujFSCkdR0th+9
 PgqFh2DuNKtTeokTiz/SW+rKbd10ZProHsBFnCAzLl3/G2fLMcOGqV1pKUCarKiCoh4y
 IwA4fvGE4kfJlalTuq1kv6N8B28+xvgR8rSP00irNGW3UyS6LlzDRt7SeRd/uSjIPdto
 pHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQOILSLiEq00IWL9WUKH7BZ/VBswGFuUP37Ium2/zmE=;
 b=HsKraeCZomlBPZ5eRzWXgGxI+f/EpVU3PFTlAqZeMdupc+1tAMiqt0F9C9moafSkDq
 rmpJoV/qth9uXZ2ebUlELNsbjn+SA6IVxfKHZpisCjiSnn2Ps2u2ABSTWn6LXx0wH9Mp
 DhmxBG8MIOFd+IWGg2qFL261yF6N/LyWYhA4MOzyOGfcD+0pT8ijCjNoWAKHKy+FVAFD
 FT9p9VC5BF26Sk9G9mZN30SY4tf75JpVFUzYvn9twCaN+5daBEOiKjkZy/QOBP2Agoa/
 rPSluZSrz9YePIJBCIkqKJmF+s7F2ekkb5LsWG4+KmKTM/BlFFTfBrdrmIWRDADYgmo7
 Gv/Q==
X-Gm-Message-State: AOAM531DXBeioRXYoT7hD2j/UmeQu/5MGWzjKrRne1sj3k6Wj2qWoVk0
 uFjLfqUMI3/bji4mHq2lfxIWA0XnEWAEFHhBcMU=
X-Google-Smtp-Source: ABdhPJx0sfmsEgHj2Yah5WsvpzRtvBWZ3N9n9M5ioqbjFEYgy23MsOnDTSCsqFyny9jsd+MPItpUP5xUYeqtkjL/MRU=
X-Received: by 2002:a05:6638:3046:: with SMTP id
 u6mr16919929jak.35.1631666986404; 
 Tue, 14 Sep 2021 17:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-5-anup.patel@wdc.com>
 <CAKmqyKPK9zrtM=g6hruL+eRLVPdz76jLR+P0xZ8qPfWXvnSTzg@mail.gmail.com>
 <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2jihzXxxMJkrb7vydjETbpiGDA6b9OmWnUaJv8-jF6OQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 10:49:20 +1000
Message-ID: <CAKmqyKN8MeKKS1h-eu+3QEuubbgW+kYAVR6-T750xvW-4HYq+g@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 00:49:51 -0000

On Tue, Sep 14, 2021 at 2:33 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Sep 9, 2021 at 12:14 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Sep 2, 2021 at 9:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > The guest external interrupts for external interrupt controller are
> > > not delivered to the guest running under hypervisor on time. This
> > > results in a guest having sluggish response to serial console input
> > > and other I/O events. To improve timely delivery of guest external
> > > interrupts, we check and inject interrupt upon every sret instruction.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  target/riscv/op_helper.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > index ee7c24efe7..4c995c239e 100644
> > > --- a/target/riscv/op_helper.c
> > > +++ b/target/riscv/op_helper.c
> > > @@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
> > >
> > >      riscv_cpu_set_mode(env, prev_priv);
> > >
> > > +    /*
> > > +     * QEMU does not promptly deliver guest external interrupts
> > > +     * to a guest running on a hypervisor which in-turn is running
> > > +     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
> > > +     * every sret instruction so that QEMU pickup guest external
> > > +     * interrupts sooner.
> > > +     */
> > > +     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> >
> > This doesn't seem right. I don't understand why we need this?
> >
> > riscv_cpu_update_mip() is called when an interrupt is delivered to the
> > CPU, if we are missing interrupts then that is a bug somewhere else.
>
> I have finally figured out the cause of guest external interrupts being
> missed by Guest/VM.
>
> The riscv_cpu_set_irq() which handles guest external interrupt lines
> of each CPU is called asynchronously. This function in-turn calls
> riscv_cpu_update_mip() but the CPU might be in host mode (V=0)
> or in Guest/VM mode (V=1). If the CPU is in host mode (V=0) when

The IRQ being raised should just directly call riscv_cpu_update_mip()
so the IRQ should happen straight away.

Even from MTTCG I see this:

"""
Currently thanks to KVM work any access to IO memory is automatically
protected by the global iothread mutex, also known as the BQL (Big
Qemu Lock). Any IO region that doesn't use global mutex is expected to
do its own locking.

However IO memory isn't the only way emulated hardware state can be
modified. Some architectures have model specific registers that
trigger hardware emulation features. Generally any translation helper
that needs to update more than a single vCPUs of state should take the
BQL.
"""

So we should be fine here as well.

Can you supply a test case to reproduce the bug?

> the riscv_cpu_set_irq() is called, then the CPU interrupt requested by
> riscv_cpu_update_mip() has no effect because the CPU can't take
> the interrupt until it enters Guest/VM mode.
>
> This patch does the right thing by doing a dummy call to
> riscv_cpu_update_mip() upon SRET instruction so that if the CPU
> had missed a guest interrupt previously then the CPU can take it now.

This still doesn't look like the right fix.

Alistair

>
> Regards,
> Anup

