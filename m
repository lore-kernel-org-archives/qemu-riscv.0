Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWL2R-0003OI-Vs
	for mharc-qemu-riscv@gnu.org; Sat, 24 Oct 2020 11:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kWL2I-0003NJ-3B; Sat, 24 Oct 2020 11:00:50 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kWL2F-0007xP-Fo; Sat, 24 Oct 2020 11:00:49 -0400
Received: by mail-io1-xd42.google.com with SMTP id z5so5516644iob.1;
 Sat, 24 Oct 2020 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JsbMyk6LLpXY+b2NUCNpCgRL0Kv6sTOMDTKtm+XXw6c=;
 b=dbgPO3/p402RkdJ4FtnSa7ejIKLrYZltl3Zj/AyEsa/TPmtQkC21aJtbd2bmochI/A
 KXy0o1F0Ppf1s0NONF1r8dCBe5Lnay5P8dUGj2caoV+OIFP0r3vLwNxA/xzaokvE9MwD
 IFFz0BCx7liCnzXfv5ScnA02qlVtGmBT0DpUtNLzeLjWuUaHdP2GdU6o2NvoRZI0bNCx
 RIQ16aM3akBSwQP3BT4uHrg0DetYT9XpxWF+sXsnZR1M6dCaiaZopIromAvOBJ30E+BY
 4Kf0TDMNUSQakXJSpQIeQvXQqfvVAwJjO+nO+3CpHv1sPl7CGilIr1cscQlTjKt/2MPm
 0Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JsbMyk6LLpXY+b2NUCNpCgRL0Kv6sTOMDTKtm+XXw6c=;
 b=eg3xaHkUL2mj4cjLeWKD6UjFLW0BB9jAxf4VFxpk3E7J/0d9BhLfuvpXJVaNWKyfna
 Wyws/KLR6qaVyv3p123fK0TWq2rzcuQPi9c0PRmM9qZG77WuMBPyRvq0zuMug0HYdGge
 vGUqPMHFaOjDvnM5iGeK5lWTSeVKJy18kT5bEWcDlFXgRvhQgxM/H+zl5cEf3++GkOA4
 zHcv72f4nKZ6dayTsNibpt+ouVXPnkFc4toblVMHFOHQrh5/kkrcJ3Agfzg4m3E0Z7RP
 FrLMJFiqij2I/fhJq9jZk7TfoUH1PogbeX9IaFpZ0lUPYHxMxX6YenoqZoYKW6aViHeC
 nbQw==
X-Gm-Message-State: AOAM532mGiA1mwdjLM/JjdNo0zkzegXx0OiTHqvctvU6H2cXDJW/xn6v
 okE1giEgKsL9MeKZFNnFntR7DIcAPNhYIy72NHo=
X-Google-Smtp-Source: ABdhPJyn/m0u74XQuFwnO5/EndMib+TqVPKfwJjxj6Vb59prUPzKBIHiUQWNj8S8FDIxTKK4UU7rvN5eNUWP4WgA9DE=
X-Received: by 2002:a05:6638:25cc:: with SMTP id
 u12mr5879495jat.26.1603551645351; 
 Sat, 24 Oct 2020 08:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201023214940.917885-1-keithp@keithp.com>
 <CAKmqyKMzHARF7C9Lo8SYFBbPNa_=ibbWBNnedwFbe8AY=DdXVA@mail.gmail.com>
 <8736246ub3.fsf@keithp.com>
In-Reply-To: <8736246ub3.fsf@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 24 Oct 2020 08:00:18 -0700
Message-ID: <CAKmqyKP6CE1YpkfKo6=zghAbdN58oQvYNoafq70dvmR6OHyhtg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
To: Keith Packard <keithp@keithp.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Sat, 24 Oct 2020 15:00:54 -0000

On Fri, Oct 23, 2020 at 10:56 PM Keith Packard <keithp@keithp.com> wrote:
>
> Alistair Francis <alistair23@gmail.com> writes:
>
> Thanks much for taking time to review this patch in detail. I've left
> the indicated changes in a new version of my riscv-semihost branch here:
>
>         https://github.com/keith-packard/qemu/tree/riscv-semihost
>
> I'll post a new version once we've wound up discussion on the remaining
> issues.
>
> >> +M: Keith Packard <keithp@keithp.com>
> >
> > I don't think you should be a maintainer just yet. In general people
> > have to be actively reviewing patches to be listed as a maintainer.
>
> Cool, I'm glad to not be listed. checkpatch.pl suggested that I might
> need to add something here, so I went ahead and included it in case it
> was necessary. (I probably should do some patch review though; SiFive is
> rather dependent on QEMU continuing to be a great RISC-V emulator)

