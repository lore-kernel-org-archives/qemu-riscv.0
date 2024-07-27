Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE35CC3DA49
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 01:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sXWCP-0002AK-0L; Fri, 26 Jul 2024 21:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sXWCJ-000279-Ip
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 21:26:11 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sXWCH-0004Py-5Q
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 21:26:11 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f032cb782dso19762291fa.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2024 18:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722043567; x=1722648367;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vf6SMqBGacUh3oyyzqoyXbaatTN5XcogvaaBcF39Vg=;
 b=jEsFxkJxF67tck3yfJYTIA/MjnDDEwgriCERrVRNJ5hI8xZriuDwQMEh5/WgulTKgL
 Y/L4trdN65F/YdDVJ/sYuh/bNLAmDzvDbN4LsgSvtf6JCw77G1t9cd8RFbA5VOJDIvXK
 9zyUxzfnoanqVlcfE3/Zrn2YxTYdN2KjFCeMxFh4Raz9Q4mw6fe8jBXKLn7Otkl/3D2S
 ALtNNlgw7fUMgup7bEItn218qgciZZrZLsagjzZfzJ6UWXeVNmGaEdgJ2BIugMbX8cwd
 dnM0TraEWjdnDEIHVma0bAuFPEP5rITBaWSp3CvGaoK58VeS0x+Dbe7MyMOV64PPIWbC
 j7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722043567; x=1722648367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vf6SMqBGacUh3oyyzqoyXbaatTN5XcogvaaBcF39Vg=;
 b=isxAxImu48sUfQv4MBEfvn3dzxSufDN5UDhlKPEifkYBjM9aJ8glQy3yrV5KPwJqYA
 bXMRWaAD3wY9Srrp9Tq0TuJGxMQ1U4HfuDQD/xz57bXG17n8lEpa71aOuZnVfcQKn9fl
 w90oHIiTP+0osWnIhcDF48Wggw6eDy0c6rWz+ZI73Iev8OeH3GREG4vJMzMYulrO+3Qm
 YPBcLl9zxs+DrvEJHPIXEBM5QnWQjN0nuQ51N7Rkvm/yQ+5HeWy/9q26KOJ2QwkH/B9V
 O/6II7Biw2kRKYJJ//5R9/uB6+4WbHPVsDoKRm4u37aJWwsTPWgMTqjiYy7m4f2253GH
 wRGg==
X-Gm-Message-State: AOJu0YztrdRNa/lAOb49HA0FHN3qJgIbS6BORxZvZyFHdrSxFXvYcA8o
 hXoD6cu2Iy90eZsdBbIx9+aX0qifI8jLP7JPHKNY+XJPO5GLT5ah4JQAb/aAOL2eCWhEawN9HL9
 AvaaQDdbZUfIInLHUokuIHw1PRMrx/m3AofdE5g==
X-Google-Smtp-Source: AGHT+IFQAAyyXQ7WEhCpaUjHRnF/J+QAYGL2pzVR15a5xPSm3GwdKc1eBSP74jOoG+m/FO7rS1q+QvkMnptJy6419bo=
X-Received: by 2002:a2e:80cb:0:b0:2f0:1e0a:4671 with SMTP id
 38308e7fff4ca-2f12edf9e78mr7591721fa.4.1722043566498; Fri, 26 Jul 2024
 18:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240724-fixes-v1-1-4a64596b0d64@rivosinc.com>
 <CAKmqyKPhCzrYxwpBF+NQi-5KgcKkhWeVNX6nwwx3ZjeE9rWEAg@mail.gmail.com>
In-Reply-To: <CAKmqyKPhCzrYxwpBF+NQi-5KgcKkhWeVNX6nwwx3ZjeE9rWEAg@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 26 Jul 2024 18:25:55 -0700
Message-ID: <CAHBxVyHe1gA39nF67ZL5KzHMOXwVCPK8dSLRDuu1BYy5OTGK=Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add asserts for out-of-bound access
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Jul 25, 2024 at 10:12=E2=80=AFPM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Wed, Jul 24, 2024 at 6:33=E2=80=AFPM Atish Patra <atishp@rivosinc.com>=
 wrote:
> >
> > Coverity complained about the possible out-of-bounds access with
> > counter_virt/counter_virt_prev because these two arrays are
> > accessed with privilege mode. However, these two arrays are accessed
> > only when virt is enabled. Thus, the privilege mode can't be M mode.
> >
> > Add the asserts anyways to detect any wrong usage of these arrays
> > in the future.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Fixes: Coverity CID 1558459
> Fixes: Coverity CID 1558462
>
> > ---
> > The lore discussion can be found here
> > https://lore.kernel.org/all/CAHBxVyGQHBobpf71o4Qp51iQGXKBh0Ajup=3De_a95=
xdLF=3D=3DV_WQ@mail.gmail.com/
> > ---
> >  target/riscv/pmu.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 3cc0b3648cad..e05ab067d2f2 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -204,6 +204,7 @@ static void riscv_pmu_icount_update_priv(CPURISCVSt=
ate *env,
> >      }
> >
> >      if (env->virt_enabled) {
> > +        g_assert(env->priv <=3D PRV_S);
>
> Don't we need this assert for !env->virt_enabled as well?
>

For that case, it uses counter and counter_prev which is array size of 4.
The assert was in the other case just to avoid wrong invocation in the
future with PRV_M while the array size is 2.

> Alistair

