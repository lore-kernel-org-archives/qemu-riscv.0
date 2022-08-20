Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPFxk-0003kT-2z
	for mharc-qemu-riscv@gnu.org; Sat, 20 Aug 2022 00:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oPFxi-0003kF-Lj
 for qemu-riscv@nongnu.org; Sat, 20 Aug 2022 00:19:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oPFxh-0004M8-BE
 for qemu-riscv@nongnu.org; Sat, 20 Aug 2022 00:19:54 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3321c2a8d4cso168203297b3.5
 for <qemu-riscv@nongnu.org>; Fri, 19 Aug 2022 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gcd2JxaszvhZPnTlMM/td0/i9eu/14VCTbHiMDbl7q8=;
 b=Y6lfxeDLPvG6kI7vKFIUY7VH3avJPJXq4PSXEbT8YJHM39RlqGzZMy/+I6tlbUa3Ma
 ErnzGnfkerCISCi+rGaULlD/5PGVHJYp4gecDjPcsBEEHzcP157KNfFilqvRvV+cra2R
 OBDyGHXX1NKamMxKV0fGSCuhbX27du9JG1wRnObF7ZCaiCIhqDQkvYoNl9+xcnllki1h
 4V7zLLCiaiAlEqN0SljFVGNuZNt+5//WFiLFZu/bFrjFBFzFGVw8Z3L1RgC2TmHIJkev
 EwirXbBCoKvY8viY0+WU6LC/L4NpjXMdAHppQWBmm67aZ3R48FirZkfpF13AYiuPyUbr
 B6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gcd2JxaszvhZPnTlMM/td0/i9eu/14VCTbHiMDbl7q8=;
 b=78Le7HUOle6GPrZDPk8u4dbaS+0ylFsxx/D8/rI5eUVdGxsT2DzqPYQDi/o67DY8Ar
 TSlsAtaw45FrAyNQJNQ0pU26CNA+qZtkWX3t9N4bvD6sVEOO50yyncPcvSxJeiB3cSwZ
 6Lp2yJRY7nCkXEAz0gDSFWZV43Xk+jsS3tl++h5vzpbQLviwUjqBAUmcxQ/4f2FxZPG+
 JALuqOEE5RIVX3ITaCRNHx5Y4YdV79Y8M6lUnSUro5D1IR9/sAg/3ScVEnJL0yGoM33V
 MVhfRfmBZwliW5FreiAXfPY81vMMah7nv7RXwAS9bzbh6bXBEI8NXHUVip9ANbSG8LI8
 XloA==
X-Gm-Message-State: ACgBeo1xMlXo9wBFrrcCMiM3l56FT7tqO/mIFoLAW1Psr2yp95WRNCIv
 Mbgza0jGTfYWIim1qLO7+sHF/XlVqQPoHS44Y9qmkg==
X-Google-Smtp-Source: AA6agR5Ue5f8imEdFMBI67NUYZ+t4VYCA8hcvlDfZjpGBZ2B6yWlGlJdcKuGSOhVZio1rezFOx6haKMsbF8acLY5NH4=
X-Received: by 2002:a05:6902:919:b0:671:2b80:4b3e with SMTP id
 bu25-20020a056902091900b006712b804b3emr10641892ybb.180.1660969190914; Fri, 19
 Aug 2022 21:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220819073147.174790-1-apatel@ventanamicro.com>
 <787bcb91-c20c-3b33-b052-95453cf6827c@linaro.org>
In-Reply-To: <787bcb91-c20c-3b33-b052-95453cf6827c@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Aug 2022 09:49:13 +0530
Message-ID: <CAAhSdy1apCOYPj9eCO-EbcuTeDZZZF+8eJ3p_H2LMLEpJLHsWg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Use official extension names for AIA CSRs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::1136;
 envelope-from=anup@brainfault.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Sat, 20 Aug 2022 04:19:54 -0000

On Fri, Aug 19, 2022 at 8:40 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/19/22 00:31, Anup Patel wrote:
> >   static int aia_hmode(CPURISCVState *env, int csrno)
> >   {
> > -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
>
> Better as
>
>      RISCVCPU *cpu = env_archcpu(env);

Okay, I will update.

Thanks,
Anup

>
>
> r~

