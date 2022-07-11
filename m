Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAoYJ-0000oG-MJ
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 04:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oAoYH-0000nq-0v
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 04:13:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1oAoYE-0001wR-TK
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 04:13:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id g126so4169126pfb.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Jul 2022 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rpUbkuTQdUddEKkOXn0k7t4grR2gHM5eNP//j9YHX38=;
 b=Y5WW7yrJZ7B4hRjeSiVrPZeFl6lf9++rk0uMDO809HI34iwQ1U8t/oVTw0yMLHRYE4
 rrFb2peyv7P5OxwCzHWU2PTg4/Nwnhn9rNQvnn2aCSH6b7fBFd3kYz4qn7whcIq1LOn1
 kUQtfOzksfGhi91Yeli9X3ABWjGzDY4EyBVoudwkG6HDSETp3kIf2gcAnDsnT38Gully
 DB9ldYw/INkrL+ofROHO9MWS8sD2SeseNtFd5moSD/ZgQmd61hNphN1oyjxVUESwKlqU
 WNdGDNFi4yOS66N9UR0Gbkib9kgd9huFsKJDrv+ruvNwxOjxcfZ3aLen4gSJvhHEYIt+
 E1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rpUbkuTQdUddEKkOXn0k7t4grR2gHM5eNP//j9YHX38=;
 b=Ev8ZJxqqZA4wVttp+DEXtOQTbOvYpx8HdME7VYwFEyE2K2TwtLmeRi/9a0Vu1yfLHs
 9DALwq17OI9ayjy+VIVTc6q3KS88WXw6z0v/8LgJSPH81AxsmMT6T9gReh0q7bzWR/RO
 H+5CZotstNJzFXdsJxmN7OXtd9V4X89ypkbbNDy+REexn11cgCkaBC+JLgPuISm1Io+F
 7JTDJQGNUTR43a75d8SwDZk8KNb7mDwYkPqECa1xQIubbdFy8rdgx/cEEgNRNYlZCi25
 jOS+KBONxhfZ18Yf8wJFe1zfccdcaqztHIdCCeGvXo7uWTRN9Kha0Fru3sLZuXw3oDwt
 AIdA==
X-Gm-Message-State: AJIora/V/ZHLR//tPDK3BP7ovx/yamq9ofOfme1NWTlLG4n3EOKh0fg5
 ILXpj/ZC0KFmXY4WsTNrD+r5xG6Mk6DD9jidaTPRAg==
X-Google-Smtp-Source: AGRyM1vpmrMoT7MNDeKdXaXHboVlLrDCVNfSTWYu/QUcMJ90zrOIKYToxm9xac5kgdAO21zyXrLOm+u4r74aX+/q7Qk=
X-Received: by 2002:a05:6a00:852:b0:528:c669:ad65 with SMTP id
 q18-20020a056a00085200b00528c669ad65mr17184393pfk.75.1657527232910; Mon, 11
 Jul 2022 01:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220708073943.54781-1-kito.cheng@sifive.com>
 <20220708073943.54781-2-kito.cheng@sifive.com>
In-Reply-To: <20220708073943.54781-2-kito.cheng@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 11 Jul 2022 16:13:42 +0800
Message-ID: <CAE_xrPiT+s0=CrPpJV_=A1E12oyzEm_=sjuK9GGRWGv8pUsMLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Auto set elen from vector extension by
 default
To: Kito Cheng <kito.cheng@sifive.com>
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="000000000000ec6dfb05e3832115"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Mon, 11 Jul 2022 08:13:57 -0000

--000000000000ec6dfb05e3832115
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 3:39 PM Kito Cheng <kito.cheng@sifive.com> wrote:

