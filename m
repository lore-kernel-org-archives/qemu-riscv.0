Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AF9C5475B
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 09:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riWds-0005In-Jw; Fri, 08 Mar 2024 04:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1riWdr-0005If-Sg
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 04:35:51 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1riWdp-0001US-Ph
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 04:35:51 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-29a74c88f74so504283a91.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Mar 2024 01:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1709890547; x=1710495347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YjbDG10OQjDEf9u2Vt80SxjffC22evs/GOzN91AVGRU=;
 b=sD+lIURBj4RBIWCMwHEJvoUk5EnTxml2PqyvltyFaP5iK2TKySMUvdmswJzLHCDaYm
 sq7u9caeec/ijDRYA7e1U8OuLklEX1N2Id4gP+SE5BR/me5sKU+/z+uXfDCQOPas9fHE
 J5vVXcmYW+XxyZZxpnqZnzJHdn+w24iHh2Y1xQGkq8QvDAbHVe8E59J+yYevgNbmdzdU
 Hcjz57TnKTb2B3vk3L588u5ryNGTUr9Gbchyn/vFNV7FuS7146vU7AxgvL9UvPV6KNd4
 LBGoWk0GzJ81Oi3SdqZ5Pk1C/wuq6xA1M0CgiXHtn/w/liBzVKS4Zi61QFcF8LWcCodR
 nbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709890547; x=1710495347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YjbDG10OQjDEf9u2Vt80SxjffC22evs/GOzN91AVGRU=;
 b=BiRtJTbB2c7pm0MvWvbmU7daauCgwsiRoi8m4soSVCDT2xuKs0oXQpb6V1y8uZbj8W
 oS0kjaOoMlilxLoQuf3LX8anrkfyd4SAopS6YgQyyl3vl6ADp1JRI0cQIgzEDeNNZ4BH
 Ya4RmaNQpQAQkEDzhTOGvPXNlaaONxFkArnmsgmD9cupLgIJKC22U0xQF8nDUReQu4+F
 xRvhT6OTfEL7jISeEkSnp/ZVqlG2JVNztwIE23Wbwi5psICNR4I9kqm8VxDWX98EW7RZ
 yrCABSwIYYFqTwauHVdbdryDYRi16WYWaqvmBqyfWIk20v0BcWlH+ERZNd8ubcy22Y4w
 UqHg==
X-Gm-Message-State: AOJu0YydJ4CSXcyzpM4xu01d5uU/fOP2VeS5yIlxPGNwo0MDaL/WLQjT
 PPfdUV4xN5WIQoF9P0MC/468jRHRhcFGzftBDmBdyxPwL09Db1BMQ5Sb+cFkI7MtYs8T+0EO24q
 AHwLi31RGtbHdA53kP5nATaRImvh/H++a3eXQXA==
X-Google-Smtp-Source: AGHT+IGLZA589PEc/h3aDFla2czKWVZPO2WI/6JlXbNOLVdVaItAZG4tif1WSf2v8EZxEb9mrj0Ox7d+HTbNwxYd3lQ=
X-Received: by 2002:a17:90a:1049:b0:29a:264b:8853 with SMTP id
 y9-20020a17090a104900b0029a264b8853mr17807003pjd.12.1709890546935; Fri, 08
 Mar 2024 01:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20240308081219.8061-2-ajones@ventanamicro.com>
In-Reply-To: <20240308081219.8061-2-ajones@ventanamicro.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 8 Mar 2024 10:35:35 +0100
Message-ID: <CAEg0e7j=DzSQanRxNDO=o6=6t9-LyCexSb-DyQ89DfBsEZQ=FA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Raise exceptions on wrs.nto
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000a7c99c061322eac0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000a7c99c061322eac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 9:12=E2=80=AFAM Andrew Jones <ajones@ventanamicro.co=
m> wrote:

> Implementing wrs.nto to always just return is consistent with the
> specification, as the instruction is permitted to terminate the
> stall for any reason, but it's not useful for virtualization, where
> we'd like the guest to trap to the hypervisor in order to allow
> scheduling of the lock holding VCPU. Change to always immediately
> raise exceptions when the appropriate conditions are present,
> otherwise continue to just return. Note, immediately raising
> exceptions is also consistent with the specification since the
> time limit that should expire prior to the exception is
> implementation-specific.
>

I've reviewed this against the Zawrs spec (triggered exceptions and their
conditions).

Reviewed-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>


>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/helper.h                       |  1 +
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 27 ++++++++++++++-------
>  target/riscv/op_helper.c                    | 11 +++++++++
>  3 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 8a635238514d..451261ce5a4f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl=
)
>  DEF_HELPER_1(sret, tl, env)
>  DEF_HELPER_1(mret, tl, env)
>  DEF_HELPER_1(wfi, void, env)
> +DEF_HELPER_1(wrs_nto, void, env)
>  DEF_HELPER_1(tlb_flush, void, env)
>  DEF_HELPER_1(tlb_flush_all, void, env)
>  /* Native Debug */
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc
> b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> index 32efbff4d5a5..5dfc3a943fde 100644
> --- a/target/riscv/insn_trans/trans_rvzawrs.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -16,7 +16,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -static bool trans_wrs(DisasContext *ctx)
> +static bool trans_wrs_sto(DisasContext *ctx, arg_wrs_sto *a)
>  {
>      if (!ctx->cfg_ptr->ext_zawrs) {
>          return false;
> @@ -40,12 +40,21 @@ static bool trans_wrs(DisasContext *ctx)
>      return true;
>  }
>
> -#define GEN_TRANS_WRS(insn)                                     \
> -static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)  \
> -{                                                               \
> -    (void)a;                                                    \
> -    return trans_wrs(ctx);                                      \
> -}
> +static bool trans_wrs_nto(DisasContext *ctx, arg_wrs_nto *a)
> +{
> +    if (!ctx->cfg_ptr->ext_zawrs) {
> +        return false;
> +    }
>
> -GEN_TRANS_WRS(wrs_nto)
> -GEN_TRANS_WRS(wrs_sto)
> +    /*
> +     * Depending on the mode of execution, mstatus.TW and hstatus.VTW,
> wrs.nto
> +     * should raise an exception when the implementation-specific bounde=
d
> time
> +     * limit has expired. Our time limit is zero, so we either return
> +     * immediately, as does our implementation of wrs.sto, or raise an
> +     * exception, as handled by the wrs.nto helper.
> +     */
> +    gen_helper_wrs_nto(tcg_env);
> +
> +    /* We only get here when helper_wrs_nto() doesn't raise an exception=
.
> */
> +    return trans_wrs_sto(ctx, NULL);
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index f414aaebdbab..2baf5bc3ca19 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -380,6 +380,17 @@ void helper_wfi(CPURISCVState *env)
>      }
>  }
>
> +void helper_wrs_nto(CPURISCVState *env)
> +{
> +    if (env->virt_enabled && (env->priv =3D=3D PRV_S || env->priv =3D=3D=
 PRV_U) &&
> +        get_field(env->hstatus, HSTATUS_VTW) &&
> +        !get_field(env->mstatus, MSTATUS_TW)) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT,
> GETPC());
> +    } else if (env->priv !=3D PRV_M && get_field(env->mstatus, MSTATUS_T=
W))
> {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +}
> +
>  void helper_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
> --
> 2.44.0
>
>

