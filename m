Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkdan-0003Id-HI
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 23:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdam-0003IJ-9F
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:16:20 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdak-0006mh-7x
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:16:19 -0400
Received: by mail-vk1-xa35.google.com with SMTP id h144so4140389vkh.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 20:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zmwg/Sb+w5t9AOKcHAsREWrH/7m2FcdrVd7pew8yaH0=;
 b=V4AepTfdtD+T4+gpFHAs9myIHN5qhSelZOKhq2LnZRRJ/Jh2A2OH1hsi/bmvmWMSYf
 YRrW47xjXjb5vOFVh9Cq6i8oLBT9BaOWgYJc3nl4vTxn8+ukuGtJnNiZSRU+U1TClkdo
 WnO+DdEumdR9Nbyb2FyWeLbCVOWOuyIL6/iFUw9RBJaBb/fB/UjikW4tInpxVHPyLBmI
 Fq4okA1z2sBVsGosjP889d0eQJuWzuMz2DLOioDa8mKDxKxHqAHapbN8btKPKxJ0mrV7
 52vbZzm3FKlk2xapl1WdoIjLetV/SkM/gfh1iW1NO2bx6R0SB24bt48AWKGtf/vkkrBb
 G+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zmwg/Sb+w5t9AOKcHAsREWrH/7m2FcdrVd7pew8yaH0=;
 b=RCgkYa48DlPRrgjdFHhxGDPw/OQuenZg4hf+8nEKjKG3VodA+1/Zknw4u5DBPJnbCB
 cMiyB2jDmEDyyeFhacEnUKSzn7k9apmevqBU81oAMw7XojgbDaqttH9YspGi6Kp0MMm2
 g8s/Bm5q3WMH9tRNjxJmOKgFV8ELQ7w0ndOu6XzlyCM72MDNdWJpWGyq+4SQbLxGW1hy
 y6nKcDzAtkywc/5lGxrNg5N4yBph2+258KO0s4Cy3OPKXSegrcGGSGAS22+rOytVV7ju
 Lp7wGLejxziuLqzujhV4iyID/lFiIEzexpoG+GD9wq7ayLyZkDQjCslxzZdWhu7gcNZu
 Rtkw==
X-Gm-Message-State: AOAM531J2jJgyesfJOAi48ZFofR7YD+ZOoZBkRjG0CwOxHo58q+nqymi
 UJC7coSwuauNykFxCru2NJwio9ptjhwcF3HZNW4=
X-Google-Smtp-Source: ABdhPJxnSxDnflow3LAsVVhyIfy9SSII7bkquqDMnoS+XEcuOskqnYjWa9+3BWPidKTACuBFfTLZmQ==
X-Received: by 2002:a1f:6a05:0:b0:33f:d8a6:f6f3 with SMTP id
 f5-20020a1f6a05000000b0033fd8a6f6f3mr713557vkc.4.1651288576960; 
 Fri, 29 Apr 2022 20:16:16 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51]) by smtp.gmail.com with ESMTPSA id
 i23-20020a67c217000000b0032d275e690asm145494vsj.10.2022.04.29.20.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 20:16:16 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id g22so3542232uam.12;
 Fri, 29 Apr 2022 20:16:16 -0700 (PDT)
X-Received: by 2002:ab0:6dda:0:b0:362:7ed4:e3ce with SMTP id
 r26-20020ab06dda000000b003627ed4e3cemr668897uaf.16.1651288575828; Fri, 29 Apr
 2022 20:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-4-apatel@ventanamicro.com>
In-Reply-To: <20220429033409.258707-4-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 11:16:04 +0800
X-Gmail-Original-Message-ID: <CANzO1D3Ojz62=coXgWwq9SvdTXRgg-B1BUbWAVocpefhecDhJQ@mail.gmail.com>
Message-ID: <CANzO1D3Ojz62=coXgWwq9SvdTXRgg-B1BUbWAVocpefhecDhJQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Set [m|s]tval for both illegal and
 virtual instruction traps
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="000000000000fbe7b605ddd694de"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=frank.chang@sifive.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 30 Apr 2022 03:16:20 -0000

--000000000000fbe7b605ddd694de
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Apr 29, 2022 at 11:36 AM Anup Patel <apatel@ventanamicro.com> wrote:

