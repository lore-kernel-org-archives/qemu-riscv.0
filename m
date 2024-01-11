Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D47C47258
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:03:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNui4-0006eA-6l; Thu, 11 Jan 2024 08:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNuhU-0006RH-Kr
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:02:28 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNuhM-0003rl-JG
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:02:20 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a28b0207c1dso419001066b.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704978125; x=1705582925; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s21DfL9PxigW5GwnOTgSjfb191mhadfCjUx2e4f8UAM=;
 b=b0oR1f747X2EH1Coj8/ltgWu/nxkd+FN93idDuzxabxNMK8IBGv3wiTuOZU9QF8hkR
 GrRfwunF0jIDBrN1Z/1vBr4BWprTIokBFkv3/AgjrFI1n7QfhYDvI+hFk4AlS1yEeBMG
 QMMH2E9Bk7S5Seyq9YPmBnHzie+wxUj6HJebw1J0kfr87JPIKQw2JWVkt9Ts17dX9yE3
 A0mgKYVd60+UeryKzOrjxfDbrSiCB8MPpiBvxbO7W4xqcUiqKoevfkTIkUjDSyE2UoC2
 cpwybhMEkg7p0Tlg0eEk+nTqWaBdJnKqUGfFTAQ4xPW4PKr5Zl+wigo1NOFKe4xcfLwV
 rDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704978125; x=1705582925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s21DfL9PxigW5GwnOTgSjfb191mhadfCjUx2e4f8UAM=;
 b=BB8e4S1iNW0LfIqgwg1kmGqSSGDmywnj97ZtAXiohHVKYjpTFP9d+K4UizclZuCu+H
 mm3GKVFCdgsbVczcIeNI4covac6MGRyjooPT2DMM2EbE2/VP0fd1opc4TB3mWwWhy1f2
 TOOe0XqumlEa3d3YTIOo2Dvl4PyZHcfYBoiQnVwf6C3bQfzu6pz9AcgutAfJOT2gBqz5
 AhbZRGlg2CFHAGDa/FA+CoDjPYPy8xi2B1U4zYx5z1z9UVzFdjYggDhjri81ejeh9JvA
 SgzjV3hr7H0a9OM2I4+7TrvLtWc0dI0Ga2Q+rgMoFLfQgFWZY6o/ZB2v93INxBuHSB36
 lx1g==
X-Gm-Message-State: AOJu0YwCr4oDK8s1HCwpZ/04EU66D4I727HWWaMpZUl8hidVHMmhUgQd
 5NFFC+isE/8iq7QmLE/7pJeC/ZC9RdS3QA==
X-Google-Smtp-Source: AGHT+IFak0J8UVY17zPSfjgWzErlEzrDhWsMXOkvd3QyWcMxtnbuWPBDJeld1jwOX1ZJ4tAJ3jtpOw==
X-Received: by 2002:a17:906:1c0c:b0:a26:98ee:9fc0 with SMTP id
 k12-20020a1709061c0c00b00a2698ee9fc0mr582130ejg.43.1704978125048; 
 Thu, 11 Jan 2024 05:02:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a170906395100b00a2c29fe8b2esm547522eje.212.2024.01.11.05.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 05:02:04 -0800 (PST)
Date: Thu, 11 Jan 2024 14:02:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com
Subject: Re: Re: [PATCH 3/3] target/riscv: Enable 'B' extension on max CPU type
Message-ID: <20240111-558c99b8f3be4297e9ae4118@orel>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-4-rbradford@rivosinc.com>
 <de442ad9-0479-4a7e-bccf-97fcd081a35e@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de442ad9-0479-4a7e-bccf-97fcd081a35e@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jan 10, 2024 at 03:32:21PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 1/9/24 14:07, Rob Bradford wrote:
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> >   target/riscv/tcg/tcg-cpu.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > index f10871d352..9705daec93 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -999,7 +999,8 @@ static void riscv_init_max_cpu_extensions(Object *obj)
> >       const RISCVCPUMultiExtConfig *prop;
> >       /* Enable RVG, RVJ and RVV that are disabled by default */
> > -    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> > +    riscv_cpu_set_misa(env, env->misa_mxl,
> > +                       env->misa_ext | RVG | RVJ | RVV | RVB);
> 
> I'm aware that we decided a while ago the 'max' CPU could only have non-vendor and
> non-experimental extensions enabled. RVB is experimental, so in theory we shouldn't
> enable it.
> 
> But RVB is an alias for zba, zbb and zbs, extensions that the 'max' CPU is already
> enabling. In this case I think it's sensible to enable RVB here since it would just
> reflect stuff that it's already happening.

It's also setting the B bit in misa, which, until this spec is at least
frozen, is a reserved bit and reserved bits "must return zero when read".

I don't want to stand in the way of progress and it seems 99.9% likely
that the spec will be frozen and ratified, but, if we want to stick to
our policies (which we should document), then even the 'max' cpu type
should require x-b be added to the command line if it wants the B bit
set in misa.

Thanks,
drew

