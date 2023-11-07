Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE947C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 02:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0CDl-0004MB-NO; Mon, 06 Nov 2023 21:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1r0CDb-0003su-Mt
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 21:53:33 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1r0CDQ-0006fC-7T
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 21:53:31 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c9b7c234a7so47379595ad.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 18:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1699325599; x=1699930399; darn=nongnu.org;
 h=mime-version:subject:references:in-reply-to:message-id:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2T7GEypH8x5B7xWZyByE6/ICkrtZZKRyEqFFaHWyx/M=;
 b=J9hBxRA6t39MMM9dkDldNcS6JwyYFoRDgxuMABThmJgZC0yEMpyuYhc7w++WfLttys
 Lde3nIlUtA9kXpoXotOe52e/EIfk0gre6gOKtY6eAGzs2grOCkiQQ55AjSKNO6xmdJ07
 2V3KEOBIWNjpW7iaHrCtzBn4+YHHCQ4LtMRX/uVxQ28fUyhXH/PKouVsy3pwmfCTUf8D
 JzWd9CCSS53Vnbc3SIfd43btYAEsIjmaqpeCRezCLogwwdaPzDxgBwR9t/UIsHj1UsMO
 bSnpgTJOVd2zpYKqvKqdnnr9HzBEtidT+6jGNJGovSAkLsEC1F1kDDtcUC2D/3ABRvR7
 BBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699325599; x=1699930399;
 h=mime-version:subject:references:in-reply-to:message-id:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2T7GEypH8x5B7xWZyByE6/ICkrtZZKRyEqFFaHWyx/M=;
 b=bqSB862yX0RZLcbyYG4UXYxKfDxwmqW9kvG3fxFuObhbIdwVId60LvYfJpF9nf5yRO
 +YUpHa9+MC2sbqQZklJDhO1O5h1z0smat4PmEPiwnau03cCAF5oLFzHanY6Zjvbqa4Js
 ZdrPtgVVpZ0hC8E/byLcvWQZDIGLAnGuTZbo+RUmgkqtd0B4bZZKKXFHCTfn5ak9EluO
 oCy+JoGWJQ35lqQtU/nad4UNTuj4rHJxyG2op7uqhat7N94AxqNlJEQ89E9bRl/6B7lY
 A/nTePvSM3lvwEf0o8EsoVq/lCfomtaYZvzC/T5lvNc718jtF/85XuFZKKh7NtE03ZPh
 hIMQ==
X-Gm-Message-State: AOJu0YwMPr/G9aSyAgNJR9wTBvmVlZj9dsx3IrsV0/Ln0IbdtMyuiuwY
 cOkKbCV4ABHjCKoDGVM+pkLi2A==
X-Google-Smtp-Source: AGHT+IGCKwJVRQBLZFO4CM9m/CfZl0ZKnMMqoz7HBqelvel3QfaCEvrcVtEQ9XFbvlSA78cgI3Ddhw==
X-Received: by 2002:a17:90b:18e:b0:27d:2663:c5f4 with SMTP id
 t14-20020a17090b018e00b0027d2663c5f4mr30910892pjs.47.1699325598608; 
 Mon, 06 Nov 2023 18:53:18 -0800 (PST)
Received: from [127.0.0.1] (111-249-77-117.dynamic-ip.hinet.net.
 [111.249.77.117]) by smtp.gmail.com with ESMTPSA id
 lt19-20020a17090b355300b0027d12b1e29dsm6187064pjb.25.2023.11.06.18.53.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Nov 2023 18:53:18 -0800 (PST)
Date: Tue, 7 Nov 2023 10:53:08 +0800
From: Jerry ZJ <jerry.zhangjian@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, 
 frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <258be47f-97be-4308-bed5-dc34ef7ff954@Spark>
In-Reply-To: <0fbc4857-d9b3-4327-8a00-3fb277f05ef5@ventanamicro.com>
References: <20231106111440.59995-1-jerry.zhangjian@sifive.com>
 <c2901c07-9eef-449c-857a-6d2553aeb170@ventanamicro.com>
 <b1df8107-d0f1-4827-94bd-3f8c7cd3ea57@Spark>
 <0fbc4857-d9b3-4327-8a00-3fb277f05ef5@ventanamicro.com>
