Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n81Cg-0004GA-4q
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 09:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n81Ce-0004Ex-4A
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 09:35:48 -0500
Received: from [2607:f8b0:4864:20::535] (port=38453
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n81Cb-0007dy-53
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 09:35:47 -0500
Received: by mail-pg1-x535.google.com with SMTP id s1so32692pga.5
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmyKLtjGGNv7SzBHh8e8AVz0ZpjPfSG1UfuavD2QARU=;
 b=T+q9zMMMd+dSHvqQhWPfnI9CTZPg3cs76DFmhi8JUpWvcgfrFMp+WhzLZkLnhBV/SD
 GZbe39CnDASx4vRufcrWA970/TVnJAvMncg7iohcX2F8A6MPspafgbRlbZXrOXFnkjGK
 vuc0czG2XXmbQCczSWUQKeEXGuSpsbYyBWTUEmiXg4dBqJJrtLvRuPQd1mvW2oWCDrGK
 lIw2XTNppOb5k57FQJjyW7Z68gg858WbY3e9j/L3oRNrFn0Hof7v9SxVQVqYBQBKYohc
 YPd4k1gUDJURrMc2H7+R6u/pdc9ooyOualOmGAaDwwj8QOoKIDW1eyzrDWzyKfpTHLXj
 FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmyKLtjGGNv7SzBHh8e8AVz0ZpjPfSG1UfuavD2QARU=;
 b=marYGmyoMEw1agkdB31ZvfMmSFjaZccwx5TWjPj01B+h73wtYa6gHzLQwuP4hNrh9J
 oFU+E6uzIBUQbNdYk1ogfGqZMEFTSwFVPy1Khh66Kc3Kd4+f+c6r0Yx7Q35azihZ9IQd
 WshPHibDBxrRY2pU+SzkxEfZHWW4KA5DJXCiHyWQD/F5vwVQ7scDlPJg2JkF5LTNVqcm
 7/FTsdX7m2f5pOvRtBR+qaYWAPxqZyA8Tm+cJDntLMGkc0qfKkNJ+v+ZDeWxs+BP/z7M
 B2ixAZ1vJqx0zSsCh6xMMyJSXzAqNgTYCA6WJZPjwwOmtWAoyVaoAOrGfLFA+3Zn9lxz
 /urA==
X-Gm-Message-State: AOAM532aDAet1DiZvD6/1r2hLXf/VHYrQeybvG4SYRU3XnQmiQPrYlaz
 5gj8mgXNPHo+gWzD1MrWdbW1BOA12k9zyoNQ
X-Google-Smtp-Source: ABdhPJz5urDDkwU/SYAgJlijEiz1swmGLk2A/CNIsLVbim9dKX9my9FOdY5wvs2d/W9K2g1I7mNvZw==
X-Received: by 2002:aa7:93ba:0:b0:4bd:bbca:1936 with SMTP id
 x26-20020aa793ba000000b004bdbbca1936mr4466632pff.43.1642084542777; 
 Thu, 13 Jan 2022 06:35:42 -0800 (PST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169])
 by smtp.gmail.com with ESMTPSA id lp6sm10818291pjb.55.2022.01.13.06.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 06:35:41 -0800 (PST)
Received: by mail-pg1-f169.google.com with SMTP id e2so32900pgc.6;
 Thu, 13 Jan 2022 06:35:41 -0800 (PST)
X-Received: by 2002:a05:6a00:88f:b0:4bc:3b4e:255a with SMTP id
 q15-20020a056a00088f00b004bc3b4e255amr4434738pfj.79.1642084540876; Thu, 13
 Jan 2022 06:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-3-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-3-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 22:35:29 +0800
X-Gmail-Original-Message-ID: <CANzO1D053w7XnqQ8wFQs_vmSJtCZuWe6S8uwLApe0rxtrvKqtA@mail.gmail.com>
Message-ID: <CANzO1D053w7XnqQ8wFQs_vmSJtCZuWe6S8uwLApe0rxtrvKqtA@mail.gmail.com>
Subject: Re: [PATCH v6 02/23] target/riscv: Implement SGEIP bit in hip and hie
 CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c00bf905d57799fe"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Thu, 13 Jan 2022 14:35:48 -0000

