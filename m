Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32199C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyU3F-0001zh-W1; Thu, 02 Nov 2023 05:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyU37-0001yq-G9
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:31:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyU36-0003Nh-1a
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:31:37 -0400
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-778af1b5b1eso40873885a.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698917495; x=1699522295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DUNit1VBkXm8CycQCvGg4ugzI6h0P5rM7lDbkJFnu4Q=;
 b=CqZVmlKdPssLfDV9baUNCg2IfQy299iF+EZc0kuZmZA1Bs5abZ3QB818meAsZDZFC0
 4eZ/CiEabpmfAgFgpky3IqcNnsprTf33DEkUd2CBr+3qZyXfIR+Hg6knbyUv598qAEOB
 NTheygINUSFYCBr3+I3s4gh65P/uekRu0wG51AnS4MXAJ4u1iXAgu1b0bygrheI/F3mc
 UccNMZTBdm+9z7samtI6Ak2n2Pxv4gqv44JsEp3+ZWtU43puumgj54RshVCwLA75ZDV5
 P/Y0F8M9NjjMkkCjXcbrIIoRqarcbRYxFGui9hUN0Peeu1Xe9F5bYwCGyQVSFFqaP5Dg
 ugTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698917495; x=1699522295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUNit1VBkXm8CycQCvGg4ugzI6h0P5rM7lDbkJFnu4Q=;
 b=aCTV47UA/0lvkZ4A8rY9/d4Vr9m+48N5PGeoPUZjTM00JV6RCZPGHBAbJ1BzfsvPXh
 AREZWIkyeB3JjPAjQ5h0GcpLm224qGr+AgKbpygxdP4Iron0MXbW5vovE7mRzJa/voyl
 zqrJ/1YyRCW54XAx0BZPWg1rfDAfX+AybaVPcqPyvE9yMzTC9GXwqR2hW1fHLhlocKl9
 3EJ426/9JKFoyah0PPhSY4CV2861b07Mtt3Sy/2FDKVFltqaCVy4o07PNsSnyO4n5myN
 nMSRYB0s4ZbrAEHYpRIQFy6vN6D8mjiMV/TwzTll/m53knbZ99E1y8I/RToLOvw+GOfX
 WFDg==
X-Gm-Message-State: AOJu0Yw4sfv2nqJYs8SPFUksYxivScEAAYCmsjLn2g7pkCoWzj9ld/md
 +yaDbiRNFhm7wGVQshVXuv2REA==
X-Google-Smtp-Source: AGHT+IFVzGBUZ766Ck4ZWPJzUU/16fBwns0B0/UUpbcVGMnykXDNZoWnXEGdyFms2SlL6JcUyQArKg==
X-Received: by 2002:a05:6214:2386:b0:675:5059:2ed4 with SMTP id
 fw6-20020a056214238600b0067550592ed4mr3207119qvb.5.1698917495247; 
 Thu, 02 Nov 2023 02:31:35 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a0cc486000000b0065b2167fd63sm2203392qvi.65.2023.11.02.02.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 02:31:34 -0700 (PDT)
Message-ID: <61c8a3b0-521e-4218-bec9-f0e58b853abd@ventanamicro.com>
Date: Thu, 2 Nov 2023 06:31:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: cpu: Set the OpenTitan priv to 1.12.0
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bmeng.cn@gmail.com
References: <20231102003424.2003428-1-alistair.francis@wdc.com>
 <20231102003424.2003428-3-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231102003424.2003428-3-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 11/1/23 21:34, Alistair Francis wrote:
> Set the Ibex CPU priv to 1.12.0 to ensure that smepmp/epmp is correctly
> enabled.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac4a6c7eec..b37b9107cd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -595,7 +595,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
>       riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> -    env->priv_ver = PRIV_VERSION_1_11_0;
> +    env->priv_ver = PRIV_VERSION_1_12_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif

