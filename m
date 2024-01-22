Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D842C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 06:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRoDF-0003T0-U2; Mon, 22 Jan 2024 01:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoD9-0003De-Oi; Mon, 22 Jan 2024 01:55:13 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoD6-0001TQ-JH; Mon, 22 Jan 2024 01:55:10 -0500
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7cecc0a662dso849527241.1; 
 Sun, 21 Jan 2024 22:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705906504; x=1706511304; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yG7aglFP/RW8FjjjTXNcp+kS+FSEPYhrXv06UTIQn9o=;
 b=DjoN8eX8hS8bg6P3Alhu95ogH8fkfXNtDXWXJVpBeGxoB9s1tfLdn8XlGGsQK5E/L1
 f8U84MP7WcyoT1RatzGAyQVFaAIRFXzBcHAvEtkLklyJnpzH5myXXnpOqnsC8xRdg+vL
 ma3FCLnlmr1y/DY0o2Kk07lFfMJmqLPz2QlPndS0dMPHZpydKSmtYjm88pOnvVnoO7jm
 +6NJ7280VxtvrEJbrQQoeUEA033xUJoz5+p8ILAmHrOESkAlWNM6vhia9gMi6D6Mo9vN
 3wSUzfSac5g4BYTFwrMFmEuKWo76ketNmhvjpcDc365Qr5jgSOQFjJagD2sYv2QmTzm+
 dKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705906504; x=1706511304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yG7aglFP/RW8FjjjTXNcp+kS+FSEPYhrXv06UTIQn9o=;
 b=LoltVb/+og6iiaOdgZNt/+lCPToPxfJ5+77bFhjkncvTm7jLHsO8qMhGUDW5jFEGtD
 L3LQljZOxfUi2QOJTCQhtoBXB2SeTx2lL2zIrcp9GM3CS/rUTouwdIDMlQ4JiRAYlR0j
 CJAdAND8yf2sjXYVl6A0Rk8LsdA2rMywSvZVlySMgFGaBFjqa0CtF38Bj2jUgo7YaHL/
 oASGyGJl50M88xVpesFX98GplcS4KjrG+jfXWdQ6F1zqTlSsjTQP+sWCA6SEsvd1qXKv
 ojbzojHiX6r5JX1a/fILz0u96pgyrXvVhArZMMHg0Oqs+RepXk70EvwgJrGyG1/yS9Ni
 u4kQ==
X-Gm-Message-State: AOJu0YwybwlODoXhAm5FbUqLdn1jFO4k4dDFOuyzh5eH1tryuJIghPWA
 hnfnrX2fZV/aBx1WxLbQNpvgSq7eoIuHyIrkSVE5Tm6c/zsVlf3VEGZA2/0a2emwJ9VVp+H1Ber
 Qy3ii6QJASDiM73p4Zss2MPlTbkE=
X-Google-Smtp-Source: AGHT+IH8Q9aOMuayNwuerPCXWK5Ovmh+2cPuQbni+dqan4wv0w1bv7lJbusFCpGznj2yDKMZjmwXX8AxMcdpVToR1vU=
X-Received: by 2002:a05:6102:348:b0:469:a92e:8d65 with SMTP id
 e8-20020a056102034800b00469a92e8d65mr925018vsa.1.1705906504546; Sun, 21 Jan
 2024 22:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-7-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-7-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 16:54:38 +1000
Message-ID: <CAKmqyKOcLLEnFHkFCf3nKWGKu+7TYU_FyEvgUJxyh0xi1wKSKw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Tue, Jan 9, 2024 at 8:31=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d8de1f1890..44ebd80aba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
> +    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
> +    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -1336,6 +1339,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[=
] =3D {
>
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
>
> +    /* Zjpm v0.8 extensions */
> +    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
> +    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
> +    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),

As this isn't ratified yet can you add a "x-" in front the of the
names to indicate experimental

Alistair

> +
>      MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
>      MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
>      MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
> --
> 2.34.1
>
>

