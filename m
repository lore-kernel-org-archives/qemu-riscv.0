Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B133EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 06:46:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ792-00060K-UG; Tue, 11 Jul 2023 02:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ791-00060B-Mg
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 02:46:43 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ78z-0006Yj-QX
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 02:46:43 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7658430eb5dso594858785a.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689058000; x=1691650000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P0TCTtlW8uOZHIeFmg1gAPUeuv7kMtuqFuZ1OZNmtUs=;
 b=Do32wsSIH9RWwLD5QcXbeyROeFcUuj4n48V8xZ75FxXJjS03pBf8BgV2DOoFnMvOTA
 8X/ortNFkeHqUkTheB6zPfGaO3c0U5KLwCXX3BZlUHRg8yIkO/BykNI7s5ympvllj4Ga
 mNnjBnaoOlRzQFbQflUoU829M+KufJHKDxJyDEg4wVjw3D/u1Z6m4YoXaVu9sszHz/lC
 rlV8sEDU52xQoabpSDXNtQdkT4S/+XSGsRFWlgJtLmyttZDHqq4cAd7jB9yRyvHRfoQO
 UQddIaoCYm8OuxllaqvMAia0ouHhVrEtrI4Z/RReykEZaMr7mB0IUAgQc8kdAqvOneJW
 WdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689058000; x=1691650000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0TCTtlW8uOZHIeFmg1gAPUeuv7kMtuqFuZ1OZNmtUs=;
 b=dQ/cTGCI5k0Mgjx54zrNl9JKmfIpetBZvtH0ubD4g+Zmr0ebQMsGAZJKbw75pKy3W8
 MA2p1v42otSHJQKLVd3pu62ObOEamPyN59mSIBUudTuyR++0Fo0wypl8X3isP+4aoT3B
 XfCtGKOrE9nWskf0AQShdXbQsilOcm7QtTlZJKkqqCkew85UMz0pBtK+K7itgv/zawHn
 /jV0T1yoJIy4GcnDTw+rYPfH6Rm/Ir22JHKqu4ZPAnJeBrZA57EIfxhkppd2h7fg/VqB
 JZlVQStjIVx76lLyx6fy/fxUGqIs1xbeOzazmQ7buYOX/QGqiCLw/CgCC7Phoz7BVfUZ
 Qlfg==
X-Gm-Message-State: ABy/qLboAbaqnmUC45MLBHGaVZCin6hLo0JAV+gBZKpLNfZsqqWx9z9H
 drZXrZxIw7naZ2RZDdTJH43FwAsUkoZqEkf5sfrYiA==
X-Google-Smtp-Source: APBJJlEXhwO+vArM8x8mGo8q61nsinZHhCIq5oNKh8iF5WxovjOqSdUJYnOasgKjdal8KSkVwEF/hoW5+oeZu9m+/Q4=
X-Received: by 2002:a05:622a:1492:b0:400:9666:4349 with SMTP id
 t18-20020a05622a149200b0040096664349mr19212074qtx.46.1689058000660; Mon, 10
 Jul 2023 23:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230711054722.15721-1-jason.chien@sifive.com>
In-Reply-To: <20230711054722.15721-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Tue, 11 Jul 2023 14:46:28 +0800
Message-ID: <CADr__8o949b85jN7oXU1i52Bktm_dBw8wTbsY+X1ReeW6FhnVg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add Zihintntl extension ISA string to DTS
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="00000000000022830a06003076d2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=jason.chien@sifive.com; helo=mail-qk1-x729.google.com
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

--00000000000022830a06003076d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
I am sorry that I forgot to add "Reviewed-by". I will add "Reviewed-by" and
send v3 shortly.

Jason Chien

On Tue, Jul 11, 2023 at 1:47=E2=80=AFPM Jason Chien <jason.chien@sifive.com=
> wrote:

> RVA23 Profiles states:
> The RVA23 profiles are intended to be used for 64-bit application
> processors that will run rich OS stacks from standard binary OS
> distributions and with a substantial number of third-party binary user
> applications that will be supported over a considerable length of time
> in the field.
>
> The chapter 4 of the unprivileged spec introduces the Zihintntl extension
> and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose
> purpose is to enable application and operating system portability across
> different implementations. Thus the DTS should contain the Zihintntl ISA
> string in order to pass to software.
>
> The unprivileged spec states:
> Like any HINTs, these instructions may be freely ignored. Hence, although
> they are described in terms of cache-based memory hierarchies, they do no=
t
> mandate the provision of caches.
>
> These instructions are encoded with used opcode, e.g. ADD x0, x0, x2, whi=
ch
> QEMU already supports, and QEMU does not emulate cache. Therefore these
> instructions can be considered as a no-op, and we only need to add a new
> property for the Zihintntl extension.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..b7e99cccd9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -87,6 +87,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
> @@ -1755,6 +1756,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, true),
>      DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
>      DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2bd9510ba3..518686eaa3 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -66,6 +66,7 @@ struct RISCVCPUConfig {
>      bool ext_icbom;
>      bool ext_icboz;
>      bool ext_zicond;
> +    bool ext_zihintntl;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> --
> 2.17.1
>
>

--00000000000022830a06003076d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div>I am sorry that I forgot to add &quot;Reviewed=
-by&quot;. I will add &quot;Reviewed-by&quot; and send v3 shortly.</div><di=
v><br></div><div>Jason Chien</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 11, 2023 at 1:47=E2=80=AFPM J=
ason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com">jason.chien@sifive=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">RVA23 Profiles states:<br>
The RVA23 profiles are intended to be used for 64-bit application<br>
processors that will run rich OS stacks from standard binary OS<br>
distributions and with a substantial number of third-party binary user<br>
applications that will be supported over a considerable length of time<br>
in the field.<br>
<br>
The chapter 4 of the unprivileged spec introduces the Zihintntl extension<b=
r>
and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose<b=
r>
purpose is to enable application and operating system portability across<br=
>
different implementations. Thus the DTS should contain the Zihintntl ISA<br=
>
string in order to pass to software.<br>
<br>
The unprivileged spec states:<br>
Like any HINTs, these instructions may be freely ignored. Hence, although<b=
r>
they are described in terms of cache-based memory hierarchies, they do not<=
br>
mandate the provision of caches.<br>
<br>
These instructions are encoded with used opcode, e.g. ADD x0, x0, x2, which=
<br>
QEMU already supports, and QEMU does not emulate cache. Therefore these<br>
instructions can be considered as a no-op, and we only need to add a new<br=
>
property for the Zihintntl extension.<br>
<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0target/riscv/cpu_cfg.h | 1 +<br>
=C2=A02 files changed, 3 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 9339c0241d..b7e99cccd9 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -87,6 +87,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zic=
ond),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr=
),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_i=
fencei),<br>
+=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihin=
tntl),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ex=
t_zihintpause),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawr=
s),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),<=
br>
@@ -1755,6 +1756,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;sscofpmf&quot;, RISCVCPU, cfg.ex=
t_sscofpmf, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ex=
t_ifencei, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_i=
csr, true),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zihintntl&quot;, RISCVCPU, cfg.ext_zi=
hintntl, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zihintpause&quot;, RISCVCPU, cfg=
.ext_zihintpause, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zawrs&quot;, RISCVCPU, cfg.ext_z=
awrs, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfa&quot;, RISCVCPU, cfg.ext_zfa=
, true),<br>
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h<br>
index 2bd9510ba3..518686eaa3 100644<br>
--- a/target/riscv/cpu_cfg.h<br>
+++ b/target/riscv/cpu_cfg.h<br>
@@ -66,6 +66,7 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_icbom;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_icboz;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zicond;<br>
+=C2=A0 =C2=A0 bool ext_zihintntl;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zihintpause;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_smstateen;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_sstc;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000022830a06003076d2--

