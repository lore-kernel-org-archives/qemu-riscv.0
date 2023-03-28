Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph7BF-0003ke-70
	for mharc-qemu-riscv@gnu.org; Tue, 28 Mar 2023 07:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ph7BD-0003kE-CF
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 07:07:55 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ph7BB-0002FU-7O
 for qemu-riscv@nongnu.org; Tue, 28 Mar 2023 07:07:54 -0400
Received: by mail-qt1-x82c.google.com with SMTP id cj15so3986240qtb.5
 for <qemu-riscv@nongnu.org>; Tue, 28 Mar 2023 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680001671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2OWo9GIHX+02Cbm4JmUor6P4E16Az7/7HFBGm2zQAk=;
 b=Nyv0klUMC4GRMlhwF81uhwtqnSqd24I3Km93moGglkqRg+7CmTl0k8CwxbOiodlFti
 h0rSfGNK4yR4sPvSmjGXWgqbZUhnG4e+HxJspGkPWy2GnUHybwQaV56hFDcIQimRgEv5
 tbcnf3KaDA+uKRTMucOqfijxEqu5eroSoyf+upzrPGEP4GRVE1lwy4tofQA8/Fuxs9T8
 lRTWd+PUp68T+l1P1wYS7U12OlLNt9FeyYDNcdMBWj28iPWzPbDZifUyfhvvn1NAGV85
 DL+1G7YKcw2jzTR0j06X3x+eVL6lTsp4sgJdYHt2U/PU2oTLQDe7bbrKleBaWja47GG1
 rHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680001671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2OWo9GIHX+02Cbm4JmUor6P4E16Az7/7HFBGm2zQAk=;
 b=Skl29j2dcE2QJDStZqz+5eRQZJXSq7gxOIOs7x2XjDlRdzxlE7AtNaQD4McyisNotC
 cWMlwBQOkO9ZO2z+VGAWagD9rUTKvjlgYOb/9X3y0tc0ES3DgoIBfjAjAX9h9t5dwov/
 DR8Kr+/cbtvGQMZDUgl4xO0JgxVWop1vG673qVJY+VWZp1nyMUd0Nm6Um7k1dcb4oD0H
 X7yfFD5ILro6ciZLIeJzevIpEGM2R0EW4ULvOm8mgEDNV1Isr9sHyInn5r24P7rp6Jz7
 bRMjqMGLvgFg+AnrCHh9TrliwcDQyCeaIih0lDpY2jdlsu7pO9gPhYEQBpHroAdgQ/Kp
 cjdg==
X-Gm-Message-State: AAQBX9cPVRnUAmCaGQaSqn5CkJp65QZkCiaknIa4jV3KREa7ER5XzuiY
 5WABH9uRw6y37GDbXhPpt2LZkmUC1jeZb8atL8PU6w==
X-Google-Smtp-Source: AK7set8k22tHNRJmLP4XMWpf8dXfu5Retly723b3vTkIZ9NSSLF7l16qBm1qVJGRi+MjQDPYUrEZL+tuIZrwOJ70m0U=
X-Received: by 2002:ac8:5744:0:b0:3e0:c4ac:1620 with SMTP id
 4-20020ac85744000000b003e0c4ac1620mr5771868qtx.13.1680001671614; Tue, 28 Mar
 2023 04:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-5-mchitale@ventanamicro.com>
 <CAKmqyKO+HQ7dtGQwaJFG481vkyMfX-tXrux2rmrGkfAz54dBbQ@mail.gmail.com>
 <3efb804f-4a3a-758e-fb4a-543e10271045@iscas.ac.cn>
In-Reply-To: <3efb804f-4a3a-758e-fb4a-543e10271045@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Tue, 28 Mar 2023 16:37:15 +0530
Message-ID: <CAN37VV5b_wdty4ob1D4tjGe6r96CuzdYYurvi=AyqG0EhsSgzg@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] target/riscv: smstateen check for fcsr
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 28 Mar 2023 11:07:55 -0000

