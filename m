Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi8r3-0000m2-2j
	for mharc-qemu-riscv@gnu.org; Wed, 03 Nov 2021 01:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mi8qu-0000iw-Pn
 for qemu-riscv@nongnu.org; Wed, 03 Nov 2021 01:30:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mi8qr-0005iR-Cj
 for qemu-riscv@nongnu.org; Wed, 03 Nov 2021 01:30:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u1so1683343wru.13
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUKQadWI9uDi8hrsr67S3K4TMWBrJA2Zc73I92CloHM=;
 b=fkbG8/ANTH2Czffq5YYFu4nJ7ryhluF028ER+JFFxs4qu6/Xhk5mnWodaC4HxWcKWR
 zpE6mC/vl9cabEpSu+Rmucfyj9N3Z20S/+ZtYEUxCTvBX+LkFTPhsSOh75CxV3cp7FsL
 YSADQ/PchQXuy2dKvqygLUFE/mcP1/H3R3l/Yt9HR0hP3wWksjiNc2RHIvc6bm/LaIXN
 L6sZ2DnxzDS9wMObHI3fN8bdbOP9N23kjJzjQewq2zveCUlrPXKIRohFm5hR5bca0dCW
 LL759d0JBTP0ixdkp/zTBUKB6s78vBOhYLr2OXQQwlAAWWr1qXIEF9Cnn4yySH50qN49
 yl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUKQadWI9uDi8hrsr67S3K4TMWBrJA2Zc73I92CloHM=;
 b=69461LnvkTNgW2Q8P9CubsvvJVjuVrxtFvh7ykZFIL+7wICcK9sFmeQ23DgjKroUVC
 fcjuNcpYWLvhilMpOyIAu0rrR/tptJxvJkRPYi08SHylkIIaVOfwQ65IZsGlGADO8NHc
 Njby2rQLABpXNNmCQTdBkFc6UQFjNwGTjmU8LKCO9UAxsY7LQVWbofxeq5kJ6x0UyB7o
 m45udzrHImZjdNjuGyb05Kux1M2npjO5BnCr//1RavGID5ufzyEk2CED+2S3+DbW+FAs
 J2GCVvgFFC5Cchw+NmsJcO11qJz+L7jvShV09zYoan2xA4eJpEacLCIVKfwrjC6k2SxX
 BQtQ==
X-Gm-Message-State: AOAM5332UvBQLlEETnnike/HbhEll4bcoeUQQY95VmruVmPJ76qXf5HY
 JILNMrrQIZ4CGLFnlvhwhN0GJewoD2AKrKYaDyPhGlft+ZSFWA==
X-Google-Smtp-Source: ABdhPJxsg1kTVliIQagbN/V8OhxhEC6hV3B5d7qDjG9EQx92vCheNSUZvLBq/816P4v7fnFwBW75+osV0Enp4dXmAe0=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr41165081wry.306.1635917417428; 
 Tue, 02 Nov 2021 22:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-3-anup.patel@wdc.com>
 <CAEUhbmX_XFTTGZBnRACrdOh27Hddj2Ho-RUL8xmf=2YG=Fw0OA@mail.gmail.com>
 <CAAhSdy0_Zg0ALHyOvP32fA=kbVjwhwxip1vRU-OsT1F2U4Fr0g@mail.gmail.com>
 <CAEUhbmVVusTTipsTGp75XpsdmCWvw-En+D0F+-oNfWrf4wn+KQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVVusTTipsTGp75XpsdmCWvw-En+D0F+-oNfWrf4wn+KQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Nov 2021 11:00:05 +0530
Message-ID: <CAAhSdy3ATdBtZgUsNyQrVL_okCm4COtQpT+jRU_XHY4E9FLqjg@mail.gmail.com>
Subject: Re: [PATCH v4 02/22] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Nov 2021 05:30:26 -0000

On Tue, Nov 2, 2021 at 4:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 6:24 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Nov 2, 2021 at 12:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Tue, Oct 26, 2021 at 2:43 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > >
> > > > A hypervsior can optionally take guest external interrupts using
> > >
> > > typo: hypervisor
> >
> > Okay, I will update.
> >
> > >
> > > > SGEIP bit of hip and hie CSRs.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  target/riscv/cpu.c      |  3 ++-
> > > >  target/riscv/cpu_bits.h |  3 +++
> > > >  target/riscv/csr.c      | 18 +++++++++++-------
> > > >  3 files changed, 16 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index 788fa0b11c..0460a3972b 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -365,6 +365,7 @@ static void riscv_cpu_reset(DeviceState *dev)
> > > >          env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> > > >      }
> > > >      env->mcause = 0;
> > > > +    env->miclaim = MIP_SGEIP;
> > > >      env->pc = env->resetvec;
> > > >      env->two_stage_lookup = false;
> > > >  #endif
> > > > @@ -598,7 +599,7 @@ static void riscv_cpu_init(Object *obj)
> > > >      cpu_set_cpustate_pointers(cpu);
> > > >
> > > >  #ifndef CONFIG_USER_ONLY
> > > > -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> > > > +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
> > > >  #endif /* CONFIG_USER_ONLY */
> > > >  }
> > > >
> > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > index cffcd3a5df..8a5a4cde95 100644
> > > > --- a/target/riscv/cpu_bits.h
> > > > +++ b/target/riscv/cpu_bits.h
> > > > @@ -498,6 +498,8 @@ typedef enum RISCVException {
> > > >  #define IRQ_S_EXT                          9
> > > >  #define IRQ_VS_EXT                         10
> > > >  #define IRQ_M_EXT                          11
> > > > +#define IRQ_S_GEXT                         12
> > > > +#define IRQ_LOCAL_MAX                      13
> > >
> > > The IRQ_LOCAL_MAX should be XLEN long, not 13.
> >
> > The IRQ_LOCAL_MAX here represents local interrupts
> > standardized by the RISC-V privilege spec. This value
>
> The standardardized IRQ number is 16.

Max local IRQ as 13 is more conservative and better (IMO)
because we are not including any undefined local IRQ.

I also totally fine changing max local IRQ to 16 as well.

>
> > will change only when more local interrupts are
> > standardized by the RISC-V privilege spec.
>
> We should leave room for platform / custom IRQ as it is already
> defined by the priv spec.

custom local IRQs are not going to be accepted in the first 16 local
IRQs.

The AIA spec defines a sparse numbering scheme for both
standard/custom local IRQs beyond 16. The AIA spec will also
maintain a table of defined local IRQs.

IMO, we should deal with custom local IRQs as when they show
up and standard local IRQs should always get first class treatment.

Regards,
Anup

>
> Regards,
> Bin

