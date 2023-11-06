Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6888DC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:22:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r01QU-0005np-RS; Mon, 06 Nov 2023 10:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1r01QR-0005nH-DD
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 10:22:03 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1r01QO-0002Mp-0J
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 10:22:02 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c9b7c234a7so41676675ad.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 07:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1699284118; x=1699888918; darn=nongnu.org;
 h=mime-version:subject:references:in-reply-to:message-id:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sBsD9TocCL73ern+0Doz4BRDVe7LWWw1DfGdaCODFCc=;
 b=a4enxUM0p4QG89Kv4tT8yHF77Nbow6KbJ5iz9AdFPoAH/fAOw2ECvZHbukokuHURFt
 g/LKRhtOE+lnTuCTrnk4Ky6MzPJ7U3nOOpuYxLpVwyHVzQko0aSN8oC5z4Q8DUHST5K+
 vYMD5fzHW+FWku1rs6N17AYdbPfkyL1Y9PzVgxBaFI8vfGfLOrJOXKpRSmdDQfms5/8l
 ZmRGcKoaUyXOYYCgwAgCdB6eQV5uyefNaGamTyXqMxc1dQQTT3bt9YflFu0hmSZY1w6X
 eQkKcx20OOMigYNliHV8PJ58pcbbFW/AgM8bEbpIEILc6Jn0vNJSRvHB6ry8ageai5uz
 BQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699284118; x=1699888918;
 h=mime-version:subject:references:in-reply-to:message-id:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBsD9TocCL73ern+0Doz4BRDVe7LWWw1DfGdaCODFCc=;
 b=aIDjsw26Yz3S9NiFnLDZ2NLL2HrB8bKmj61De0Kj07SKsjUxjAozuo7x/aMIgZM3P8
 XtdbUkaS1HL8ffd+Pmjpo51pHMTbLLIjHvoRaWmjYAG2odaf2/6BrX9wRK0MBvcrZggL
 wWvx8241ys2np7b4IN3dPBXHNXEqkBQ26FshDgWazYaA97gf2eDha7DeoVYwqcbhfFpz
 DwfAw1R+91oKzuWFvXelhTIULaOfjpZkr5gY9wZgry+XDNg/7wPTeYaPFnEvN/coubAN
 /RDDQhBwLpmy3hJHkST0iJTj4C/E7OPAJdSL/NB6G1qkc3QacYCA02KFRowofEv2wQs3
 NCkA==
X-Gm-Message-State: AOJu0Ywxzsn425J+aGT7ywpZEgRL0eGAIx8dVjVNN/cmGKgYnT4wZmU9
 2FoTkCI0/HOQbcrKl63jW5vU+g==
X-Google-Smtp-Source: AGHT+IEr2wMMSePQV6t4tUCml3398TZ6HkIgpCj89I2GnTFGN2R0eDoYraSV5CcUpaIK1G/f+Md/Aw==
X-Received: by 2002:a17:903:20d4:b0:1cc:2dad:7ae9 with SMTP id
 i20-20020a17090320d400b001cc2dad7ae9mr24268861plb.32.1699284118130; 
 Mon, 06 Nov 2023 07:21:58 -0800 (PST)
Received: from [127.0.0.1] (111-249-81-178.dynamic-ip.hinet.net.
 [111.249.81.178]) by smtp.gmail.com with ESMTPSA id
 f1-20020a170902860100b001c61901ed2esm6001426plo.219.2023.11.06.07.21.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:21:57 -0800 (PST)
Date: Mon, 6 Nov 2023 23:21:48 +0800
From: Jerry ZJ <jerry.zhangjian@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, 
 frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <b1df8107-d0f1-4827-94bd-3f8c7cd3ea57@Spark>
In-Reply-To: <c2901c07-9eef-449c-857a-6d2553aeb170@ventanamicro.com>
References: <20231106111440.59995-1-jerry.zhangjian@sifive.com>
 <c2901c07-9eef-449c-857a-6d2553aeb170@ventanamicro.com>
Subject: Re: [PATCH] target/riscv: don't enable Zfa by default
X-Readdle-Message-ID: b1df8107-d0f1-4827-94bd-3f8c7cd3ea57@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65490491_7ee28cfa_135e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-pl1-x631.google.com
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

--65490491_7ee28cfa_135e7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

We do have some cases that failed. SiFive e-series cores (https://static.dev.sifive.com/SiFive-E21-Manual-v1p0.pdf) do not have F extension (For example: rv32imc_zicsr_zifencei_zba_zbb). When we use the corresponding extension options to configure QEMU, i.e., rv32, i=true, m=true, a=true, c=true, Zicsr=true, Zifencei=true, zba=true, zbb=true, the QEMU will have the following error.
Zfa extension requires F extension

IMHO, we should not enable Zfa extension by default, especially when Zfa requires F to be enabled implicitly.

Best Regards,
Jerry ZJ
SiFive Inc. Taiwan
On Nov 6, 2023 at 22:55 +0800, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wrote:
>
>
> On 11/6/23 08:14, Jerry Zhang Jian wrote:
> > - Zfa requires F, we should not assume all CPUs have F extension
> > support.
>
> We do not have a case where this happen, do we? The default CPUs have F
> enabled (see misa_ext_cfgs[] in target/riscv/tcg/tcg-cpu.c), so zfa being
> enable isn't a problem for them. Vendor CPUs might not have F enabled, but
> they don't use the default values for extensions, so they're not affected.
> Having zfa enabled by default does not hurt the default CPU setups we have.
>
> I am not a fan of these defaults for rv64 and so on, but once we set them to
> 'true' people can complain if we set them to 'false' because it might break
> existing configs in the wild. We need a strong case (i.e. a bug) to do so.
>
>
> Thanks,
>
> Daniel
>
>
> >
> > Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> > ---
> > target/riscv/cpu.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ac4a6c7eec..c9f11509c8 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1247,7 +1247,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
> > MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> > MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> > MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> > - MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> > + MULTI_EXT_CFG_BOOL("zfa", ext_zfa, false),
> > MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> > MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
> > MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),

