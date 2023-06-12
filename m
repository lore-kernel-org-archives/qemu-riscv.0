Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD4C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8b07-0003qf-9A; Mon, 12 Jun 2023 02:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8b05-0003qT-I2; Mon, 12 Jun 2023 02:26:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8b03-0000nO-W4; Mon, 12 Jun 2023 02:26:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-650bacd6250so3095422b3a.2; 
 Sun, 11 Jun 2023 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686551157; x=1689143157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OpyMnkbVAycFx8P+Gc1NJCL5P6PbQWCu/mgvBxwSFXw=;
 b=pD2nw7da0O7N1d9AUYMBMng0Bh8XswK5mPMFKEYNdKWRQ5eB2R4nURK8trLIxAAMD4
 LsxPXjRhau9MYg3HnAPm6HXz7jT0RAaf66hJTqgplSKApMCmZ0W9SAZvC/vD+9NM/cpw
 gC5hADpvYNCiY0ADfopKfsjBAUnWNncfK7i+I+O+57S0m1SZQWFhyDkxqLW4evzhC67r
 HrkL51y2CG2iMY4eLww+BqtQIGw6IHSOe3IUhy1BK3al7XoWRfhYjuGQzqVGJqH/oG9X
 Qs+abK1h1GY1t05arBY/JGCVIq63gwhi7YfcLeTjSoYNqVhX8FUCneKTiKAAGqbn97Lv
 q9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686551157; x=1689143157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OpyMnkbVAycFx8P+Gc1NJCL5P6PbQWCu/mgvBxwSFXw=;
 b=fSojCStIzALbVPveQ052x0qCYAOtE+46SKyikiNKELBqUXgCuuIzfbYn5CyARazVNy
 2YYoUXsDeV+LzFLRHlDS0SVMs53q989hnu9DY3Ewm9Tbb6PCw27GZd1XyVOsGNQF8/Bx
 uBax2Ig5cuC0oCN62EjkXprt74JLyAVdKRsTK4BOnt5FrLKhxM5yCk/Fq7RNLRJuRjnT
 v7fqcVzGUbAdbxJxc/yF5wyAE21NWfSZ+Q8rzkyK1if8PlJXH2PMF7W748pGuW1AtWLN
 EwoSQwF4gOxoe4VSQ+THiE+hxQuvhwbeWeCv5PTmgVf+tAxzeEbnQNd12hgdsjNykHxd
 r9Gw==
X-Gm-Message-State: AC+VfDwZpExyFg93jsa6Uq810Lkm9+XSsFGlKudx/Zj9g7jm7NwQK+eU
 YxQslpu+fNWKl304Pp+xRZk=
X-Google-Smtp-Source: ACHHUZ6BrCskY9Q4qH/ac3NFWg0UCmQpy7rJ1n53mhOTOVT2wctyr9vKrWPVQAditSo8+f6gYMpGEw==
X-Received: by 2002:a05:6a00:13a9:b0:653:852d:4fa8 with SMTP id
 t41-20020a056a0013a900b00653852d4fa8mr9371137pfg.3.1686551156993; 
 Sun, 11 Jun 2023 23:25:56 -0700 (PDT)
Received: from [30.221.96.167] ([47.246.101.55])
 by smtp.gmail.com with ESMTPSA id
 r201-20020a632bd2000000b0054a8200ac4bsm4189341pgr.89.2023.06.11.23.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jun 2023 23:25:56 -0700 (PDT)
Message-ID: <29c57d6a-247c-ef4c-da4c-f3021bb0ea54@gmail.com>
Date: Mon, 12 Jun 2023 14:25:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/9] target/riscv/cpu: Share RISCVCPUConfig with
 disassembler
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-7-christoph.muellner@vrull.eu>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20230530131843.1186637-7-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=baxiantai@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/5/30 21:18, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> The disassembler needs the available extensions in order
> to properly decode instructions in case of overlapping
> encodings (e.g. for vendor extensions).
>
> Let's use the field 'disassemble_info::private_data' to store
> our RISCVCPUConfig pointer.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   target/riscv/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5b7818dbd1..6f0cd9a0bb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -819,6 +819,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>   {
>       RISCVCPU *cpu = RISCV_CPU(s);
>       CPURISCVState *env = &cpu->env;
> +    RISCVCPUConfig *cfg = &cpu->cfg;
> +
> +    info->private_data = cfg;

I don't know if this field will be overridden by the binutils. Can we 
extend the struct disassemble_info, and add some fields like supporting 
for Capstone?

Zhiwei

>   
>       switch (env->xl) {
>       case MXL_RV32:

