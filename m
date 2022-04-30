Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkdU8-0008Hq-Cp
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 23:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdU4-0008HL-EH
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:09:24 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:34328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdU2-0005iT-1v
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:09:23 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id h31so3581636vsv.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CEDyFLI6JuOXrhUJnjqwbhzlHXMO0gl6yoiRNENSDyo=;
 b=GfRf0NXJ4yArXmLNGNc3ZuN/maEwoJZuM2CjM7JsVnEuz+Tgq2zB7KHKl1pkIS0eZk
 X2WfLma695s2s0dGXxJrBCzkHok4lT6ozRVjuWLwraH3ONt29BWjNv3IXDh/W/Odclc7
 xeG1SBioukemIN1X377iApgwmDInPclUEBQCGorcTlrvYcHURCYD6pfzagyjLuTkIdF2
 tKmSd7DPOjzwSaEtcevJPk0ntJCTtT3yOCXimsXX6A2O9F5gyfphDUDbIzsQhZI4fdMo
 xGPeqCC4EjfI+kVU6iZV8a620Q8xYI7ltqgMlJHvZUOMfMgrYidEd5eSExECJOzvJOR/
 e1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEDyFLI6JuOXrhUJnjqwbhzlHXMO0gl6yoiRNENSDyo=;
 b=jFtnBbTjs7zjByLqYVXpOgxeay+eG+z3QiCTK4kam0iBwx2mRFYsrcpJ48lEjk6FCN
 8PI+slxw79V5Su8ZTNFxMTi7A6Px/h1amQH2E95kgO+FyoMdqcbZkrLyqCMxKmPkzj47
 IyczJ8WumEv6mmpFUGzAKfskB1+qDp5OfKVnfDN1a26w30xprq10QMK9YkVW63OUo2ic
 mizFFjVf9NSF/AK2woAD0Cx4yGxNO0P3/oYwkXaCkg5StxsCK2B6D0l74+kgDL7+JzaN
 ACcyz06aJHmI7Ag9nOI8W+FF5n8zVNQJsnlXFZZSvUMl5axJejWUQ4VgKVurRdU5MhbQ
 CHzQ==
X-Gm-Message-State: AOAM531WaOXy9sNEAVVgLdS5Wv0PBFwFwLWGdQOZg9F8FDECTtjRpPpq
 u2O2UX7C0QmCtVrV2N5k/XZLrIAPvVtD1ktdwuE=
X-Google-Smtp-Source: ABdhPJyj6pOWBg7pAbTclHHa972BSWupgRA7BFxVe1+GIY1OZFGXRxtjzp1IzfspW8Wf2/OGTTRDzw==
X-Received: by 2002:a67:ee4f:0:b0:32c:ee75:6e98 with SMTP id
 g15-20020a67ee4f000000b0032cee756e98mr573240vsp.79.1651288159101; 
 Fri, 29 Apr 2022 20:09:19 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 t65-20020a1f4644000000b0034e6f1fd045sm129977vka.15.2022.04.29.20.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 20:09:17 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id q2so9222879vsr.5;
 Fri, 29 Apr 2022 20:09:17 -0700 (PDT)
X-Received: by 2002:a67:df10:0:b0:32d:ba4:8f73 with SMTP id
 s16-20020a67df10000000b0032d0ba48f73mr763219vsk.74.1651288157138; Fri, 29 Apr
 2022 20:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-4-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-4-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 11:09:06 +0800
X-Gmail-Original-Message-ID: <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
Message-ID: <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Consider priv spec version when
 generating ISA string
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="00000000000007333d05ddd67cdf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=frank.chang@sifive.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Sat, 30 Apr 2022 03:09:24 -0000

--00000000000007333d05ddd67cdf
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

If we want to limit the generated ISA string to/after a specific privilege
spec version.
Shouldn't we also check the privilege spec version when these extensions
are enabled?
Otherwise, it's possible that one extension is enabled,
but the privilege spec version is smaller than the one in which the
extension is supported.
(This is possible if user specifies the privileged spec version through the
command line.)
The ISA string therefore won't include the enabled extension.

Regards,
Frank Chang


On Fri, Apr 29, 2022 at 11:49 PM Anup Patel <apatel@ventanamicro.com> wrote:

> Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svinval,
> etc) are only available after Priv spec v1.12 so ISA string generation
> should check the minimum required priv spec version for all extensions.
>
> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> device tree")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 02ee7d45d8..d8c88b96bc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] =
> "IEMAFDQCPVH";
>  struct isa_ext_data {
>      const char *name;
>      bool enabled;
> +    uint32_t min_priv_ver;
>  };
>
>  const char * const riscv_int_regnames[] = {
> @@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void
> *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> +#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu->cfg.prop, priv}
>
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int
> max_str_len)
>  {
> @@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu,
> char **isa_str, int max_str_len)
>       *    extensions by an underscore.
>       */
>      struct isa_ext_data isa_edata_arr[] = {
> -        ISA_EDATA_ENTRY(zfh, ext_zfh),
> -        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> -        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> -        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> -        ISA_EDATA_ENTRY(zba, ext_zba),
> -        ISA_EDATA_ENTRY(zbb, ext_zbb),
> -        ISA_EDATA_ENTRY(zbc, ext_zbc),
> -        ISA_EDATA_ENTRY(zbs, ext_zbs),
> -        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> -        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> -        ISA_EDATA_ENTRY(svinval, ext_svinval),
> -        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> -        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> +        ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VERSION_1_12_0),
> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSION_1_12_0),
>      };
>
>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].enabled) {
> +        if (isa_edata_arr[i].enabled &&
> +            cpu->env.priv_ver >= isa_edata_arr[i].min_priv_ver) {
>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old = new;
> --
> 2.34.1
>
>
>

--00000000000007333d05ddd67cdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Anup,</div><div dir=3D"ltr"><br></div><div dir=3D"=
ltr">If we want to limit the generated ISA string to/after a specific privi=
lege spec version.</div><div>Shouldn&#39;t we also check the privilege spec=
 version when these extensions are enabled?</div><div>Otherwise, it&#39;s p=
ossible that one extension is enabled,</div><div>but the privilege spec ver=
sion is smaller than the one in which the extension is supported.</div><div=
>(This is possible if user specifies the privileged spec version through th=
e command line.)</div><div>The ISA string therefore won&#39;t include the e=
nabled extension.</div><div><br></div><div>Regards,</div><div>Frank Chang</=
div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Apr 29, 2022 at 11:49 PM Anup Patel &lt;<a href=3D"mai=
lto:apatel@ventanamicro.com">apatel@ventanamicro.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Most of the multi-lette=
r extensions (such as Svpbmt, Svnapot, Svinval,<br>
etc) are only available after Priv spec v1.12 so ISA string generation<br>
should check the minimum required priv spec version for all extensions.<br>
<br>
Fixes: a775398be2e (&quot;target/riscv: Add isa extenstion strings to the<b=
r>
device tree&quot;)<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 36 +++++++++++++++++++-----------------<br>
=C2=A01 file changed, 19 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 02ee7d45d8..d8c88b96bc 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] =3D &quot;IE=
MAFDQCPVH&quot;;<br>
=C2=A0struct isa_ext_data {<br>
=C2=A0 =C2=A0 =C2=A0const char *name;<br>
=C2=A0 =C2=A0 =C2=A0bool enabled;<br>
+=C2=A0 =C2=A0 uint32_t min_priv_ver;<br>
=C2=A0};<br>
<br>
=C2=A0const char * const riscv_int_regnames[] =3D {<br>
@@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *=
data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, riscv_cpu_properties);<br>
=C2=A0}<br>
<br>
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu-&gt;cfg.prop}<br>
+#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu-&gt;cfg.prop, priv}<=
br>
<br>
=C2=A0static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int m=
ax_str_len)<br>
=C2=A0{<br>
@@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 extensions by an underscore.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0struct isa_ext_data isa_edata_arr[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_1=
2_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSI=
ON_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION=
_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION=
_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_V=
ERSION_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION=
_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_1=
2_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_1=
2_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_1=
2_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_1=
2_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSI=
ON_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSI=
ON_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VER=
SION_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VER=
SION_1_12_0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSI=
ON_1_12_0),<br>
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(isa_edata_arr); i++) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (isa_edata_arr[i].enabled &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.priv_ver &gt;=3D isa=
_edata_arr[i].min_priv_ver) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new =3D g_strconcat(old, &q=
uot;_&quot;, isa_edata_arr[i].name, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(old);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old =3D new;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000007333d05ddd67cdf--

