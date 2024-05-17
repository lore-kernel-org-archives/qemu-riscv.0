Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C42FC04FFE
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 May 2024 17:56:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s81oa-0003fv-MG; Fri, 17 May 2024 13:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1s81oY-0003fS-Ti
 for qemu-riscv@nongnu.org; Fri, 17 May 2024 13:56:18 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1s81oX-0003pL-B0
 for qemu-riscv@nongnu.org; Fri, 17 May 2024 13:56:18 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso16148671fa.0
 for <qemu-riscv@nongnu.org>; Fri, 17 May 2024 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715968575; x=1716573375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILybd4uCFVq2sLCUT+bII60RqHgIew9z0KFEVI3h8bM=;
 b=mzbcZEjPcaRNvraxnX/q4KGy2GDImQLzTJKNw+IhCjJUAxdxrAQuZ3CLML3CqN5AoD
 rxwAM9cDavyU53HHJKNgSVw61W1lsyOEXznhNUvFFQWIra+HiGLPuN9qnEotD7lFArni
 0p6/cts85llP1qEQhyWpmfOeZk8fmnpr0ezEGMVXnCFwCgJnnU2LBfLlCdy7xnIcxIOI
 Mw/Eou5r1QYpK3+B5T1DPC8/OCDYHIo/gx37lo5Q1izSRKRFxFv3Kz3TT6UE3/3+2ps5
 fiYcJtctzcZVt3YZc4qFxdQcal1TCTbeBAD6wvzIKHA4gGNXWprAn+NCqAZS53Xz6dT2
 Bvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715968575; x=1716573375;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILybd4uCFVq2sLCUT+bII60RqHgIew9z0KFEVI3h8bM=;
 b=lsmbjvq8jzmxnuZwTgvGj2UyXKrRpB4hcZ2FZ/OipLMSqppuruWf0+vBGB24Hs5Yz2
 O36W3AOyXsD3pD1WSUmeQ6H2A+EC+Y+seznNSrYoAFw0QM3e63Xb3Hk2uo1BBnvK7sS7
 9Xu/MiwR8RJDCWKTuqu62B29FZyu0AeHBjHsjkesnuhWWihv4VKeOvLBVsvEfUm4/N71
 Iks/dOh/NwqsvtvLeDVi+NwR91fzkVh/urMKcq1jgA+9VrdGfUJsmuaAMhhVOJ+NiiHU
 IuXsPymGrk4CH4nkrFhs40VufHZq77XDqYc/ZXPfy6Oh572zFAtP5/gL5zQ1Nv4cp/4B
 is2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+PSagoHsrsk0r9aOo0ivZ26s7ybIXy6XXX2Ih6DK0xoh+S6h/5BpKxHKBpoeDi/6Qkw9g3r27goBtuIpv/TP7t+oRnE=
X-Gm-Message-State: AOJu0Yz4fEExOEJW8XO85Q2GGXI1rLg0FF6jxw1QAcFBCaDRvbnwaskU
 3QFH7UOAKwqNNj6xvGxh3hdvfWCT7131F9mE3XAgZ2mNPmv7OTih8sjZ3jYD2YQ=
X-Google-Smtp-Source: AGHT+IFpF093pv0hwwRWaGrCgDekBb8/acHfg50zvqnRoU954uKhh2TpqwIJQ01ZiDYb3oJCq6+9uw==
X-Received: by 2002:a05:651c:1055:b0:2d8:8fb6:a53d with SMTP id
 38308e7fff4ca-2e52028a6cfmr172105691fa.42.1715968574635; 
 Fri, 17 May 2024 10:56:14 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17891f87sm1129992066b.65.2024.05.17.10.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 10:56:14 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3FAB75F88D;
 Fri, 17 May 2024 18:56:13 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,
 alistair.francis@wdc.com,  bmeng@tinylab.org,  liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com,  palmer@rivosinc.com,
 akihiko.odaki@daynix.com,  mjt@tls.msk.ru,  Robin Dapp
 <rdapp.gcc@gmail.com>
Subject: Re: [PATCH 1/1] riscv, gdbstub.c: fix reg_width in
 ricsv_gen_dynamic_vector_feature()
In-Reply-To: <20240516171010.639591-2-dbarboza@ventanamicro.com> (Daniel
 Henrique Barboza's message of "Thu, 16 May 2024 14:10:10 -0300")
References: <20240516171010.639591-1-dbarboza@ventanamicro.com>
 <20240516171010.639591-2-dbarboza@ventanamicro.com>
Date: Fri, 17 May 2024 18:56:13 +0100
Message-ID: <874jawqq4i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:

> Commit 33a24910ae changed 'reg_width' to use 'vlenb', i.e. vector length
> in bytes, when in this context we want 'reg_width' as the length in
> bits.
>
> Fix 'reg_width' back to the value in bits like 7cb59921c05a
> ("target/riscv/gdbstub.c: use 'vlenb' instead of shifting 'vlen'") set
> beforehand.
>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Robin Dapp <rdapp.gcc@gmail.com>
> Fixes: 33a24910ae ("target/riscv: Use GDBFeature for dynamic XML")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index d0cc5762c2..358158c42a 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -288,7 +288,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUS=
tate *cs, int base_reg)
>  static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int ba=
se_reg)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    int reg_width =3D cpu->cfg.vlenb;
> +    int reg_width =3D cpu->cfg.vlenb << 3;

You could consider renaming the var to reg_bits for clarity but
otherwise:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>      GDBFeatureBuilder builder;
>      int i;

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

