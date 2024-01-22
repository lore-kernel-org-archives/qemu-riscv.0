Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A48C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 04:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmLp-0004wm-3f; Sun, 21 Jan 2024 23:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmLm-0004wL-8w; Sun, 21 Jan 2024 23:55:59 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmLj-00033b-On; Sun, 21 Jan 2024 23:55:57 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4b78b813dd0so477313e0c.3; 
 Sun, 21 Jan 2024 20:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705899354; x=1706504154; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1DRBnPUW7LDIgb1eBqu1uYKbW1nor7/7fRm8Gl7UG4=;
 b=k6HeoQ+kB6aJPPKab2SQfavEHtlZ5ZPEApqN0xmHf84yO8Ds13FaG8y2HPd7ZnWcDo
 7VGNq//iVJlZNwubMemLqoZ3boPckS1DXhp51wgb8ZNXHOikhmuDcWXnQUgvuAFVew4j
 cr4lY+chcprE2mXGl7TPgmSwUL+hWjqF315jZw0ECQu6e3glOz3pQ9f6Q/p8EzVuoVvB
 LuJGXZqSFhocPHrhoCz2OQDja4WsB9XtgKDwmrJbw+s0ytzNOqlzQoYlxdo4dYNhS7aN
 FN518QUAQa1415aZaJl4ucqMaxsxeuYuJ8jnPGV+Kzb4r0VUyBDIP7kpjk/MeD5GWoEU
 ZozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705899354; x=1706504154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1DRBnPUW7LDIgb1eBqu1uYKbW1nor7/7fRm8Gl7UG4=;
 b=E5qwsQjYnyOQ1ztQRgB0ZOdNphW5fEjSE5CZ6XTMc9aW0dJLInfj1ycCjDAlqnUS28
 XJx3ij9nnKGgtkRMVdCFSW3iJezZ9eC4iejn1cuRWHdiE2M4UZCB5/7l40BKxn+x8r2J
 yJ3a8EW7qwpG6rpDhl4KYscZec+ykE4vWzT/O/6yvXllDlx2jCCYzYwkQCop/71jX3Yf
 udLE/9gLp/knDojbIoASqbP0UEK6T4GbGLQtcOQcWck2iWohftccS14jo54p6S5igDjq
 868HmAmmty23gaYOBe3xlB5VIG2CtYhcXq5ZYcw5Cq7CD/bMcrcKQFUaZ+QB6WBQ/Hf6
 IhPw==
X-Gm-Message-State: AOJu0Yxbk2dOAPdKOJdsvNHwviQdS6GwdhaQHi29Ih9TTWIhuBtxaZ+m
 P3YuZCRlPcWaJ0pKE1kYbb3/5pUT+xEKwg3LZgzLXEz2T1DZXM+vlyu6s+asd5UIGhIyug01ggT
 VP54Qd6JkVz2LkofxvFvXZeagUNI=
X-Google-Smtp-Source: AGHT+IH9k/5CcWiG8NJdVheO0DuESm2YBA79faTUnabOI8P5dppJN26WK/RjXhzSmhwNmg8Sk6E2VIEvx7CmUpHpBrc=
X-Received: by 2002:a05:6122:90f:b0:4b7:2940:8fa2 with SMTP id
 j15-20020a056122090f00b004b729408fa2mr832309vka.12.1705899353770; Sun, 21 Jan
 2024 20:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20240109002554.646572-1-atishp@rivosinc.com>
 <20240109002554.646572-3-atishp@rivosinc.com>
In-Reply-To: <20240109002554.646572-3-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 14:55:27 +1000
Message-ID: <CAKmqyKMgy8UGJ1soavRFh0rWJu2iyY-WbevSh+Ot=zuPVUz6Hw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
To: Atish Patra <atishp@rivosinc.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
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

On Tue, Jan 9, 2024 at 11:04=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>
> This adds the properties for ISA extension smcntrpmf. Patches
> implementing it will follow.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 2 ++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07be..501ae560ec29 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -144,6 +144,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
>      ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>      ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> @@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t=
 bit)
>  const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
>      MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>      MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>      MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190b9..00c34fdd3209 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -72,6 +72,7 @@ struct RISCVCPUConfig {
>      bool ext_zihpm;
>      bool ext_smstateen;
>      bool ext_sstc;
> +    bool ext_smcntrpmf;
>      bool ext_svadu;
>      bool ext_svinval;
>      bool ext_svnapot;
> --
> 2.34.1
>
>

