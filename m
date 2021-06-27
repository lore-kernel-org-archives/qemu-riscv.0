Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxWso-0004an-6C
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 11:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxWsm-0004YS-FL
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 11:39:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxWsj-0004NR-I9
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 11:39:40 -0400
Received: by mail-pf1-x434.google.com with SMTP id x16so11867578pfa.13
 for <qemu-riscv@nongnu.org>; Sun, 27 Jun 2021 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytoyOC0FyhLj3Gmj1/l70yJX5TGsFYnDA8Y4r7uhJBQ=;
 b=cHPICL3TL1m04w2/YZG0+KaMWxzsLfKsS1754srIlueb3kxlwQnHdNRuuz/eyh7Xg2
 tQzeFvega8CUs1/v0UCCdgnNiB+uWtzVabGdtVd3clyPrd1Vg2B/Kn1Y1FDsS49OHUbg
 EjVQPyuMVPdVlugNO7Tp8Sxu2U1noT20IWL5k3FJi6Gy7GzlWx4h6m6Jtj+Nk26alEmQ
 4ERIOdsyfqmJXI+2wouYlO7lIYUn1q0rhsZChPjG8y7Xtyiqwk0W4OieggbshXu4MsdY
 AavaxEJm7YeY0oBHnfVjBZQhymQ4p2KvWfK0JICr8u/aDibbcZGQcV2TwJH6d3YBocE9
 Zfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytoyOC0FyhLj3Gmj1/l70yJX5TGsFYnDA8Y4r7uhJBQ=;
 b=SUZYLVffYevsE66zXcM01GJ5i+9JnaIYeDZeKsvhjFgXqAGbpX3AWzNHEuk6kwmkzH
 x+5qeYgRcu2XWBkBGzorgZtXEVmgzXDe/JhyaV8cmwkEwGbn0eFPqBZ5IL0t1ge6uzZm
 SURCaAtzj/PTG7zUFVpErWDFpsfxmOQbJu7k+aqDIfAl56qkkQ8VyVbNSEKOCXBuCEmq
 UKZSbVABORunc8dAyQqQZAnEMhDjjI0JTyI08lQu2iX3KP63td3m2jGf34akfoFihSUc
 M7SI0PmtSdtQEQP+Hzw+RsJiaaBlHfHuvaSmk3WW8ATzUuBntawqLuoAGgk/bXbQ9XHY
 mPSA==
X-Gm-Message-State: AOAM532SJbsra95jfEwqCAGa5e4XnFLi0gNKW/zf2n+D47R097DgnVud
 TROw5cgLM4uedjJXCQFl1mqXvw==
X-Google-Smtp-Source: ABdhPJyhSQDpc4yi65YEA69Rn58arTfJvpS7j1Ot71eCpNdjuFzkhaxfpaHotuOaoavgFta8wHztmA==
X-Received: by 2002:a62:5257:0:b029:301:b5c1:66ae with SMTP id
 g84-20020a6252570000b0290301b5c166aemr20400827pfb.65.1624808375648; 
 Sun, 27 Jun 2021 08:39:35 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178])
 by smtp.gmail.com with ESMTPSA id c24sm12368014pgj.11.2021.06.27.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:39:34 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id x16so11867547pfa.13;
 Sun, 27 Jun 2021 08:39:34 -0700 (PDT)
X-Received: by 2002:a62:b40c:0:b029:2de:4a1e:a753 with SMTP id
 h12-20020a62b40c0000b02902de4a1ea753mr20592194pfn.64.1624808374162; Sun, 27
 Jun 2021 08:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-11-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-11-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 23:39:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D1v9mr8cechiTqzNJXi_Az6-7ptKQBBfPP4QcMDMzuKmA@mail.gmail.com>
Message-ID: <CANzO1D1v9mr8cechiTqzNJXi_Az6-7ptKQBBfPP4QcMDMzuKmA@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] target/riscv: Update interrupt handling in CLIC
 mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000f85b5205c5c12d63"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Sun, 27 Jun 2021 15:39:40 -0000

