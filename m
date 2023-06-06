Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870CFC77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:53:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6WBk-0004El-Ih; Tue, 06 Jun 2023 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6WBg-0004EM-Of
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 08:53:26 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6WBc-0005Az-Ha
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 08:53:22 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b160f3f185so1857686a34.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686055999; x=1688647999;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMLn6NrX4dxBDQCy3kTWwH+NUy/Z0ihwMDQ+0S+Gsfw=;
 b=E/jrnEZ9QpqOib8LdmHfQrPmeh0iHC6PwmJVjYHEVnAvziuG2DqCnW5wDzL/VrJfPI
 EHbrIyVfaqWGxcydPluUVO0XL5dVINIly34B0nsuhJ4Kd5bML+BqxYG7Ji85rAmItJom
 SGN/jXi8hi9gUcKWDExk0XfkVdw9m52c1gTOKSI832COZYgkhP2DmX+AILN2CaaIKZrt
 oP2/qkcv6MT3QbQ73ZEEZkr+z+MnPC3N1YW3ec1mJypZhubq/9lWH+yO+MfwCgrC2gLt
 1jL6zFgLrbj4H2NwF2tU4MRGg3WN8nBxF2MBfFUiWG+igh/8eWqwBQ3ml1+bPcqscSMo
 wnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055999; x=1688647999;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMLn6NrX4dxBDQCy3kTWwH+NUy/Z0ihwMDQ+0S+Gsfw=;
 b=R2Aty+F2M3GnLUF6fbmeiLw9VeB2+W1bE5xvN5K8F3fk72z+xzI1T41vh/HInW5NVF
 kxR4s65oT/au5EEPLQ4IN4pq6zXBMZBbVinlU1NIdD6aNBalEU7B4xsqKdDOQgR7X6Oy
 XKPHrpN55uCasbLfzFQTfXL/cohz/lMh+zlNR+87IhEEwxBJ5DOaNmoIcRttbkNfpwok
 P5q8+q0t4bw2nWK1s5rpJKM3vzaQIZPvcPEGFTKjG4HbxnBZiQC3cl63KnRknZgMZ556
 IGLLHB8enI266mNSAQ6R6xgdBv1fLiFrutxK6WZ/6GRyi/t7wdqT+jNSnu9m8rCOyI7v
 11Kg==
X-Gm-Message-State: AC+VfDxro9t9qIh97JUkFwcdJoLp7JCKOHhluOy6aVE44/2NR7yc3bUG
 5S4uPu8NnyYm1AsxU49YacmP1w==
X-Google-Smtp-Source: ACHHUZ727ukA1p6S/qTSbDgQSZZAih7EeU4l/OXROpvFMtQJ8G3P66AzKGlSJc+2Lo6W4yqeqDrw5A==
X-Received: by 2002:aca:918:0:b0:398:6495:5a9b with SMTP id
 24-20020aca0918000000b0039864955a9bmr921312oij.5.1686055999161; 
 Tue, 06 Jun 2023 05:53:19 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 j83-20020acab956000000b0039a21e8c620sm4605795oif.3.2023.06.06.05.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 05:53:18 -0700 (PDT)
Message-ID: <4c930820-cced-cd60-39c2-73565e2f6028@ventanamicro.com>
Date: Tue, 6 Jun 2023 09:53:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] target/riscv: Smepmp: Return error when access
 permission not allowed in PMP
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
 <20230605164548.715336-1-hchauhan@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230605164548.715336-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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



On 6/5/23 13:45, Himanshu Chauhan wrote:
> On an address match, skip checking for default permissions and return error
> based on access defined in PMP configuration.
> 
> v3 Changes:
> o Removed explicit return of boolean value from comparision
>    of priv/allowed_priv
> 
> v2 Changes:
> o Removed goto to return in place when address matches
> o Call pmp_hart_has_privs_default at the end of the loop
> 
> Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules when address matches")
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/pmp.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 418738afd8..9d8db493e6 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -291,7 +291,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                           pmp_priv_t *allowed_privs, target_ulong mode)
>   {
>       int i = 0;
> -    bool ret = false;
>       int pmp_size = 0;
>       target_ulong s = 0;
>       target_ulong e = 0;
> @@ -435,17 +434,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                * defined with PMP must be used. We shouldn't fallback on
>                * finding default privileges.
>                */
> -            ret = true;
> -            break;
> +            return (privs & *allowed_privs) == privs;
>           }
>       }
>   
>       /* No rule matched */
> -    if (!ret) {
> -        ret = pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
> -    }
> -
> -    return ret;
> +    return pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
>   }
>   
>   /*

