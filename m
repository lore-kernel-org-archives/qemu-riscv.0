Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5E76-0005eE-Oh
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E6s-0005ZG-6O
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:46:19 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=34770
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E6q-0006oh-Ag
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:46:17 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id k69so1852373ybf.1
 for <qemu-riscv@nongnu.org>; Wed, 05 Jan 2022 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5USgIA2nAiUdSLBoxwlrKOM0//qGpuQCArlzEii5Zo=;
 b=qQgy+VUivfDkL9Q3CGfcfl9mEWiLwUkG+qMiR6USQqP4oFkk+G1LixXBbyG9AgIvvH
 xMHri8pWvdVqBJbNWGctihjdYfC/Svb2OaLl68DrypVPSPWdzeAdEDmg1ake1+Rtez25
 T9Q15iMD47a6qNvh/BSEm/ppEymWkshj0hi+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5USgIA2nAiUdSLBoxwlrKOM0//qGpuQCArlzEii5Zo=;
 b=hhWPvrkSKN7zFto3efN7wcX3afrk/Rd+4q/Sjz0Chv/VD1p+6PkSXDZUvgzOkvnWYJ
 xBb6x2zNwMhcIFh9HroW2OMRmKfyq0YAIL6/FbnYqVvHiB3Y5hVI/noY3B1YuzhC9+vr
 jJ7yXLe0mZ9dIbNqPZxPaSI3B5tidQ+ab6NwQy+WTt5JJUzNF+UCy0IPdeqD4lhsbH+X
 Lg4bMXcb2Fn0Ik5PBACP3eXEap0prkvpUsPoLrgBdp/N05AynAw7OHI1GobLnLrGHgFK
 YQoq+nfDIA4Z0qnPC7h1oNQW0LQ6aEBhkCEeHXBQUmkK2a3xJfvB6GMgGjPCY5+9qksa
 oH4Q==
X-Gm-Message-State: AOAM533RJ+MxBOiPhb4Rp9S/v4fXdBWaLRlf4aZhbuzLSDlkX3COk3P0
 KHFJxOJ5mmyustda34sP8Ox4VSv6dnOQcxnVD9iY
X-Google-Smtp-Source: ABdhPJyM11w0w1h3dK6WUMdncVv1qP8OxjU78eGfMr1e0FpzvmZ9KY61NUktH6E8KpSQtrjMmxGkQjUY47o+dBNxsso=
X-Received: by 2002:a5b:ec2:: with SMTP id a2mr54150994ybs.713.1641419174873; 
 Wed, 05 Jan 2022 13:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-3-atish.patra@wdc.com>
 <CAEUhbmUOBq4-tguGbGixXADGdstJ2azKr-WK=6y2J83Ye9AbBQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUOBq4-tguGbGixXADGdstJ2azKr-WK=6y2J83Ye9AbBQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 5 Jan 2022 13:46:04 -0800
Message-ID: <CAOnJCULrd-UnkYMriK7fE0dz+6Ch_Bxn49XqD+1Rgiw8umMmjg@mail.gmail.com>
Subject: Re: [ PATCH v3 02/10] target/riscv: Implement PMU CSR predicate
 function for
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 21:46:25 -0000

On Thu, Nov 4, 2021 at 4:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 3:56 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
>
> The commit title is incomplete
>

Oops. Fixed it.

>
> > Currently, the predicate function for PMU related CSRs only works if
> > virtualization is enabled. It also does not check mcounteren bits before
> > before cycle/minstret/hpmcounterx access.
> >
> > Support supervisor mode access in the predicate function as well.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 1ec776013435..de484c74d3b4 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >  #if !defined(CONFIG_USER_ONLY)
> >      CPUState *cs = env_cpu(env);
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> > +    int ctr_index;
> >
> >      if (!cpu->cfg.ext_counters) {
> >          /* The Counters extensions is not enabled */
> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > +    if (env->priv == PRV_S) {
> > +        switch (csrno) {
> > +        case CSR_CYCLE:
> > +            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_TIME:
> > +            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_INSTRET:
> > +            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
> > +        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > +            ctr_index = csrno - CSR_CYCLE;
> > +            if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +            break;
>
> The above switch..case can be simplified with the logic of last case
> as the same one applies to all cases.
>

I did not condense it because I wanted to keep it analogous to the
virtualization case.
But I agree that it should be much shorter in both cases. I will add a
separate patch to simplify the entire function for
all the cases.


> > +        }
> > +        if (riscv_cpu_is_32bit(env)) {
> > +            switch (csrno) {
> > +            case CSR_CYCLEH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_TIMEH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_INSTRETH:
> > +                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
> > +                break;
> > +            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > +                ctr_index = csrno - CSR_CYCLEH;
> > +                if (!get_field(env->mcounteren, 1 << ctr_index)) {
> > +                    return RISCV_EXCP_ILLEGAL_INST;
> > +                }
>
> ditto
>
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> >      if (riscv_cpu_virt_enabled(env)) {
> >          switch (csrno) {
> >          case CSR_CYCLE:
> >
>
> Regards,
> Bin
>


--
Regards,
Atish

