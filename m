Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C72DC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:50:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLuc-0004oX-MG; Wed, 01 Nov 2023 20:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLuV-0004jv-PH; Wed, 01 Nov 2023 20:50:12 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLuT-0000Pr-VQ; Wed, 01 Nov 2023 20:50:11 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7ba8e3107c9so150877241.1; 
 Wed, 01 Nov 2023 17:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886207; x=1699491007; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUi2feV8doZyZo65diDRU2VDTpGzMURT1Ra9dQVZ3hc=;
 b=gPcXgrwlFIOjvYGlU3O0LE221Oq1f0f+uC1dIJ13oFCqlHsgMsQqWPwH+/eE9TV4bb
 sckDYtVwyyGh80a+Ly+dN0oHmvfu6cAHxWhR7tKh4J69qYhph+x9t61mhlOdm/xoOiVO
 7TmlOfq3PZNsqO3/VOgwD05QKbjUGPBFPPI7JStXMZX/ti6oOrjUiWbYiRPxyvX035i2
 U+PHGpzoRRjQFAnz1igdu8vrM32tg4OA2zaSkMx1iirltNRd5wHkYTFaH8hDy4LUmmXW
 0/mQwr+KS9sW84gFeFKG0iFHERryvk5oqaFIaAA9HOc5Jn/dqB/5HOPjsYR83sKjo8q3
 k8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886207; x=1699491007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUi2feV8doZyZo65diDRU2VDTpGzMURT1Ra9dQVZ3hc=;
 b=RBUJ7wH/4RYgxmMD+M/W1t7pM2cK7ue/WSSoIkQt/UR6NX8aoa7iN064pL28mnhx+D
 /wGv6km/L0kH1LVYa0XGG65AwnjCCfUXKtDyQYJKKPqU8gZJ5ZQU7NH6KjRrWgcU0dFD
 KVsh2yJpdXQSNu+l0iQPWxQtR/bpk9ko6bdY3R8i269wYUbYW2tWnUfqSfYMefUVIPXI
 L1mVQJKCjWqZKRHjdp+3zxYcMba7omvImXcxNR8iGr4yiljqm81Sc628sUHtCQOenW8Q
 ngNf45UlC1RQ6ofa3a+sLwtBspNNZjj4/tSqqnPP55hc2d5t9KT1k1BK4PzrpF4cXJMd
 TEOQ==
X-Gm-Message-State: AOJu0Yxn6cF5acCQF2o+rJQPUivLheBabWNlmYFXXm1Wzr2HJ9fI8Bbp
 1qKqGYrZSwhwQHeFd8KiuO1DnrM03t6D+2y+UW4=
X-Google-Smtp-Source: AGHT+IEB09IasGmc7ffK+qnRF/4ePSsG0o9e3axDPLlj3W5o0pU7qCIt7A7ukwSuHhWHNB4DGf2c18/soq9zAbetTLs=
X-Received: by 2002:a67:c204:0:b0:452:62b2:36b with SMTP id
 i4-20020a67c204000000b0045262b2036bmr12166273vsj.30.1698886207507; Wed, 01
 Nov 2023 17:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-8-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-8-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:49:41 +1000
Message-ID: <CAKmqyKOFCT5UPQr8jc6DM-pmL1LpDiJeDhRBSASHhphopHQyJw@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] target/riscv: Expose Zvkn[c|g] extnesion
 properties
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
> Expose the properties of NIST Algorithm Suite related extensions (Zvkn,
> Zvknc, Zvkng).
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 992f8e0f7b0..8eae8d3e59c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,7 +127,10 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
>      ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
>      ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
> +    ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
> +    ISA_EXT_DATA_ENTRY(zvknc, PRIV_VERSION_1_12_0, ext_zvknc),
>      ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
> +    ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
>      ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
>      ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
>      ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
> @@ -1379,6 +1382,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
>      MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
>      MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
> +    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
>
>      DEFINE_PROP_END_OF_LIST(),
>  };
> --
> 2.34.1
>
>

