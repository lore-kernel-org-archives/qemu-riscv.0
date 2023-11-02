Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCF0C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:44:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLpD-0000eI-QH; Wed, 01 Nov 2023 20:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLpC-0000do-Mp; Wed, 01 Nov 2023 20:44:42 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLpA-0006WQ-7f; Wed, 01 Nov 2023 20:44:42 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-49d8dd34f7bso172408e0c.3; 
 Wed, 01 Nov 2023 17:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885878; x=1699490678; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdPawGMmVtrqe6ZxnWjCx0V9z88CMRJnNs9pTTbA3hY=;
 b=OKzn1o8CpOGv8L86Na1fNCZqJx/4NzDgIdXWJGWT2T5P64lUCT25uuZNJ1ZceBTpeV
 tYLPp/dcVQM1E3NsLYy8gLB1izcl018+Y6wr4Ub2yHIFJnU0ymR02xQ8BdPKdrklMMuu
 9LKWPKWJDb5Tt2p6KtUZolsBoymKkLjEicb33Wb78AgdxfeTnKy/w8iIsLtO+HuEQTUk
 LJtATT+GxxyzGfR6a9r7wZBL4faH7DOdlYDLyUNtVrnVoGtw8cqp5HRJ10BIrEtjkggj
 DU/JcnILMnyjw27BbVCX+H3fswfjoUrXgDIEJsZ+GOi+7EsXuKkSFm5zXpaR1rDzKfa+
 pIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885878; x=1699490678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rdPawGMmVtrqe6ZxnWjCx0V9z88CMRJnNs9pTTbA3hY=;
 b=gvR25pjJx8fmNC+gDa2oYSfNvjiPrsrCENZ9ar0hF05jCFMT8mOlI2EdHVQAPTR4Nv
 jIhu5DlOCKBJccChvWzTUc1tW2KPzelnSDWlEOw5QXr+PJdGxRBxqAehwdgCwhQ57YOY
 yy9kxgrnkSLuc1aG1X9lSNqr99BApUGJZLi2iegVMShrLsG5Kk1bSm/TsTG9BieIg+Vy
 UW55AZTiwRW7iSqj9TuMk/12M922RYrBbKcoa+Ht1e4H2kpYeWbWw+03K8EaLfcM3ooS
 +lfVJQrwsm2cpf+2q/Ra0JAhBFoHb9QNs3i0he/A+uSRPhjJzV3FIROjHS9U5E+HxM7J
 dgjg==
X-Gm-Message-State: AOJu0YxpeGdSAs00kRRGSsrVmElV9DTeQEfZNtotJTPzilFd0sxvZTTp
 pr6n+hB25q5/8bMusAQjoR9RK2V9dywR8pgyLdM=
X-Google-Smtp-Source: AGHT+IHSX5zOUpb57UiRe5fNSugZyTPN5ljxH/tOh34IaCjw6jP1b2iEDx1eQIAusDiKPxRS73j7YRbrjmD9tTbAdo8=
X-Received: by 2002:a1f:1dc8:0:b0:4a8:4218:804b with SMTP id
 d191-20020a1f1dc8000000b004a84218804bmr15714060vkd.12.1698885877894; Wed, 01
 Nov 2023 17:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-2-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-2-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:44:11 +1000
Message-ID: <CAKmqyKPYFTkbsyVrch5ZVdMfi-SFifZUxSoXgmDOjjgjCzbSkg@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] target/riscv: Add cfg property for Zvkt extension
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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
> Vector crypto spec defines the Zvkt extension that included all of the
> instructions of Zvbb & Zvbc extensions and some vector instructions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index e7ce977189c..d8d17dedeed 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -94,6 +94,7 @@ struct RISCVCPUConfig {
>      bool ext_zvknhb;
>      bool ext_zvksed;
>      bool ext_zvksh;
> +    bool ext_zvkt;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
>      bool ext_zvfbfwma;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index c5ff03efce9..b9eaecb699c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -499,6 +499,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          return;
>      }
>
> +    if (cpu->cfg.ext_zvkt) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> +    }
> +
>      /*
>       * In principle Zve*x would also suffice here, were they supported
>       * in qemu
> --
> 2.34.1
>
>

