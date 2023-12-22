Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6248C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 18:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGjoM-0001rw-JY; Fri, 22 Dec 2023 12:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGjoK-0001rF-VV; Fri, 22 Dec 2023 12:59:48 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGjoI-0003ym-Qg; Fri, 22 Dec 2023 12:59:48 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5534abbc637so2437429a12.0; 
 Fri, 22 Dec 2023 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703267984; x=1703872784; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fuCCWVhXmj2sIWYpiCSNq9+FtlzlxfkUKB1bIHeKqTw=;
 b=VYGig9+om2abcX4B6XzVjgfyDnb9bY/Qyrl+zJzWML6NQBeRMTnhX+CWq/UymGBcm8
 GhaPU9iOqHGEmTys9+pB72Cm4+m6VJorcZ43RMPGemWXOTh7fIOCsdOkamEfjnNZ1rvI
 /MRXeNyzGg2K2b07y6/VHepPILVYEdXYxvMPI5K6wB/a5ZA1VvNQct6AOPuBwA4rp6py
 Xjk+ji3HT5UANFh09iXb4k+5rM3kNVBclcNRuz0YbTlbn8caTIJKzHSNh7jG5GgwW7e2
 9hncSSPn0AbRdVV12AAJabo+aNBYcx70N3KLH43gbVF5Dw1KFPXsFru2qGOWy1m4OSJ7
 qBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703267984; x=1703872784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fuCCWVhXmj2sIWYpiCSNq9+FtlzlxfkUKB1bIHeKqTw=;
 b=pIpDtWSvWU8LFq3gBeBOhV111q/ljiq5zmaJFPVPAP2I9m4et44TGMZJ9kObweLeJ1
 6ttdtX20Wo5FJDE0NYt60pn+ZK2J+FWR8m3ombBwuroz3+43fl9aIQvYjwSjk8dktzxf
 +k+vnIeM0MvChOk4FG1U4Zj6iQEEl9pkkZZkyG81ce2HR0i9tIcCX/sH8xrzM9e0Y3A6
 68SUYWxMNbiZfu+doVUJIyLNptB+v7fR3yq3VYDU8xgbdaP0oPfaNsV2rO1u8No0UBdX
 TyNklzGnr6wv697UyNvagR49FxlqATfV9ZTCW4TGJjuH4K6wpR3oYezVbupTscHemGQj
 UWTQ==
X-Gm-Message-State: AOJu0YzDg/mxY5OkHRQyRcpCcEevxIMizYvxCdWvxCnUmyVoyIzqMZ35
 EpI9kvHw0cGIFgb8VdN5Z/gS9oXU+Zhr6vRN97c=
X-Google-Smtp-Source: AGHT+IFUgffiACLooRpVx5gYfW4M4RvQ4DHHr+z9UvywWxpVX4jr1g3qsHe3j9PiWSsiZHE2RAiT9+IsNuUD2xgNJuI=
X-Received: by 2002:a50:cd41:0:b0:54c:b88a:7a69 with SMTP id
 d1-20020a50cd41000000b0054cb88a7a69mr848170edj.73.1703267983470; Fri, 22 Dec
 2023 09:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20231221104035.1287244-1-me@deliversmonkey.space>
 <20231221104035.1287244-4-me@deliversmonkey.space>
 <6da02b36-d82f-49ae-ae85-4642486dabe7@linaro.org>
In-Reply-To: <6da02b36-d82f-49ae-ae85-4642486dabe7@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 22 Dec 2023 20:59:32 +0300
Message-ID: <CAFukJ-DNx0EMpG18vtA2-2DSdROp8nOOOOK_q-EOpu_=Gjp+OA@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/riscv: Add pointer masking tb flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001cb3ad060d1cfb9b"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000001cb3ad060d1cfb9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the suggestion.
If it's ok to consume another bit(3 bits total) for Pointer Masking flags,
I'll do it.
>so that the translator can see the true width of the address
I guess I'll need a helper to calculate the exact number of bits to
shift(0, 7 or 16) based on those 2 extracted bits. Is it ok with you?

Thanks

=D0=BF=D1=82, 22 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 01:49, Ric=
hard Henderson <richard.henderson@linaro.org
>:

