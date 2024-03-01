Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0304CC5478C
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 15:51:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rg5AJ-0000bN-HG; Fri, 01 Mar 2024 10:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg5AG-0000aa-P0
 for qemu-riscv@nongnu.org; Fri, 01 Mar 2024 10:51:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg5AF-0006G5-5e
 for qemu-riscv@nongnu.org; Fri, 01 Mar 2024 10:51:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-412cad778afso3282885e9.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2024 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709308269; x=1709913069; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oDa42n1Ei544pT0WBQ9oXhFQ/0gh0b6vmnfaufFTyEQ=;
 b=Iov5Yt4YkIUTLy9P3i3SPCHOcz5BVFJ4smKOdd6Mo1t5y+0w0lJ48nrzGSOnUd+U3G
 TZK3S1+/AYShI1DZ9Gwjit/0eOODeBKh7mGkmikYhrSgXaFSaOphoWwQp/H/hEHB8tir
 QZYEnvFAT+FxYlck9nzFLIL64CJZUUPX72NBVkQLwrhZpNNQMB9WeLganSjXF7ppBuV7
 mPPUJdOSjgMVSVzPfcpJjaiQxoXKjPQMlPY/tAhOEtsHeZLuqwdevc7pTtXqZYvVXFK+
 1YPDDyaZXYW8KVVGIc6vvbETnK9T8n4SsVSmLRz5AD2Wv10SYyd0TRGgC06Jpildo6xV
 xlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709308269; x=1709913069;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDa42n1Ei544pT0WBQ9oXhFQ/0gh0b6vmnfaufFTyEQ=;
 b=Ng2bxbIy9sXDr/oPHnFGs/cf0N3McS5CxdN0NP79mjqir2G+j8S+7ngddqlQoxWpzP
 Q+ZHljfzdFFIMZeLPC/gVNA70CLCBUCr9pmKeDDVtysBY/hGblriSg8OwldHCmUyr7fS
 HtcooB+S782UEgNuOZ/wSii7cvi5n6wCXKjUEQCtWs5DtNm0WKwdJh0pkZf7Xju3WgHW
 sbKP5kRYqkDz7o6NY0/5tK34ku9L7sLgSCeoXC3XxLi4C4zw2qmRlRry740ev6naWX/V
 06DzX7WfjNspkoio03t4htxUDFYj+HLIZIi69i0Yd36aQ/4dtXanTzkL4zHLYFpUyZfl
 1TyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDvRWnCa6YF4SeodgzTfNDW2UTWips5SCmmZQct0s+N4tVRykr9BvWjX4gCdX1kCRqL1E2+73Yr4s0LjTXSvFyChaNAFg=
X-Gm-Message-State: AOJu0YxPKWVj5M88A0Z3HEscIBl7nd/0JtW8ZLF2/BNnj3RaoBwqn+QC
 H6IxE4iQsYwuTMHKWk3zmTXlIvrAAtkQOiWVxvd0UmB9r8ag0cpNqlkjXC4pPAQ=
X-Google-Smtp-Source: AGHT+IGujuxe+gtr9lPXWCvwbYjTszypujrzlApGruG8+p6211u7l3zcARs0gf1EwTFKRW5WA0SDrg==
X-Received: by 2002:a05:600c:35d5:b0:412:b41a:53a2 with SMTP id
 r21-20020a05600c35d500b00412b41a53a2mr1855736wmq.2.1709308267394; 
 Fri, 01 Mar 2024 07:51:07 -0800 (PST)
Received: from [192.168.193.175] (232.red-88-28-18.dynamicip.rima-tde.net.
 [88.28.18.232]) by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b004122b7a680dsm5956241wmb.21.2024.03.01.07.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:51:06 -0800 (PST)
Message-ID: <4ed4b35a-659b-42d2-a0d9-9e7340b732f6@linaro.org>
Date: Fri, 1 Mar 2024 16:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix unexpected Illegal instruction error on RISC-V.
Content-Language: en-US
To: SiHuaN <liyongtai@iscas.ac.cn>, qemu-devel@nongnu.org
References: <20240301145545.333810-2-liyongtai@iscas.ac.cn>
Cc: "demin.han" <demin.han@starfivetech.com>,
 qemu-riscv <qemu-riscv@nongnu.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240301145545.333810-2-liyongtai@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Hi SiHuaN,

On 1/3/24 15:55, SiHuaN wrote:
> Avoid right-shifting by a negative number of bits when lmul is 8.

FYI Demin posted a similar patch, see:
https://lore.kernel.org/qemu-devel/20240225174114.5298-1-demin.han@starfivetech.com/

> Signed-off-by: SiHuaN <liyongtai@iscas.ac.cn>
> ---
>   target/riscv/vector_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 84cec73eb2..f0158ea237 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -53,10 +53,11 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>            * VLEN * LMUL >= SEW
>            * VLEN >> (8 - lmul) >= sew
>            * (vlenb << 3) >> (8 - lmul) >= sew
> +         * Considering that lmul may be 8, the following form cannot be used.
>            * vlenb >> (8 - 3 - lmul) >= sew
>            */
>           if (vlmul == 4 ||
> -            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
> +            (cpu->cfg.vlenb << 3) >> (8 - vlmul) < sew) {
>               vill = true;
>           }
>       }


