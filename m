Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C3C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLpW-0000qj-QP; Wed, 01 Nov 2023 20:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLpU-0000no-Qs; Wed, 01 Nov 2023 20:45:00 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLpT-0006a5-1Q; Wed, 01 Nov 2023 20:45:00 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4abd057b0fcso129176e0c.1; 
 Wed, 01 Nov 2023 17:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885897; x=1699490697; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGzsFZvtKTEAqrKGrL7r4En8gYn+F29kYiq7fT8ljqk=;
 b=LJhzSGf+5NHTVNB5te5T1FT1kQfM4JQWswhrDpUX033BCyaEdA/Ib5SjjsCrDyzNBd
 qU5rCG1pgDzDiZ9R6v6OvjN+9JoFndl4i26dx7lpNg9/LksJqQ9H1VPYeCzuXQm3KAo7
 lqU0k+Amz4FMDp5I/DYV9G3eSOdg9kMKa+nmcHhbqfb4Uvd65cIxBfcJyJMl3u9gqQeQ
 GNo7J8r0DL6Pu32DWvLIh/grBshSxi869Zr2BoQt0kRucnST81oSkN0vhPSQ1qzQberm
 5nUixuJUGrFZDqb9lv9O5wttR2nlogvYDGboHNAiCOZVQg4+jVT4CKX0ehTcmSYQJeQq
 E/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885897; x=1699490697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGzsFZvtKTEAqrKGrL7r4En8gYn+F29kYiq7fT8ljqk=;
 b=cXynPAH6CQ9cm/ni0QzLWoZmXVlwXua+SS4iEDCzs9wSgbVPhgrs3jUnLpSwWhLPFR
 EOcBVximJiQWrcyagtNdx1KJ42GzHX+eM9Tu3XWZFv3EXauW1OlfiG2Cx/maxCQv+I/F
 GoJxkTjteuyoEGJdmBZ9dEYHBjj2Li3fJvxmObP2HDAfQuS1fdEKyiYiHeTlap2tBVBz
 ehItKHopF3VtfhShwdizE6frtyByBC3IKJn6JAgAxDsd3btZZlRns1ZfbnEzm9X+DjT0
 p4MVgsLc6Hjge4/ZYNTf5wjhp0HkEYv2j31WWA9WC5AJff5EDGqbdxIJctOtpapltQB7
 s/GQ==
X-Gm-Message-State: AOJu0Yyok7Awf+5NNpZ2IXyiZS0kV5DeZRSRDsTfeGT7UPziqSDUn+KE
 pGgn3n5xxfXyjluOBwcsyKO5GMBA0D+2EQhldOU=
X-Google-Smtp-Source: AGHT+IH2VykP6ws2qcxyRF9FO/3VyE8OJvGwy3r+z5Fh3Bhe6K7K+UFaGG09L/FCa0eoiVamWKECYmqqw8T+0+H7fRA=
X-Received: by 2002:a1f:1e52:0:b0:49a:8237:c81 with SMTP id
 e79-20020a1f1e52000000b0049a82370c81mr16508956vke.13.1698885897278; Wed, 01
 Nov 2023 17:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-3-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-3-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:44:30 +1000
Message-ID: <CAKmqyKPJYPiZexeVTfEBeLHjdaFMCv93G6TLcxiFFR8MArRkNg@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] target/riscv: Expose Zvkt extension property
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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
> index a2881bfa383..5099c786415 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -131,6 +131,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
>      ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
>      ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
> +    ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> @@ -1375,6 +1376,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
>      MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
>      MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
>
>      DEFINE_PROP_END_OF_LIST(),
>  };
> --
> 2.34.1
>
>

