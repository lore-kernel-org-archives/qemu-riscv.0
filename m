Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419AC77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 05:32:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6PIg-0000ai-7R; Tue, 06 Jun 2023 01:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6PId-0000Zd-VK
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 01:32:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6PIb-0005h2-82
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 01:32:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30e407daab5so2054878f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686029523; x=1688621523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VfOOJinkjSh0l6gqLPyVdZ8e/+vLTEa7wa66JblaO8=;
 b=wfJmQ+zvrNbpk09oYfwAqwk9SS0iVDZEAWLyBiOOHlfnE/jQo6QrhdGayqYC4EamnA
 TyBfJJgBV2pBgcKU0fxdDcWtJVV9FjhJnN41c6gCct5d0EHO7X0R/55eN7N4gLKw5MTH
 Zur32UJArgDQEg4Uv8O7jwVBeB4JAjMlhoq3JM3zI9HpZIcP+1bj5VMPjn5FNJknkaBV
 1XsD9hhxvT8QmJrZdpvccHXwUInj/YSPZOMWCL7ELMKezBeYuIDOdl30pfvgEA1ko/zp
 mWWI1LolhPD8bFt0Md3Aclv6P8zxcH12UWHsqwbm1+rx7mS3UrjpeBOsr1oCborWTfwi
 J+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686029523; x=1688621523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4VfOOJinkjSh0l6gqLPyVdZ8e/+vLTEa7wa66JblaO8=;
 b=E+Drdl/TMZzeSCPNUfxHJoyyZSkQcZEnDJ16v53+8gzW9+qiKa1/WTouzJwiiHOUt/
 f+ERLYUTACcGXspwgiCrXO1UGNeeffSGUJ4mBfxX260PBgm5MuS5+sAwP3CybG9EGN6s
 hmATg0HnMRS44kkvbGXzQtokP5y8fr7bLsBN+seaws3aJNZ35jKbLAKAXDkjFd07m3Lc
 1nFMtADHGx8AXsCyxDjYhJ+Xq9D4UcyJQlWrOazSmirJmc1rt+R5XplZYSTjTXNZwQmd
 p5/xR0bpkYOyGGdevVxi9K7uVo/FMcgW04Ce5bRvFG1Z+wyssToeCuFl5iJg0GOobKQ1
 NNHg==
X-Gm-Message-State: AC+VfDxE8feQKfUrVc7nMDzWjqjfpu98lZRLdm09OkgSix9NjOZGtYpf
 Av6tLDc+Iq8nSq7F6E4bipZRwQ==
X-Google-Smtp-Source: ACHHUZ7KW5f46Fu2TwW8RcBsG/OabhqdnHsanr6dWn081cYThqa/uEaRyr5Xt8LyYeDjG1Kl+Ie6Dw==
X-Received: by 2002:adf:e3c8:0:b0:306:2eab:fb8c with SMTP id
 k8-20020adfe3c8000000b003062eabfb8cmr885316wrm.42.1686029523455; 
 Mon, 05 Jun 2023 22:32:03 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b003093a412310sm11412127wrx.92.2023.06.05.22.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 22:32:02 -0700 (PDT)
Message-ID: <98003cfe-742c-d932-5949-499750489663@linaro.org>
Date: Tue, 6 Jun 2023 07:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405160454.97436-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 5/4/23 18:04, Philippe Mathieu-Daudé wrote:
> All types used are forward-declared in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index cc6c678ed8..7902acdfd9 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -16,9 +16,6 @@
>   #ifndef QEMU_KVM_H
>   #define QEMU_KVM_H
>   
> -#include "qemu/queue.h"
> -#include "hw/core/cpu.h"
> -#include "exec/memattrs.h"

Oops this is incorrect...

   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);

MemTxAttrs is not:
- forward-declared
- used as pointer

Since this is now merged as commit 1e05888ab5 I'll send a fix.

>   #include "qemu/accel.h"
>   #include "qom/object.h"
>   


