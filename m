Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3ZMG-0000ly-UK
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 02:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZMF-0000kK-97
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:26:31 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1k3ZMD-0002UY-1h
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 02:26:31 -0400
Received: by mail-il1-x142.google.com with SMTP id z3so29290960ilh.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 23:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mt6nafcYDXBHqhoxqxzppUqN1Mbd141VYL6QYeICKZE=;
 b=lgW18PkqshsXmcn9dVQ8KGxY42/Do4vmTx3Pl53MMI7078XnDaf1Xa1HJP2/tMv+wC
 h/GYtD7pEyQcIyBwYTe6ZP9yTeUMYXEXj5WCfROF/GOdGsW5wcPsd1HG7huHPob1nS86
 sU4rD4Zt5CJ1iv1d50G6785Xmo629rDnYO/S+YoNhNIJUDRKGFNfnhhFJphj/q45dv/O
 qQf6CnRoIcKlOk4NK0LENWQ5GSmEnGOiNLOTaCKjlTPFZQtmF1vQydEQmDO0xg5aReCL
 IYYpX8TS8D9Clwrapn4NvgNA0Xs/Xxrm7waqHyb1GKJ6ji6AJV+DlxXFp2pv3FFLDiqX
 1uIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mt6nafcYDXBHqhoxqxzppUqN1Mbd141VYL6QYeICKZE=;
 b=CWmCeRY5crf4Z0qeuOeoAwLdll+gB5Y5g5fkZkqlsUnzJ0kd3IDxHFBBDehrrAAF3U
 +rPxjxOAES3Cw/LWwOijXoILMt+Ok2N47/AYkP8VMGx589ZDmFNWNvNcVVz1OntVuMNk
 tuAglQ6N/FbylDsPHg7tgtUnwcDnhswhLUvam9P7WJGFufHOM3LKD8mPP7gY9HUYLxFW
 shGmEctEtjKLFNYTwlaS+Ww+4tKVQepisUW4Ia9nfWfBH22IJkYEo/uTvew5yBFiUHK3
 0ME0NcgnWX+jjlnB+cyVSw7fJJ49na0vSvAYhzKaW7k16YUC9rdiyd1e1yYz/ZBCKICq
 XRKw==
X-Gm-Message-State: AOAM533cTV+jmKOpYXjLGBGbnbeGCFE5MigBtIyC16BaIZyfa6TJ1zFD
 Iz5+mHoGXLoLC0U6oocXUtU15QdGLxHaBdM18tjn0w==
X-Google-Smtp-Source: ABdhPJwleaJLxsgrzPqKgoaNRjk67FSfc3Zntjpz4nJgMSlilBe1/NCICLlynpt+COWGu9wjxSIJ/VGCN/4+fGOaEJM=
X-Received: by 2002:a05:6e02:1213:: with SMTP id
 a19mr8520911ilq.129.1596695187804; 
 Wed, 05 Aug 2020 23:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
 <20200724002807.441147-5-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-5-richard.henderson@linaro.org>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 6 Aug 2020 14:26:17 +0800
Message-ID: <CAEiOBXWs44cpuVC+vKtK612f3vKveh5e37aO42xOnkVoq67r-A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] target/riscv: Check nanboxed inputs to fp helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="0000000000007beffe05ac2f91b6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=chihmin.chao@sifive.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 06:26:31 -0000

