Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DFBC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:18:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welSR-0007IA-ON; Tue, 30 Jun 2026 23:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welSJ-0007HH-Ez
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:17:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welSH-0007Oa-Q4
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:17:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-37fa06b39b4so112736a91.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875860; x=1783480660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ULOQtr1YJTNJ4QgkNmEBvJ3hn7RftSvavRhuzQ74SFg=;
 b=h/3aCX9OPqI8UROhTvFVNjdxYRdcDA6KvSD9kU1qOQxihZoSTr1EnwU7UvjT+6xLoo
 zowKyL8RghWy61yyc/6bZxD8VNRVKGloHLCz32asbPiOBwfW+klpnZmlOOHndpUVLb0t
 T9Ei+mnnw2OM+o9UUitkrUMDsS585OAQ74C6UUTGVkrQ5dF6iwmrWIGC98DD+Ul7GeF3
 gV/GBNLETQ6ch6Y1NkA5w+NTQgNeo7YIvTlE+HffV6Q6F528VyHZ1DKuOcWXEMcZ2z66
 pNp5pEuWVwOoWIyWYhc8t+c/76o7qGTYkRGCmTfK1rTgnM8ukZX6/sfIBJ+W5z2z9yZ8
 LdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875860; x=1783480660;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULOQtr1YJTNJ4QgkNmEBvJ3hn7RftSvavRhuzQ74SFg=;
 b=YbRKKBi8+IgZx0t8ZMrdULEfQoKVH/GlpaDu8Y/XWk2bDXQDMis6dhBtrn+v1l8F12
 7jxBBzRaUHUjBnwA3MExWPFsZz+5xOrVZnHcdXxKUgxDql92X/1wwJ/VF8MbsYnNXfza
 pzoBbx9zOrtiZHIkik+wj6iyC6h+kzUAECUPsNhsvRot/PkDbRoOJ3E/1MjxytEUUTA2
 ZkMRG7Il/DC06JA7y46MfI2ub85H5ZXrshHcPyw8bppR7Jq59xEySwKgfQ3bz686OFmW
 tkVtD4sScMCaCvR+xo4JM9mUsKtgMuGgHREorQb07PkpfIaH0DBKQdvisLAjavYD9sF+
 iCVQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RonEPCgOVjfPW5uHCawzEOVXaGyEKPjL6kTgG587TY+KhmdX7qCbRS3I/BaUBMw9N6EidtEcl4y0FKN@nongnu.org
X-Gm-Message-State: AOJu0YxZ5CWMHVqt5gUkWSgYJ28Oiu8VVRYfIuTWaedwJ+9P+xfwMnPh
 nf4FhX2TNq7M3Ub2KeRCgOgwLTHCwvwdKewAvgj9PE5GDwC9zbJlYPznxznk0SGI8tY=
X-Gm-Gg: AfdE7clHvpTQiSF0RnTArAiSlGkVOExDkD2pThvw5DO+9JihMlJgP7Y9yVqtI9TpdfG
 4zIajxwesWy55OunmegmA0qpl54grZzQAdcafpETx9HZoco74RAuls/67UBUHFpnEa/n8wBbc2A
 9NuTZUCc4lwc5PXjmeRUNWwKu3MvXMQUPYnUJr17cwMUglCiAfOhYb5saiAbZkWLejSIc4fhvlZ
 cb2g7SYasvKDEGarAo5U+p+m04ApcWufrfjUGZPAHWt1rHSu48gIENAliR/T023NuD8qIDzPJq2
 tF14sKVyEsh5t2Pn+Vf/mRhl0xRujGxBL6iWRcTeHFq7rdw7wRB2z7y73PB4mTnjG4wZUggGzQz
 8fCgqXIn2oUNZTAODJdBQPeCaS7NDNoHrNRYRcZv2RzGLV//jd6Kj9KZfBvMCUexH5aowUYOp0e
 HWgHXW7uoMTckRlJZ9md6FgSh7o79DdJO6x0hfUjvG0wo1upB5ctL14tcqULkspseiae59
X-Received: by 2002:a17:90a:c10e:b0:37d:9874:9363 with SMTP id
 98e67ed59e1d1-3808bd3faa8mr2712959a91.2.1782875859811; 
 Tue, 30 Jun 2026 20:17:39 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbcd9f5fbsm2480215a12.9.2026.06.30.20.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 20:17:39 -0700 (PDT)
Message-ID: <f4235288-ef5f-4ae1-b5fe-eafcf1d19dc2@linaro.org>
Date: Tue, 30 Jun 2026 20:17:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] disas/riscv: Use extract helpers for operand fields
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
References: <20260701-b4-disas-xthead-fix-riscv-next-v2-0-e6e4ff5a7847@linux.alibaba.com>
 <20260701-b4-disas-xthead-fix-riscv-next-v2-5-e6e4ff5a7847@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260701-b4-disas-xthead-fix-riscv-next-v2-5-e6e4ff5a7847@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 6/30/26 18:51, TANG Tiancheng wrote:
>   static int32_t operand_imm20(rv_inst inst)
>   {
> -    return (((int64_t)inst << 32) >> 44) << 12;
> +    return extract32(inst, 12, 20) << 12;
>   }

sextract32.

>   
>   static int32_t operand_jimm20(rv_inst inst)
>   {
> -    return (((int64_t)inst << 32) >> 63) << 20 |
> -        ((inst << 33) >> 54) << 1 |
> -        ((inst << 43) >> 63) << 11 |
> -        ((inst << 44) >> 56) << 12;
> +    uint32_t imm = extract32(inst, 31, 1) << 20 |
> +        extract32(inst, 21, 10) << 1 |
> +        extract32(inst, 20, 1) << 11 |
> +        extract32(inst, 12, 8) << 12;
> +
> +    return sextract32(imm, 0, 21);
>   }

You can use sextract32 on the first extraction, rather than re-extracting at the end:

     return sextract(inst, 31, 1) << 20 |
            ...


>   static int32_t operand_simm12(rv_inst inst)
>   {
> -    return (((int64_t)inst << 32) >> 57) << 5 |
> -        (inst << 52) >> 59;
> +    uint32_t imm = extract32(inst, 25, 7) << 5 |
> +        extract32(inst, 7, 5);
> +
> +    return sextract32(imm, 0, 12);
>   }

Likewise.

>   
>   static int32_t operand_sbimm12(rv_inst inst)
>   {
> -    return (((int64_t)inst << 32) >> 63) << 12 |
> -        ((inst << 33) >> 58) << 5 |
> -        ((inst << 52) >> 60) << 1 |
> -        ((inst << 56) >> 63) << 11;
> +    uint32_t imm = extract32(inst, 31, 1) << 12 |
> +        extract32(inst, 25, 6) << 5 |
> +        extract32(inst, 8, 4) << 1 |
> +        extract32(inst, 7, 1) << 11;
> +
> +    return sextract32(imm, 0, 13);
>   }

Etc.


r~

