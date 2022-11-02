Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oq1L7-0000kd-7o
	for mharc-qemu-riscv@gnu.org; Tue, 01 Nov 2022 20:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oq1L6-0000kR-2q; Tue, 01 Nov 2022 20:10:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oq1L4-0002RV-BW; Tue, 01 Nov 2022 20:10:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso422041pjc.5; 
 Tue, 01 Nov 2022 17:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iUrCjGE8qLgI/QMXE4/eWCxrSnxNuixCVQOdtm4AJRM=;
 b=c4GN/nP9z/PMW3MfMJdgjCIYqT0fBfbweBvjUrenfNT+su1u+GrTc/rtpcvOJrDzAP
 +ilrFt7Vmblk3cnoIthuZoH8FaQwgaFyZwnxQGODONtcpeqNRerNEnnYV7g/ZY/lp6Un
 v+LhN0AegCTi3OumS8OQtoaoJ5yyXuaF/wTb+/ave5rJmUF2whsseRIRboCl1dsOQzuM
 T8wQAxHsaz/Az++hgMloUMkchFyiYyTZcHqVg8HFEdvn8wehQ00hpbeEC9wV83WVnjyr
 5tL/tPozjAsaG9KFPmt4rC4hG8nZlqrZhSnZZKpCoRJCMy0JqEMYQ9KE7n8/q4jIUgpa
 R1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iUrCjGE8qLgI/QMXE4/eWCxrSnxNuixCVQOdtm4AJRM=;
 b=pEUIH3jWKb6bla+p1qW4k53fkVH1qmWwjD1YAyWkDOJxaoohaQ8CbyzpCi9rwELedg
 dk4DFLMBklnVzfgT2aBM5pbnCD7fXenLhV5sqewESeozp+kN81R5032ymwgBTPIxEwOF
 SG5Z7c48Nlkr29G2xovGccp5YzvMzp7aNK65sXbTj/TanD5hZL1VHrbBZjfvhJthunOC
 OLiBwu4VNa17d4NP3BvZOOpllcng4ttFwkuu5rFcRdbFpsgyTJpvqPynJHr4Xahvgvw8
 ftTcAknvmjYv1H+Q1erudMvQwsObGHHgNnJ9Fj9xPWz51gKIwmDy/pJbE/TLb/ndiKhT
 owSQ==
X-Gm-Message-State: ACrzQf2lnk4rWfA7AcNu8EXqYc62pY0/xTXOGEafqQhCDgXTpOBsXDB0
 GkNo51qQ0M2WW7oIoyLmCBl8xTYhlyqy93Vc9lo=
X-Google-Smtp-Source: AMsMyM5Ue3+FwzhERu5oB0hkwBQgHr3Mpwv88uYfVDR6NcNWd65MVJMEOtK9k1hSFWPQFp8SosL+JxvU6aHCZMngi5E=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr16336745pll.149.1667347834838; Tue, 01
 Nov 2022 17:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221027164743.194265-1-apatel@ventanamicro.com>
 <20221027164743.194265-5-apatel@ventanamicro.com>
 <CAKmqyKNWdJCQvT-5ddjQBjwMJ=uqBZv_+zG7TSAwqAS1p8oTkQ@mail.gmail.com>
 <CAK9=C2WjjYsvi3VCOk8NGms+BupQKCbu3SUGqPNjEdzR9eVpag@mail.gmail.com>
In-Reply-To: <CAK9=C2WjjYsvi3VCOk8NGms+BupQKCbu3SUGqPNjEdzR9eVpag@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Nov 2022 10:10:08 +1000
Message-ID: <CAKmqyKPGA5_S-qHuivOSH3fvDf4Rp0ja_bsoDkLrT_83juyiqw@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 02 Nov 2022 00:10:40 -0000

On Mon, Oct 31, 2022 at 1:49 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Mon, Oct 31, 2022 at 6:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Oct 28, 2022 at 2:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > The time CSR will wrap-around immediately after reaching UINT64_MAX
> > > so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
> > > in riscv_timer_write_timecmp().
> >
> > I'm not clear what this is fixing?
> >
> > If the guest sets a timer for UINT64_MAX shouldn't that still trigger
> > an event at some point?
>
> Here's what Sstc says about timer interrupt using Sstc:
> "A supervisor timer interrupt becomes pending - as reflected in the
> STIP bit in the mip and sip registers - whenever time contains a
> value greater than or equal to stimecmp, treating the values as
> unsigned integers. Writes to stimecmp are guaranteed to be
> reflected in STIP eventually, but not necessarily immediately.
> The interrupt remains posted until stimecmp becomes greater
> than time - typically as a result of writing stimecmp."
>
> When timecmp = UINT64_MAX, the time CSR will eventually reach
> timecmp value but on next timer tick the time CSR will wrap-around
> and become zero which is less than UINT64_MAX. Now, the timer
> interrupt behaves like a level triggered interrupt so it will become 1
> when time = timecmp = UINT64_MAX and next timer tick it will
> become 0 again because time = 0 < timecmp = UINT64_MAX.

Ah, I didn't realise this. Can you add this to the code comment and
maybe add this description to the commit message. Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> This time CSR wrap-around comparison with timecmp is natural
> to implement in HW but not straight forward in QEMU hence this
> patch.
>
> Software can potentially use timecmp = UINT64_MAX as a way
> to clear the timer interrupt and keep timer disabled instead of
> enabling/disabling sie.STIP. This timecmp = UINT64_MAX helps:
> 1) Linux RISC-V timer driver keep timer interrupt enable/disable
>     state in-sync with Linux interrupt subsystem.
> 2) Reduce number of traps taken when emulating Sstc for the
>     "Nested Guest" (i.e. Guest running under some "Guest Hypervisor"
>     which in-turn runs under a "Host Hypervisor").
>
> In fact, the SBI set_timer() call also defines similar mechanism to
> disable timer: "If the supervisor wishes to clear the timer interrupt
> without scheduling the next timer event, it can either request a timer
> interrupt infinitely far into the future (i.e., (uint64_t)-1), ...".
>
> Regards,
> Anup
>
> >
> > Alistair
> >
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  target/riscv/time_helper.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> > > index 4fb2a471a9..1ee9f94813 100644
> > > --- a/target/riscv/time_helper.c
> > > +++ b/target/riscv/time_helper.c
> > > @@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> > >          riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> > >      }
> > >
> > > +    /*
> > > +     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
> > > +     * time CSR will wrap-around immediately after reaching UINT64_MAX.
> > > +     */
> > > +    if (timecmp == UINT64_MAX) {
> > > +        return;
> > > +    }
> > > +
> > >      /* otherwise, set up the future timer interrupt */
> > >      diff = timecmp - rtc_r;
> > >      /* back to ns (note args switched in muldiv64) */
> > > --
> > > 2.34.1
> > >
> > >

