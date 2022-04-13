Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nemsW-0005AX-Qk
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 19:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nemsS-0005AB-9r; Wed, 13 Apr 2022 19:58:24 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nems8-0004BU-JH; Wed, 13 Apr 2022 19:58:23 -0400
Received: by mail-il1-x12a.google.com with SMTP id d3so2126031ilr.10;
 Wed, 13 Apr 2022 16:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qBk78eEW621GF334sY1DP1J4BPM1T+2v4E9uZGDpyH0=;
 b=Vjc5L8oXoqdO5XLThKAo7ID2Wqt99iL0A4bjTHzKKemaLF+zKJH07Dv8cfVivbpENL
 s3siD3Sa+c/M1FZ3sLcxM2vBnB5iXaTOJBnFYfpkTkcypS5BOA+wZtPaOpUqbkCV9cjH
 J71G+iTyihw5HzN8g9o+imzTreUY3xGkCaDv8Pg63TS8JLgH2jCMpYQbKDNb9ESEbPV4
 rMUl7mpa+b56q/ee4IeiIrJbFYIfsD9TPxGFz1ocFBPvwr7ZaI84eopOgzAVZHKtrUts
 ueGZ2rvJ3t9ZnqZYHV2eT01mCxgSEhV6+M00QmAfIGOyV3JMSJBDA3vGzJ/fXOYu7KFa
 xFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qBk78eEW621GF334sY1DP1J4BPM1T+2v4E9uZGDpyH0=;
 b=DKy3VvJV/qjlLQDMw9MNXQWRjx6jufvpHq32aVqgB9BSQbHMrJkXy50j7pcJty+y1H
 gO7zglHKMLhOnij3r+sHjOl8XBPO8Cx8hCXfRq+07+0ZpGxt0ihlsRn7B5WfouBr0/rc
 mAVPlW/M5qdIe4tgDpVIOKPzi4a5RpXhwH99CADtbMF7QAiUP21z0UyNbhHDrMthX+xM
 vlcEXgsR//g+SmMblx6XPYXUQc5Vd0szcfMleIZikfDcfGfw+Eiwi2tAl2FV7x0QjCEQ
 ioueOu/Sa1bKOEwsKBP5kPgW9ZXiq0Al13LApd4dn/P5QiQ1U7hshy3b711+la0MiNaw
 jItg==
X-Gm-Message-State: AOAM533On7ZuUxdINks/PQTorVbH5WPNqBLJwVeffcLP+7g89MtmaC3r
 4kSOVJ9eCoe517pX6eUBFHVLbUzw/C5n9OmGg3M=
X-Google-Smtp-Source: ABdhPJw7VIH3OpJeowOzZ+8IJiqtuMugNLaAtt3HoqcYJDmdia/pR6k7sI8oUBnh1bLkA1ttuh4SSYZT1jGbv64FhFk=
X-Received: by 2002:a92:d791:0:b0:2ca:bcb8:9a5a with SMTP id
 d17-20020a92d791000000b002cabcb89a5amr31009iln.145.1649894283071; Wed, 13 Apr
 2022 16:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-13-liweiwei@iscas.ac.cn>
 <e00bf2b4-3c33-ffef-93a2-338917ff50b3@iscas.ac.cn>
In-Reply-To: <e00bf2b4-3c33-ffef-93a2-338917ff50b3@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Apr 2022 09:57:37 +1000
Message-ID: <CAKmqyKO+LzAO9U1TzhtrVnmPETbjbSGxdbQ-T=3pEqLzTAYi=A@mail.gmail.com>
Subject: Re: [PATCH v9 12/14] target/riscv: rvk: add CSR support for Zkr
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Wed, 13 Apr 2022 23:58:24 -0000

On Mon, Apr 11, 2022 at 2:46 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Hi, any comments on this patch or patchset?
>
> Currently, read-only instruction to access Seed CSR is checked as a
> special case in helper_csrr as suggested in
>
> https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00146.html.

Ah sorry, I didn't realise you had updated this.