> Default ELEN is setting to 64 for now, which is incorrect setting for
> Zve32*, and spec has mention minimum VLEN and supported EEW in chapter
> "Zve*: Vector Extensions for Embedded Processors" is 32 for Zve32.
>
> ELEN actaully could be derived from which extensions are enabled,
> so this patch set elen to 0 as auto detect, and keep the capability to
> let user could configure that.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/cpu.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 487d0faa63..c1b96da7da 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -751,13 +751,22 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen == 0) {
> +              if (cpu->cfg.ext_zve32f) {
> +                cpu->cfg.elen = 32;
> +              }
> +              if (cpu->cfg.ext_zve64f || cpu->cfg.ext_v) {
> +                cpu->cfg.elen = 64;
> +              }
> +            }
> +            if (cpu->cfg.elen != 0 && (cpu->cfg.elen > 64 ||
> +                                       cpu->cfg.elen < 8)) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports
> ELEN "
>                          "in the range [8, 64]");
>                  return;
>              }
>

Should we also check whether cpu->cfg.elen set by user must >= 32 if Zve32f
is enabled?
Same for Zve64f.

Regards,
Frank Chang


> -            if (cpu->cfg.vlen < cpu->cfg.elen) {
> +            if (cpu->cfg.elen != 0 && cpu->cfg.vlen < cpu->cfg.elen) {
>                  error_setg(errp,
>                          "Vector extension VLEN must be greater than or
> equal "
>                          "to ELEN");
> @@ -901,7 +910,8 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +    /* elen = 0 means set from v or zve* extension */
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 0),
>
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> --
> 2.34.0
>
>

--000000000000ec6dfb05e3832115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Jul 8, 2022 at 3:39 PM Kito Cheng=
 &lt;<a href=3D"mailto:kito.cheng@sifive.com">kito.cheng@sifive.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Default ELEN is setting to 64 for now, which is incorrec=
t setting for<br>
Zve32*, and spec has mention minimum VLEN and supported EEW in chapter<br>
&quot;Zve*: Vector Extensions for Embedded Processors&quot; is 32 for Zve32=
.<br>
<br>
ELEN actaully could be derived from which extensions are enabled,<br>
so this patch set elen to 0 as auto detect, and keep the capability to<br>
let user could configure that.<br>
<br>
Signed-off-by: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com" targ=
et=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 16 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 487d0faa63..c1b96da7da 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -751,13 +751,22 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Vector extension ELEN must be power of 2&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen &gt; 64 || =
cpu-&gt;cfg.vlen &lt; 8) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen =3D=3D 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_zve32=
f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.elen =
=3D 32;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_zve64=
f || cpu-&gt;cfg.ext_v) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.elen =
=3D 64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen !=3D 0 &amp=
;&amp; (cpu-&gt;cfg.elen &gt; 64 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;c=
fg.elen &lt; 8)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(er=
rp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Vector extension implementation only supports ELEN &=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;in the range [8, 64]&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br>=
</div><div>Should we also check whether cpu-&gt;cfg.elen set by user must &=
gt;=3D 32 if Zve32f is enabled?</div><div>Same for Zve64f.</div><div><br></=
div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.vlen &lt; cpu-&g=
t;cfg.elen) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen !=3D 0 &amp=
;&amp; cpu-&gt;cfg.vlen &lt; cpu-&gt;cfg.elen) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(er=
rp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Vector extension VLEN must be greater than or equal =
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;to ELEN&quot;);<br>
@@ -901,7 +910,8 @@ static Property riscv_cpu_extensions[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;priv_spec&quot;, RISCVCPU, cfg=
.priv_spec),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;vext_spec&quot;, RISCVCPU, cfg=
.vext_spec),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT16(&quot;vlen&quot;, RISCVCPU, cfg.vlen=
, 128),<br>
-=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;elen&quot;, RISCVCPU, cfg.elen, 64)=
,<br>
+=C2=A0 =C2=A0 /* elen =3D 0 means set from v or zve* extension */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;elen&quot;, RISCVCPU, cfg.elen, 0),=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;svinval&quot;, RISCVCPU, cfg.ext=
_svinval, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;svnapot&quot;, RISCVCPU, cfg.ext=
_svnapot, false),<br>
-- <br>
2.34.0<br>
<br>
</blockquote></div></div>

--000000000000ec6dfb05e3832115--