> On 12/21/23 21:40, Alexey Baturo wrote:
> > From: Alexey Baturo <baturo.alexey@gmail.com>
> >
> > Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> > ---
> >   target/riscv/cpu.h        | 19 +++++++++++++------
> >   target/riscv/cpu_helper.c |  4 ++++
> >   target/riscv/translate.c  | 10 ++++++++++
> >   3 files changed, 27 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f49d4aa52c..2099168950 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -390,6 +390,10 @@ struct CPUArchState {
> >       target_ulong senvcfg;
> >       uint64_t henvcfg;
> >   #endif
> > +    /* current number of masked top bits by pointer masking */
> > +    target_ulong pm_pmlen;
> > +    /* if pointer masking should do sign extension */
> > +    bool pm_signext;
> >
> >       /* Fields from here on are preserved across CPU reset. */
> >       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> > @@ -538,14 +542,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
> >   FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
> >   /* The combination of MXL/SXL/UXL that applies to the current cpu
> mode. */
> >   FIELD(TB_FLAGS, XL, 16, 2)
> > -FIELD(TB_FLAGS, VTA, 18, 1)
> > -FIELD(TB_FLAGS, VMA, 19, 1)
> > +/* If pointer masking should be applied and address sign extended */
> > +FIELD(TB_FLAGS, PM_ENABLED, 18, 1)
>
> I think it would be better add the entire two bit field here, so that the
> translator can
> see the true width of the address.  You can then use tcg_gen_{s}extract_t=
l
> to perform the
> truncation.  At which point the 'target_ulong pm_pmlen' is not required.
>
>
> r~
>
> > +FIELD(TB_FLAGS, PM_SIGNEXTEND, 19, 1)
> > +FIELD(TB_FLAGS, VTA, 20, 1)
> > +FIELD(TB_FLAGS, VMA, 21, 1)
> >   /* Native debug itrigger */
> > -FIELD(TB_FLAGS, ITRIGGER, 20, 1)
> > +FIELD(TB_FLAGS, ITRIGGER, 22, 1)
> >   /* Virtual mode enabled */
> > -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> > -FIELD(TB_FLAGS, PRIV, 22, 2)
> > -FIELD(TB_FLAGS, AXL, 24, 2)
> > +FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> > +FIELD(TB_FLAGS, PRIV, 24, 2)
> > +FIELD(TB_FLAGS, AXL, 25, 2)
> >
> >   #ifdef TARGET_RISCV32
> >   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index a3d477d226..79cddbd930 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -135,6 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vadd=
r
> *pc,
> >       flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
> >       flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> >       flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> > +    if (env->pm_pmlen !=3D 0) {
> > +        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, 1);
> > +    }
> > +    flags =3D FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, env->pm_signe=
xt);
> >
> >       *pflags =3D flags;
> >   }
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 6b4b9a671c..4c0d526b58 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -42,6 +42,8 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl=
,
> cpu_vstart;
> >   static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
> >   static TCGv load_res;
> >   static TCGv load_val;
> > +/* number of top masked address bits by pointer masking extension */
> > +static TCGv pm_pmlen;
> >
> >   /*
> >    * If an operation is being performed on less than TARGET_LONG_BITS,
> > @@ -103,6 +105,9 @@ typedef struct DisasContext {
> >       bool vl_eq_vlmax;
> >       CPUState *cs;
> >       TCGv zero;
> > +    /* pointer masking extension */
> > +    bool pm_enabled;
> > +    bool pm_signext;
> >       /* Use icount trigger for native debug */
> >       bool itrigger;
> >       /* FRM is known to contain a valid value. */
> > @@ -1176,6 +1181,8 @@ static void
> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >       ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
> >       ctx->address_xl =3D FIELD_EX32(tb_flags, TB_FLAGS, AXL);
> >       ctx->cs =3D cs;
> > +    ctx->pm_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> > +    ctx->pm_signext =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
> >       ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> >       ctx->zero =3D tcg_constant_tl(0);
> >       ctx->virt_inst_excp =3D false;
> > @@ -1307,4 +1314,7 @@ void riscv_translate_init(void)
> >                                "load_res");
> >       load_val =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState,
> load_val),
> >                                "load_val");
> > +    /* Assign var with number of pointer masking masked bits to tcg
> global */
> > +    pm_pmlen =3D tcg_global_mem_new(tcg_env, offsetof(CPURISCVState,
> pm_pmlen),
> > +                                   "pmlen");
> >   }
>
>

--0000000000001cb3ad060d1cfb9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>Thanks for the suggestion.<=
/div><div>If it&#39;s ok to consume another bit(3 bits total) for Pointer M=
asking flags, I&#39;ll do it.</div><div>&gt;so that the translator can see =
the true width of the address</div><div>I guess I&#39;ll need a helper to c=
alculate the exact number of bits to shift(0, 7 or 16) based on those 2 ext=
racted bits. Is it ok with you?</div><div><br></div><div>Thanks</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=
=D1=82, 22 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 01:49, Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 12/21/23 21:40, Alexey Baturo wrote:<br>
&gt; From: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" tar=
get=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail=
.com" target=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++=
++++++------<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_helper.c |=C2=A0 4 ++++<br>
&gt;=C2=A0 =C2=A0target/riscv/translate.c=C2=A0 | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 27 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index f49d4aa52c..2099168950 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -390,6 +390,10 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong senvcfg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t henvcfg;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; +=C2=A0 =C2=A0 /* current number of masked top bits by pointer masking=
 */<br>
