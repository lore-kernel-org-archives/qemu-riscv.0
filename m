Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F554C001B0
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:42:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNhlx-00040h-SA; Sun, 23 Jul 2023 18:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhlv-000402-T8; Sun, 23 Jul 2023 18:41:51 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhlu-0005bN-EL; Sun, 23 Jul 2023 18:41:51 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-483ad06a37aso3340067e0c.1; 
 Sun, 23 Jul 2023 15:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690152109; x=1690756909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZRHNW1ptRjm6aySrG0hRWYpToqmwTfBB+4gvfkbYuU=;
 b=QU9jpiaQLLQLxcrh/cC4+4pVHHB40DGojRPjd6vuWo2ROrmgp1vk1zje9RMlqpDWpL
 +1MFUoIDbdfXDkj4ThgUx3NW8NL7GLe91y3Mr3UJM1RGHALMpzdZ8oNs4++RG3P239gj
 YV52YEv+f5FOB8n2RMGKw+UCbn1xD8pKyP55hi8UiDZ8wjQBJBfZcsPFuICkBI5YdaE0
 4dakCOctM74L64JXlCI3v5bD+CXpkjESlWaNEn+gAX9lCL9FoQXxZW06RjBOBu7qkO9j
 7GFLrB1BDpUHSAjnaHrRIbB/UpK11MqLCqOcWdcq9VM4BSyYrrCCPI5Lc8IpfOcn+CzM
 25TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690152109; x=1690756909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZRHNW1ptRjm6aySrG0hRWYpToqmwTfBB+4gvfkbYuU=;
 b=BwH6yfzyJh8OhA5zGTVXXBTZ2XlHvPyHG+rbfuXW1z5EYYHzaWDT4QqN/WFLwFErq8
 yNnatYw6D4JgZ+wXzdjd1+QhCYBQEXAYNlVqLErwdqkxZJPP2XuA9n55RxXGNazPxsyV
 sdZcxgQZWW8Dys0XdHryVrO0YtwZsSWdHL/8JPgQg+9MZElxHeJMD1EDiqxBw/fl0f9u
 y+KFubiPWEqY+BWQtWLdMHI6kepU2PNgbH0B7vmxQj0SKZPZ8Q5V0ohntSelsIMuIDi9
 6UHscP8nmfphjwz0s1y9K8Nl10sDzxD3E2OE8TfO3lpI6hdwokZ/MswJpnWLvLDNCoe9
 qkrA==
X-Gm-Message-State: ABy/qLb5ZkQuieLpqRdlD0ROk2WjODOQ0eyf0Hg/r/OSnBCqhCwwlgZI
 l2yPrZ2JGDNHIOQw5ce9R+pfEsYZUoKBLnpARHU=
X-Google-Smtp-Source: APBJJlF5okG+mtz41QsuT9IilQlQhTWi4vMbeun49kKZaLLCQmDs2HFiVvYxH7O8eoszMyRY4w6Imtv/KWTmlkAF2dg=
X-Received: by 2002:a1f:5cc8:0:b0:440:4946:fac with SMTP id
 q191-20020a1f5cc8000000b0044049460facmr2409144vkb.4.1690152109175; Sun, 23
 Jul 2023 15:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
 <20230720132424.371132-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230720132424.371132-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:41:23 +1000
Message-ID: <CAKmqyKPY9EqrzOFnJM2Kt76VmqmR=S1JHh-e-QnC3AA-2QpPwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/cpu.c: add smepmp isa string
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Thu, Jul 20, 2023 at 11:26=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The cpu->cfg.epmp extension is still experimental, but it already has a
> 'smepmp' riscv,isa string. Add it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d64ac07558..8c9acadd3b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -130,6 +130,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, epmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>      ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> --
> 2.41.0
>
>

