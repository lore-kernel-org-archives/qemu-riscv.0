Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5A7C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:52:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLwO-0006zB-UR; Wed, 01 Nov 2023 20:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLwO-0006yK-06; Wed, 01 Nov 2023 20:52:08 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLwM-00015d-FJ; Wed, 01 Nov 2023 20:52:07 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7ba962d534eso170792241.3; 
 Wed, 01 Nov 2023 17:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886325; x=1699491125; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7tnui+oXq10/BlvW62k7oF4Bx7tTaYzgMQ2/JwL5pM=;
 b=eIz4x/4TFIuWbXqh5xKIsmU+JAgGshOCMfDKr+iP82VkQNNiE7NkH50d0TCpOQLCXl
 /ZrT5gV53bVmSmIZjO+5VP/CgWDoSv1+53TL/HWrXx+grhO8sT/GiHH59Srmyvs2RMJ5
 uhZ5sXOCs7u+ytskz4kSnvYdC4XJLB+nwW5KEk+1MFXqsGsHRvcw2YviIYlVKqVGvglG
 2gBBB2DMEZ01YB4yXrJiWTIndEuxaBogug1P0qxHldurv2q6mdfnW+UXs4zUl00LBsIh
 utLdbUGu5q51ZqG6HBGuvjMkeXoiWRKzv5jijxgAfImU8qm18Wqkop60c5tBe1z1AL72
 hDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886325; x=1699491125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7tnui+oXq10/BlvW62k7oF4Bx7tTaYzgMQ2/JwL5pM=;
 b=JDBPd5FQQgoD3fR03ciOdgnKuW+qnwa7QpNiPIgjYaqiuY7OPLRBWARRjUQGoCXTd+
 0PWvuy6BmRJXzHcif/aPw6NGkEwAxYcXB6lMJA2RprXzHf9zJqZVqdjVpJuxp9UpJ/ag
 oOS/xxEP1qQhMTEU8wOa4DQL0vKB4amcOBRduESNFgIZCtZt21P+0e7GwtoG7C5ETSJh
 aEnSRGAE+DoFIFzhnYQhtt/nXQqbkirTuxuODC7ipxTvC9BPcTqvS6XChuTptT+WGzTt
 gSWRD9EiieQxTaSrLbDCRWmQ4uVtLivunLFLtMu3A07m19HYpPgY7MgHGYNZIYvcDEfC
 TxhA==
X-Gm-Message-State: AOJu0YzosTiuxvVJ/sIqJZXQtpsLc7ft39K7f0piev1MjGXE8WY+2IpJ
 OWWylDprlNp11z0OLv5prw1ErztYswRushAgmMI=
X-Google-Smtp-Source: AGHT+IGq0xgO+YEvkpq4M6WvB+4SkEZWTb1eQfZzMeQCZC2kqFERU32stTBu7rDuTzaN+2b/Avx4HCeKTTjJ1zz9l2E=
X-Received: by 2002:a05:6102:2:b0:457:bc5f:b4a8 with SMTP id
 j2-20020a056102000200b00457bc5fb4a8mr16750866vsp.28.1698886325053; Wed, 01
 Nov 2023 17:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-11-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-11-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:51:38 +1000
Message-ID: <CAKmqyKNg3scLazYAHAjW=taDZC12-XipT+VA-DFUt_eWTas9jQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] target/riscv: Move vector crypto extensions to
 riscv_cpu_extensions
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Fri, Oct 27, 2023 at 1:22=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Because the vector crypto specification is ratified, so move theses
> extensions from riscv_cpu_experimental_exts to riscv_cpu_extensions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1709df76a9b..5b5805399ee 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1342,6 +1342,24 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[=
] =3D {
>      MULTI_EXT_CFG_BOOL("zcmt", ext_zcmt, false),
>      MULTI_EXT_CFG_BOOL("zicond", ext_zicond, false),
>
> +    /* Vector cryptography extensions */
> +    MULTI_EXT_CFG_BOOL("zvbb", ext_zvbb, false),
> +    MULTI_EXT_CFG_BOOL("zvbc", ext_zvbc, false),
> +    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkg, false),
> +    MULTI_EXT_CFG_BOOL("zvkg", ext_zvkg, false),
> +    MULTI_EXT_CFG_BOOL("zvkned", ext_zvkned, false),
> +    MULTI_EXT_CFG_BOOL("zvknha", ext_zvknha, false),
> +    MULTI_EXT_CFG_BOOL("zvknhb", ext_zvknhb, false),
> +    MULTI_EXT_CFG_BOOL("zvksed", ext_zvksed, false),
> +    MULTI_EXT_CFG_BOOL("zvksh", ext_zvksh, false),
> +    MULTI_EXT_CFG_BOOL("zvkt", ext_zvkt, false),
> +    MULTI_EXT_CFG_BOOL("zvkn", ext_zvkn, false),
> +    MULTI_EXT_CFG_BOOL("zvknc", ext_zvknc, false),
> +    MULTI_EXT_CFG_BOOL("zvkng", ext_zvkng, false),
> +    MULTI_EXT_CFG_BOOL("zvks", ext_zvks, false),
> +    MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
> +    MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -1374,24 +1392,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimenta=
l_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("x-zvfbfmin", ext_zvfbfmin, false),
>      MULTI_EXT_CFG_BOOL("x-zvfbfwma", ext_zvfbfwma, false),
>
> -    /* Vector cryptography extensions */
> -    MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
> -    MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
> -    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
> -    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
> -    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
> -
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.34.1
>
>