Subject: Re: [PATCH] target/riscv: don't enable Zfa by default
X-Readdle-Message-ID: 258be47f-97be-4308-bed5-dc34ef7ff954@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6549a699_340f8c63_135e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-pl1-x630.google.com
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

--6549a699_340f8c63_135e7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Use use mode QEMU can reproduce this
Reproduce steps

Compile: riscv64-unknown-elf-clang -march=rv32imac_zicsr_zifencei_zba_zbb ./test.c -o hello_rv32imac

Run: qemu-riscv32 -cpu rv32,g=false,f=false,v=false,d=false,e=false,h=false,c=true,m=true,i=true,a=true,Zicsr=true,Zifencei=true,zmmul=true,zba=true,zbb=true ./hello_rv32imac

Then you will get the following error message:
qemu-riscv32: Zfa extension requires F extension

Since Zfa has just been ratified, I suppose disabling it by default makes sense and will not break anything that exists.

Best Regards,
Jerry ZJ
SiFive Inc. Taiwan
On Nov 7, 2023 at 00:38 +0800, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wrote:
>
>
> On 11/6/23 12:21, Jerry ZJ wrote:
> > We do have some cases that failed. SiFive e-series cores (https://static.dev.sifive.com/SiFive-E21-Manual-v1p0.pdf <https://static.dev.sifive.com/SiFive-E21-Manual-v1p0.pdf>) do not have F extension (For example: rv32imc_zicsr_zifencei_zba_zbb). When we use the corresponding extension options to configure QEMU, i.e., rv32, i=true, m=true, a=true, c=true, Zicsr=true, Zifencei=true, zba=true, zbb=true, the QEMU will have the following error.
> > Zfa extension requires F extension
>
> Can you send your whole command line? I'm unable to reproduce it here. This
> will boot:
>
> ./build/qemu-system-riscv32 -M virt -cpu rv32,i=true,m=true,a=true,c=true,zicsr=true,zifencei=true,zba=true,zbb=true --nographic
>
>
> In a side note, we have a new CPU type (still pending, not yet queue) called
> "rv64i", which comes only with 'RVI' enabled and nothing else - no defaults,
> nothing.
>
> I believe this use case you testing here would benefit from a "rv32i" CPU that
> does the same but for 32 bits. Then you can specify the whole CPU and not worry
> about hidden defaults. Does that makes sense?
>
> >
> > IMHO, we should not enable Zfa extension by default, especially when Zfa requires F to be enabled implicitly.
>
> If the rv32 use case you mentioned is really breaking because of zfa and
> Fm, I'm fine with disabling zfa because it's now a bug. We just need a
> reproducer.
>
>
> Thanks,
>
> Daniel
>
> >
> > Best Regards,
> > Jerry ZJ
> > *SiFive Inc. Taiwan*
> > On Nov 6, 2023 at 22:55 +0800, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wrote:
> > >
> > >
> > > On 11/6/23 08:14, Jerry Zhang Jian wrote:
> > > > - Zfa requires F, we should not assume all CPUs have F extension
> > > > support.
> > >
> > > We do not have a case where this happen, do we? The default CPUs have F
> > > enabled (see misa_ext_cfgs[] in target/riscv/tcg/tcg-cpu.c), so zfa being
> > > enable isn't a problem for them. Vendor CPUs might not have F enabled, but
> > > they don't use the default values for extensions, so they're not affected.
> > > Having zfa enabled by default does not hurt the default CPU setups we have.
> > >
> > > I am not a fan of these defaults for rv64 and so on, but once we set them to
> > > 'true' people can complain if we set them to 'false' because it might break
> > > existing configs in the wild. We need a strong case (i.e. a bug) to do so.
> > >
> > >
> > > Thanks,
> > >
> > > Daniel
> > >
> > >
> > > >
> > > > Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> > > > ---
> > > > target/riscv/cpu.c | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index ac4a6c7eec..c9f11509c8 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -1247,7 +1247,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
> > > > MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> > > > MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> > > > MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> > > > - MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> > > > + MULTI_EXT_CFG_BOOL("zfa", ext_zfa, false),
> > > > MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> > > > MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
> > > > MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),