>
> (The new version for that patch is in
> https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00156.html)
>
> Regards,
>
> Weiwei Li
>
> =E5=9C=A8 2022/3/18 =E4=B8=8B=E5=8D=8812:19, Weiwei Li =E5=86=99=E9=81=93=
:
> >   - add SEED CSR which must be accessed with a read-write instruction:
> >     A read-only instruction such as CSRRS/CSRRC with rs1=3Dx0 or CSRRSI=
/CSRRCI
> > with uimm=3D0 will raise an illegal instruction exception.
> >   - add USEED, SSEED fields for MSECCFG CSR
> >
> > Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> > Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> > ---
> >   target/riscv/cpu_bits.h  |  9 ++++++
> >   target/riscv/csr.c       | 68 +++++++++++++++++++++++++++++++++++++++=
+
> >   target/riscv/op_helper.c |  9 ++++++
> >   target/riscv/pmp.h       |  8 +++--
> >   4 files changed, 91 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index bb47cf7e77..d401100f47 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -458,6 +458,9 @@
> >   #define CSR_VSPMMASK        0x2c1
> >   #define CSR_VSPMBASE        0x2c2
> >
> > +/* Crypto Extension */
> > +#define CSR_SEED            0x015
> > +
> >   /* mstatus CSR bits */
> >   #define MSTATUS_UIE         0x00000001
> >   #define MSTATUS_SIE         0x00000002
> > @@ -800,4 +803,10 @@ typedef enum RISCVException {
> >   #define HVICTL_VALID_MASK                  \
> >       (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
> >
> > +/* seed CSR bits */
> > +#define SEED_OPST                        (0b11 << 30)
> > +#define SEED_OPST_BIST                   (0b00 << 30)
> > +#define SEED_OPST_WAIT                   (0b01 << 30)
> > +#define SEED_OPST_ES16                   (0b10 << 30)
> > +#define SEED_OPST_DEAD                   (0b11 << 30)
> >   #endif
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 3c61dd69af..5717a51f56 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -24,6 +24,8 @@
> >   #include "qemu/main-loop.h"
> >   #include "exec/exec-all.h"
> >   #include "sysemu/cpu-timers.h"
> > +#include "qemu/guest-random.h"
> > +#include "qapi/error.h"
> >
> >   /* CSR function table public API */
> >   void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
> > @@ -292,6 +294,40 @@ static RISCVException epmp(CPURISCVState *env, int=
 csrno)
> >   }
> >   #endif
> >
> > +static RISCVException seed(CPURISCVState *env, int csrno)
> > +{
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +
> > +    if (!cpu->cfg.ext_zkr) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +#if !defined(CONFIG_USER_ONLY)
> > +    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
> > +        /* Hypervisor extension is supported */
> > +        if (riscv_cpu_virt_enabled(env) && (env->priv !=3D PRV_M)) {

You can simplify this to just riscv_cpu_virt_enabled(). You don't need
to check if we have the extension as well.

> > +            if (env->mseccfg & MSECCFG_SSEED) {
> > +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > +            } else {
> > +                return RISCV_EXCP_ILLEGAL_INST;
> > +            }
> > +        }
> > +    }
> > +
> > +    if (env->priv =3D=3D PRV_M) {
> > +        return RISCV_EXCP_NONE;
> > +    } else if (env->priv =3D=3D PRV_S && (env->mseccfg & MSECCFG_SSEED=
)) {
> > +        return RISCV_EXCP_NONE;
> > +    } else if (env->priv =3D=3D PRV_U && (env->mseccfg & MSECCFG_USEED=
)) {
> > +        return RISCV_EXCP_NONE;
> > +    } else {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +#else
> > +    return RISCV_EXCP_NONE;
> > +#endif
> > +}
> > +
> >   /* User Floating-Point CSRs */
> >   static RISCVException read_fflags(CPURISCVState *env, int csrno,
> >                                     target_ulong *val)
> > @@ -2961,6 +2997,35 @@ static RISCVException write_upmbase(CPURISCVStat=
e *env, int csrno,
> >
> >   #endif
> >
> > +/* Crypto Extension */
> > +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> > +                              target_ulong *ret_value,
> > +                              target_ulong new_value, target_ulong wri=
te_mask)
> > +{
> > +    uint16_t random_v;
> > +    Error *random_e =3D NULL;
> > +    int random_r;
> > +
> > +    random_r =3D qemu_guest_getrandom(&random_v, 2, &random_e);
> > +    if (unlikely(random_r < 0)) {
> > +        /*
> > +         * Failed, for unknown reasons in the crypto subsystem.
> > +         * The best we can do is log the reason and return a
> > +         * failure indication to the guest.  There is no reason
> > +         * we know to expect the failure to be transitory, so
> > +         * indicate DEAD to avoid having the guest spin on WAIT.
> > +         */
> > +        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
> > +                      __func__, error_get_pretty(random_e));
> > +        error_free(random_e);
> > +        *ret_value =3D SEED_OPST_DEAD;
> > +    } else {
> > +        *ret_value =3D random_v | SEED_OPST_ES16;
> > +    }

Won't this seg fault if a guest does a CSR write?

> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   /*
> >    * riscv_csrrw - read and/or update control and status register
> >    *
> > @@ -3205,6 +3270,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >       [CSR_TIME]  =3D { "time",  ctr,   read_time  },
> >       [CSR_TIMEH] =3D { "timeh", ctr32, read_timeh },
> >
> > +    /* Crypto Extension */
> > +    [CSR_SEED] =3D { "seed", seed, NULL, NULL, rmw_seed },
> > +
> >   #if !defined(CONFIG_USER_ONLY)
> >       /* Machine Timers and Counters */
> >       [CSR_MCYCLE]    =3D { "mcycle",    any,   read_instret  },
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index e0d708091e..3d8443416d 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint=
32_t exception)
> >
> >   target_ulong helper_csrr(CPURISCVState *env, int csr)
> >   {
> > +    /*
> > +     * The seed CSR must be accessed with a read-write instruction. A
> > +     * read-only instruction such as CSRRS/CSRRC with rs1=3Dx0 or CSRR=
SI/
> > +     * CSRRCI with uimm=3D0 will raise an illegal instruction exceptio=
n.
> > +     */
> > +    if (csr =3D=3D CSR_SEED) {
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > +    }
> > +
> >       target_ulong val =3D 0;
> >       RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0, false);
> >
> > diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> > index fcb6b7c467..a8dd797476 100644
> > --- a/target/riscv/pmp.h
> > +++ b/target/riscv/pmp.h
> > @@ -39,9 +39,11 @@ typedef enum {
> >   } pmp_am_t;
> >
> >   typedef enum {
> > -    MSECCFG_MML  =3D 1 << 0,
> > -    MSECCFG_MMWP =3D 1 << 1,
> > -    MSECCFG_RLB  =3D 1 << 2
> > +    MSECCFG_MML   =3D 1 << 0,
> > +    MSECCFG_MMWP  =3D 1 << 1,
> > +    MSECCFG_RLB   =3D 1 << 2,

Why are these ones being changed?

Alistair

> > +    MSECCFG_USEED =3D 1 << 8,
> > +    MSECCFG_SSEED =3D 1 << 9
> >   } mseccfg_field_t;
> >
> >   typedef struct {
>
>