--0000000000007beffe05ac2f91b6
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 8:29 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> If a 32-bit input is not properly nanboxed, then the input is
> replaced with the default qnan.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/internals.h  | 11 +++++++
>  target/riscv/fpu_helper.c | 64 ++++++++++++++++++++++++++++-----------
>  2 files changed, 57 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 9f4ba7d617..f1a546dba6 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -43,4 +43,15 @@ static inline uint64_t nanbox_s(float32 f)
>      return f | MAKE_64BIT_MASK(32, 32);
>  }
>
> +static inline float32 check_nanbox_s(uint64_t f)
> +{
> +    uint64_t mask = MAKE_64BIT_MASK(32, 32);
> +
> +    if (likely((f & mask) == mask)) {
> +        return (uint32_t)f;
> +    } else {
> +        return 0x7fc00000u; /* default qnan */
> +    }
> +}
> +
>  #endif
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 72541958a7..bb346a8249 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -81,9 +81,12 @@ void helper_set_rounding_mode(CPURISCVState *env,
> uint32_t rm)
>      set_float_rounding_mode(softrm, &env->fp_status);
>  }
>
> -static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t
> frs2,
> -                           uint64_t frs3, int flags)
> +static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
> +                           uint64_t rs3, int flags)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
> +    float32 frs3 = check_nanbox_s(rs3);
>      return nanbox_s(float32_muladd(frs1, frs2, frs3, flags,
> &env->fp_status));
>  }
>
> @@ -139,74 +142,97 @@ uint64_t helper_fnmadd_d(CPURISCVState *env,
> uint64_t frs1, uint64_t frs2,
>                            float_muladd_negate_product, &env->fp_status);
>  }
>
> -uint64_t helper_fadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_add(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_sub(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fmul_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_mul(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_div(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fmin_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fmax_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> +uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
>  }
>
> -uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t frs1)
> +uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return nanbox_s(float32_sqrt(frs1, &env->fp_status));
>  }
>
> -target_ulong helper_fle_s(CPURISCVState *env, uint64_t frs1, uint64_t
> frs2)
> +target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return float32_le(frs1, frs2, &env->fp_status);
>  }
>
> -target_ulong helper_flt_s(CPURISCVState *env, uint64_t frs1, uint64_t
> frs2)
> +target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return float32_lt(frs1, frs2, &env->fp_status);
>  }
>
> -target_ulong helper_feq_s(CPURISCVState *env, uint64_t frs1, uint64_t
> frs2)
> +target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
> +    float32 frs2 = check_nanbox_s(rs2);
>      return float32_eq_quiet(frs1, frs2, &env->fp_status);
>  }
>
> -target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t frs1)
> +target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return float32_to_int32(frs1, &env->fp_status);
>  }
>
> -target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t frs1)
> +target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return (int32_t)float32_to_uint32(frs1, &env->fp_status);
>  }
>
>  #if defined(TARGET_RISCV64)
> -uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t frs1)
> +uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return float32_to_int64(frs1, &env->fp_status);
>  }
>
> -uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t frs1)
> +uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return float32_to_uint64(frs1, &env->fp_status);
>  }
>  #endif
> @@ -233,8 +259,9 @@ uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t
> rs1)
>  }
>  #endif
>
> -target_ulong helper_fclass_s(uint64_t frs1)
> +target_ulong helper_fclass_s(uint64_t rs1)
>  {
> +    float32 frs1 = check_nanbox_s(rs1);
>      return fclass_s(frs1);
>  }
>
> @@ -275,7 +302,8 @@ uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t
> rs1)
>
>  uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)
>  {
> -    return float32_to_float64(rs1, &env->fp_status);
> +    float32 frs1 = check_nanbox_s(rs1);
> +    return float32_to_float64(frs1, &env->fp_status);
>  }
>
>  uint64_t helper_fsqrt_d(CPURISCVState *env, uint64_t frs1)
> --
> 2.25.1
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

Chih-Min Chao

--0000000000007beffe05ac2f91b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">On Fri, Jul 24, =
2020 at 8:29 AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@l=
inaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div></div></div=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If a 32-bit input is not properly nanboxed, then the input is<br=
>
replaced with the default qnan.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/internals.h=C2=A0 | 11 +++++++<br>
=C2=A0target/riscv/fpu_helper.c | 64 ++++++++++++++++++++++++++++----------=
-<br>
=C2=A02 files changed, 57 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/target/riscv/internals.h b/target/riscv/internals.h<br>
index 9f4ba7d617..f1a546dba6 100644<br>
--- a/target/riscv/internals.h<br>
+++ b/target/riscv/internals.h<br>
@@ -43,4 +43,15 @@ static inline uint64_t nanbox_s(float32 f)<br>
=C2=A0 =C2=A0 =C2=A0return f | MAKE_64BIT_MASK(32, 32);<br>
=C2=A0}<br>
<br>
+static inline float32 check_nanbox_s(uint64_t f)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t mask =3D MAKE_64BIT_MASK(32, 32);<br>
+<br>
+=C2=A0 =C2=A0 if (likely((f &amp; mask) =3D=3D mask)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uint32_t)f;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0x7fc00000u; /* default qnan */<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0#endif<br>
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c<br>
index 72541958a7..bb346a8249 100644<br>
--- a/target/riscv/fpu_helper.c<br>
+++ b/target/riscv/fpu_helper.c<br>
@@ -81,9 +81,12 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32=
_t rm)<br>
=C2=A0 =C2=A0 =C2=A0set_float_rounding_mode(softrm, &amp;env-&gt;fp_status)=
;<br>
=C2=A0}<br>
<br>
-static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs=
2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint64_t frs3, int flags)<br>
+static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint64_t rs3, int flags)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
+=C2=A0 =C2=A0 float32 frs3 =3D check_nanbox_s(rs3);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_muladd(frs1, frs2, frs3, flags,=
 &amp;env-&gt;fp_status));<br>