On Fri, Mar 24, 2023 at 7:01=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2022/11/21 07:35, Alistair Francis wrote:
> > On Sun, Oct 16, 2022 at 11:09 PM Mayuresh Chitale
> > <mchitale@ventanamicro.com> wrote:
> >> If smstateen is implemented and sstateen0.fcsr is clear then the float=
ing point
> >> operations must return illegal instruction exception or virtual instru=
ction
> >> trap, if relevant.
> >>
> >> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> ---
> >>   target/riscv/csr.c                        | 23 ++++++++++++
> >>   target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++=
--
> >>   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
> >>   3 files changed, 75 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 71236f2b5d..8b25f885ec 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int cs=
rno)
> >>           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >> +
> >> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> >> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> >> +    }
> >>   #endif
> >>       return RISCV_EXCP_NONE;
> >>   }
> >> @@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVSt=
ate *env, int csrno,
> >>                                         target_ulong new_val)
> >>   {
> >>       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >> +    if (!riscv_has_ext(env, RVF)) {
> >> +        wr_mask |=3D SMSTATEEN0_FCSR;
> >> +    }
> >>
> >>       return write_mstateen(env, csrno, wr_mask, new_val);
> >>   }
> >> @@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCV=
State *env, int csrno,
> >>   {
> >>       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >>
> >> +    if (!riscv_has_ext(env, RVF)) {
> >> +        wr_mask |=3D SMSTATEEN0_FCSR;
> >> +    }
> >> +
> >>       return write_mstateenh(env, csrno, wr_mask, new_val);
> >>   }
> >>
> >> @@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVS=
tate *env, int csrno,
> >>   {
> >>       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >>
> >> +    if (!riscv_has_ext(env, RVF)) {
> >> +        wr_mask |=3D SMSTATEEN0_FCSR;
> >> +    }
> >> +
> >>       return write_hstateen(env, csrno, wr_mask, new_val);
> >>   }
> >>
> >> @@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCV=
State *env, int csrno,
> >>   {
> >>       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >>
> >> +    if (!riscv_has_ext(env, RVF)) {
> >> +        wr_mask |=3D SMSTATEEN0_FCSR;
> >> +    }
> >> +
> >>       return write_hstateenh(env, csrno, wr_mask, new_val);
> >>   }
> >>
> >> @@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVS=
tate *env, int csrno,
> >>   {
> >>       uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> >>
> >> +    if (!riscv_has_ext(env, RVF)) {
> >> +        wr_mask |=3D SMSTATEEN0_FCSR;
> >> +    }
> >> +
> >>       return write_sstateen(env, csrno, wr_mask, new_val);
> >>   }
> >>
> >> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/in=
sn_trans/trans_rvf.c.inc
> >> index a1d3eb52ad..93657680c6 100644
> >> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> >> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> >> @@ -24,9 +24,46 @@
> >>               return false; \
> >>   } while (0)
> >>
> >> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> >> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> >> -        REQUIRE_EXT(ctx, RVF); \
> >> +#ifndef CONFIG_USER_ONLY
> >> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
> >> +{
> >> +    CPUState *cpu =3D ctx->cs;
> >> +    CPURISCVState *env =3D cpu->env_ptr;
> >> +    uint64_t stateen =3D env->mstateen[index];
> > Sorry I missed this the first time around. You can't access env here
> >
> > Richard pointed it out here:
> > https://patchwork.kernel.org/project/qemu-devel/patch/20221117070316.58=
447-8-liweiwei@iscas.ac.cn/#25095773
> >
> > I'm going to drop this patch and patch v5
> >
> > Alistair
>
> Hi, Any new updates for the last two patches after they were dropped?
>
> Regards,
>
> Weiwei Li
>
Looks like I missed the original comments from Richard and Alistair. I
am not yet clear how to implement it but I am looking into it.

