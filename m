Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC8EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 05:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGv4X-0001Rd-K4; Wed, 05 Jul 2023 01:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1qGv4W-0001R4-7U
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 01:29:00 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1qGv4T-0003bX-Qe
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 01:28:59 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso9755817e87.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Jul 2023 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688534935; x=1691126935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IRpNPwmKya6i+NN8HgR6KqJWm2gGh6nOq9jxBn8oquU=;
 b=DepCqlpeTqlJKoC/gQNRz2DSQac2a3lQltVzU25yzDR/yXhsM9IeiYkBtXa0P2DPXq
 oANTmwSk8DnstkOdENeI1XndPag7HBbUTr9Dp9Hx5+tUSuqJa52mNPatWnj6Bewl3ij+
 GMmzkEQDItbo/noY3xNeRZxjxPuUqHLOeL8SO/EqDCLYYRo4JaiINDFYehWkxREVoEv5
 HyKocpmH4iHpJgLo1KklCkLi/4bZkHdwXvYPyWy7vrBZRW8cwergPX4GuPkSEXJd1++t
 7cgvD79zqAp/VV2zE8GMZBxwra7dwse83erju1BL4+z+6Q0C2U/C0p20zKg1aQEVkJh7
 o8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688534935; x=1691126935;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IRpNPwmKya6i+NN8HgR6KqJWm2gGh6nOq9jxBn8oquU=;
 b=hURA+ReGWZX8f61iPloYwjYCjV/SP7V3T/izN7wqcEowUZci/Y76i+cZOinXdcUvON
 3SID8Zt4dHaQ/XiO7H9+b2Iwsjs/JkpoQg/uo0FXleiewefV7PbU4ZKAwaxuwTgJju1J
 1WShwtgOgk3YqlHpnf4EFNfVUa6PtDSmfmHXoAmsEkan1leq8ekv8vC4K0knsJdBYmRK
 8WQmDlbcEN4uu5eQUOqJE+vJDr+MdrLT+ut4kwSLLVVOdKUs3HyM3LIWDlEwrFa0cHfY
 1KFUo3bfqLrp3BUKZ3shuLFbUS2BUPHC3HSDJaCSQTgW2EKqaEhiczRbN8YJ5Ya0K35F
 P8Cg==
X-Gm-Message-State: ABy/qLaxidU7Sqd63O4cjW6xsbrnY+CANGsww6SlBGuBSXShuWA2P47p
 4fQ80KLJuZFEcVtYck2XQI9/xw==
X-Google-Smtp-Source: APBJJlH36MQBPUdUFUYjBqn++CjSEXDBqgKGvhwo83jwiuXVwKmMW9KkVtNGEcdk/D749Wu6Auc60Q==
X-Received: by 2002:a19:4f10:0:b0:4f8:5dd2:21f5 with SMTP id
 d16-20020a194f10000000b004f85dd221f5mr9937011lfb.67.1688534934940; 
 Tue, 04 Jul 2023 22:28:54 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 p5-20020a19f005000000b004fbbf5db0a5sm436151lfc.100.2023.07.04.22.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 22:28:54 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso101464791fa.0; 
 Tue, 04 Jul 2023 22:28:54 -0700 (PDT)
X-Received: by 2002:a05:651c:d4:b0:2b6:df5d:8e08 with SMTP id
 20-20020a05651c00d400b002b6df5d8e08mr6873343ljr.28.1688534934111; Tue, 04 Jul
 2023 22:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230704084013.21749-1-jason.chien@sifive.com>
In-Reply-To: <20230704084013.21749-1-jason.chien@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 5 Jul 2023 13:28:42 +0800
X-Gmail-Original-Message-ID: <CANzO1D3GRUqkdfS1_PcriMAc+Z14bWhtM2FTrV7VQuNBLO74Sg@mail.gmail.com>
Message-ID: <CANzO1D3GRUqkdfS1_PcriMAc+Z14bWhtM2FTrV7VQuNBLO74Sg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add Zihintntl extension ISA string to DTS
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000f04a7605ffb6acf2"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x133.google.com
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

--000000000000f04a7605ffb6acf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Tue, Jul 4, 2023 at 4:41=E2=80=AFPM Jason Chien <jason.chien@sifive.com>=
 wrote:

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
> index 881bddf393..6fd21466a4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
> @@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, true),
>      DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
>      DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..c7da2facef 100644
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
>

--000000000000f04a7605ffb6acf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 4:41=E2=
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
index 881bddf393..6fd21466a4 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {<br=
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
=C2=A0 =C2=A0 =C2=A0ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),<=
br>
@@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
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
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, cfg.ext_zfh=
, false),<br>
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h<br>
index c4a627d335..c7da2facef 100644<br>
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
<br>
</blockquote></div>

--000000000000f04a7605ffb6acf2--