=C2=A0}<br>
<br>
@@ -139,74 +142,97 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_t=
 frs1, uint64_t frs2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0float_muladd_negate_product, &amp;env-&gt;fp_status=
);<br>
=C2=A0}<br>
<br>
-uint64_t helper_fadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_add(frs1, frs2, &amp;env-&gt;fp=
_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_sub(frs1, frs2, &amp;env-&gt;fp=
_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fmul_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_mul(frs1, frs2, &amp;env-&gt;fp=
_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_div(frs1, frs2, &amp;env-&gt;fp=
_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fmin_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_minnum(frs1, frs2, &amp;env-&gt=
;fp_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fmax_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2)<b=
r>
+uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_maxnum(frs1, frs2, &amp;env-&gt=
;fp_status));<br>
=C2=A0}<br>
<br>
-uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t frs1)<br>
+uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return nanbox_s(float32_sqrt(frs1, &amp;env-&gt;fp_stat=
us));<br>
=C2=A0}<br>
<br>
-target_ulong helper_fle_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
)<br>
+target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<=
br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return float32_le(frs1, frs2, &amp;env-&gt;fp_status);<=
br>
=C2=A0}<br>
<br>
-target_ulong helper_flt_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
)<br>
+target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<=
br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return float32_lt(frs1, frs2, &amp;env-&gt;fp_status);<=
br>
=C2=A0}<br>
<br>
-target_ulong helper_feq_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
)<br>
+target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)<=
br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 float32 frs2 =3D check_nanbox_s(rs2);<br>
=C2=A0 =C2=A0 =C2=A0return float32_eq_quiet(frs1, frs2, &amp;env-&gt;fp_sta=
tus);<br>
=C2=A0}<br>
<br>
-target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t frs1)<br>
+target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return float32_to_int32(frs1, &amp;env-&gt;fp_status);<=
br>
=C2=A0}<br>
<br>
-target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t frs1)<br>
+target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return (int32_t)float32_to_uint32(frs1, &amp;env-&gt;fp=
_status);<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(TARGET_RISCV64)<br>
-uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t frs1)<br>
+uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return float32_to_int64(frs1, &amp;env-&gt;fp_status);<=
br>
=C2=A0}<br>
<br>
-uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t frs1)<br>
+uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return float32_to_uint64(frs1, &amp;env-&gt;fp_status);=
<br>
=C2=A0}<br>
=C2=A0#endif<br>
@@ -233,8 +259,9 @@ uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t =
rs1)<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
-target_ulong helper_fclass_s(uint64_t frs1)<br>
+target_ulong helper_fclass_s(uint64_t rs1)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
=C2=A0 =C2=A0 =C2=A0return fclass_s(frs1);<br>
=C2=A0}<br>
<br>
@@ -275,7 +302,8 @@ uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t r=
s1)<br>
<br>
=C2=A0uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return float32_to_float64(rs1, &amp;env-&gt;fp_status);<br>
+=C2=A0 =C2=A0 float32 frs1 =3D check_nanbox_s(rs1);<br>
+=C2=A0 =C2=A0 return float32_to_float64(frs1, &amp;env-&gt;fp_status);<br>
=C2=A0}<br>
<br>
=C2=A0uint64_t helper_fsqrt_d(CPURISCVState *env, uint64_t frs1)<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><span style=3D"color:rgb(136,136,136)">Chih-Min Chao</span><div style=3D=
"color:rgb(136,136,136)"></div></div></div></div><div>=C2=A0</div></div></d=
iv>

--0000000000007beffe05ac2f91b6--

