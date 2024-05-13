Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B48C25B75
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 May 2024 12:22:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6Ugt-0001OP-Ui; Mon, 13 May 2024 08:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s6Ugr-0001Na-3q
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 08:22:01 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s6Ugn-0002Yl-Tb
 for qemu-riscv@nongnu.org; Mon, 13 May 2024 08:22:00 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so3474033a12.2
 for <qemu-riscv@nongnu.org>; Mon, 13 May 2024 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1715602916; x=1716207716; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wiMkWx3T5F0LZKJkA1k4nNiiIVh++xI2bXntF1viwPc=;
 b=X2j23vi23cbFDZkpJRRqCAkHrWcYU1ad9fm03bxbHyTYuyuM4RFAbBREBdymIzHLDu
 7RTrOOQOGXCdLCjmzfJih9DLV8fYJfXY7+qeTGnZ/L/sbHo3DIjhChq5xX9nWn6WwvBW
 UNinwMZFQZ/IQJD7+XFpmRUoaZtorqIOy52QU/extZbo1BezRCFi4YAdO7EJw7NbZsh1
 INqjyMt+kuB9eKwcNnkWaSEWC8PXDjjq8BgjXUt4xwvpP2L/279wOqmJBwAHOD4/y81G
 aiVLtcFw5reIsATcodpOxzaBaBmsGaTaOHaTOUqwSGGk2r42d0rf11Kvw3XKofNVHQvL
 2xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715602916; x=1716207716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wiMkWx3T5F0LZKJkA1k4nNiiIVh++xI2bXntF1viwPc=;
 b=AQuL8su41sI6E9UdcXxeV59h9M/LSe1svqRE+bzlyUmCdMcy0csRBp/MN4I0HjoKFN
 ygS2Lhx3gXN39UfXKrLLXmXOFL1M1lHOTImQAUQTqr+n7LLWmOU0a4LRiT0GfC8WMBGA
 qIBdUuc6Jz9euUmv4cG4XK7oZaI+RLIi9V7vzrwD7nNbpz+XCPA6VWeFBQ9PpSN96nKA
 FhpODBBQDb/ohrnczq1oXxmh578TeMRGyhnL4OFafiIoVttSnM4m+0NapDnJEq1Y1238
 it7hq6cgciqrvzhQi1epdSlKRzZMG2zMkwMr7ZKcDidIF5G2V5HF1MZlECE2wYZvYdxH
 m8zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT532K+k9uKnQRQnLd3jMajWI493X3l6k3IBKF9if2QcScoW+PgctOToMxDbEb+XgYlAiDdv4ProFXJGrlrJ/2opkjJI0=
X-Gm-Message-State: AOJu0YxYlS3pnZeKWreR5LKTnAJqEQRXLEmYhCSqsDqHcskz1f5Z0GBJ
 52dloL0/3abbzE6AiXqCUkzSWZvRGqjFwRtASg1xHL/gaP+hedRuxGci01s4Shs=
X-Google-Smtp-Source: AGHT+IEmVQZJYMonjJ9+vWHrWPSAs0Wa5DKStTriPDM9FWu3fViqJZ/14KhbvjrBmfArV1Ult6Eo2w==
X-Received: by 2002:a17:90a:2e84:b0:2b2:7e94:c5e0 with SMTP id
 98e67ed59e1d1-2b6cc758cfemr7074152a91.20.1715602915988; 
 Mon, 13 May 2024 05:21:55 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.57])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b6ab8750bdsm6244981a91.49.2024.05.13.05.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 05:21:55 -0700 (PDT)
Message-ID: <9b50e4fd-6056-4dc8-98d6-be235bd89bfa@ventanamicro.com>
Date: Mon, 13 May 2024 09:21:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] target/riscv/cpu.c: fix Zvkb extension config
To: Yangyu Chen <cyy@cyyself.name>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Chou <max.chou@sifive.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <tencent_7E34EEF0F90B9A68BF38BEE09EC6D4877C0A@qq.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <tencent_7E34EEF0F90B9A68BF38BEE09EC6D4877C0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x534.google.com
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



On 5/11/24 08:26, Yangyu Chen wrote:
> This code has a typo that writes zvkb to zvkg, causing users can't
> enable zvkb through the config. This patch gets this fixed.

My bad!



> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Fixes: ea61ef7097d0 ("target/riscv: Move vector crypto extensions to riscv_cpu_extensions")
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


Michael, here's another one for stable.


Thanks,


Daniel

>   target/riscv/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index eb1a2e7d6d..13cd34adbd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1535,7 +1535,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       /* Vector cryptography extensions */
>       MULTI_EXT_CFG_BOOL("zvbb", ext_zvbb, false),
>       MULTI_EXT_CFG_BOOL("zvbc", ext_zvbc, false),
> -    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkg, false),
> +    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkb, false),
>       MULTI_EXT_CFG_BOOL("zvkg", ext_zvkg, false),
>       MULTI_EXT_CFG_BOOL("zvkned", ext_zvkned, false),
>       MULTI_EXT_CFG_BOOL("zvknha", ext_zvknha, false),