--000000000000c00bf905d57799fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> A hypervisor can optionally take guest external interrupts using
> SGEIP bit of hip and hie CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c      |  3 ++-
>  target/riscv/cpu_bits.h |  3 +++
>  target/riscv/csr.c      | 18 +++++++++++-------
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..7d92ce7555 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -372,6 +372,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>          env->mstatus =3D set_field(env->mstatus, MSTATUS64_UXL,
> env->misa_mxl);
>      }
>      env->mcause =3D 0;
> +    env->miclaim =3D MIP_SGEIP;
>      env->pc =3D env->resetvec;
>      env->two_stage_lookup =3D false;
>      /* mmte is supposed to have pm.current hardwired to 1 */
> @@ -610,7 +611,7 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>
>  #ifndef CONFIG_USER_ONLY
> -    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
> +    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1e31f4d35f..fe276d4b34 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -534,6 +534,8 @@ typedef enum RISCVException {
>  #define IRQ_S_EXT                          9
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
> +#define IRQ_S_GEXT                         12
> +#define IRQ_LOCAL_MAX                      16
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> @@ -548,6 +550,7 @@ typedef enum RISCVException {
>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
> +#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
>
>  /* sip masks */
>  #define SIP_SSIP                           MIP_SSIP
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd7110c38b..a4028f28e0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -446,12 +446,13 @@ static RISCVException read_timeh(CPURISCVState *env=
,
> int csrno,
>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
>  #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
>  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
>
>  static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
>  static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;
>  static const target_ulong all_ints =3D M_MODE_INTERRUPTS |
> S_MODE_INTERRUPTS |
> -                                     VS_MODE_INTERRUPTS;
> +                                     HS_MODE_INTERRUPTS;
>  #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
>                           (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
>                           (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
> @@ -712,7 +713,7 @@ static RISCVException write_mideleg(CPURISCVState
> *env, int csrno,
>  {
>      env->mideleg =3D (env->mideleg & ~delegable_ints) | (val &
> delegable_ints);
>      if (riscv_has_ext(env, RVH)) {
> -        env->mideleg |=3D VS_MODE_INTERRUPTS;
> +        env->mideleg |=3D HS_MODE_INTERRUPTS;
>      }
>      return RISCV_EXCP_NONE;
>  }
> @@ -728,6 +729,9 @@ static RISCVException write_mie(CPURISCVState *env,
> int csrno,
>                                  target_ulong val)
>  {
>      env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
> +    if (!riscv_has_ext(env, RVH)) {
> +        env->mie &=3D ~MIP_SGEIP;
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -1023,7 +1027,7 @@ static RISCVException rmw_sip(CPURISCVState *env,
> int csrno,
>      }
>
>      if (ret_value) {
> -        *ret_value &=3D env->mideleg;
> +        *ret_value &=3D env->mideleg & S_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1141,7 +1145,7 @@ static RISCVException rmw_hvip(CPURISCVState *env,
> int csrno,
>                        write_mask & hvip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &=3D hvip_writable_mask;
> +        *ret_value &=3D VS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1154,7 +1158,7 @@ static RISCVException rmw_hip(CPURISCVState *env,
> int csrno,
>                        write_mask & hip_writable_mask);
>
>      if (ret_value) {
> -        *ret_value &=3D hip_writable_mask;
> +        *ret_value &=3D HS_MODE_INTERRUPTS;
>      }
>      return ret;
>  }
> @@ -1162,14 +1166,14 @@ static RISCVException rmw_hip(CPURISCVState *env,
> int csrno,
>  static RISCVException read_hie(CPURISCVState *env, int csrno,
>                                 target_ulong *val)
>  {
> -    *val =3D env->mie & VS_MODE_INTERRUPTS;
> +    *val =3D env->mie & HS_MODE_INTERRUPTS;
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException write_hie(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
> -    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) | (val &
> VS_MODE_INTERRUPTS);
> +    target_ulong newval =3D (env->mie & ~HS_MODE_INTERRUPTS) | (val &
> HS_MODE_INTERRUPTS);
>      return write_mie(env, CSR_MIE, newval);
>  }
>
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000c00bf905d57799fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
A hypervisor can optionally take guest external interrupts using<br>
SGEIP bit of hip and hie CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 3 +++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++-------<br>
=C2=A03 files changed, 16 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 6ef3314bce..7d92ce7555 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -372,6 +372,7 @@ static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D set_field(env-&gt;mst=
atus, MSTATUS64_UXL, env-&gt;misa_mxl);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mcause =3D 0;<br>
+=C2=A0 =C2=A0 env-&gt;miclaim =3D MIP_SGEIP;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;pc =3D env-&gt;resetvec;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;two_stage_lookup =3D false;<br>
=C2=A0 =C2=A0 =C2=A0/* mmte is supposed to have pm.current hardwired to 1 *=
/<br>
@@ -610,7 +611,7 @@ static void riscv_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0cpu_set_cpustate_pointers(cpu);<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_=
MAX);<br>
=C2=A0#endif /* CONFIG_USER_ONLY */<br>
=C2=A0}<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 1e31f4d35f..fe276d4b34 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -534,6 +534,8 @@ typedef enum RISCVException {<br>
=C2=A0#define IRQ_S_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
=C2=A0#define IRQ_VS_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
=C2=A0#define IRQ_M_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
+#define IRQ_S_GEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
+#define IRQ_LOCAL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
<br>
=C2=A0/* mip masks */<br>
=C2=A0#define MIP_USIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SOFT)<br>
@@ -548,6 +550,7 @@ typedef enum RISCVException {<br>
=C2=A0#define MIP_SEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_EXT)<br>
=C2=A0#define MIP_VSEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_VS_EXT)<br>
=C2=A0#define MIP_MEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_M_EXT)<br>
+#define MIP_SGEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_S_GEXT)<br>
<br>
=C2=A0/* sip masks */<br>
=C2=A0#define SIP_SSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SSIP<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index fd7110c38b..a4028f28e0 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -446,12 +446,13 @@ static RISCVException read_timeh(CPURISCVState *env, =
int csrno,<br>
=C2=A0#define M_MODE_INTERRUPTS=C2=A0 (MIP_MSIP | MIP_MTIP | MIP_MEIP)<br>
=C2=A0#define S_MODE_INTERRUPTS=C2=A0 (MIP_SSIP | MIP_STIP | MIP_SEIP)<br>
=C2=A0#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)<br>
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)<br>
<br>
=C2=A0static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VS_MODE_INTERRUPTS;<br>
=C2=A0static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;<b=
r>
=C2=A0static const target_ulong all_ints =3D M_MODE_INTERRUPTS | S_MODE_INT=
ERRUPTS |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VS_MODE_INTERRUP=
TS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HS_MODE_INTERRUP=
TS;<br>
=C2=A0#define DELEGABLE_EXCPS ((1ULL &lt;&lt; (RISCV_EXCP_INST_ADDR_MIS)) |=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1ULL &lt;&lt; (RISCV_EXCP_INST_ACCESS_FAULT)) | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1ULL &lt;&lt; (RISCV_EXCP_ILLEGAL_INST)) | \<br>
@@ -712,7 +713,7 @@ static RISCVException write_mideleg(CPURISCVState *env,=
 int csrno,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mideleg =3D (env-&gt;mideleg &amp; ~delegable_i=
nts) | (val &amp; delegable_ints);<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_has_ext(env, RVH)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mideleg |=3D VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mideleg |=3D HS_MODE_INTERRUPTS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
@@ -728,6 +729,9 @@ static RISCVException write_mie(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mie =3D (env-&gt;mie &amp; ~all_ints) | (val &a=
mp; all_ints);<br>
+=C2=A0 =C2=A0 if (!riscv_has_ext(env, RVH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mie &amp;=3D ~MIP_SGEIP;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
@@ -1023,7 +1027,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D env-&gt;mideleg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D env-&gt;mideleg &amp; S_MO=
DE_INTERRUPTS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -1141,7 +1145,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, in=
t csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; hvip_writable_mask);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D hvip_writable_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D VS_MODE_INTERRUPTS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -1154,7 +1158,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mask &amp; hip_writable_mask);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ret_value) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D hip_writable_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value &amp;=3D HS_MODE_INTERRUPTS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
@@ -1162,14 +1166,14 @@ static RISCVException rmw_hip(CPURISCVState *env, i=
nt csrno,<br>
=C2=A0static RISCVException read_hie(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; VS_MODE_INTERRUPTS;<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; HS_MODE_INTERRUPTS;<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
=C2=A0static RISCVException write_hie(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~VS_MODE_INTERRUP=
TS) | (val &amp; VS_MODE_INTERRUPTS);<br>
+=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mie &amp; ~HS_MODE_INTERRUP=
TS) | (val &amp; HS_MODE_INTERRUPTS);<br>
=C2=A0 =C2=A0 =C2=A0return write_mie(env, CSR_MIE, newval);<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000c00bf905d57799fe--

