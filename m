Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mR7WA-0002IC-NU
	for mharc-qemu-riscv@gnu.org; Fri, 17 Sep 2021 02:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mR7W8-0002HP-Jb
 for qemu-riscv@nongnu.org; Fri, 17 Sep 2021 02:38:36 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mR7W5-0001D6-U3
 for qemu-riscv@nongnu.org; Fri, 17 Sep 2021 02:38:35 -0400
Received: by mail-io1-xd2f.google.com with SMTP id m11so10935653ioo.6
 for <qemu-riscv@nongnu.org>; Thu, 16 Sep 2021 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmUhTDqFsHtDgE9nmzLnIwwBaJAdESV8WUxMaghAusE=;
 b=Ao82bKgSBmqcqNBZzRT07m4fce/ALttpqQpwF5vFUkoAuFPCgzNzENh3J+JVSt8aVJ
 Lm+cPPk9WCqVEeoZzlJ83wpdRS2RQVIN6PrcAQ7oqhOBRMABQpJ8FNB0NgV8LLeKTdy3
 /VW90rYvhI7kn2hf9JVNYXW7ODsXD8vernVD2owOSMMs9lBL58DY6OCaM2CqZj3k39dm
 fbDovtK775D8bA66ev5mXMlvads3E1/yoDZY0C3wSUqAufOo4Ne3P9UYIfTrxgPPhJUJ
 WNr/ck4XIrxvRFpNM3Latt8A+iQpsiOQ9gOkgAkhwJeAulEXchDuh8P9t7kZ8TCBd33A
 Xslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmUhTDqFsHtDgE9nmzLnIwwBaJAdESV8WUxMaghAusE=;
 b=bW0W4RwSBlNMsdbQCXCqNZVtBZrmYPj7PKQbzRGtm50ka3U9aSnEgyK6/ijRnhebtn
 3t4tsPqtyo3T0XXvsc702/DDup3ORvMusMFqUZdiddikCuWSqxNsc7mi0kmESOGreHjR
 7SVhKhFbFrEJEtRCpRBvuvLjnP6qkwQ4mDzRDQYDFXfHV2cluX/5P69/gIOK0946zG33
 DFjR9f/PEvqnsNfsr0YvKgMzPMYfkcyUafXcg974zNhYjaJ7dFFIYPk6+nMWNGdDIvbL
 3LdxhF4q13EzaONmvJZ2zyXe4gVAAObFwI5GeAEosJxW5aGPxql2zAErbSgtnN+U7rI1
 f//w==
X-Gm-Message-State: AOAM532VWsTkwuQjkx2y1p60OFfzswiY0P6xj6/U7gBY1YqLWgw7s3dU
 nfRIxAt770mk7/sgJtoXv3lhr5EAsZbRmMNVDklYRg==
X-Google-Smtp-Source: ABdhPJwrbyjP4KQfXLn1mUNNjiw1dT28UZenNDHQnnFfkEW5cgBmhW5JEswIDIpC84ltgxHtuShvHIwyQ26+12awPEY=
X-Received: by 2002:a6b:f007:: with SMTP id w7mr7443640ioc.112.1631860712584; 
 Thu, 16 Sep 2021 23:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061441.3757201-1-frank.chang@sifive.com>
In-Reply-To: <20210917061441.3757201-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 17 Sep 2021 14:38:21 +0800
Message-ID: <CAE_xrPiG7cbg8K9C6kiP6itwrHXxh4pGaVS4jm1xmLWX_xfssA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and
 V=1 in mark_fs_dirty()
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000018d26805cc2b2e2c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Fri, 17 Sep 2021 06:38:36 -0000

--00000000000018d26805cc2b2e2c
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 2:14 PM <frank.chang@sifive.com> wrote:

> From: Frank Chang <frank.chang@sifive.com>
>
> When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> Modifying the floating-point state when V=1 causes both fields to
> be set to 3 (Dirty).
>
> However, it's possible that HS-level sstatus.FS is Clean and VS-level
> vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> We can't early return for this case because we still need to set
> sstatus.FS to Dirty according to spec.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> Tested-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  target/riscv/cpu.h       |  3 +++
>  target/riscv/translate.c | 24 +++++++++++++++---------
>  2 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e735e53e26c..c5cae45f955 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,6 +394,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>  FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> @@ -450,6 +451,8 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState
> *env, target_ulong *pc,
>                  get_field(env->hstatus, HSTATUS_HU))) {
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
> +
> +        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> env->mstatus_hs);
>

Oops, I should use get_field() to extract FS bits from env->mstatus_hs here.
Please ignore this one. I will revise it and resent the patch.
Sorry for the confusion.

Regards,
Frank Chang


