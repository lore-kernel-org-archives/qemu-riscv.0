Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqAZo-0007Ne-Ra
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jun 2020 03:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1jqAZn-0007MT-AR
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 03:21:07 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chihmin.chao@sifive.com>)
 id 1jqAZd-0003kn-CL
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 03:21:07 -0400
Received: by mail-io1-xd43.google.com with SMTP id c16so19899380ioi.9
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2020 00:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2GMc+9NLu2HY0kaTaRdGrxJJgalYC5CSeXSfxm6o10=;
 b=EU9S0/StJYyNws5Zd8iSIG0koV20ZlkOcqpl1smtMEQfK31EX+7Qf2xDW1gnvwgz6R
 fbweyq1FDGtNHl2SHvCIKkdDy0zOawNVIamiOedui1CtXqpJ3pMMCI+whdIT3hibc25c
 QITvllcKx8m4zpIqXVjJo5MKL3doxeMAlJLR169V7kRcqpATFEaxUZm54GjT571BMICV
 iuQ2VJtjnqdBL9Ze+/eZRZdiW1T49OD0mxbHxHrHdACz0NfsgKWUcdVR+QVI+on8Tstc
 voHHIptzn40hf53XeELzsG0ozFQru+EYf5pldl/NqGnID27sV4LsUeJb3lx7uzX0XDa6
 z3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2GMc+9NLu2HY0kaTaRdGrxJJgalYC5CSeXSfxm6o10=;
 b=G9NnPqj7GPjuXQAA20dCbLwlG73FziXDCosmO0MnQ2bK4KHKn/acy/3ecgozJR45O+
 hCAeOMsdaFs/l4bhQu5YZf3j4yIrveMgTiqkELuuum1YtRbWVJ/qmAiSM+thofuyCs1l
 6WGJSngkYy/ff7epwm/lZlhhyqv+M5gztu7774YS7DLzgaPiHBOf7f5i8yEMXQqvlSEc
 mBaHnwiJoGmEwGWtITZq8lARgnAQ/vDRyXx9vuwgOElXzuDr4soK2RnhSE1ZlLcVggmn
 EFDQ/fACPjGyxwnVbuBa+qGAaK7VmSttE+3JRNX0Lu6qMiW/fW4Amb3+F1xACSGt2+ds
 UOlg==
X-Gm-Message-State: AOAM532B6KRHurfi3EtzWb48uMSNvRNCVEehHWvKa+4hSZ9bStBwjcSn
 hQ8hGrDhh3GwVr9M1zlqcWP7V9z7DTGajU+eQPkoWA==
X-Google-Smtp-Source: ABdhPJz7YJmDeZVm5JaLy6y3cQfeQIeMmn6N5zTatCLMvYcTBpLlifqZMLDxOpKcffmukqIyeuky+Pnm6e5eRlva4Oo=
X-Received: by 2002:a05:6638:1483:: with SMTP id
 j3mr22167115jak.65.1593501655470; 
 Tue, 30 Jun 2020 00:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
 <20200626205917.4545-4-zhiwei_liu@c-sky.com>
In-Reply-To: <20200626205917.4545-4-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 30 Jun 2020 15:20:44 +0800
Message-ID: <CAEiOBXWCVWhZ4oopTvmhU5yfSW+pdyJPDvqDfnvHD2DesXdAhQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/riscv: Check for LEGAL NaN-boxing
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, wxy194768@alibaba-inc.com, 
 wenmeng_zhang@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ian Jiang <ianjiang.ict@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001fba1d05a948045a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=chihmin.chao@sifive.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 07:21:07 -0000

--0000000000001fba1d05a948045a
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 27, 2020 at 5:05 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:

