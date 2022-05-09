Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1no24L-0000wo-HM
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 08:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1no240-0000tl-P7
 for qemu-riscv@nongnu.org; Mon, 09 May 2022 08:00:34 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1no23v-0001kj-BT
 for qemu-riscv@nongnu.org; Mon, 09 May 2022 08:00:32 -0400
Received: by mail-lf1-x12a.google.com with SMTP id d15so14862225lfk.5
 for <qemu-riscv@nongnu.org>; Mon, 09 May 2022 05:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jFlolGB7y2Yo1CY/S0EI1M9WjxGNfe5eFQyZeirIpHw=;
 b=l2f6MJ4ntmGd1P3/UZN0zlqivFRNIOzRtlyLPv5oQk6iSlqUQzo8DY/PGmdN765tuF
 C3d0Bn9ezTGtbo4Hxl2ISVddA24PPg+4oeQtQM8OoStl5apq1Eo6E/0sVLea4clg5Vyj
 2CzrjePeaILLmQbciVPamu3XzOis2nK/aWjcr0e6t3dJBLhAiHQQWkgLUX8+x9vaArs5
 zKeuPAyA0KBOJCSQxssDbmIu+eiqNfWBwpev751WQjcFObrZrrD8QyXmBc5wgGTZRcvM
 6EtqUIV+qEoeAdu4+mQyCVnOIw6qkIz3u8LCqIg5xj6gxItcxVwtXcy8GHT1zpxb4EK/
 mgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jFlolGB7y2Yo1CY/S0EI1M9WjxGNfe5eFQyZeirIpHw=;
 b=OgffOs/gm3i9sQnrJ9y5sqsJJYxFp2BFgSjDnH5vxnPq7MAizLjIOw/gnWFeC06cLn
 QpdMrMADxM2CVcnKiwyWVTwB71HxB4UggbTv6USGcuunpAQC8sXoCuaZCyHxLbjNcQVc
 UcqbVhEFbllmkMYjRqUCQrMLKa33yTsrsBUp3q7yG8HEEZHH0zFYyAKeRt4KPembCTwv
 9F3oMLGvYI/iQtI+v5IYIO7rnM2RPjiviEQWI3gxgVFKV2MfK8O9fAdUmixsxEfBQZXP
 zutz7b1imDEL1oXhtsggRx6YHRB3CVy6vBie8/tuwkxvVK1T+kqaxMV5BushxmzeFzVW
 rgTQ==
X-Gm-Message-State: AOAM533TGjsQPK0QaYtwgSHr1zI8mGslLRQs8b2B6VphbhI3T6cWHOnZ
 zYBsjRu4USBXlEYmq10QBBdBWVb8MEniO10ETKnpcw==
X-Google-Smtp-Source: ABdhPJyTdYQeIjOiekjuu5PRQh1wAKKTUnBL2Lsw2y+Gm+Jq41571IgUvH+v/GnrNxUrcaNJREtr7BdbK4dHlXndgqk=
X-Received: by 2002:ac2:53a2:0:b0:472:3dd:40c6 with SMTP id
 j2-20020ac253a2000000b0047203dd40c6mr13269915lfh.130.1652097625082; Mon, 09
 May 2022 05:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-3-apatel@ventanamicro.com>
 <CAKmqyKMFVanzOMKPuo_i7hWZEJOmReBpp+wgqv3e2ExV2Jb-7g@mail.gmail.com>
 <CAK9=C2UBXfEoCEe1Nexa+v51ZxY7qd3xpJDd5x77L6FM8T2Qag@mail.gmail.com>
 <CAKmqyKO3cqA+diXVuz8es_0FTiPJyufPpfTxQU_bqw6vHDdFQw@mail.gmail.com>
In-Reply-To: <CAKmqyKO3cqA+diXVuz8es_0FTiPJyufPpfTxQU_bqw6vHDdFQw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 May 2022 17:30:14 +0530
Message-ID: <CAK9=C2XDHvWCcBdML6auRkRfmhuhzL8wtwjPrzjAGJZfJbws5w@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 May 2022 12:00:36 -0000

On Mon, May 9, 2022 at 2:54 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 5, 2022 at 12:36 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Thu, May 5, 2022 at 3:21 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Fri, Apr 29, 2022 at 1:38 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > Currently, QEMU does not set hstatus.GVA bit for traps taken from
> > > > HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
> > > > on QEMU. This was working previously.
> > > >
> > > > This patch updates riscv_cpu_do_interrupt() to fix the above issue.
> > > >
> > > > Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  target/riscv/cpu_helper.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > index e1aa4f2097..d83579accf 100644
> > > > --- a/target/riscv/cpu_helper.c
> > > > +++ b/target/riscv/cpu_helper.c
> > > > @@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > > >                  /* Trap into HS mode */
> > > >                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> > > >                  htval = env->guest_phys_fault_addr;
> > > > -                write_gva = false;
> > >
> > > This doesn't seem right.
> > >
> > > "Field GVA (Guest Virtual Address) is written by the implementation
> > > whenever a trap is taken
> > > into HS-mode. For any trap (breakpoint, address misaligned, access
> > > fault, page fault, or guest-
> > > page fault) that writes a guest virtual address to stval, GVA is set
> > > to 1. For any other trap into
> > > HS-mode, GVA is set to 0"
> > >
> > > So if we are trapping from HS to HS, the address in stval should not
> > > be a guest virtual address, at least in general.
> >
> > That's not correct. The HLV/HSV instructions executed by hypervisor
> > (HS-mode) take guest virtual address. These instructions can trap
> > from HS-mode to HS-mode.
>
> Ah, I forgot about those instructions, but still they are the
> exception. In general we would expect a trap from HS to HS to contain
> HS addresses. We should just handle the other cases specially

I see your point. Let me re-work this patch to ensure that the GVA bit
is only set when we have a guest virtual address.

Regards,
Anup

>
> Alistair
>
> >
> > >
> > > We probably aren't correctly setting GVA if MPRV is set though, as
> > > then the page faults should be guest addresses. That's probably the
> > > issue you are seeing.
> >
> > The Xvisor nested MMU test-suit is broken on QEMU because it
> > uses HLV/HSV instructions in HS-mode.
> >
> > Regards,
> > Anup
> >
> > >
> > > Alistair
> > >
> > > >              }
> > > >              env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
> > > >          }
> > > > --
> > > > 2.34.1
> > > >
> > > >