--6549a699_340f8c63_135e7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Use use mode QEMU can reproduce this<br />
Reproduce steps<br />
<br />
Compile: riscv64-unknown-elf-clang -march=3Drv32imac=5Fzicsr=5Fzifencei=5F=
zba=5Fzbb ./test.c -o hello=5Frv32imac<br />
<br />
Run: qemu-riscv32 -cpu rv32,g=3Dfalse,f=3Dfalse,v=3Dfalse,d=3Dfalse,e=3Df=
alse,h=3Dfalse,c=3Dtrue,m=3Dtrue,i=3Dtrue,a=3Dtrue,Zicsr=3Dtrue,Zifencei=3D=
true,zmmul=3Dtrue,zba=3Dtrue,zbb=3Dtrue ./hello=5Frv32imac<br />
<br />
Then you will get the following error message:<br />
qemu-riscv32: Zfa extension requires =46 extension<br />
<br />
Since Zfa has just been ratified, I suppose disabling it by default makes=
 sense and will not break anything that exists.</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Best Regards,
<div>Jerry ZJ</div>
<div><b>Si=46ive Inc. Taiwan</b></div>
</div>
</div>
<div name=3D=22messageReplySection=22>On Nov 7, 2023 at 00:38 +0800, Dani=
el Henrique Barboza &lt;dbarboza=40ventanamicro.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22><br />
<br />
On 11/6/23 12:21, Jerry ZJ wrote:<br />
<blockquote type=3D=22cite=22>We do have some cases that failed. Si=46ive=
 e-series cores (https://static.dev.sifive.com/Si=46ive-E21-Manual-v1p0.p=
df &lt;https://static.dev.sifive.com/Si=46ive-E21-Manual-v1p0.pdf&gt;) do=
 not have =46 extension (=46or example: rv32imc=5Fzicsr=5Fzifencei=5Fzba=5F=
zbb). When we use the corresponding extension options to configure QEMU, =
i.e., rv32, i=3Dtrue, m=3Dtrue, a=3Dtrue, c=3Dtrue, Zicsr=3Dtrue, Zifence=
i=3Dtrue, zba=3Dtrue, zbb=3Dtrue, the QEMU will have the following error.=
<br />
Zfa extension requires =46 extension<br /></blockquote>
<br />
Can you send your whole command line=3F I'm unable to reproduce it here. =
This<br />
will boot:<br />
<br />
./build/qemu-system-riscv32 -M virt -cpu rv32,i=3Dtrue,m=3Dtrue,a=3Dtrue,=
c=3Dtrue,zicsr=3Dtrue,zifencei=3Dtrue,zba=3Dtrue,zbb=3Dtrue --nographic<b=
r />
<br />
<br />
In a side note, we have a new CPU type (still pending, not yet queue) cal=
led<br />
=22rv64i=22, which comes only with 'RVI' enabled and nothing else - no de=
faults,<br />
nothing.<br />
<br />
I believe this use case you testing here would benefit from a =22rv32i=22=
 CPU that<br />
does the same but for 32 bits. Then you can specify the whole CPU and not=
 worry<br />
about hidden defaults. Does that makes sense=3F<br />
<br />
<blockquote type=3D=22cite=22><br />
IMHO, we should not enable Zfa extension by default, especially when Zfa =
requires =46 to be enabled implicitly.<br /></blockquote>
<br />
If the rv32 use case you mentioned is really breaking because of zfa and<=
br />
=46m, I'm fine with disabling zfa because it's now a bug. We just need a<=
br />
reproducer.<br />
<br />
<br />
Thanks,<br />
<br />
Daniel<br />
<br />
<blockquote type=3D=22cite=22><br />
Best Regards,<br />
Jerry ZJ<br />
*Si=46ive Inc. Taiwan*<br />
On Nov 6, 2023 at 22:55 +0800, Daniel Henrique Barboza &lt;dbarboza=40ven=
tanamicro.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22><br />
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
</blockquote>
</blockquote>
</div>
</body>
</html>

--6549a699_340f8c63_135e7--