> Currently, the [m|s]tval CSRs are set with trapping instruction encoding
> only for illegal instruction traps taken at the time of instruction
> decoding.
>
> In RISC-V world, a valid instructions might also trap as illegal or
> virtual instruction based to trapping bits in various CSRs (such as
> mstatus.TVM or hstatus.VTVM).
>
> We improve setting of [m|s]tval CSRs for all types of illegal and
> virtual instruction traps.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  8 +++++++-
>  target/riscv/cpu_helper.c |  1 +
>  target/riscv/translate.c  | 17 +++++++++++++----
>  4 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dff4606585..f0a702fee6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -406,6 +406,7 @@ void restore_state_to_opc(CPURISCVState *env,
> TranslationBlock *tb,
>      } else {
>          env->pc = data[0];
>      }
> +    env->bins = data[1];
>  }
>
>  static void riscv_cpu_reset(DeviceState *dev)
> @@ -445,6 +446,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mcause = 0;
>      env->miclaim = MIP_SGEIP;
>      env->pc = env->resetvec;
> +    env->bins = 0;
>      env->two_stage_lookup = false;
>
>      /* Initialized default priorities of local interrupts. */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe6c9a2c92..a55c918274 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -30,6 +30,12 @@
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> +/*
> + * RISC-V-specific extra insn start words:
> + * 1: Original instruction opcode
> + */
> +#define TARGET_INSN_START_EXTRA_WORDS 1
> +
>  #define TYPE_RISCV_CPU "riscv-cpu"
>
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
> @@ -140,7 +146,7 @@ struct CPUArchState {
>      target_ulong frm;
>
>      target_ulong badaddr;
> -    uint32_t bins;
> +    target_ulong bins;
>
>      target_ulong guest_phys_fault_addr;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d83579accf..bba4fce777 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1371,6 +1371,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              tval = env->badaddr;
>              break;
>          case RISCV_EXCP_ILLEGAL_INST:
> +        case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
>          default:
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0cd1d9ee94..55a4713af2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -107,6 +107,8 @@ typedef struct DisasContext {
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> +    /* TCG of the current insn_start */
> +    TCGOp *insn_start;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -236,9 +238,6 @@ static void generate_exception_mtval(DisasContext
> *ctx, int excp)
>
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> -    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> -                   offsetof(CPURISCVState, bins));
> -
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>  }
>
> @@ -1017,6 +1016,13 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> +static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
> +{
> +    assert(ctx->insn_start != NULL);
> +    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
> +    ctx->insn_start = NULL;
> +}
> +
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t
> opcode)
>  {
>      /*
> @@ -1033,6 +1039,7 @@ static void decode_opc(CPURISCVState *env,
> DisasContext *ctx, uint16_t opcode)
>
>      /* Check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
> +        decode_save_opc(ctx, opcode);
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
> @@ -1047,6 +1054,7 @@ static void decode_opc(CPURISCVState *env,
> DisasContext *ctx, uint16_t opcode)
>          opcode32 = deposit32(opcode32, 16, 16,
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
> +        decode_save_opc(ctx, opcode32);
>          ctx->opcode = opcode32;
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
>
> @@ -1113,7 +1121,8 @@ static void riscv_tr_insn_start(DisasContextBase
> *dcbase, CPUState *cpu)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
> -    tcg_gen_insn_start(ctx->base.pc_next);
> +    tcg_gen_insn_start(ctx->base.pc_next, 0);
> +    ctx->insn_start = tcg_last_op();
>  }
>
>  static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState
> *cpu)
> --
> 2.34.1
>
>
>

--000000000000fbe7b605ddd694de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"m=
ailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29,=
 2022 at 11:36 AM Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com"=
>apatel@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Currently, the [m|s]tval CSRs are set with trapping=
 instruction encoding<br>
only for illegal instruction traps taken at the time of instruction<br>
decoding.<br>
<br>
In RISC-V world, a valid instructions might also trap as illegal or<br>
virtual instruction based to trapping bits in various CSRs (such as<br>
mstatus.TVM or hstatus.VTVM).<br>
<br>
We improve setting of [m|s]tval CSRs for all types of illegal and<br>
virtual instruction traps.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++-<br>
=C2=A0target/riscv/cpu_helper.c |=C2=A0 1 +<br>
=C2=A0target/riscv/translate.c=C2=A0 | 17 +++++++++++++----<br>
=C2=A04 files changed, 23 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index dff4606585..f0a702fee6 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -406,6 +406,7 @@ void restore_state_to_opc(CPURISCVState *env, Translati=
onBlock *tb,<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc =3D data[0];<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 env-&gt;bins =3D data[1];<br>
=C2=A0}<br>
<br>
=C2=A0static void riscv_cpu_reset(DeviceState *dev)<br>
@@ -445,6 +446,7 @@ static void riscv_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mcause =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;miclaim =3D MIP_SGEIP;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;pc =3D env-&gt;resetvec;<br>
+=C2=A0 =C2=A0 env-&gt;bins =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;two_stage_lookup =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Initialized default priorities of local interrupts. =
*/<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index fe6c9a2c92..a55c918274 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -30,6 +30,12 @@<br>
<br>
=C2=A0#define TCG_GUEST_DEFAULT_MO 0<br>
<br>
+/*<br>
+ * RISC-V-specific extra insn start words:<br>
+ * 1: Original instruction opcode<br>
+ */<br>
+#define TARGET_INSN_START_EXTRA_WORDS 1<br>
+<br>
=C2=A0#define TYPE_RISCV_CPU &quot;riscv-cpu&quot;<br>
<br>
=C2=A0#define RISCV_CPU_TYPE_SUFFIX &quot;-&quot; TYPE_RISCV_CPU<br>
@@ -140,7 +146,7 @@ struct CPUArchState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong frm;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong badaddr;<br>
-=C2=A0 =C2=A0 uint32_t bins;<br>
+=C2=A0 =C2=A0 target_ulong bins;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong guest_phys_fault_addr;<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index d83579accf..bba4fce777 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -1371,6 +1371,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tval =3D env-&gt;badaddr;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case RISCV_EXCP_ILLEGAL_INST:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tval =3D env-&gt;bins;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 0cd1d9ee94..55a4713af2 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -107,6 +107,8 @@ typedef struct DisasContext {<br>
=C2=A0 =C2=A0 =C2=A0/* PointerMasking extension */<br>
=C2=A0 =C2=A0 =C2=A0bool pm_mask_enabled;<br>
=C2=A0 =C2=A0 =C2=A0bool pm_base_enabled;<br>
+=C2=A0 =C2=A0 /* TCG of the current insn_start */<br>
+=C2=A0 =C2=A0 TCGOp *insn_start;<br>
=C2=A0} DisasContext;<br>
<br>
=C2=A0static inline bool has_ext(DisasContext *ctx, uint32_t ext)<br>
@@ -236,9 +238,6 @@ static void generate_exception_mtval(DisasContext *ctx,=
 int excp)<br>
<br>
=C2=A0static void gen_exception_illegal(DisasContext *ctx)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 tcg_gen_st_i32(tcg_constant_i32(ctx-&gt;opcode), cpu_env,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offse=
tof(CPURISCVState, bins));<br>
-<br>
=C2=A0 =C2=A0 =C2=A0generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);<br>
=C2=A0}<br>
<br>
@@ -1017,6 +1016,13 @@ static uint32_t opcode_at(DisasContextBase *dcbase, =
target_ulong pc)<br>
=C2=A0/* Include decoders for factored-out extensions */<br>
=C2=A0#include &quot;decode-XVentanaCondOps.c.inc&quot;<br>
<br>
+static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)<br=
>
+{<br>
+=C2=A0 =C2=A0 assert(ctx-&gt;insn_start !=3D NULL);<br>
+=C2=A0 =C2=A0 tcg_set_insn_start_param(ctx-&gt;insn_start, 1, opc);<br>
+=C2=A0 =C2=A0 ctx-&gt;insn_start =3D NULL;<br>
+}<br>
+<br>
=C2=A0static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_=
t opcode)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -1033,6 +1039,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Check for compressed insn */<br>
=C2=A0 =C2=A0 =C2=A0if (extract16(opcode, 0, 2) !=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_save_opc(ctx, opcode);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!has_ext(ctx, RVC)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exception_illegal(ctx);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -1047,6 +1054,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opcode32 =3D deposit32(opcode32, 16, 16,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 translator_lduw(env, &amp;ctx-&gt;base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ctx-&gt;base.pc_next + 2));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 decode_save_opc(ctx, opcode32);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;opcode =3D opcode32;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;pc_succ_insn =3D ctx-&gt;base.pc_=
next + 4;<br>
<br>
@@ -1113,7 +1121,8 @@ static void riscv_tr_insn_start(DisasContextBase *dcb=
ase, CPUState *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DisasContext *ctx =3D container_of(dcbase, DisasContext=
, base);<br>
<br>
-=C2=A0 =C2=A0 tcg_gen_insn_start(ctx-&gt;base.pc_next);<br>
+=C2=A0 =C2=A0 tcg_gen_insn_start(ctx-&gt;base.pc_next, 0);<br>
+=C2=A0 =C2=A0 ctx-&gt;insn_start =3D tcg_last_op();<br>
=C2=A0}<br>
<br>
=C2=A0static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUStat=
e *cpu)<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000fbe7b605ddd694de--

