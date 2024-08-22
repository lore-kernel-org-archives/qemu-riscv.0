Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF35CC52D7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 00:57:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgw8k-0000kf-Dm; Wed, 21 Aug 2024 20:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgw8j-0000iy-3y
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:57:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgw8h-0006Uo-BV
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:57:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7a1c7857a49so206341a12.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2024 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724288240; x=1724893040; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1263F4mV4Km5S8FWF7EIKOjU44U7JCrIs1gfANxD3mU=;
 b=KN3BDT8grI/Vqlnmk5/gnyjINs9fp+zc7Jd176AUT5343ZK3CdBYtbyX6pjh2f6iOW
 q0GYP/NGrzocv6AsvicIOdVnNLV+BOygZudBTnyeR6XyrdpFe5yHRcLHh/HbIjZOgniz
 X856hWh615DwbCBgnn09SeRj8RqgZIqZO7WQlP57Cq1M9j2SC7f7ue56PugMj7qjsaGO
 Z5HAxoi2aMdgGZ8bJ2+gUqrgOHakRT7WtEbz3qkzOOSNxDIFdEDLD49rOlchpRIX/p2F
 XFARmMl1aIDFvRq2jDGgtFC2UwUMN08kYw8TSQI9rXqdqYQ1ZYETTfXKNgP/JhkVigTF
 l+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724288240; x=1724893040;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1263F4mV4Km5S8FWF7EIKOjU44U7JCrIs1gfANxD3mU=;
 b=QVDzMBmh0FNYuq78wT1zsVBzkfZ2WHwDVMicigudGzO7Em7kGkIaicfoSHIFC3i9UI
 ot3JmSbrutSou+R9ZYZgP9SfakPtVgx77z+QRp2yOx9IOqhusY4GRsuHQTD2+7Up5hYd
 IZpMWBIF3S+UZW2Svez9K7jK1iN5K/eBzc4zQuaTCh8rPWCB8pAnTYqNK3sB/FbRDeUV
 4Rzk0jUQn2mrrHstNVYj960VTfNK3Dnvj0FsjZx3Y/ngUIguTYio0VldXDYCOxil2VkD
 9Mh25I6NOTnYcvs+b5Amd73AV9CO5OLfh6XV0VRqHwqnsY5R+2+7A50Nil1u89cOHGdV
 kt2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa3QBzt4eQm2jO7oa8i0xZq3Rx86qNf/2mVxgFMxi2eEDSDaCeECjfn6OhvnJ26PKk0qim65llTdaU@nongnu.org
X-Gm-Message-State: AOJu0YzW7ONbofCOmzVGBRQLA3k4IuS3PHy+kpxDCfuzpg0ZVLs1JkmH
 cUunOW5vPrA3ShNEjWgRfvdeFUj7fnCtKa0wRfY+IMiUeZ15TgX5f8tt/ZNAPzE=
X-Google-Smtp-Source: AGHT+IG6PBMktc7XjaT2glIiA03QR0ojwwl77ZJkXaiuGk4NvMXH0wX7yf9Lda6WElPWl1nXCLGWbQ==
X-Received: by 2002:a17:90b:4a04:b0:2d3:ce99:44b6 with SMTP id
 98e67ed59e1d1-2d5e9ec96d8mr4277160a91.29.1724288240078; 
 Wed, 21 Aug 2024 17:57:20 -0700 (PDT)
Received: from [192.168.98.227] (60-242-98-186.static.tpgi.com.au.
 [60.242.98.186]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d5ebbb009bsm2583228a91.41.2024.08.21.17.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 17:57:19 -0700 (PDT)
Message-ID: <85deb108-cac1-492e-89be-0997510fde0b@linaro.org>
Date: Thu, 22 Aug 2024 10:57:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/16] target/riscv: implement zicfiss instructions
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240821215014.3859190-1-debug@rivosinc.com>
 <20240821215014.3859190-14-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240821215014.3859190-14-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 8/22/24 07:50, Deepak Gupta wrote:
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -18,6 +18,8 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include "exec/memop.h"
> +

Why?  This will have been done long ago, within the includes of translate.c, the parent of 
this file.

> +static bool trans_ssrdp(DisasContext *ctx, arg_ssrdp *a)
> +{
> +    if (!ctx->bcfi_enabled || a->rd == 0) {
> +        return false;
> +    }
> +
> +    TCGv dest = tcg_temp_new();

dest = dest_gpr(ctx, a->rd);



r~

