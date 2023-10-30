Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A5AC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:28:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxW3l-00083J-Po; Mon, 30 Oct 2023 13:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW3k-000830-As
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:28:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW3i-0006Ay-FI
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:28:16 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a822f96aedso44283757b3.2
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698686891; x=1699291691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lu2/7lXds9vmvkv1bgzzJ7xgpsriEJt3IyBGL3KkmNg=;
 b=fwq4HbPC3VvIDjD1NUBR6Dsx6EkpCFmkP1IUxO4JqX9UBA3k3y2fv9DqhxGAmMKzf3
 4hk7gBAoN9DiA+eqUZhosQL6gHGa2nqMfXq8O0qn1Jb5AahZMy+4B/2LD+GYlX8KTk75
 wCxDGLQXCnlIJWMFrsndEjJHZ8FOxo4ggiZMhqiQYQ6b/jUQC43Lq/bcPuT0esMva4H4
 sqdWK5TddNNiVQ51nmKNNEm7Br3CXvnWDONJ9rgQ4ivGdYoWqIBpZ3TOFjzsMN6SBEF4
 4B3aWtKdJN6J9XDaYq9OhqjTnpFJkI3lg31rHNZICrnEsJyJBnoaqvCmtgweaulZBmza
 BTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698686891; x=1699291691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lu2/7lXds9vmvkv1bgzzJ7xgpsriEJt3IyBGL3KkmNg=;
 b=EHwy26ZwSLWgzkh/aRjOxjtSpHCru6RGSySCXAOEq7yOe3AJXv3F+DEvElU9hWMcv9
 vTSktNKRBQuqlgb4+Dj3PjjxEa9yQ85N5N9d/Y0ku1couKRsvRCRUO6wPqOAneaFs6P0
 Kof4vnungLm1SrmWC9/9Yw8Fx48ObVptPhsNqg4ffUqiOdKMFQBTtfjyHhYuPSGdARRa
 NA8JYDGDzVc6wAijlcyN7YydwEHgdJz5us7j1YiCmmet7uXvhuKbcGvLfeK3mBLjbDYY
 OIV8MtgHRlSfwiy/P+eXWi6wP8z2ffe6QOgaCn2boAkNDw7Kclk1iXLP2Fsno8+kj1hU
 D2zA==
X-Gm-Message-State: AOJu0YzVLUV5QT9aWee2EbyFxZE6vWDHmr5m6ee0D6u5zk6PtZdYBFqa
 1x2FRowCuvIqSJDu7TxE323BHBFOHNLQquAAKFg=
X-Google-Smtp-Source: AGHT+IG3+zskYo1hj0exz2e7lS3+v8SWI/GSv3FmQJcznoiD2eMjGti16lEaMUrjIAJPFPZrS4fj1A==
X-Received: by 2002:a81:9b45:0:b0:5a7:af86:8d3b with SMTP id
 s66-20020a819b45000000b005a7af868d3bmr10055162ywg.37.1698686890953; 
 Mon, 30 Oct 2023 10:28:10 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 h67-20020a0dc546000000b0057a918d6644sm4578958ywd.128.2023.10.30.10.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:28:10 -0700 (PDT)
Message-ID: <4eef627e-49ee-4d54-97c6-ea89eb772047@ventanamicro.com>
Date: Mon, 30 Oct 2023 14:28:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] target/riscv: Add cfg properties for Zvkn[c|g]
 extensions
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-7-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-7-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/26/23 12:18, Max Chou wrote:
> Vector crypto spec defines the NIST algorithm suite related extensions
> (Zvkn, Zvknc, Zvkng) combined by several vector crypto extensions.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu_cfg.h     |  3 +++
>   target/riscv/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 935335e5721..fd07aa96a27 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -96,6 +96,9 @@ struct RISCVCPUConfig {
>       bool ext_zvksed;
>       bool ext_zvksh;
>       bool ext_zvkt;
> +    bool ext_zvkn;
> +    bool ext_zvknc;
> +    bool ext_zvkng;
>       bool ext_zmmul;
>       bool ext_zvfbfmin;
>       bool ext_zvfbfwma;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 1b08f27eee4..e460701a13c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -499,6 +499,26 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
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

As a follow-up, we should move these vector validations to its own helper.
We already have riscv_cpu_validate_v(), making it a good place to center
all RVV related validations.


For now:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



>       if (cpu->cfg.ext_zvkt) {
>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
>           cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);