--000000000000f85b5205c5c12d63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:54=E5=AF=AB=E9=81=93=EF=BC=9A

> Decode CLIC interrupt information from exccode, includes interrupt
> priviledge mode, interrupt level, and irq number.
>
> Then update CSRs xcause, xstatus, xepc, xintstatus and jump to
> correct PC according to the CLIC specification.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h   |   1 +
>  target/riscv/cpu_helper.c | 117 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 111 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 494e41edc9..d8378d2384 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -557,6 +557,7 @@
>  #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
>  #define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
>
> +#define RISCV_EXCP_INT_CLIC                0x40000000
>  #define RISCV_EXCP_INT_FLAG                0x80000000
>  #define RISCV_EXCP_INT_MASK                0x7fffffff
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 21c54ef561..998d1a2742 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -26,6 +26,10 @@
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
>
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/intc/riscv_clic.h"
> +#endif
> +
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
>  #ifdef CONFIG_USER_ONLY
> @@ -36,6 +40,20 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> +static int riscv_cpu_local_irq_mode_enabled(CPURISCVState *env, int mode=
)
> +{
> +    switch (mode) {
> +    case PRV_M:
> +        return env->priv < PRV_M ||
> +               (env->priv =3D=3D PRV_M && get_field(env->mstatus,
> MSTATUS_MIE));
> +    case PRV_S:
> +        return env->priv < PRV_S ||
> +               (env->priv =3D=3D PRV_S && get_field(env->mstatus,
> MSTATUS_SIE));
> +    default:
> +        return false;
> +    }
> +}
> +
>  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
>      target_ulong irqs;
> @@ -90,6 +108,18 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>              return true;
>          }
>      }
> +    if (interrupt_request & CPU_INTERRUPT_CLIC) {
> +        RISCVCPU *cpu =3D RISCV_CPU(cs);
> +        CPURISCVState *env =3D &cpu->env;
> +        int mode =3D (env->exccode >> 12) & 0b11;
> +        int enabled =3D riscv_cpu_local_irq_mode_enabled(env, mode);
> +        if (enabled) {
> +            cs->exception_index =3D RISCV_EXCP_INT_CLIC | env->exccode;
> +            cs->interrupt_request =3D cs->interrupt_request &
> ~CPU_INTERRUPT_CLIC;
> +            riscv_cpu_do_interrupt(cs);
> +            return true;
> +        }
> +    }
>  #endif
>      return false;
>  }
> @@ -884,6 +914,55 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>  #endif
>  }
>
> +
> +#if !defined(CONFIG_USER_ONLY)
> +static target_ulong riscv_intr_pc(CPURISCVState *env, target_ulong tvec,
> +                                  target_ulong tvt, bool async, bool cli=
c,
> +                                  int cause, int mode)
> +{
> +    int mode1 =3D tvec & 0b11, mode2 =3D tvec & 0b111111;
> +    CPUState *cs =3D env_cpu(env);
> +
> +    if (!(async || clic)) {
> +        return tvec & ~0b11;
>

In CLIC mode, synchronous exception traps always jump to NBASE.


> +    }
> +    /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D rese=
rved */
> +    switch (mode1) {
> +    case 0b00:
> +        return tvec & ~0b11;
> +    case 0b01:
> +        return (tvec & ~0b11) + cause * 4;
> +    default:
> +        if (env->clic && (mode2 =3D=3D 0b000011)) {
> +            /* Non-vectored, clicintattr[i].shv =3D 0 || cliccfg.nvbits =
=3D 0
> */
> +            if (!riscv_clic_shv_interrupt(env->clic, mode, cs->cpu_index=
,
> +                                          cause)) {
> +                /* NBASE =3D mtvec[XLEN-1:6]<<6 */
> +                return tvec & ~0b111111;
> +            } else {
> +                /*
> +                 * pc :=3D M[TBASE + XLEN/8 * exccode)] & ~1,
> +                 * TBASE =3D mtvt[XLEN-1:6]<<6
> +                 */
> +                int size =3D TARGET_LONG_BITS / 8;
> +                target_ulong tbase =3D (tvt & ~0b111111) + size * cause;
> +                void *host =3D tlb_vaddr_to_host(env, tbase, MMU_DATA_LO=
AD,
> mode);
>

According to spec:
  For permissions-checking purposes, the memory access to retrieve the
  function pointer for vectoring is treated as a load with the privilege
mode
  and interrupt level of the interrupt handler. If there is an access
exception
  on the table load, xepc holds the faulting address. If this was a page
fault,
  the table load can be resumed by returning with xepc pointing to the
  table entry and the trap handler mode bit set.

So retreiving vector function pointer may raise an exception,
but tlb_vaddr_to_host() cannot reflect that.
We also need to include hardware vectoring bit: xinhv
to allow resumable traps on fetches to the trap vector table.

However, I think it's not easy to raise an exception inside of interrupt
handling routine.
It will immediately siglongjmp back to cpu_exec() and we will lose current
context :(


> +                if (host !=3D NULL) {
> +                    target_ulong new_pc =3D ldn_p(host, size);
> +                    if (tlb_vaddr_to_host(env, new_pc, MMU_INST_FETCH,
> mode)) {
> +                        return new_pc;
> +                    }
> +                }
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "CLIC: load trap handler error!\n");
> +                exit(1);
> +            }
> +        }
> +        g_assert_not_reached();
> +    }
> +}
> +#endif
> +
>  /*
>   * Handle Traps
>   *
> @@ -898,11 +977,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      CPURISCVState *env =3D &cpu->env;
>      bool force_hs_execp =3D riscv_cpu_force_hs_excep_enabled(env);
>      uint64_t s;
> +    int mode, level;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wi=
de
>       * so we mask off the MSB and separate into trap type and cause.
>       */
>      bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
> +    bool clic =3D !!(cs->exception_index & RISCV_EXCP_INT_CLIC);
>      target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
>      target_ulong deleg =3D async ? env->mideleg : env->medeleg;
>      bool write_tval =3D false;
> @@ -958,6 +1039,28 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          }
>      }
>
> +    if (clic) {
> +        mode =3D (cause >> 12) & 3;
> +        level =3D (cause >> 14) & 0xff;
> +        cause &=3D 0xfff;
> +        cause |=3D get_field(env->mstatus, MSTATUS_MPP) << 28;
> +        switch (mode) {
> +        case PRV_M:
> +            cause |=3D get_field(env->mintstatus, MINTSTATUS_MIL) << 16;
> +            cause |=3D get_field(env->mstatus, MSTATUS_MIE) << 27;
> +            env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_MI=
L,
> level);
> +            break;
> +        case PRV_S:
> +            cause |=3D get_field(env->mintstatus, MINTSTATUS_SIL) << 16;
> +            cause |=3D get_field(env->mstatus, MSTATUS_SPIE) << 27;
> +            env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_SI=
L,
> level);
> +            break;
> +        }
> +    } else {
> +        mode =3D env->priv <=3D PRV_S &&
> +            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1) ? PRV_S :
> PRV_M;
> +    }
> +
>      trace_riscv_trap(env->mhartid, async, cause, env->pc, tval,
>                       riscv_cpu_get_trap_name(cause, async));
>
> @@ -967,8 +1070,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                    __func__, env->mhartid, async, cause, env->pc, tval,
>                    riscv_cpu_get_trap_name(cause, async));
>
> -    if (env->priv <=3D PRV_S &&
> -            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> +    if (mode =3D=3D PRV_S) {
>          /* handle the trap in S-mode */
>          if (riscv_has_ext(env, RVH)) {
>              target_ulong hdeleg =3D async ? env->hideleg : env->hedeleg;
> @@ -1021,12 +1123,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          s =3D set_field(s, MSTATUS_SPP, env->priv);
>          s =3D set_field(s, MSTATUS_SIE, 0);
>          env->mstatus =3D s;
> -        env->scause =3D cause | ((target_ulong)async << (TARGET_LONG_BIT=
S -
> 1));
> +        env->scause =3D cause | ((target_ulong)(async | clic) <<
> +                               (TARGET_LONG_BITS - 1));
>          env->sepc =3D env->pc;
>          env->sbadaddr =3D tval;
>          env->htval =3D htval;
> -        env->pc =3D (env->stvec >> 2 << 2) +
> -            ((async && (env->stvec & 3) =3D=3D 1) ? cause * 4 : 0);
> +        env->pc =3D riscv_intr_pc(env, env->stvec, env->stvt, async,
> +                                clic & 0xfff, cause, PRV_S);
>

Should AND 0xfff on cause instead of clic variable.

Regards,
Frank Chang


>          riscv_cpu_set_mode(env, PRV_S);
>      } else {
>          /* handle the trap in M-mode */
> @@ -1056,8 +1159,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          env->mepc =3D env->pc;
>          env->mbadaddr =3D tval;
>          env->mtval2 =3D mtval2;
> -        env->pc =3D (env->mtvec >> 2 << 2) +
> -            ((async && (env->mtvec & 3) =3D=3D 1) ? cause * 4 : 0);
> +        env->pc =3D riscv_intr_pc(env, env->mtvec, env->mtvt, async,
> +                                clic, cause & 0xfff, PRV_M);
>          riscv_cpu_set_mode(env, PRV_M);
>      }
>
> --
> 2.25.1
>
>
>

--000000000000f85b5205c5c12d63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:54=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Decode CLIC interrupt information from exccode, includ=
es interrupt<br>
priviledge mode, interrupt level, and irq number.<br>
<br>
Then update CSRs xcause, xstatus, xepc, xintstatus and jump to<br>
correct PC according to the CLIC specification.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0target/riscv/cpu_helper.c | 117 +++++++++++++++++++++++++++++++++++--=
-<br>
=C2=A02 files changed, 111 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 494e41edc9..d8378d2384 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -557,6 +557,7 @@<br>
=C2=A0#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x16<br>
=C2=A0#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT=C2=A0 0x17<br>
<br>
+#define RISCV_EXCP_INT_CLIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x40000000<br>
=C2=A0#define RISCV_EXCP_INT_FLAG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x80000000<br>
=C2=A0#define RISCV_EXCP_INT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x7fffffff<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 21c54ef561..998d1a2742 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -26,6 +26,10 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;semihosting/common-semi.h&quot;<br>
<br>
+#if !defined(CONFIG_USER_ONLY)<br>
+#include &quot;hw/intc/riscv_clic.h&quot;<br>
+#endif<br>
+<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)<br>
=C2=A0{<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
@@ -36,6 +40,20 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)=
<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+static int riscv_cpu_local_irq_mode_enabled(CPURISCVState *env, int mode)<=
br>
+{<br>
+=C2=A0 =C2=A0 switch (mode) {<br>
+=C2=A0 =C2=A0 case PRV_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return env-&gt;priv &lt; PRV_M ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_M &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_MIE));<br>
+=C2=A0 =C2=A0 case PRV_S:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return env-&gt;priv &lt; PRV_S ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv =3D=
=3D PRV_S &amp;&amp; get_field(env-&gt;mstatus, MSTATUS_SIE));<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static int riscv_cpu_local_irq_pending(CPURISCVState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0target_ulong irqs;<br>
@@ -90,6 +108,18 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_CLIC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int mode =3D (env-&gt;exccode &gt;&gt; 12) &am=
p; 0b11;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int enabled =3D riscv_cpu_local_irq_mode_enabl=
ed(env, mode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D RISCV=
_EXCP_INT_CLIC | env-&gt;exccode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request =3D cs-=
&gt;interrupt_request &amp; ~CPU_INTERRUPT_CLIC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_do_interrupt(cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
@@ -884,6 +914,55 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
+<br>
+#if !defined(CONFIG_USER_ONLY)<br>
+static target_ulong riscv_intr_pc(CPURISCVState *env, target_ulong tvec,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong tvt, bool async,=
 bool clic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cause, int mode)<br>
+{<br>
+=C2=A0 =C2=A0 int mode1 =3D tvec &amp; 0b11, mode2 =3D tvec &amp; 0b111111=
;<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+<br>
+=C2=A0 =C2=A0 if (!(async || clic)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tvec &amp; ~0b11;<br></blockquote><div>=
<br></div><div>In CLIC mode, synchronous exception traps always jump to NBA=
SE.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 &=
gt;=3D reserved */<br>
+=C2=A0 =C2=A0 switch (mode1) {<br>
+=C2=A0 =C2=A0 case 0b00:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tvec &amp; ~0b11;<br>
+=C2=A0 =C2=A0 case 0b01:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (tvec &amp; ~0b11) + cause * 4;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;clic &amp;&amp; (mode2 =3D=3D 0b00=
0011)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Non-vectored, clicintattr[i].=
shv =3D 0 || cliccfg.nvbits =3D 0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_clic_shv_interrupt(en=
v-&gt;clic, mode, cs-&gt;cpu_index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
ause)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* NBASE =3D mtvec=
[XLEN-1:6]&lt;&lt;6 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tvec &amp; =
~0b111111;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pc :=3D M[=
TBASE + XLEN/8 * exccode)] &amp; ~1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TBASE =3D =
mtvt[XLEN-1:6]&lt;&lt;6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int size =3D TARGE=
T_LONG_BITS / 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong tbase=
 =3D (tvt &amp; ~0b111111) + size * cause;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *host =3D tlb=
_vaddr_to_host(env, tbase, MMU_DATA_LOAD, mode);<br></blockquote><div><br><=
/div><div>According to spec:</div><div>=C2=A0 For permissions-checking purp=
oses, the memory access to retrieve the</div><div>=C2=A0 function pointer f=
or vectoring is treated as a load with the privilege mode</div><div>=C2=A0 =
and interrupt level of the interrupt handler. If there is an access excepti=
on</div><div>=C2=A0 on the table load, xepc holds the faulting address. If =
this was a page fault,</div><div>=C2=A0 the table load can be resumed by re=
turning with xepc pointing to the</div><div>=C2=A0 table entry and the trap=
 handler mode bit set.</div><div><br></div><div>So retreiving vector functi=
on pointer may raise an exception,</div><div>but tlb_vaddr_to_host() cannot=
 reflect that.</div><div>We also need to include=C2=A0hardware vectoring bi=
t: xinhv</div><div>to allow resumable traps on fetches to the trap vector t=
able.</div><div><br></div><div>However, I think it&#39;s not easy to raise =
an exception inside of interrupt handling routine.<br></div><div>It will im=
mediately=C2=A0siglongjmp back to=C2=A0cpu_exec() and we will lose current =
context :(</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host !=3D NULL=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targ=
et_ulong new_pc =3D ldn_p(host, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
tlb_vaddr_to_host(env, new_pc, MMU_INST_FETCH, mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return new_pc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_=
GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CLIC: load trap handler error!\n&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+#endif<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Handle Traps<br>
=C2=A0 *<br>
@@ -898,11 +977,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0bool force_hs_execp =3D riscv_cpu_force_hs_excep_enable=
d(env);<br>
=C2=A0 =C2=A0 =C2=A0uint64_t s;<br>
+=C2=A0 =C2=A0 int mode, level;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* cs-&gt;exception is 32-bits wide unlike mcause which=
 is XLEN-bits wide<br>
=C2=A0 =C2=A0 =C2=A0 * so we mask off the MSB and separate into trap type a=
nd cause.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0bool async =3D !!(cs-&gt;exception_index &amp; RISCV_EX=
CP_INT_FLAG);<br>
+=C2=A0 =C2=A0 bool clic =3D !!(cs-&gt;exception_index &amp; RISCV_EXCP_INT=
_CLIC);<br>
=C2=A0 =C2=A0 =C2=A0target_ulong cause =3D cs-&gt;exception_index &amp; RIS=
CV_EXCP_INT_MASK;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong deleg =3D async ? env-&gt;mideleg : env-&g=
t;medeleg;<br>
=C2=A0 =C2=A0 =C2=A0bool write_tval =3D false;<br>
@@ -958,6 +1039,28 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (clic) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D (cause &gt;&gt; 12) &amp; 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 level =3D (cause &gt;&gt; 14) &amp; 0xff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &amp;=3D 0xfff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cause |=3D get_field(env-&gt;mstatus, MSTATUS_=
MPP) &lt;&lt; 28;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (mode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PRV_M:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause |=3D get_field(env-&gt;min=
tstatus, MINTSTATUS_MIL) &lt;&lt; 16;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause |=3D get_field(env-&gt;mst=
atus, MSTATUS_MIE) &lt;&lt; 27;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus, MINTSTATUS_MIL, level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PRV_S:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause |=3D get_field(env-&gt;min=
tstatus, MINTSTATUS_SIL) &lt;&lt; 16;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause |=3D get_field(env-&gt;mst=
atus, MSTATUS_SPIE) &lt;&lt; 27;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus, MINTSTATUS_SIL, level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D env-&gt;priv &lt;=3D PRV_S &amp;&amp;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &lt; TARGET_LONG_BITS &amp=
;&amp; ((deleg &gt;&gt; cause) &amp; 1) ? PRV_S : PRV_M;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0trace_riscv_trap(env-&gt;mhartid, async, cause, env-&gt=
;pc, tval,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 riscv_cpu_get_trap_name(cause, async));<br>
<br>
@@ -967,8 +1070,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func=
__, env-&gt;mhartid, async, cause, env-&gt;pc, tval,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_=
cpu_get_trap_name(cause, async));<br>
<br>
-=C2=A0 =C2=A0 if (env-&gt;priv &lt;=3D PRV_S &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &lt; TARGET_LONG_BITS &amp=
;&amp; ((deleg &gt;&gt; cause) &amp; 1)) {<br>
+=C2=A0 =C2=A0 if (mode =3D=3D PRV_S) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* handle the trap in S-mode */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong hdeleg =3D asy=
nc ? env-&gt;hideleg : env-&gt;hedeleg;<br>
@@ -1021,12 +1123,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D set_field(s, MSTATUS_SPP, env-&gt;p=
riv);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D set_field(s, MSTATUS_SIE, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D cause | ((target_ulong)asyn=
c &lt;&lt; (TARGET_LONG_BITS - 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D cause | ((target_ulong)(asy=
nc | clic) &lt;&lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(TARGET_LONG_BITS - 1));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;sepc =3D env-&gt;pc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;sbadaddr =3D tval;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;htval =3D htval;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D (env-&gt;stvec &gt;&gt; 2 &lt;&=
lt; 2) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((async &amp;&amp; (env-&gt;stve=
c &amp; 3) =3D=3D 1) ? cause * 4 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D riscv_intr_pc(env, env-&gt;stve=
c, env-&gt;stvt, async,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic &amp; 0xfff, cause, PRV_S);<br>=
</blockquote><div><br></div><div>Should AND 0xfff on cause instead of clic =
variable.</div><div><br></div><div>Regards,</div><div>Frank Chang</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_set_mode(env, PRV_S);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* handle the trap in M-mode */<br>
@@ -1056,8 +1159,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mepc =3D env-&gt;pc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mbadaddr =3D tval;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mtval2 =3D mtval2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D (env-&gt;mtvec &gt;&gt; 2 &lt;&=
lt; 2) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((async &amp;&amp; (env-&gt;mtve=
c &amp; 3) =3D=3D 1) ? cause * 4 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D riscv_intr_pc(env, env-&gt;mtve=
c, env-&gt;mtvt, async,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic, cause &amp; 0xfff, PRV_M);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_set_mode(env, PRV_M);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000f85b5205c5c12d63--