> A narrow n-bit operation, where n < FLEN, checks that input operands
> are correctly NaN-boxed, i.e., all upper FLEN - n bits are 1.
> If so, the n least-significant bits of the input are used as the input
> value,
> otherwise the input value is treated as an n-bit canonical NaN.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/translate.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 4b1534c9a6..1c9b809d4a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -104,6 +104,35 @@ static void gen_nanbox_fpr(DisasContext *ctx, int
> regno)
>      }
>  }
>
> +/*
> + * A narrow n-bit operation, where n < FLEN, checks that input operands
> + * are correctly NaN-boxed, i.e., all upper FLEN - n bits are 1.
> + * If so, the n least-signicant bits of the input are used as the input
> value,
> + * otherwise the input value is treated as an n-bit canonical NaN.
> + * (riscv-spec-v2.2 Section 9.2).
> + */
> +static void check_nanboxed(DisasContext *ctx, int num, ...)
> +{
> +    if (has_ext(ctx, RVD)) {
> +        int i;
> +        TCGv_i64 cond1 = tcg_temp_new_i64();
>
forget to remove ?

> +        TCGv_i64 t_nan = tcg_const_i64(0x7fc00000);
> +        TCGv_i64 t_max = tcg_const_i64(MAKE_64BIT_MASK(32, 32));
> +        va_list valist;
> +        va_start(valist, num);
> +
> +        for (i = 0; i < num; i++) {
> +            TCGv_i64 t = va_arg(valist, TCGv_i64);
> +            tcg_gen_movcond_i64(TCG_COND_GEU, t, t, t_max, t, t_nan);
> +        }
> +
> +        va_end(valist);
> +        tcg_temp_free_i64(cond1);
>
forget to remove ?

> +        tcg_temp_free_i64(t_nan);
> +        tcg_temp_free_i64(t_max);
> +    }
> +}
> +
>  static void generate_exception(DisasContext *ctx, int excp)
>  {
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> --
> 2.23.0
>
>

 Chih-Min Chao

--0000000000001fba1d05a948045a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><span style=3D"color:rgb(136,136,136)"></span><div style=3D"color:rgb(136=
,136,136)"><br></div></div></div></div></div><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 27, 2020 at 5:05 AM LIU Zhiw=
ei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A narrow=
 n-bit operation, where n &lt; FLEN, checks that input operands<br>
are correctly NaN-boxed, i.e., all upper FLEN - n bits are 1.<br>
If so, the n least-significant bits of the input are used as the input valu=
e,<br>
otherwise the input value is treated as an n-bit canonical NaN.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/translate.c | 29 +++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 29 insertions(+)<br>
<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 4b1534c9a6..1c9b809d4a 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -104,6 +104,35 @@ static void gen_nanbox_fpr(DisasContext *ctx, int regn=
o)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/*<br>
+ * A narrow n-bit operation, where n &lt; FLEN, checks that input operands=
<br>
+ * are correctly NaN-boxed, i.e., all upper FLEN - n bits are 1.<br>
+ * If so, the n least-signicant bits of the input are used as the input va=
lue,<br>
+ * otherwise the input value is treated as an n-bit canonical NaN.<br>
+ * (riscv-spec-v2.2 Section 9.2).<br>
+ */<br>
+static void check_nanboxed(DisasContext *ctx, int num, ...)<br>
+{<br>
+=C2=A0 =C2=A0 if (has_ext(ctx, RVD)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 cond1 =3D tcg_temp_new_i64();<br></bl=
ockquote><div>forget to remove ?=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t_nan =3D tcg_const_i64(0x7fc00000);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t_max =3D tcg_const_i64(MAKE_64BIT_MA=
SK(32, 32));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 va_list valist;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 va_start(valist, num);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 t =3D va_arg(valist, TC=
Gv_i64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movcond_i64(TCG_COND_GEU=
, t, t, t_max, t, t_nan);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 va_end(valist);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(cond1);<br></blockquote><div=
>forget to remove ?=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t_nan);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(t_max);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void generate_exception(DisasContext *ctx, int excp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(cpu_pc, ctx-&gt;base.pc_next);<br>
-- <br>
2.23.0<br>
<br></blockquote><div><br></div><div>=C2=A0</div><div>=C2=A0Chih-Min Chao</=
div><div>=C2=A0</div></div></div>

--0000000000001fba1d05a948045a--

