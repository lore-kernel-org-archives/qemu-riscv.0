Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E45D69113
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 14:21:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGfOp-0004no-L9; Thu, 28 Nov 2024 09:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tGfOn-0004n9-0J
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:21:41 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tGfOk-00020Z-4A
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 09:21:40 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffdf564190so9706121fa.3
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732803696; x=1733408496; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXzV769INCFEmjzCnLh8ZWhwThXu0Qb6bYCR7og3els=;
 b=SNLp+0SCyUwdHFBM2Yn5sm4s0dG91/B24ac2dBYjwZMJ4dKptdJjKqFeOE5tHwgZEA
 Si+AdMesufdKo3eWx7f4nVRgrt8aTGGfTITW1c3d4GxfCGlf7PCiwMaPZz+UNEOLdMsI
 nwV5cIuwcRr3UbFt+1Groz2RvlptBU3YljurZ5eku/Ce4t8fPUjtuGAr6vzg0Ki9dq4l
 QHwWCQjhI3IFMvQTH6Ll9l9WBQcArlLHqWkvtEhDnCUz+D9RO8IQqzaViSg06l+0/c70
 KI1sUSoHuQrZ84LwsEihIpG+OuHVXqzxqjm11RR2UA5SN+QXfhmorCusOtuA3LsV+R3q
 qYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803696; x=1733408496;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mXzV769INCFEmjzCnLh8ZWhwThXu0Qb6bYCR7og3els=;
 b=uRPJZVJBxYpHn6cHAEMZ3CNc1M01krFMw4SpB6pTEraltgrxFkQztYbk4InCXvv5JI
 Uv4qrBMYCCYThXzYF0laED2ZCP6VqS+qo1rKGoRwuAkEDEcJRhuwxRTnmAhskTGx0U20
 sGhRyfUT/K1B06GAWCtQ0Z7FG6FKinAuEznRwEDXlLNK/17Bnrr55JYrI+8x28LMYVbI
 Q+muvAShTZptlLXY2xktyJs9LQhevC452G856OrWXpP3lIqhkVnbPQWxkf+/KWk+0nnM
 jumncSMYILKjg4vtdgfFfdgKEUo4ca3lHHUDw2I232SmEDI5lu9thtuZLXObOhd1qNYN
 Orlg==
X-Gm-Message-State: AOJu0Yw7BU8Zm4lhIPCMjUtgrUmEwNKJIXY3cUMYjcx41Ut890AsZ1N+
 JG9U5RhfUZluFjB0f2GzAPt6e+xxc5nUFlx+wf4KKjxObB6RO4RXVcSQFrsw7mE2GGzhQQsFPX9
 Jacc=
X-Gm-Gg: ASbGncsxz8VVYagjeiN+HYXB/p07+NaKAuGCmTDTodxdOhM/AV23VcrLAzkhULas7O7
 Y5pbbuibEEOQ2lDc+XOaA/A8l9rN93+7wnhJN8VQqAc6bKqwcuJuVRaY7aJTkkDQ2Ck6/x4WPlp
 8TxypU05MgVLtzaiSLXGCsPm/m5KcWwpuNG9JliGmgwWJ4ohrelcoBBsBqHfRsqG0zwuulZW3Sj
 F1+LpK97zHK81DwgXYtTsO5hg/Qa8W9RTK9cur9XmSAIRin
X-Google-Smtp-Source: AGHT+IE1chvEfPE9xvFUMqXcXN7mbIbvm6fb8lp25k/T4yvLW8pO0iJES+HnR7K9/ybhBo68eoc25g==
X-Received: by 2002:a2e:a99e:0:b0:2fb:5a7e:5046 with SMTP id
 38308e7fff4ca-2ffd5fff00emr39186901fa.9.1732803695856; 
 Thu, 28 Nov 2024 06:21:35 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097ebb56esm766091a12.87.2024.11.28.06.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:21:35 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7AFD35F8AC;
 Thu, 28 Nov 2024 14:21:33 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yanfeng Liu <yfliu2008@qq.com>
