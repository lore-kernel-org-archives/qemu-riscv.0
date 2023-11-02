Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D59C0018A
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:45:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLqG-0001xk-UN; Wed, 01 Nov 2023 20:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLqF-0001xM-Pw; Wed, 01 Nov 2023 20:45:47 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLqE-000789-A5; Wed, 01 Nov 2023 20:45:47 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-458289fb60bso198444137.0; 
 Wed, 01 Nov 2023 17:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885945; x=1699490745; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7Ge7GKVmmVMW1lg8OTp9wfwCpNFxOfIL5UZvTptkvw=;
 b=Dx70ks5y/srfi5H6kxbE028r82OdhMNk9mDsQw9tSTB6Grt/8U+srXp+GSSUEGvBcw
 wlQxEq21EBK6JWyTo4VP9wCHiOtln9FH+XYTURy2brz1BLh3k6qonOPT5g2fXHlKtyrd
 f2sPYar5gCJx1/QY3izcn/Q532HhAu/G8uyEpjS4I9V9/glihH3FZ83KCTb1rDaam1XX
 K8wijBL2/LdunogdssMjWvsA3TxANwHw609A+a9sMww2nxV4NBddmGpoYzpsYRU3OoRR
 HwcdKE5Dft572dTbrnT52aCWjP7cv/ZFFRDijgKgRAkjvKC7u5nikFVdwW4DAyDKLlbG
 cb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885945; x=1699490745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7Ge7GKVmmVMW1lg8OTp9wfwCpNFxOfIL5UZvTptkvw=;
 b=ROLE8yMKvUdpO3TXjy0HPhce63ars+aD83HRF8Wbt4Gyf6AQikx2tO78WFUt8Z8wvh
 IV41qSP9II8i6I3KW93HXzo5D3B8FWmfzRinVrNNXB6dhUtqCcMCyK0Q3b/tyqpLGQeB
 aZdUpU585nPtQWHnd4IWPt4ZciAj4RrXR694kbgkqE2j7dieSqDzYfemW+nz4Ih1LtEj
 YzXY+v8uKh3hYn1Ukm+DBF1EANfiT9jb6/S5q1SSaakjA8OpStGJnLXv3ly9typRsPe3
 qfV2iktf9IeZ9tLOCqM3PQ2v1Rqa15k+ubQ3ffVYre2X7teXxCCtk60ZHTw8Wbypgl6K
 oSbA==
X-Gm-Message-State: AOJu0YycTDFM+gRZFsWQuk98+1BnzJapfX4cPiQ9Lb3CGdQhHrN0aPI0
 m2zl2nqMq6CeExG6n44SNcDRnbVN4wgNjonpzjk=
X-Google-Smtp-Source: AGHT+IGJmre4zKC9oGWIGyYI6oJ2ECaz/z2b1jWLI5Jmn8aj0/D1C4PHS8/ppNsadRWMk8JGb9oe1xEA+AXuhgrN/7E=
X-Received: by 2002:a67:e0cb:0:b0:457:cccf:d989 with SMTP id
 m11-20020a67e0cb000000b00457cccfd989mr15637936vsl.28.1698885945045; Wed, 01
 Nov 2023 17:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-4-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-4-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:45:18 +1000
Message-ID: <CAKmqyKPzgpUFYiHH-Mh_gcC+t9tzwNzXnnObLtXE6PSr2_r9JQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] target/riscv: Add cfg property for Zvkb extension
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Oct 27, 2023 at 1:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> After vector crypto spec v1.0.0-rc3 release, the Zvkb extension is
> defined as a proper subset of the Zvbb extension. And both the Zvkn and
> Zvks shorthand extensions replace the included Zvbb extension by Zvkb
> extnesion.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index d8d17dedeed..935335e5721 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -88,6 +88,7 @@ struct RISCVCPUConfig {
>      bool ext_zve64d;
>      bool ext_zvbb;
>      bool ext_zvbc;
> +    bool ext_zvkb;
>      bool ext_zvkg;
>      bool ext_zvkned;
>      bool ext_zvknha;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index b9eaecb699c..1b08f27eee4 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -508,9 +508,9 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>       * In principle Zve*x would also suffice here, were they supported
>       * in qemu
>       */
> -    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned |=
|
> -         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed || cpu->cfg.ext_zvks=
h) &&
> -        !cpu->cfg.ext_zve32f) {
> +    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
> +         cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvks=
ed ||
> +         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
>          error_setg(errp,
>                     "Vector crypto extensions require V or Zve* extension=
s");
>          return;
> --
> 2.34.1
>
>

