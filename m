Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26907C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLtv-0004Ef-KB; Wed, 01 Nov 2023 20:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLtu-0004EQ-NS; Wed, 01 Nov 2023 20:49:34 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLtt-000082-4o; Wed, 01 Nov 2023 20:49:34 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-457c2e44f20so190496137.1; 
 Wed, 01 Nov 2023 17:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886172; x=1699490972; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpPDH09rrtiu0ihq0+Fze0k4jg6YXQNFjUTWDNQeNP4=;
 b=GAoNsifOovUI9zvVL0hM/z1RS5cRJ1woA8Dyf4jI7hI+rpTOeTQnzTo0o5n3ietvug
 tQSf4wJtJWhYd2yzink034ZftmnwXQIi8EcPzYMapL1WIOXoTlt94mtbYSPRyn9FJ+Mu
 PIba4SlWs9fv3qSsaVvgg3oM0LoFUwR1cz3Pb+ITXcE2YxHL/mmkqg/WFn7/QxDhMh5T
 pRbgowbuaLYgcEXoi5lXmUctHRLKiu74EJ7GSR5ZYOwc6ALWT2mAWl2DUhAEUjnnHtKR
 J2rRgNTFWtz/G1RbBRcZlt2rD7EmET8blVf1aGPV/ueLcSfQyHQ+0w2HZsyOVkCc8aum
 WbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886172; x=1699490972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpPDH09rrtiu0ihq0+Fze0k4jg6YXQNFjUTWDNQeNP4=;
 b=JshdwrOInwK0KPekW/9PJ8z+MQah6Yi5QFjUB+a3/GskOrMnd+0fyYdJJ7GGbBZY+E
 kqNRKNVaEdagIdUxY/XeIVZ7qX4Mn8unUVhyxdMcrqZiJJE6AXDW+FlJiLEafZqeHJvo
 UwFdaJeB6Q+bdDXNdR+EfTEaNAtmqvCPZMsv9TSfXCEhs/nVN4fPNnEWRDbVMRzR3gKF
 QbQvDbVjplXRz1nWXY2arPod/XkdFUOpxkKU08JyDRJnLtf+LclZgjYEjMq7p2joMXfr
 fGEdfJ0LOx+mdrVhUX4howFx0LUZRiv/zm+oHu4PJaf+lLVcAhWjKtkQ/lq+GqejL5Ni
 lEAQ==
X-Gm-Message-State: AOJu0YzQQgeAUaki8dLwkoUM7+zFNFFXXNHsozMz52vnvmyEPAtrIFWi
 FlgKZH/Idg7mu5uhmKhT+h9PyLpK/5Tbr0WoVx8=
X-Google-Smtp-Source: AGHT+IFy2OCqDj5ekoSUZfYUJj4iOVXfqklv2VDNXmtOnw3+clNX6wO2imQC1nFyFe9X89f7yRkrtPZTXNhGJA9Y0M8=
X-Received: by 2002:a67:cc08:0:b0:457:bdbf:8a34 with SMTP id
 q8-20020a67cc08000000b00457bdbf8a34mr15873235vsl.29.1698886171783; Wed, 01
 Nov 2023 17:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-7-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-7-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:49:05 +1000
Message-ID: <CAKmqyKMgXGCp4wcgjfmv5H0TJ6qTG=fdLayeKEhN0YBzUNkzBA@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] target/riscv: Add cfg properties for Zvkn[c|g]
 extensions
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Fri, Oct 27, 2023 at 2:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Vector crypto spec defines the NIST algorithm suite related extensions
> (Zvkn, Zvknc, Zvkng) combined by several vector crypto extensions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg.h     |  3 +++
>  target/riscv/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 935335e5721..fd07aa96a27 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -96,6 +96,9 @@ struct RISCVCPUConfig {
>      bool ext_zvksed;
>      bool ext_zvksh;
>      bool ext_zvkt;
> +    bool ext_zvkn;
> +    bool ext_zvknc;
> +    bool ext_zvkng;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
>      bool ext_zvfbfwma;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 1b08f27eee4..e460701a13c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -499,6 +499,26 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          return;
>      }
>
> +    /*
> +     * Shorthand vector crypto extensions
> +     */
> +    if (cpu->cfg.ext_zvknc) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkn), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> +    }
> +
> +    if (cpu->cfg.ext_zvkng) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkn), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkg), true);
> +    }
> +
> +    if (cpu->cfg.ext_zvkn) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkned), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvknhb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
> +    }
> +
>      if (cpu->cfg.ext_zvkt) {
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> --
> 2.34.1
>
>