--65490491_7ee28cfa_135e7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>We do have some cases that failed. Si=46ive e-serie=
s cores (<a href=3D=22https://static.dev.sifive.com/Si=46ive-E21-Manual-v=
1p0.pdf=22 target=3D=22=5Fblank=22>https://static.dev.sifive.com/Si=46ive=
-E21-Manual-v1p0.pdf</a>) do not have =46 extension (=46or example: rv32i=
mc=5Fzicsr=5Fzifencei=5Fzba=5Fzbb). When we use the corresponding extensi=
on options to configure QEMU, i.e., rv32, i=3Dtrue, m=3Dtrue, a=3Dtrue, c=
=3Dtrue, Zicsr=3Dtrue, Zifencei=3Dtrue, zba=3Dtrue, zbb=3Dtrue, the QEMU =
will have the following error.<br />
<span style=3D=22color:=23e6edf3;background-color:rgba(110, 118, 129, 0.4=
);font-family:ui-monospace, S=46Mono-Regular, S=46 Mono, Menlo, Consolas,=
 Liberation Mono, monospace;font-size: 11.9px=22>Zfa extension requires =46=
 extension</span><span style=3D=22font-size: 11.9px=22><br /></span><br /=
>
IMHO, we should not enable Zfa extension by default, especially when Zfa =
requires =46 to be enabled implicitly.</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Best Regards,
<div>Jerry ZJ</div>
<div><b>Si=46ive Inc. Taiwan</b></div>
</div>
</div>
<div name=3D=22messageReplySection=22>On Nov 6, 2023 at 22:55 +0800, Dani=
el Henrique Barboza &lt;dbarboza=40ventanamicro.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22><br />
<br />
On 11/6/23 08:14, Jerry Zhang Jian wrote:<br />
<blockquote type=3D=22cite=22>- Zfa requires =46, we should not assume al=
l CPUs have =46 extension<br />
support.<br /></blockquote>
<br />
We do not have a case where this happen, do we=3F The default CPUs have =46=
<br />
enabled (see misa=5Fext=5Fcfgs=5B=5D in target/riscv/tcg/tcg-cpu.c), so z=
fa being<br />
enable isn't a problem for them. Vendor CPUs might not have =46 enabled, =
but<br />
they don't use the default values for extensions, so they're not affected=
.<br />
Having zfa enabled by default does not hurt the default CPU setups we hav=
e.<br />
<br />
I am not a fan of these defaults for rv64 and so on, but once we set them=
 to<br />
'true' people can complain if we set them to 'false' because it might bre=
ak<br />
existing configs in the wild. We need a strong case (i.e. a bug) to do so=
.<br />
<br />
<br />
Thanks,<br />
<br />
Daniel<br />
<br />
<br />
<blockquote type=3D=22cite=22><br />
Signed-off-by: Jerry Zhang Jian &lt;jerry.zhangjian=40sifive.com&gt;<br /=
>
---<br />
target/riscv/cpu.c =7C 2 +-<br />
1 file changed, 1 insertion(+), 1 deletion(-)<br />
<br />
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br />
index ac4a6c7eec..c9f11509c8 100644<br />
--- a/target/riscv/cpu.c<br />
+++ b/target/riscv/cpu.c<br />
=40=40 -1247,7 +1247,7 =40=40 const RISCVCPUMultiExtConfig riscv=5Fcpu=5F=
extensions=5B=5D =3D =7B<br />
MULTI=5FEXT=5FC=46G=5FBOOL(=22zihintntl=22, ext=5Fzihintntl, true),<br />=

MULTI=5FEXT=5FC=46G=5FBOOL(=22zihintpause=22, ext=5Fzihintpause, true),<b=
r />
MULTI=5FEXT=5FC=46G=5FBOOL(=22zawrs=22, ext=5Fzawrs, true),<br />
- MULTI=5FEXT=5FC=46G=5FBOOL(=22zfa=22, ext=5Fzfa, true),<br />
+ MULTI=5FEXT=5FC=46G=5FBOOL(=22zfa=22, ext=5Fzfa, false),<br />
MULTI=5FEXT=5FC=46G=5FBOOL(=22zfh=22, ext=5Fzfh, false),<br />
MULTI=5FEXT=5FC=46G=5FBOOL(=22zfhmin=22, ext=5Fzfhmin, false),<br />
MULTI=5FEXT=5FC=46G=5FBOOL(=22zve32f=22, ext=5Fzve32f, false),<br /></blo=
ckquote>
</blockquote>
</div>
</body>
</html>

--65490491_7ee28cfa_135e7--