--000000000000a7c99c061322eac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 8, 2024 at 9:12=E2=80=AFA=
M Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com">ajones@ventan=
amicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Implementing wrs.nto to always just return is consistent with th=
e<br>
specification, as the instruction is permitted to terminate the<br>
stall for any reason, but it&#39;s not useful for virtualization, where<br>
we&#39;d like the guest to trap to the hypervisor in order to allow<br>
scheduling of the lock holding VCPU. Change to always immediately<br>
raise exceptions when the appropriate conditions are present,<br>
otherwise continue to just return. Note, immediately raising<br>
exceptions is also consistent with the specification since the<br>
time limit that should expire prior to the exception is<br>
implementation-specific.<br></blockquote><div><br></div><div>I&#39;ve revie=
wed this against the Zawrs spec (triggered exceptions and their conditions)=
.</div><div><br></div><div>Reviewed-by: Christoph M=C3=BCllner &lt;<a href=
=3D"mailto:christoph.muellner@vrull.eu">christoph.muellner@vrull.eu</a>&gt;=
<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Signed-off-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.com" =
target=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/riscv/insn_trans/trans_rvzawrs.c.inc | 27 ++++++++++++++------=
-<br>
=C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++<br>
=C2=A03 files changed, 30 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
index 8a635238514d..451261ce5a4f 100644<br>
--- a/target/riscv/helper.h<br>
+++ b/target/riscv/helper.h<br>
@@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)<=
br>
=C2=A0DEF_HELPER_1(sret, tl, env)<br>
=C2=A0DEF_HELPER_1(mret, tl, env)<br>
=C2=A0DEF_HELPER_1(wfi, void, env)<br>
+DEF_HELPER_1(wrs_nto, void, env)<br>
=C2=A0DEF_HELPER_1(tlb_flush, void, env)<br>
=C2=A0DEF_HELPER_1(tlb_flush_all, void, env)<br>
=C2=A0/* Native Debug */<br>
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/ins=
n_trans/trans_rvzawrs.c.inc<br>
index 32efbff4d5a5..5dfc3a943fde 100644<br>
--- a/target/riscv/insn_trans/trans_rvzawrs.c.inc<br>
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc<br>
@@ -16,7 +16,7 @@<br>
=C2=A0 * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
=C2=A0 */<br>
<br>
-static bool trans_wrs(DisasContext *ctx)<br>
+static bool trans_wrs_sto(DisasContext *ctx, arg_wrs_sto *a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;cfg_ptr-&gt;ext_zawrs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
@@ -40,12 +40,21 @@ static bool trans_wrs(DisasContext *ctx)<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
<br>
-#define GEN_TRANS_WRS(insn)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
-static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)=C2=A0 \<br>
-{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
-=C2=A0 =C2=A0 (void)a;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 return trans_wrs(ctx);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
-}<br>
+static bool trans_wrs_nto(DisasContext *ctx, arg_wrs_nto *a)<br>
+{<br>
+=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zawrs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
<br>
-GEN_TRANS_WRS(wrs_nto)<br>
-GEN_TRANS_WRS(wrs_sto)<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Depending on the mode of execution, mstatus.TW and h=
status.VTW, wrs.nto<br>
+=C2=A0 =C2=A0 =C2=A0* should raise an exception when the implementation-sp=
ecific bounded time<br>
+=C2=A0 =C2=A0 =C2=A0* limit has expired. Our time limit is zero, so we eit=
her return<br>
+=C2=A0 =C2=A0 =C2=A0* immediately, as does our implementation of wrs.sto, =
or raise an<br>
+=C2=A0 =C2=A0 =C2=A0* exception, as handled by the wrs.nto helper.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 gen_helper_wrs_nto(tcg_env);<br>
+<br>
+=C2=A0 =C2=A0 /* We only get here when helper_wrs_nto() doesn&#39;t raise =
an exception. */<br>
+=C2=A0 =C2=A0 return trans_wrs_sto(ctx, NULL);<br>
+}<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index f414aaebdbab..2baf5bc3ca19 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -380,6 +380,17 @@ void helper_wfi(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+void helper_wrs_nto(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 if (env-&gt;virt_enabled &amp;&amp; (env-&gt;priv =3D=3D PRV=
_S || env-&gt;priv =3D=3D PRV_U) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;hstatus, HSTATUS_VTW) &amp;&=
amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_field(env-&gt;mstatus, MSTATUS_TW)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT, GETPC());<br>
+=C2=A0 =C2=A0 } else if (env-&gt;priv !=3D PRV_M &amp;&amp; get_field(env-=
&gt;mstatus, MSTATUS_TW)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_=
INST, GETPC());<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0void helper_tlb_flush(CPURISCVState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div></div>

--000000000000a7c99c061322eac0--