Cc: qemu-riscv@nongnu.org,  qemu-devel@nongnu.org,  alistair.francis@wdc.com
Subject: Re: [PATCH v2] riscv/gdb: add virt mode debug interface
In-Reply-To: <tencent_B52B1EB0A504D6F690B6E6F3FD3AC9BCDC09@qq.com> (Yanfeng
 Liu's message of "Thu, 28 Nov 2024 15:21:27 +0800")
References: <tencent_B52B1EB0A504D6F690B6E6F3FD3AC9BCDC09@qq.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 14:21:33 +0000
Message-ID: <8734jbh21e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Yanfeng Liu <yfliu2008@qq.com> writes:

> This adds `virt` virtual register on debug interface so that users
> can access current virtualization mode for debugging purposes.
>
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>  gdb-xml/riscv-32bit-virtual.xml |  1 +
>  gdb-xml/riscv-64bit-virtual.xml |  1 +
>  target/riscv/gdbstub.c          | 18 ++++++++++++------
>  3 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtua=
l.xml
> index 905f1c555d..d44b6ca2dc 100644
> --- a/gdb-xml/riscv-32bit-virtual.xml
> +++ b/gdb-xml/riscv-32bit-virtual.xml
> @@ -8,4 +8,5 @@
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name=3D"org.gnu.gdb.riscv.virtual">
>    <reg name=3D"priv" bitsize=3D"32"/>
> +  <reg name=3D"virt" bitsize=3D"32"/>
>  </feature>
> diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtua=
l.xml
> index 62d86c237b..7c9b63d5b6 100644
> --- a/gdb-xml/riscv-64bit-virtual.xml
> +++ b/gdb-xml/riscv-64bit-virtual.xml
> @@ -8,4 +8,5 @@
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name=3D"org.gnu.gdb.riscv.virtual">
>    <reg name=3D"priv" bitsize=3D"64"/>
> +  <reg name=3D"virt" bitsize=3D"64"/>
>  </feature>

I assume these are mirrored in gdb not a QEMU only extension?

> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index c07df972f1..7399003e04 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -206,14 +206,14 @@ static int riscv_gdb_set_csr(CPUState *cs, uint8_t =
*mem_buf, int n)
>=20=20
>  static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
>  {
> -    if (n =3D=3D 0) {
> +    if (n >=3D 0 && n <=3D 1) {
>  #ifdef CONFIG_USER_ONLY
>          return gdb_get_regl(buf, 0);
>  #else
>          RISCVCPU *cpu =3D RISCV_CPU(cs);
>          CPURISCVState *env =3D &cpu->env;
>=20=20
> -        return gdb_get_regl(buf, env->priv);
> +        return gdb_get_regl(buf, n ? env->virt_enabled : env->priv);

The range checking of n and ternary op are a bit magical here. Whats
wrong with a good old fashioned switch/case statement?

>  #endif
>      }
>      return 0;
> @@ -221,14 +221,20 @@ static int riscv_gdb_get_virtual(CPUState *cs, GByt=
eArray *buf, int n)
>=20=20
>  static int riscv_gdb_set_virtual(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> -    if (n =3D=3D 0) {
> +    if (n >=3D 0 && n <=3D 1) {
>  #ifndef CONFIG_USER_ONLY
>          RISCVCPU *cpu =3D RISCV_CPU(cs);
>          CPURISCVState *env =3D &cpu->env;
>=20=20
> -        env->priv =3D ldtul_p(mem_buf) & 0x3;
> -        if (env->priv =3D=3D PRV_RESERVED) {
> -            env->priv =3D PRV_S;
> +        if (n =3D=3D 0) {
> +            env->priv =3D ldtul_p(mem_buf) & 0x3;
> +            if (env->priv =3D=3D PRV_RESERVED) {
> +                env->priv =3D PRV_S;
> +            }
> +        } else {
> +            if (env->priv !=3D PRV_M) {
> +                env->virt_enabled =3D ldtul_p(mem_buf) & 0x1;
> +            }

ditto here.

>          }
>  #endif
>          return sizeof(target_ulong);

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

