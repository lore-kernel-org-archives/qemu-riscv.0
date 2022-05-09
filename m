Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nnzcd-0004El-Sm
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 05:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzca-0004EO-Vh; Mon, 09 May 2022 05:24:05 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzcZ-0000bJ-Bv; Mon, 09 May 2022 05:24:04 -0400
Received: by mail-io1-xd30.google.com with SMTP id o190so14633376iof.10;
 Mon, 09 May 2022 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2MzysXjxEYQ/MxcFGbjDThnNkiI9BKEBXsHlcbiLOc=;
 b=S1/QzwYM5pbi9eAB0DJkWY5MIHM38tmx8UsGHdMZC6gEqO266eAxlDuT4f+0iu9n0A
 C1VCCpuY4UPYu3qYPqrS6397R07b39vclYX0wDvHy9v/tD2BIpNev/g80AHu5gi7C3yy
 XWWHTiBYRAweXjhCpl/WHGDsJUOBBBYpO2ijrLNVk6XEp1Qm+DpvgxEXS3t/BP74wsl5
 d7qZ5MTdPpwtmd+f0citiYW2Gw5a1hfgwIwTSpGlDwv+5mFtpob3COe2zIIHSBqiZUL/
 UvVm7/r0m97wFuAugKh03SYbs/iMZbZ4RzaWVJ04zjGOXaOBriF8Zd7D8vIyHd7mZrXe
 jvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2MzysXjxEYQ/MxcFGbjDThnNkiI9BKEBXsHlcbiLOc=;
 b=kJ+vQBGjY7q5CPzKZJTCVGUBLq4FrnDKIi8hQ42iXMs6SZ4vOAy2L1sMG6PzGFDzJ5
 MDgPcpoVMWuVQLiDTVqBeZB/2zCrKa7EN4b+3xYR2MvPrArB5Ua52MVUlBnWmMR7kp6Q
 1iL0jnlKMUpnktMVtDNxKoWQj9hCbPAKgZLUYS9wFFrqKiRGxl3UV6E0zQTs2Ifof0jV
 1hkyO1K0kXhscQcYV5dEDR5A4ujL+K7sW5AB3PZrrjanzYoE90YXZY8jZiRE+0Oo7ut7
 F8RCBCXv04/tvCVYFW/Yik1awAuI+IMhTnRTkr5cHWJYh2ltEjD9hkAkHOYYCAoZFBu5
 g0tw==
X-Gm-Message-State: AOAM533Eh+o6JgmQLIXgVQFNxZt0OwR0IqN0DwX2T+BscgHk0kgINWC/
 2fdvQ4BgCulUj5Or/+NaTbSvCnMvhzVhiBDSrG4+HP5rIXShL8IhyRo=
X-Google-Smtp-Source: ABdhPJyjXiDs5kiYK1Y4WihNkXKsSAq5k64nRjCL4OUZ5RSgZ2CE8em7g0S0bhHFH+s3omXlbWUUu6U/a+LWdMFWAvU=
X-Received: by 2002:a05:6638:190a:b0:32b:95b7:4e64 with SMTP id
 p10-20020a056638190a00b0032b95b74e64mr6536604jal.212.1652088241915; Mon, 09
 May 2022 02:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-3-apatel@ventanamicro.com>
 <CAKmqyKMFVanzOMKPuo_i7hWZEJOmReBpp+wgqv3e2ExV2Jb-7g@mail.gmail.com>
 <CAK9=C2UBXfEoCEe1Nexa+v51ZxY7qd3xpJDd5x77L6FM8T2Qag@mail.gmail.com>
In-Reply-To: <CAK9=C2UBXfEoCEe1Nexa+v51ZxY7qd3xpJDd5x77L6FM8T2Qag@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:23:35 +0200
Message-ID: <CAKmqyKO3cqA+diXVuz8es_0FTiPJyufPpfTxQU_bqw6vHDdFQw@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 09 May 2022 09:24:05 -0000

On Thu, May 5, 2022 at 12:36 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, May 5, 2022 at 3:21 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Apr 29, 2022 at 1:38 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > Currently, QEMU does not set hstatus.GVA bit for traps taken from
> > > HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
> > > on QEMU. This was working previously.
> > >
> > > This patch updates riscv_cpu_do_interrupt() to fix the above issue.
> > >
> > > Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  target/riscv/cpu_helper.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index e1aa4f2097..d83579accf 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >                  /* Trap into HS mode */
> > >                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> > >                  htval = env->guest_phys_fault_addr;
> > > -                write_gva = false;
> >
> > This doesn't seem right.
> >
> > "Field GVA (Guest Virtual Address) is written by the implementation
> > whenever a trap is taken
> > into HS-mode. For any trap (breakpoint, address misaligned, access
> > fault, page fault, or guest-
> > page fault) that writes a guest virtual address to stval, GVA is set
> > to 1. For any other trap into
> > HS-mode, GVA is set to 0"
> >
> > So if we are trapping from HS to HS, the address in stval should not
> > be a guest virtual address, at least in general.
>
> That's not correct. The HLV/HSV instructions executed by hypervisor
> (HS-mode) take guest virtual address. These instructions can trap
> from HS-mode to HS-mode.

Ah, I forgot about those instructions, but still they are the
exception. In general we would expect a trap from HS to HS to contain
HS addresses. We should just handle the other cases specially

Alistair

>
> >
> > We probably aren't correctly setting GVA if MPRV is set though, as
> > then the page faults should be guest addresses. That's probably the
> > issue you are seeing.
>
> The Xvisor nested MMU test-suit is broken on QEMU because it
> uses HLV/HSV instructions in HS-mode.
>
> Regards,
> Anup
>
> >
> > Alistair
> >
> > >              }
> > >              env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
> > >          }
> > > --
> > > 2.34.1
> > >
> > >

