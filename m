Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9E3EB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 19:32:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHrBB-0003N1-R9; Fri, 07 Jul 2023 15:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHrBA-0003Md-Ew
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 15:31:44 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHrB8-0002XD-M4
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 15:31:44 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a36b52b4a4so1401133b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688758300; x=1691350300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccTiCkLVA/LRJPZjVHRAReNmK/s85i/9qg8fzqvgX8E=;
 b=VZvsl3JZf+mNArvtcn3ht10sC6xpEFZgLEaYluUV0uhOXFhi+cZykwyyCHMqa2Iphm
 ImYSRISE8Gn/8ATbWokLCzLf9kuyXm6dmXvNP71hSRfRsBNcXEd8p/y1Z2NFFoz7NaJa
 63cBY8G55/c8kiZN9cp27i4WpB5xPwyF617tRljh/3lmZPu8eub17j/3qzdYrmeBXleS
 hmkzUQoFH6FZp2NoxgywXTpwOYdPT8pnap56cFq8VojUmq9Wycczy17oyPdo62JPcrR4
 X7wCsk0lf/LYG7f8wu//TvDLWhXK4473+ikN/rDOp6CGrgsDBeHzC9/JX/K4mppAThMN
 PGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758300; x=1691350300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ccTiCkLVA/LRJPZjVHRAReNmK/s85i/9qg8fzqvgX8E=;
 b=hzp0fBH+M620C1SZSxZou5t2KkuWzlCKiwXfiK1OBnUzqCUImMZIpAQGkboXf+LdVU
 F9eajd34LMuK9oR9e15BAgZSnrxgP9ZnRhXckazkc2TyjksPBtWy1GOfFJHf6Mu5ekXt
 MTYbiAEIkiq9iuYq2gXkBIzJpUzmCg4Lxy7Gzg1co4BXik2qBcMjaA5w+rOM3wk+s5yV
 IMgV98dyN6H5MAnRmO4G7+I6VlSEPpP9xnJ8q4+qRgsl9/jY6escGYtkUsbAy6H157Um
 E4oJfKKEOPE16AA3gCotFITwOLlJrG9emQUSXD/1kjOctQ0uCe4Aj/RdKIVuHwv3/Odp
 peeA==
X-Gm-Message-State: ABy/qLb9Q9lU/EeXsfuN7cRtA6DcZI90X6QEyPxgE0cjCbhxOW13RlaU
 eM3KnQDiM+eqCsaocpDPdVSjJA==
X-Google-Smtp-Source: APBJJlEv6mOuKOP4l6srcdwZwhqGFzf3bqoHNG/VX0l7NULTAbWbwvFCjLwiAtkJvyLHIq8CXuItBw==
X-Received: by 2002:a05:6808:1444:b0:3a1:f18d:2fe8 with SMTP id
 x4-20020a056808144400b003a1f18d2fe8mr5256267oiv.10.1688758300384; 
 Fri, 07 Jul 2023 12:31:40 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 4-20020a544184000000b003a361fbec60sm1939734oiy.47.2023.07.07.12.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:31:40 -0700 (PDT)
Message-ID: <00b01e30-2675-01f7-dc39-19214d6f5197@ventanamicro.com>
Date: Fri, 7 Jul 2023 16:31:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] target/riscv: Remove redundant check in
 pmp_is_locked
Content-Language: en-US
To: Ruibo Lu <reaperlu@hust.edu.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, luruibo2000@163.com, alistair.francis@wdc.com,
 liweiwei@iscas.ac.cn
References: <20230704023811.4355-1-reaperlu@hust.edu.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230704023811.4355-1-reaperlu@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 7/3/23 23:33, Ruibo Lu wrote:
> the check of top PMP is redundant and will not influence the return
> value, so consider remove it
> 
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
> ---

I believe we might want to add:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1733



>   target/riscv/pmp.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..1a9279ba88 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -49,11 +49,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>           return 1;
>       }
>   
> -    /* Top PMP has no 'next' to check */
> -    if ((pmp_index + 1u) >= MAX_RISCV_PMPS) {
> -        return 0;
> -    }
> -
>       return 0;
>   }
>   

