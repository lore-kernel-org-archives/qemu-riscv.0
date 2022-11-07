Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orsBr-0006gg-P0
	for mharc-qemu-riscv@gnu.org; Sun, 06 Nov 2022 21:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1orsBk-0006bu-Qr
 for qemu-riscv@nongnu.org; Sun, 06 Nov 2022 21:48:44 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1orsBh-0007A4-Lo
 for qemu-riscv@nongnu.org; Sun, 06 Nov 2022 21:48:40 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so11359586fac.6
 for <qemu-riscv@nongnu.org>; Sun, 06 Nov 2022 18:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EETHCb1nN/iayV0/E2dgKymEWGryst+ltywwlrl+lho=;
 b=dlUwqx+jsUtq9rev/C9n/q5laK3PC0CjRM44CRco5mlMRaxZ/639M2uD17aVsMMLYP
 uiNFqirD5yd3UD/DkYzi6ZgaYCEL0PwzBbwCJAoJbRMvUYgAFm58VieJAacGl+RxQWKR
 NkolK1pFt5W/r78Aaatrn596DLks7zMN1UfFCQJaD/iYZaAuIkGUh2G1eEKtZD+uSaxa
 m0ZyrC2Vvaq6bq7uHf6o3v7rYxHA2PIAgN32KU7OH0hAUzCikpK8ll3p+y5OScpxFfsO
 6HpZPnWu7UJ7AtlJhpdHYtTWM7uRoDyxyGX6Ia0g3JvpJTmRwopqWdELnj5GATmE33dF
 Tnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EETHCb1nN/iayV0/E2dgKymEWGryst+ltywwlrl+lho=;
 b=E9vZ6oJhC9EQembCWS+rNTybu/vLoMVVRCUhixdQyA1IMmO6WgIcuY9oypstYjVVrV
 3GpEsA2PiWouOE3A5AnvpGiVPXUSNj/wqgxs4rSc8/KlLMYDsGBCXIeCzbug/eZyOGLf
 cANdGBi5vgNQD1371BIr0INcuKbDnZfgXR5bbKoeiRLX4PwGUYmxEUYcNYlhIRkIQ3lr
 RLWLpGkOOy+ytB+yqEiz8jI/zYGlOtc49J+Tcc4HaONh9TH+Z/TBJ91HPr/AxWlyA7HC
 DPbXEOhANZ3YSMgwQH3mdk7H3pgoAjsUUHPxitZ0xvwDklEz+twglKGo6KwHiUTBr452
 8NYg==
X-Gm-Message-State: ACrzQf0xT6/X61BPqqSYuV7otIREW6ykkBqNvOPBC1eTXgMNYc0gUqCg
 BNCEaWH+tbtkOYlpqF81rgT8dXjh31ZA7XzlpxFZqA==
X-Google-Smtp-Source: AMsMyM6W/FcjITp3bsalVhlZT3TmpRs3UtbQWU8KmcIzYVrEgRrL6VVkvjz7VtpqjO2vPSapiXepmBURey/Km1HiX3c=
X-Received: by 2002:a05:6870:ac0d:b0:13b:b9e7:e6d0 with SMTP id
 kw13-20020a056870ac0d00b0013bb9e7e6d0mr36613545oab.17.1667789314352; Sun, 06
 Nov 2022 18:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-5-apatel@ventanamicro.com>
 <CAKmqyKNWdJCQvT-5ddjQBjwMJ=uqBZv_+zG7TSAwqAS1p8oTkQ@mail.gmail.com>
 <CAK9=C2WjjYsvi3VCOk8NGms+BupQKCbu3SUGqPNjEdzR9eVpag@mail.gmail.com>
 <CAKmqyKPGA5_S-qHuivOSH3fvDf4Rp0ja_bsoDkLrT_83juyiqw@mail.gmail.com>
In-Reply-To: <CAKmqyKPGA5_S-qHuivOSH3fvDf4Rp0ja_bsoDkLrT_83juyiqw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 7 Nov 2022 08:18:23 +0530
Message-ID: <CAK9=C2X78GBYw75rFJV9UMRQ3DQMMMungRhg73exsPTfjrpU+A@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 07 Nov 2022 02:48:45 -0000

On Wed, Nov 2, 2022 at 5:40 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Oct 31, 2022 at 1:49 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Mon, Oct 31, 2022 at 6:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Fri, Oct 28, 2022 at 2:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > The time CSR will wrap-around immediately after reaching UINT64_MAX
> > > > so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
> > > > in riscv_timer_write_timecmp().
> > >
> > > I'm not clear what this is fixing?
> > >
> > > If the guest sets a timer for UINT64_MAX shouldn't that still trigger
> > > an event at some point?
> >
> > Here's what Sstc says about timer interrupt using Sstc:
> > "A supervisor timer interrupt becomes pending - as reflected in the
> > STIP bit in the mip and sip registers - whenever time contains a
> > value greater than or equal to stimecmp, treating the values as
> > unsigned integers. Writes to stimecmp are guaranteed to be
> > reflected in STIP eventually, but not necessarily immediately.
> > The interrupt remains posted until stimecmp becomes greater
> > than time - typically as a result of writing stimecmp."
> >
> > When timecmp = UINT64_MAX, the time CSR will eventually reach
> > timecmp value but on next timer tick the time CSR will wrap-around
> > and become zero which is less than UINT64_MAX. Now, the timer
> > interrupt behaves like a level triggered interrupt so it will become 1
> > when time = timecmp = UINT64_MAX and next timer tick it will
> > become 0 again because time = 0 < timecmp = UINT64_MAX.
>
> Ah, I didn't realise this. Can you add this to the code comment and
> maybe add this description to the commit message. Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Sure, I will add a detailed comment block in the code itself.

Thanks,
Anup

>
> Alistair
>
> >
> > This time CSR wrap-around comparison with timecmp is natural
> > to implement in HW but not straight forward in QEMU hence this
> > patch.
> >
> > Software can potentially use timecmp = UINT64_MAX as a way
> > to clear the timer interrupt and keep timer disabled instead of
> > enabling/disabling sie.STIP. This timecmp = UINT64_MAX helps:
> > 1) Linux RISC-V timer driver keep timer interrupt enable/disable
> >     state in-sync with Linux interrupt subsystem.
> > 2) Reduce number of traps taken when emulating Sstc for the
> >     "Nested Guest" (i.e. Guest running under some "Guest Hypervisor"
> >     which in-turn runs under a "Host Hypervisor").
> >
> > In fact, the SBI set_timer() call also defines similar mechanism to
> > disable timer: "If the supervisor wishes to clear the timer interrupt
> > without scheduling the next timer event, it can either request a timer
> > interrupt infinitely far into the future (i.e., (uint64_t)-1), ...".
> >
> > Regards,
> > Anup
> >
> > >
> > > Alistair
> > >
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  target/riscv/time_helper.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > > > index 4fb2a471a9..1ee9f94813 100644
> > > > --- a/target/riscv/time_helper.c
> > > > +++ b/target/riscv/time_helper.c
> > > > @@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > > >          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> > > >      }
> > > >
> > > > +    /*
> > > > +     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
> > > > +     * time CSR will wrap-around immediately after reaching UINT64_MAX.
> > > > +     */
> > > > +    if (timecmp == UINT64_MAX) {
> > > > +        return;
> > > > +    }
> > > > +
> > > >      /* otherwise, set up the future timer interrupt */
> > > >      diff = timecmp - rtc_r;
> > > >      /* back to ns (note args switched in muldiv64) */
> > > > --
> > > > 2.34.1
> > > >
> > > >