>      }
>  #endif
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 74b33fa3c90..2b48db6fd02 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -58,6 +58,7 @@ typedef struct DisasContext {
>      target_ulong misa;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> +    uint32_t mstatus_hs_fs;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction,
>         which we have already installed into env->fp_status.  Or -1 for
> @@ -280,26 +281,30 @@ static void gen_jal(DisasContext *ctx, int rd,
> target_ulong imm)
>  static void mark_fs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
> -    target_ulong sd;
> +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +
> +    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> +        /* Remember the stage change for the rest of the TB. */
> +        ctx->mstatus_hs_fs = MSTATUS_FS;
> +
> +        tmp = tcg_temp_new();
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_temp_free(tmp);
> +    }
>
>      if (ctx->mstatus_fs == MSTATUS_FS) {
>          return;
>      }
> +
>      /* Remember the state change for the rest of the TB.  */
>      ctx->mstatus_fs = MSTATUS_FS;
>
>      tmp = tcg_temp_new();
> -    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> -
>      tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
>      tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -
> -    if (ctx->virt_enabled) {
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -    }
>      tcg_temp_free(tmp);
>  }
>  #else
> @@ -533,6 +538,7 @@ static void
> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->vlen = cpu->cfg.vlen;
> +    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
> --
> 2.25.1
>
>

--00000000000018d26805cc2b2e2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 17, 2021 at 2:14 PM &lt;<a hr=
ef=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" =
target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
<br>
When V=3D1, both vsstauts.FS and HS-level sstatus.FS are in effect.<br>
Modifying the floating-point state when V=3D1 causes both fields to<br>
be set to 3 (Dirty).<br>
<br>
However, it&#39;s possible that HS-level sstatus.FS is Clean and VS-level<b=
r>
vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=3D1.<br>
We can&#39;t early return for this case because we still need to set<br>
sstatus.FS to Dirty according to spec.<br>
<br>
Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" ta=
rget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
Reviewed-by: Vincent Chen &lt;<a href=3D"mailto:vincent.chen@sifive.com" ta=
rget=3D"_blank">vincent.chen@sifive.com</a>&gt;<br>
Tested-by: Vincent Chen &lt;<a href=3D"mailto:vincent.chen@sifive.com" targ=
et=3D"_blank">vincent.chen@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0target/riscv/translate.c | 24 +++++++++++++++---------<br>
=C2=A02 files changed, 18 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index e735e53e26c..c5cae45f955 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -394,6 +394,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)<br>
=C2=A0FIELD(TB_FLAGS, VILL, 8, 1)<br>
=C2=A0/* Is a Hypervisor instruction load/store allowed? */<br>
=C2=A0FIELD(TB_FLAGS, HLSX, 9, 1)<br>
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)<br>
<br>
=C2=A0bool riscv_cpu_is_32bit(CPURISCVState *env);<br>
<br>
@@ -450,6 +451,8 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *=
env, target_ulong *pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env=
-&gt;hstatus, HSTATUS_HU))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D FIELD_DP32(flags,=
 TB_FLAGS, HLSX, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_=
HS_FS, env-&gt;mstatus_hs);<br></blockquote><div><br></div><div>Oops, I sho=
uld use get_field() to extract FS bits from env-&gt;mstatus_hs here.</div><=
div>Please ignore this one. I will revise it and resent the patch.</div><di=
v>Sorry for the confusion.</div><div><br></div><div>Regards,</div><div>Fran=
k Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 74b33fa3c90..2b48db6fd02 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -58,6 +58,7 @@ typedef struct DisasContext {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong misa;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t opcode;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mstatus_fs;<br>
+=C2=A0 =C2=A0 uint32_t mstatus_hs_fs;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mem_idx;<br>
=C2=A0 =C2=A0 =C2=A0/* Remember the rounding mode encoded in the previous f=
p instruction,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 which we have already installed into env-&gt;fp=
_status.=C2=A0 Or -1 for<br>
@@ -280,26 +281,30 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)<br>
=C2=A0static void mark_fs_dirty(DisasContext *ctx)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TCGv tmp;<br>
-=C2=A0 =C2=A0 target_ulong sd;<br>
+=C2=A0 =C2=A0 target_ulong sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64=
_SD;<br>
+<br>
+=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled &amp;&amp; ctx-&gt;mstatus_hs_fs !=
=3D MSTATUS_FS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember the stage change for the rest of t=
he TB. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx-&gt;mstatus_hs_fs =3D MSTATUS_FS;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D tcg_temp_new();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVS=
tate, mstatus_hs));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVS=
tate, mstatus_hs));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;mstatus_fs =3D=3D MSTATUS_FS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Remember the state change for the rest of the TB.=C2=
=A0 */<br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;mstatus_fs =3D MSTATUS_FS;<br>
<br>
=C2=A0 =C2=A0 =C2=A0tmp =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mst=
atus));<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mst=
atus));<br>
-<br>
-=C2=A0 =C2=A0 if (ctx-&gt;virt_enabled) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVS=
tate, mstatus_hs));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVS=
tate, mstatus_hs));<br>
-=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0tcg_temp_free(tmp);<br>
=C2=A0}<br>
=C2=A0#else<br>
@@ -533,6 +538,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;frm =3D -1;=C2=A0 /* unknown rounding mode */<b=
r>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;ext_ifencei =3D cpu-&gt;cfg.ext_ifencei;<br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;vlen =3D cpu-&gt;cfg.vlen;<br>
+=C2=A0 =C2=A0 ctx-&gt;mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MST=
ATUS_HS_FS);<br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);<=
br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);<=
br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);<br=
>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000018d26805cc2b2e2c--

