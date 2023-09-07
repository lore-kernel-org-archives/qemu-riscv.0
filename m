Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E1BEE14D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:48:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe602-0006Ad-8X; Wed, 06 Sep 2023 23:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5zz-00069m-DY; Wed, 06 Sep 2023 23:48:07 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5zw-0004Lg-1S; Wed, 06 Sep 2023 23:48:06 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7a52a1e2a59so175800241.0; 
 Wed, 06 Sep 2023 20:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694058482; x=1694663282; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0p4FyPt60KtDjdEVHoiwCan99Q+dxUjQaUI00G+sLvA=;
 b=QlflcM9tU+olco1NuItk83tlWmT7XUJyy8X1lsmIs7oA+1jaucfagHS7pU1Kl9yuDY
 Uatec/AWhParA7zN0pniwqIhaKqNqXR2sjSwS2EgbDBvo25Qoo1Gnz0UkWOwshh0u/1V
 fy+hxDfHFJKUsv532hYjRueGvshGLWVCaqBS/DViLec1yan2gkeROtYL0iF4fqDi0ePA
 PwNBDbJK3e1kPkJhSSqwfUz4DT9KEqqvVrlYkUest2nLJMhLCH0w5ocNb21hh8NWNCpL
 eIWjJfr41csG3eX+q7ReDbYqqQU4yTZNPnZNnGs8V9lZhGASs8XKsw5tYA1Xv5TWbjhb
 0c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694058482; x=1694663282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0p4FyPt60KtDjdEVHoiwCan99Q+dxUjQaUI00G+sLvA=;
 b=Lic4tg3RDt1uf4u8JJi1ueFJ8gOEOj7MIkMeg7NTXXMAQ7J6WcPIg9SM3QOxMIA3H6
 +Bffat8LCywS9B27tYMxuz1hiHFgvPaqvIsMKxqci9suqB/uYcWrPNq8wtEdLWRgK+qu
 sC0X3GK6IOb0OQ4h7sfHbX+1Y/8DSeVoiD1u427AZJxqC7i/f9P7gF0I0+ErwRSUzogX
 npFBy8vtrdhWeQLLAMx+U9Yy/WFBft+JiKJSgEKNHXljW/+KTyGpkdBZETaisVo0trzZ
 K6CdilYhWv24G5I3uEliPgGN5S9Ssl9B1GOjanAZnL/Uoo/rtWBcCYslh0UtvgDj/P9N
 n+Qw==
X-Gm-Message-State: AOJu0Yx9Ukc+IgwZdw5keX8OX5s0AFgSJXZHeoCWIKR55LOntqGlIVIG
 x8GJQYtWYT0AE2N4askl1ttfF4AHRYCH/qcYIiA=
X-Google-Smtp-Source: AGHT+IF1n7NfJpBhx7H85lqos0GeiWZZgFMaLWzRxuVRAcLx2KTELJKqO+mus70bvLiBDVAS1xpx2kfk8eN+8sZLFlI=
X-Received: by 2002:a1f:4ec2:0:b0:48f:9778:2ba2 with SMTP id
 c185-20020a1f4ec2000000b0048f97782ba2mr4686051vkb.5.1694058482320; Wed, 06
 Sep 2023 20:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:47:35 +1000
Message-ID: <CAKmqyKOU=_4F_vuFkzLM-KcykT6CbEuDztooZHTbvTtYFcpRtA@mail.gmail.com>
Subject: Re: [PATCH v9 11/20] avocado, risc-v: add tuxboot tests for 'max' CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Sep 2, 2023 at 5:51=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add smoke tests to ensure that we'll not break the 'max' CPU type when
> adding new frozen/ratified RISC-V extensions.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/avocado/tuxrun_baselines.py | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_bas=
elines.py
> index e12250eabb..c99bea6c0b 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -501,6 +501,38 @@ def test_riscv64(self):
>
>          self.common_tuxrun(csums=3Dsums)
>
> +    def test_riscv32_maxcpu(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Dcpu:max
> +        :avocado: tags=3Dtuxboot:riscv32
> +        """
> +        sums =3D { "Image" :
> +                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a=
3d6deccbd5",
> +                 "fw_jump.elf" :
> +                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b1=
8936676985",
> +                 "rootfs.ext4.zst" :
> +                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31=
bb13108cba" }
> +
> +        self.common_tuxrun(csums=3Dsums)
> +
> +    def test_riscv64_maxcpu(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:virt
> +        :avocado: tags=3Dcpu:max
> +        :avocado: tags=3Dtuxboot:riscv64
> +        """
> +        sums =3D { "Image" :
> +                 "cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729=
e119bac25e",
> +                 "fw_jump.elf" :
> +                 "6e3373abcab4305fe151b564a4c71110d833c21f2c0a1753b79354=
59e36aedcf",
> +                 "rootfs.ext4.zst" :
> +                 "b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6=
982ed679eb" }
> +
> +        self.common_tuxrun(csums=3Dsums)
> +
>      def test_s390(self):
>          """
>          :avocado: tags=3Darch:s390x
> --
> 2.41.0
>
>

