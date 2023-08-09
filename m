Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5CC001B0
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 06:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTcWE-0005UG-Ol; Wed, 09 Aug 2023 02:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTcWC-0005TO-Uq
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 02:18:04 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTcWA-0006xk-Rr
 for qemu-riscv@nongnu.org; Wed, 09 Aug 2023 02:18:04 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9ab1725bbso101319761fa.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691561880; x=1692166680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Or0p23hOAO5Yt+sSYF4t7ng4wTzCa5mJHjVwHaV2gjg=;
 b=LLHsZ1aCVS8FHuioqyAz1Ut2+Ma9lmI1xMEN5sHBEnaFkNlM/EsFGhPpFXNdwuaBcB
 rvJFyOvmPveuzxdJgoR2kIZgbdnfit0bDDemC9dSg7QGBK7XMD7o+ylYu1MFxZbf6Azr
 oHgs89pnIiHlmAhbyHszEDZ8jd0CH89ErmlHZeyTJKcsNMELLVrnbbIo/eGsiJ7H1HWs
 mBrUoK7Ut3pDddyuammkSNgsYHx8AvO4Ey5CyeGMEJxDFkxYFaRX9561dTczhVSh6YVN
 BJMNPerb+AYHR4VSb7O2k8Ug364VTKIuHlH6yCocNb7RQubqywVU/T7qC5os86l2DC4g
 axEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691561880; x=1692166680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Or0p23hOAO5Yt+sSYF4t7ng4wTzCa5mJHjVwHaV2gjg=;
 b=b2SEIkYRuU/jWT9xOo2EZpkaP8lm3dR5lbi/VGe9Doa0YMg4uA8csk0URE6cbrOFch
 B3RDMJy3V8clr3Aw+H5vggXSdKrcfSC3ZEV1G5YYsvlFEvxhYd7XbyXrJatI0YY1y07v
 2MPSVcoeFPyZZOzqwuBtagRx/6aRVHz56vpc1GjUQwxKDzYZRDHEaPLFsDtQom/MdFrK
 VLceFK53IFyVTXnbn8uhUS3UTA4SUYDQxJLvoWq4XSXe6HysuxvPy6iuJ/hZqb8lrOW6
 /W/nyEqOVU8GWpFF/Foz34AjM+FQBOsfO5dqkXaBPpf7+XI1QfKfMBCkaqd22D3BozhJ
 WLQQ==
X-Gm-Message-State: AOJu0Yzh0H5KzxMNxPBOH3qZodk1dsVEHBe3lP6o0pwQMVu63XjEHwZ7
 RqZTgyFUYVDyPpsQyw3SJ29+l6SYw7j9vNlUJWbpBg==
X-Google-Smtp-Source: AGHT+IGWiKr/5JtDa2hFx0J+uNX4hMU2Vnh+htwlJ5MxNK2cPFMOHnYTfhosD5UiWQVJtbI8QYX8H6fwvkJmW8kO25E=
X-Received: by 2002:a2e:b693:0:b0:2b9:575e:5298 with SMTP id
 l19-20020a2eb693000000b002b9575e5298mr1135653ljo.13.1691561880223; Tue, 08
 Aug 2023 23:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230726074049.19505-1-jason.chien@sifive.com>
 <20230726074049.19505-2-jason.chien@sifive.com>
In-Reply-To: <20230726074049.19505-2-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Wed, 9 Aug 2023 14:17:48 +0800
Message-ID: <CADr__8qKbbBEWLsTTVoaqUHVg=C7W3+zuvMv1Kf38qzMJ3ZviQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 1/1] target/riscv: Add Zihintntl extension ISA
 string to DTS
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000fcaa5b06027770c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000fcaa5b06027770c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

This patch seems to be ignored.
patch link:
https://lore.kernel.org/qemu-devel/20230726074049.19505-2-jason.chien@sifiv=
e.com/

On Wed, Jul 26, 2023 at 3:41=E2=80=AFPM Jason Chien <jason.chien@sifive.com=
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
> These instructions are encoded with non-used opcode, e.g. ADD x0, x0, x2,
> which QEMU already supports, and QEMU does not emulate cache. Therefore
> these instructions can be considered as a no-op, and we only need to add
> a new property for the Zihintntl extension.
>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 921c19e6cd..a49e934b41 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -87,6 +87,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
> @@ -1763,6 +1764,7 @@ static Property riscv_cpu_extensions[] =3D {
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

--000000000000fcaa5b06027770c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<div><br>This patch seems to be ignored.<br>patch link=
:=C2=A0<a href=3D"https://lore.kernel.org/qemu-devel/20230726074049.19505-2=
-jason.chien@sifive.com/">https://lore.kernel.org/qemu-devel/20230726074049=
.19505-2-jason.chien@sifive.com/</a></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 26, 2023 at 3:41=E2=
=80=AFPM Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com">jason.ch=
ien@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">RVA23 Profiles states:<br>
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
These instructions are encoded with non-used opcode, e.g. ADD x0, x0, x2,<b=
r>
which QEMU already supports, and QEMU does not emulate cache. Therefore<br>
these instructions can be considered as a no-op, and we only need to add<br=
>
a new property for the Zihintntl extension.<br>
<br>
Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" targ=
et=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0target/riscv/cpu_cfg.h | 1 +<br>
=C2=A02 files changed, 3 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 921c19e6cd..a49e934b41 100644<br>
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
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmu=
l),<br>
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawr=
s),<br>
@@ -1763,6 +1764,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
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

--000000000000fcaa5b06027770c6--