That would be helpful, we are always short on reviewers.

>
> >> +#include "exec/cpu-all.h"
> >
> > This isn't used in the header so it shouldn't be here.
>
> Worse than that -- it's already included in this file. I suspect
> this is left over from a previous version and have removed it.
>
> >> +#define RISCV_EXCP_SEMIHOST                      0x10
> >
> > I don't see this in the RISC-V spec, it seems to just be reserved, not
> > for semihosting.
>
> Hrm. It's entirely an internal implementation detail in QEMU and matches
> how semihosting works in the ARM implementation -- the presence of the
> semihosting breakpoint raises this exception which is then handled in
> the usual exception processing path.

It's not fully internal though. Someone running with the `-d int`
command line argument will see these exceptions, which don't
correspond to anything in the spec.

Is there some way we could at least convey that information to users?

>
> If there is ever a real exception that uses this number, we can
> re-define this to something else. Or if you have a favorite number you'd
> like to use instead, that'd be great.

I think it would at least be better to use a high reserved number, but
like I mentioned above this is somewhat user visible.

>
> >> + *  ARM Semihosting is documented in:
> >> + *     Semihosting for AArch32 and AArch64 Release 2.0
> >> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf
> >
> > Maybe just point to the RISC-V doc instead.
>
> Good suggestion. Fixed.
>
> > Could we split all of the shared code out somewhere?
>
> Yes, that seems like a reasonable suggestion. I haven't done so because
> that brings a lot of additional obligations on the patch to not impact
> the ARM implementation, and means that future changes to either the
> RISC-V or ARM specifications would need to be careful to not impact the
> other architecture as the code is modified.

That makes sense. If they start to diverge we can also re-split them out though.

>
> Benjamin Herrenschmidt started a thread back in January about creating a
> common semihosting implementation to be shared across ARM, RISC-V and
> PPC. I'm not sure he ever published the resulting code, but we can
> probably get whatever he's done and see if we want to go that way. I
> suspect the biggest impact will be to the ARM maintainers who will end
> up on the hook for reviewing the code to make sure it doesn't break
> anything for them.

AFAIK that unfortunately never progressed too far.

>
> I can expand the semihost testing which picolibc currently performs
> under QEMU on ARM, AARCH64 and RISC-V; that might help catch regressions
> caused by this rework.

That would be helpful.

When doing that make sure to split the patches up (this one is already
a little big) so that the ARM people can just review 1 patch.

>
> >> --- a/target/riscv/translate.c
> >> +++ b/target/riscv/translate.c
> >> @@ -63,6 +63,7 @@ typedef struct DisasContext {
> >>      uint16_t vlen;
> >>      uint16_t mlen;
> >>      bool vl_eq_vlmax;
> >> +    CPUState *cs;
> >
> > I'm not sure we should do this.
>
> Yeah, the RISC-V semihosting requirement that three instructions be
> compared to determine a valid 'sequence' is the least pleasing part of
> the specification. This is the second version of this particular piece
> of code.
>
> We also changed the semihosting specification to require that all three
> instructions lie on the same page to make sure they are all available if
> any are available. In the application implementation, all that was

I saw that, that is good news.

> required to meet that was to put the sequence in a function and align
> that to a 16-byte boundary as the function consists of four 32-bit
> instructions:
>
>         .global sys_semihost
>         .balign 16
>         .option push
>         .option norvc
> sys_semihost:
>         slli zero, zero, 0x1f
>         ebreak
>         srai zero, zero, 0x7
>         ret
>         .option pop
>
> >> +static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
> >> +{
> >> +    DisasContext *ctx = container_of(dcbase, DisasContext, base);
> >> +    CPUState *cpu = ctx->cs;
> >> +    CPURISCVState *env = cpu->env_ptr;
> >> +
> >> +    return cpu_ldl_code(env, pc);
> >
> > @Richard Henderson is this ok?
>
> Let me know if you've got a better plan, or even some suggestions on how
> it might be improved as it seems like it a layering violation to me.

I don't have an idea off the top of my head, hopefully Richard already
knows the answer here :)

Alistair

>
> --
> -keith