&gt; +=C2=A0 =C2=A0 target_ulong pm_pmlen;<br>
&gt; +=C2=A0 =C2=A0 /* if pointer masking should do sign extension */<br>
&gt; +=C2=A0 =C2=A0 bool pm_signext;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fields from here on are preserved across =
CPU reset. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUTimer *stimer; /* Internal timer for S-m=
ode interrupt */<br>
&gt; @@ -538,14 +542,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)<br>
&gt;=C2=A0 =C2=A0FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)<br>
&gt;=C2=A0 =C2=A0/* The combination of MXL/SXL/UXL that applies to the curr=
ent cpu mode. */<br>
&gt;=C2=A0 =C2=A0FIELD(TB_FLAGS, XL, 16, 2)<br>
&gt; -FIELD(TB_FLAGS, VTA, 18, 1)<br>
&gt; -FIELD(TB_FLAGS, VMA, 19, 1)<br>
&gt; +/* If pointer masking should be applied and address sign extended */<=
br>
&gt; +FIELD(TB_FLAGS, PM_ENABLED, 18, 1)<br>
<br>
I think it would be better add the entire two bit field here, so that the t=
ranslator can <br>
see the true width of the address.=C2=A0 You can then use tcg_gen_{s}extrac=
t_tl to perform the <br>
truncation.=C2=A0 At which point the &#39;target_ulong pm_pmlen&#39; is not=
 required.<br>
<br>
<br>
r~<br>
<br>
&gt; +FIELD(TB_FLAGS, PM_SIGNEXTEND, 19, 1)<br>
&gt; +FIELD(TB_FLAGS, VTA, 20, 1)<br>
&gt; +FIELD(TB_FLAGS, VMA, 21, 1)<br>
&gt;=C2=A0 =C2=A0/* Native debug itrigger */<br>
&gt; -FIELD(TB_FLAGS, ITRIGGER, 20, 1)<br>
&gt; +FIELD(TB_FLAGS, ITRIGGER, 22, 1)<br>
&gt;=C2=A0 =C2=A0/* Virtual mode enabled */<br>
&gt; -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)<br>
&gt; -FIELD(TB_FLAGS, PRIV, 22, 2)<br>
&gt; -FIELD(TB_FLAGS, AXL, 24, 2)<br>
&gt; +FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)<br>
&gt; +FIELD(TB_FLAGS, PRIV, 24, 2)<br>
&gt; +FIELD(TB_FLAGS, AXL, 25, 2)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#ifdef TARGET_RISCV32<br>
&gt;=C2=A0 =C2=A0#define riscv_cpu_mxl(env)=C2=A0 ((void)(env), MXL_RV32)<b=
r>
&gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
&gt; index a3d477d226..79cddbd930 100644<br>
&gt; --- a/target/riscv/cpu_helper.c<br>
&gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; @@ -135,6 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vad=
dr *pc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D FIELD_DP32(flags, TB_FLAGS, XL, en=
v-&gt;xl);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, c=
pu_address_xl(env));<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;pm_pmlen !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, PM_=
ENABLED, 1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, en=
v-&gt;pm_signext);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*pflags =3D flags;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index 6b4b9a671c..4c0d526b58 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -42,6 +42,8 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_v=
l, cpu_vstart;<br>
&gt;=C2=A0 =C2=A0static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions =
*/<br>
&gt;=C2=A0 =C2=A0static TCGv load_res;<br>
&gt;=C2=A0 =C2=A0static TCGv load_val;<br>
&gt; +/* number of top masked address bits by pointer masking extension */<=
br>
&gt; +static TCGv pm_pmlen;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * If an operation is being performed on less than TARGET_=
LONG_BITS,<br>
&gt; @@ -103,6 +105,9 @@ typedef struct DisasContext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool vl_eq_vlmax;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv zero;<br>
&gt; +=C2=A0 =C2=A0 /* pointer masking extension */<br>
&gt; +=C2=A0 =C2=A0 bool pm_enabled;<br>
&gt; +=C2=A0 =C2=A0 bool pm_signext;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use icount trigger for native debug */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool itrigger;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FRM is known to contain a valid value. */=
<br>
&gt; @@ -1176,6 +1181,8 @@ static void riscv_tr_init_disas_context(DisasCon=
textBase *dcbase, CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;xl =3D FIELD_EX32(tb_flags, TB_FLAGS=
, XL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;address_xl =3D FIELD_EX32(tb_flags, =
TB_FLAGS, AXL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;cs =3D cs;<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;pm_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, P=
M_ENABLED);<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;pm_signext =3D FIELD_EX32(tb_flags, TB_FLAGS, P=
M_SIGNEXTEND);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;itrigger =3D FIELD_EX32(tb_flags, TB=
_FLAGS, ITRIGGER);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;zero =3D tcg_constant_tl(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;virt_inst_excp =3D false;<br>
&gt; @@ -1307,4 +1314,7 @@ void riscv_translate_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;load_res&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0load_val =3D tcg_global_mem_new(tcg_env, off=
setof(CPURISCVState, load_val),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;load_val&quot;);<br>
&gt; +=C2=A0 =C2=A0 /* Assign var with number of pointer masking masked bit=
s to tcg global */<br>
&gt; +=C2=A0 =C2=A0 pm_pmlen =3D tcg_global_mem_new(tcg_env, offsetof(CPURI=
SCVState, pm_pmlen),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pmlen&quot;);=
<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
</blockquote></div>

--0000000000001cb3ad060d1cfb9b--

