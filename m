Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ky1HF-0004cd-2d
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jan 2021 18:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1HD-0004bw-6J; Fri, 08 Jan 2021 18:34:39 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:40361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1HB-0008At-Fz; Fri, 08 Jan 2021 18:34:38 -0500
Received: by mail-il1-x136.google.com with SMTP id e7so12002135ile.7;
 Fri, 08 Jan 2021 15:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vR1if8u9a8NFBhMb/Mx8V/1NE8TZuKRcRJqT9+CdSlE=;
 b=ldpNb7B3geHrDuqBIjpQVmsQzU6Qdl9sxZ0Ppwgze2LRHxHSfV41Xsq4+SJKJ3Ldez
 3ESb0b+LY3OBstP5CTdKiGD8dqRoKiJ7vXm5+Rn0R/S5Tt3Rs6KOlKm3+dE6xJQPeyIO
 MK/aA8e+aCyYACZjFy9RC5UhR+KlkEhmn+0JL3zC8lK8JXFiDVGZFaluUWmEU7FB0RHE
 nJDHEVTMK/WkCeiDcq7VdvfB7QnLBJNnTTUUFpEjbDdtXCR1rieIF7kthJH/mDAPS/33
 113G4YNTCCJbnkaIDc994cgppVTW3ZQkZ8MrG0lrPiu+4haW97CgE6cLcssvQvVK0pN3
 fBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vR1if8u9a8NFBhMb/Mx8V/1NE8TZuKRcRJqT9+CdSlE=;
 b=qK3vQPjfVgGskoWFl7WVYJXZtoM9XwbReXn/ghVHV6I48uBjWvCO9t9vupmlFCu1Uv
 LVNFOwUIax0KGaQGj5pGMY4mTvkob79HIGLiiFj/XPIoRCRXcHaxhanFaM3FaLzSlgHr
 LaSgQUMU1N4u5uBfuD1IZXz8cst8Zjnq7wx/0vnqjMafCZjjl+ABeyLSdBgKbSZn/iO/
 +9TQaWCa7Az3lh58W7tLmzL7mNxBctkAEgAvWuxZuDO8G27lshCSQZQ9+hpKcDaAn2AH
 OUNizHQW0IpHu3UFH7QDdRDUtnYXAFhF3ANqlCTvMvwDE0UGwIlgh455nJhhJqjOm7uG
 KenA==
X-Gm-Message-State: AOAM530IYFmjDlbY5H1vepf33R9tshUyA1nHSAtvWkIoDMepvNgn02MX
 ntefb5LchT5CechLEEp0Xxt65hUMHi+tpMu0Y14=
X-Google-Smtp-Source: ABdhPJzPDJSCH1w82GZwxl5CmORPnlLYHicTr+5pdvKKoUaohY1eFXXMFIGM4UafCp1AVDKdIgmZnZO/56ij6Wy6N2w=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr6043069ilg.40.1610148876084; 
 Fri, 08 Jan 2021 15:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20201223192553.332508-1-atish.patra@wdc.com>
 <CAKmqyKO7uRewgKZz9V5BP5Xnqw8HWaCruaQta1JK_HvzmhdR+Q@mail.gmail.com>
 <3542d26c042fd088114aa403612a58a643d45eaf.camel@wdc.com>
In-Reply-To: <3542d26c042fd088114aa403612a58a643d45eaf.camel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Jan 2021 15:34:10 -0800
Message-ID: <CAKmqyKOxdr5cXgmoMQOHOPjUEJ6xFr2RfafORuwLBECHOMozfQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/pmp: Raise exception if no PMP entry is
 configured
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Anup Patel <Anup.Patel@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Fri, 08 Jan 2021 23:34:39 -0000

On Thu, Jan 7, 2021 at 11:02 AM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Thu, 2021-01-07 at 09:19 -0800, Alistair Francis wrote:
> > On Wed, Dec 23, 2020 at 11:26 AM Atish Patra <atish.patra@wdc.com>
> > wrote:
> > >
> > > As per the privilege specification, any access from S/U mode should
> > > fail
> > > if no pmp region is configured.
> >
> > This doesn't sound right, the spec says:
> >
> > "If no PMP entry matches an S-mode or U-mode access, but at least one
> > PMP entry is implemented, the access fails."
> >
> > I don't see anything saying that an access will fail if there are no
> > PMP regions configred.
> >
>
> It also says
>
> If at least one PMP entry is implemented, but all PMP entries=E2=80=99 A =
fields
> are set to OFF, then all S-mode and U-mode memory accesses will fail.
>
> My understanding is that if PMP is implemented in hardware, but not
> configured, S/U-mode memory access should fail. At least that's how
> hardware behave.

Ah, I misinterpreted what implemented means.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied to riscv-to-apply.next

Alistair

>
> > Alistair
> >
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > > Changes from v2->v1
> > > 1. Removed the static from the function definition
> > > ---
> > >  target/riscv/op_helper.c | 5 +++++
> > >  target/riscv/pmp.c       | 4 ++--
> > >  target/riscv/pmp.h       | 1 +
> > >  3 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > index d55def76cffd..1eddcb94de7e 100644
> > > --- a/target/riscv/op_helper.c
> > > +++ b/target/riscv/op_helper.c
> > > @@ -150,6 +150,11 @@ target_ulong helper_mret(CPURISCVState *env,
> > > target_ulong cpu_pc_deb)
> > >
> > >      uint64_t mstatus =3D env->mstatus;
> > >      target_ulong prev_priv =3D get_field(mstatus, MSTATUS_MPP);
> > > +
> > > +    if (!pmp_get_num_rules(env) && (prev_priv !=3D PRV_M)) {
> > > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST,
> > > GETPC());
> > > +    }
> > > +
> > >      target_ulong prev_virt =3D get_field(env->mstatus, MSTATUS_MPV);
> > >      mstatus =3D set_field(mstatus, MSTATUS_MIE,
> > >                          get_field(mstatus, MSTATUS_MPIE));
> > > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > > index 2eda8e1e2f07..80d0334e1bfc 100644
> > > --- a/target/riscv/pmp.c
> > > +++ b/target/riscv/pmp.c
> > > @@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState
> > > *env, uint32_t pmp_index)
> > >  /*
> > >   * Count the number of active rules.
> > >   */
> > > -static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
> > > +uint32_t pmp_get_num_rules(CPURISCVState *env)
> > >  {
> > >       return env->pmp_state.num_rules;
> > >  }
> > > @@ -237,7 +237,7 @@ bool pmp_hart_has_privs(CPURISCVState *env,
> > > target_ulong addr,
> > >
> > >      /* Short cut if no rules */
> > >      if (0 =3D=3D pmp_get_num_rules(env)) {
> > > -        return true;
> > > +        return (env->priv =3D=3D PRV_M) ? true : false;
> > >      }
> > >
> > >      if (size =3D=3D 0) {
> > > diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> > > index 6c6b4c9befe8..c8d5ef4a694e 100644
> > > --- a/target/riscv/pmp.h
> > > +++ b/target/riscv/pmp.h
> > > @@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env,
> > > hwaddr tlb_sa,
> > >                           target_ulong *tlb_size);
> > >  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
> > >  void pmp_update_rule_nums(CPURISCVState *env);
> > > +uint32_t pmp_get_num_rules(CPURISCVState *env);
> > >
> > >  #endif
> > > --
> > > 2.25.1
> > >
> > >
>
> --
> Regards,
> Atish

