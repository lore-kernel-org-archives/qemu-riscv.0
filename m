Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6DEE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe4nV-0001a5-M6; Wed, 06 Sep 2023 22:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe4nU-0001Zr-C6; Wed, 06 Sep 2023 22:31:08 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe4nS-0007os-7n; Wed, 06 Sep 2023 22:31:08 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-49370a7fe6cso605661e0c.0; 
 Wed, 06 Sep 2023 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694053864; x=1694658664; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2n0UZ0EkU0eysp3ahrnkPL0hrpHX7FmAu9pL2c84BSU=;
 b=GItnj2apRKHtjG/d3k8U8TLWYgOoQ7ar4b2Y/urTdkki5CPVFmbGcyPUAQt6xigyVF
 jog0ZEPTlYwYe2u5JQ+weec1pFwMmTC4TD9XQXGzYYrFxg21UBoR2q+JRu70Loso/s4O
 cv79+yIcX71PJS7gqEkQZbuOlSasVWmz7hzFy40m01QfvhKUJ9Z8eHTcHDJpz169bZE/
 ZxT83oXqdmIgup35Gh5QjhgUTDnlgO9tBYPcJJQgr6hLOOS37nm/2eLSISK4P6yPjP9d
 nWjvVCJKtUkeYtZ1HlTcQDKVqstbNWaOV4PBNAgC4D2TLO9+XjEP7auVjgsjHUY5U8s/
 9P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694053864; x=1694658664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2n0UZ0EkU0eysp3ahrnkPL0hrpHX7FmAu9pL2c84BSU=;
 b=lC9nlvQs1Md9HFy66OlibS/Fs5j9Y+llD+PMYHRZobgC1PHr6rJyzO1FSPkcLUE9th
 jwf7Swwa+qqRbCE7dJeQT44ZqDoN9h68E+106cn8WJWIgvgwdaizSTooiKfYkqp6WiNQ
 SbjK3LKRJ55z8UW3zhbmfp8ke7GeRTrnL9ODf2c4skTgN+g9UUsCzuJ5ljfxZpMEGXJO
 ZXvKbPtnDWP7r//TJ3rIoual6piVsNxqFRauxxaFQcKJJZKKkuukxPYeG86npdLH8k2C
 CehCzpMoF8xN+lMpe1ovqJ5Au863zbDb75SpARhZdxbdFAZRjppk7TfsE1gZdLFYMTsN
 83NA==
X-Gm-Message-State: AOJu0YwTFFMda5HynDePkSW6ix9dKEk0S2diZMHt23dNjyQlWi5DFAl1
 0ES+nerejkgYwFkRWnd1avmhNXhglXTQ6Onsov8=
X-Google-Smtp-Source: AGHT+IGxjc5roU9ML0mey7TnGo4SEMprUoGHdHMdWB4RWGbCWD1V0nLOl8YzXNc/ITVENc8ao6zzcYmtuSIYxZq5lKQ=
X-Received: by 2002:a05:6122:490b:b0:48f:adcb:26b4 with SMTP id
 ev11-20020a056122490b00b0048fadcb26b4mr907842vkb.4.1694053863505; Wed, 06 Sep
 2023 19:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230816061647.600672-1-tommy.wu@sifive.com>
In-Reply-To: <20230816061647.600672-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 12:30:36 +1000
Message-ID: <CAKmqyKNSTx50gBBdYjt8r1LFM=-1MY_-aH3Nj_j=gXWDD29GGw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Align the AIA model to v1.0 ratified spec
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Wed, Aug 16, 2023 at 4:18=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrot=
e:
>
> According to the new spec, when vsiselect has a reserved value, attempts
> from M-mode or HS-mode to access vsireg, or from VS-mode to access
> sireg, should preferably raise an illegal instruction exception.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..e4244b8dac 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1685,7 +1685,7 @@ static int rmw_iprio(target_ulong xlen,
>  static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
>                       target_ulong new_val, target_ulong wr_mask)
>  {
> -    bool virt;
> +    bool virt, isel_reserved;
>      uint8_t *iprio;
>      int ret =3D -EINVAL;
>      target_ulong priv, isel, vgein;
> @@ -1695,6 +1695,7 @@ static int rmw_xireg(CPURISCVState *env, int csrno,=
 target_ulong *val,
>
>      /* Decode register details from CSR number */
>      virt =3D false;
> +    isel_reserved =3D false;
>      switch (csrno) {
>      case CSR_MIREG:
>          iprio =3D env->miprio;
> @@ -1739,11 +1740,13 @@ static int rmw_xireg(CPURISCVState *env, int csrn=
o, target_ulong *val,
>                                                    riscv_cpu_mxl_bits(env=
)),
>                                      val, new_val, wr_mask);
>          }
> +    } else {
> +        isel_reserved =3D true;
>      }
>
>  done:
>      if (ret) {
> -        return (env->virt_enabled && virt) ?
> +        return (env->virt_enabled && virt && !isel_reserved) ?
>                 RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_IN=
ST;
>      }
>      return RISCV_EXCP_NONE;
> --
> 2.27.0
>
>

