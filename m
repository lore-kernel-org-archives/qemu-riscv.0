Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AFBC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:47:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLs2-0003B5-Hh; Wed, 01 Nov 2023 20:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLs0-00034p-K8; Wed, 01 Nov 2023 20:47:36 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLrz-0007uN-00; Wed, 01 Nov 2023 20:47:36 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-457bac7c3f5so177953137.2; 
 Wed, 01 Nov 2023 17:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886053; x=1699490853; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0m289EFVXwwjFbjgE486HNR2dkSDd3BEiXG68avp+4=;
 b=FnH2WlM0C8vBXhhWq9wRRpSTf3ifv4aJPmopuYiHtZLlUeavYlX0cLl8Q+X8niIBLa
 KOxFFroqHkrfkluv6huCCgodbM7bT1UgsfmNKgblK4wAJTc4OkBx9lVqy57wFjWdmL7b
 Gyl30Tg/8bsLRJC19TlfZfwUdDtfz4ifw8HTiJcfyh3ZFqIYqe6admkKr98iU7P9067q
 PNdRTjJG2f5M88eyOSQxS8jATIe0FNfbt+XKW1iDYVJyIamoMZix2iQxCAh5IeQFmOIz
 oOQqcvE3nJX/39dk+0Nv31OEw8159vqK93s9ZJqgiDkajcvJcSenQoV6Hq7fdTZAFxP8
 QZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886053; x=1699490853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0m289EFVXwwjFbjgE486HNR2dkSDd3BEiXG68avp+4=;
 b=wJAikCpROQTmG9jmcPKuGAhFG0Du/k2Xbpp/fNdLwrLTe078QSzTHi1yy5TMCDTVjK
 jHwhUBpxaP/SlR3RvTKPETEcLoDdnxNjVgFdHH54nKy3D8w7RQp0OnLR4YdzT70OiiRF
 /WAosGd5mCU/7qRd575eczDZQVxfFW1cVP6z0uk7VRZU5cDP23pF0iL+3z6cNQNiAkoD
 JYF2XSbRnXMBqrXdGik3N0LPNOkxX7gpY80UoXaYHsZTyxTk/pi2s/Nw5Tot/5e4q4N9
 YrAb+HJ5etRpepdMXTJboZyTaf0XUZLHLUK6y2Tul8BeZOAKuFQ0EcArfj7rbdVJ1umS
 6hzg==
X-Gm-Message-State: AOJu0Ywtr9BAeL+hAIETm5Nle2ErZ9nkXDlXRexFQHPwIAOQYiUMHI3g
 kg96U8YSRxVZza3FKYqrF7ftglLrh4SuIJ5LdzU=
X-Google-Smtp-Source: AGHT+IGZvo2SX6wkzHSsFnzy8viGnO4VXKrvpu+4HDuZdgbF0pImjLYgH+Q7qtmdDEtMU8/VYqPq4cIBP/nGG4Lx878=
X-Received: by 2002:a67:ab0a:0:b0:45d:7207:9550 with SMTP id
 u10-20020a67ab0a000000b0045d72079550mr40393vse.13.1698886053047; Wed, 01 Nov
 2023 17:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-6-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-6-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:47:06 +1000
Message-ID: <CAKmqyKP8XfqVLXZZNqADSMD3Zh3JY3QfEA3Fgc4hWDFLsvXRqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] target/riscv: Expose Zvkb extension property
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5099c786415..992f8e0f7b0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -125,6 +125,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
>      ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
>      ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
> +    ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
>      ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
>      ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
>      ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
> @@ -1370,6 +1371,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>      /* Vector cryptography extensions */
>      MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
>      MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
>      MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
>      MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
>      MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
> --
> 2.34.1
>
>

