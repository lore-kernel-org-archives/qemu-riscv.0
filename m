Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB5EC04FFE
	for <qemu-riscv@archiver.kernel.org>; Sat, 11 May 2024 17:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s5qKx-0007XV-28; Sat, 11 May 2024 13:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1s5qKl-0007Rk-G4
 for qemu-riscv@nongnu.org; Sat, 11 May 2024 13:16:33 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1s5qKj-000718-Tn
 for qemu-riscv@nongnu.org; Sat, 11 May 2024 13:16:31 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6f4e59191a1so1215817b3a.1
 for <qemu-riscv@nongnu.org>; Sat, 11 May 2024 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715447787; x=1716052587; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7XFEW2hHqsE0W+wL5BHvp0VcOoKk6+31RYpXFA9UgwM=;
 b=OfZLnQL8Qymgk+vT10/ssFgVPMd2xLfDlM4oR101pGhMLQL7J7f6nika99MNjpFJ4M
 XR9oQCmUra3e8kwWQnIYHVNI1t66XsMTuUDXibNgHOuiFpCYxUkFGffttE7KbjcLi+zN
 Tmu/bm7OznvtrX1KPdSYCv0XXOxgtUfvSK6SCiTK2S4si7gjBijUISVuumwSL4BuazYZ
 6a9VgoTXXQK1YXCWEYsSfKTYjls3fgqLmI5D0hqJUL3NCZGBTAQQPoNTlDO9f2MOU/HN
 Fvb36adN/kolCv0lhTKJLPJCAFQ8ygvmPXX3NszrUvJnp1+E5SNk1z/YLR/DNAY3RyN+
 EOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715447787; x=1716052587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XFEW2hHqsE0W+wL5BHvp0VcOoKk6+31RYpXFA9UgwM=;
 b=lvYm3GQN7xF/dcrG/98o7hRq4kDtCL5YdSyUlyKsrYn7kAvUOeWiUuxbeFCKWyDOxV
 IigVjWmifDKy+iibNLKT6jpyVDdUUgibDz2qCemmKCMrRvzEktXTgjn9Y5P2x1ZHrjC/
 PYre+OM9iT0vJ9/zHoB6kLYLzqEqji6015JwFRUucvrM4fJfiQimsDshIs9bNunkBSHZ
 LQkhz7PDgRtoyc9RdQpTdKNQzxhg66FBe/vGbEtiCd9QMjS7Z9LjagDuVxXPnaJdyWQV
 sWubhcYwqF7f3WfRasm7GwsvuhDcsy42F1SJKv4WMONG5BE4FpMvycvltWG731UeXMZt
 k0JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kQvWlZJ2kVyncClTok+HUdDEHjOhug/tqyv12anOMmJsdJBafy96Vh61FItQ+bJcbnfn8GgABuP64lmpEl473jD9avQ=
X-Gm-Message-State: AOJu0YzFdEU8yVhNC8rGBMnYS+SsYLM99fkRV+8MJTeGSlMY55XazLXG
 jU4hyUh0iDa/T0kckfXCoLvniJznvRGr8QBCc3GOtLKWMtYyaFxp0U3vMiRxdTA=
X-Google-Smtp-Source: AGHT+IG6gaS4/gw6yPhUgm3gb9Ue9h0NwoWv0Avq85x4xR0mDaiQuzPO3E1C0WibpgmQMPiehqQt/w==
X-Received: by 2002:a05:6a00:1415:b0:6f4:b6fc:dfc7 with SMTP id
 d2e1a72fcca58-6f4e02ab7d0mr6033867b3a.9.1715447787467; 
 Sat, 11 May 2024 10:16:27 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a828d5sm4683105b3a.62.2024.05.11.10.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 May 2024 10:16:27 -0700 (PDT)
Message-ID: <379fca17-8631-48ff-8105-6c6f7c248d43@sifive.com>
Date: Sun, 12 May 2024 01:16:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] target/riscv/cpu.c: fix Zvkb extension config
To: Yangyu Chen <cyy@cyyself.name>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <tencent_7E34EEF0F90B9A68BF38BEE09EC6D4877C0A@qq.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <tencent_7E34EEF0F90B9A68BF38BEE09EC6D4877C0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Max Chou <max.chou@sifive.com>

Max

On 2024/5/11 7:26 PM, Yangyu Chen wrote:
> This code has a typo that writes zvkb to zvkg, causing users can't
> enable zvkb through the config. This patch gets this fixed.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Fixes: ea61ef7097d0 ("target/riscv: Move vector crypto extensions to riscv_cpu_extensions")
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
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

