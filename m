Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E1C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxW5Q-0001Uq-8B; Mon, 30 Oct 2023 13:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW5O-0001Tv-MO
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:29:58 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW5N-0006RA-12
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:29:58 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5ac376d311aso44763217b3.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698686995; x=1699291795; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcYqIckJwJqzebceNGkRXnnHc7nSGvpFW3k3cu5EXys=;
 b=lZSBOh8gGEcjAo0KcGL1ChEbKuwv4idtKnHpwPwdHQIRjllqr4cQbATdlqtau2ZzWL
 RBS/fWqBiULEUD9gan13sdlUCzBZT5VYo9RoVxU6LpZ4rdy4EZRbEF/cNqDY0xhN0gpk
 0zupDIejqtXKT3CjM+htwNf6mdybj2IPMkcE46YWBf/uPCNvtFjJxJ8aqqiPO51WZJ6s
 fDkjCof7xiucycI47SaaZgxb/bLPczxVZumYOmPl3v1Hg6qugIyOUZk/NLeG7kISu42J
 bVLMliJ24H/EvGOcW6alFo3yAlidcUIz6CryGYK9tOopeImRK1H7AvTJw6tVfXRtwILP
 61EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698686995; x=1699291795;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fcYqIckJwJqzebceNGkRXnnHc7nSGvpFW3k3cu5EXys=;
 b=l0hq1i7e8K2oSZntiYsYEpf/3vrmn4mWNmr69YduxiHumjDRdze3BSUlR+Rcn35wKi
 rIxWphMkt2q/V3nQA5JerdRqid+uqkqJ4VSLm+FZNZdWwWqdoq0LQnYhWOY1BxdS7XdW
 YZQYhpCvUKUK7M8yVC0jTgNi4j2HRVQE5VXrzRuDnsrABywdHwZIn/a1EoiRQDyW3OEr
 +gTgDNVqLAnIIOXfFFyHBvYTD/Rh/Mcl642OiTNsSN7mESdZCOGhSjUmuANaQTD/jMbV
 VbthT1CYfhEtoM4WYh3h5Q5B5W/wtjkJm89zGNQ3ENV/t134piVjBnPip1i4VAAYbut1
 Xupg==
X-Gm-Message-State: AOJu0YwmBlfnYWyFbbJJs8MDAt77DcTcEZRwZCySWj/Nt9ViXMwyRarz
 C+R98fA0LY4UMIbd/yr0vYyF8w==
X-Google-Smtp-Source: AGHT+IHBQkBD38/CCu3unFIITzEtia9BybAYNbeZ7uy6SCcgkXYwjoILdYMuBTYmcgOIKHq4Jdu1xw==
X-Received: by 2002:a81:c704:0:b0:5a7:b81a:7f5d with SMTP id
 m4-20020a81c704000000b005a7b81a7f5dmr10305561ywi.18.1698686994701; 
 Mon, 30 Oct 2023 10:29:54 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a81be17000000b005b03d703564sm3915791ywn.137.2023.10.30.10.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:29:54 -0700 (PDT)
Message-ID: <aacea11b-af69-4c4b-8165-88034988ad66@ventanamicro.com>
Date: Mon, 30 Oct 2023 14:29:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] target/riscv: Expose Zvkn[c|g] extnesion
 properties
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-8-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-8-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112a.google.com
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
> Expose the properties of NIST Algorithm Suite related extensions (Zvkn,
> Zvknc, Zvkng).
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 992f8e0f7b0..8eae8d3e59c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,7 +127,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
>       ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
>       ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
> +    ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
> +    ISA_EXT_DATA_ENTRY(zvknc, PRIV_VERSION_1_12_0, ext_zvknc),
>       ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
> +    ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
>       ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
>       ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
>       ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
> @@ -1379,6 +1382,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
>       MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
>       MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
> +    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };

