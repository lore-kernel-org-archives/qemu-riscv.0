Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A897D3A67F
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 18:59:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t5rR4-0008Md-4L; Tue, 29 Oct 2024 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t5rQy-0008M2-U0
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 14:59:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t5rQw-0001K2-Mw
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 14:59:16 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-20c693b68f5so63226475ad.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2024 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730228353; x=1730833153; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SCqDGgkVhv9SEwqIERUFigt4Y/PjkVNti2HwnBeNZw4=;
 b=O/DZyqkM2aywGBxBZ2fk9x4qW8X+UcL+Ett3GSpgWdFKdXQDnWhe0JyNeBljP7DJWh
 pHQ9QCAqX+6sw5Vii+KwR7SeyiMUZ6haHCl4pXJW1KNdXCIzJo2HoYfqst+j0r9fJCgo
 E339L7UeAdXXff0DIj1aGtIpH0HI+GlqePN8xVlQ/KciDTtH3G1EioNA/T4RlAPOkNKq
 +umJ8ebhD2AI3MC5acEBVzYwYSkleYPq6tXT6MlNKS5rV/T9oFlbgvp60pCj+qTRtJUO
 AruA8V+xr8YpuukrvaSvgivuJglBaf369vkvklLHWiZdIjKRznma332IM+MRYHBZl23c
 95Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730228353; x=1730833153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SCqDGgkVhv9SEwqIERUFigt4Y/PjkVNti2HwnBeNZw4=;
 b=mrFkjTgbCUy/mfPP5Ole4oVDKClv0rHSeSgPOv1gjRT1Xhw8PbARgXy/M6XNDKie1l
 moOPPWJw/zz84SW4Gqkw2CEvCQ/xqm3cRIoF9r9pxoBwLJ7grMsWZOkoxhZeJVgQecFn
 PQh+iC90NqdKlNugMnih0O0ZxGxL/WotiCwMVP+CfTiDrowtcQeTV4x/wEeMbXIlLTgz
 MlRqK6GTfSK+BtTKv8rl1uuTg4M9duLFv6HmehuKEBj6ACxswNr9HKhfQrIvA+tJy1Px
 cRf8bKg/svE/K2HVO7CJwt+mM/B4flD9omYvBRKVWo/ChD8taNAvJkQnXXhU/wuW3r7n
 IfvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5zY4jgqeJTDvd7Qd+Pjxo56P8afu2Cy7HaFXV7a7bMH6ElkEC6sgDCY46ieJAEOsVWjBm3m/jYcow@nongnu.org
X-Gm-Message-State: AOJu0Yxo5tL3h7K0iMDGGpeAP0pw7YkorgjEEgHGk8uavCqhM3AVzk1u
 94Q2IqsSUvz43pNj/tCRKAbMFxWqokj+bMnKrsq/Usb/9ybsxuvIPqbJvy/FlA4=
X-Google-Smtp-Source: AGHT+IGQQYnru3XJ2+7YhZsuTFJxRHrP93t/xW4wioeIQrOuJ/oxYIXSLqRQnbwQ8E8IDlMayg6QTA==
X-Received: by 2002:a17:902:ce82:b0:20c:bca5:12a8 with SMTP id
 d9443c01a7336-210c6ce4f68mr151690715ad.60.1730228352699; 
 Tue, 29 Oct 2024 11:59:12 -0700 (PDT)
Received: from [192.168.68.110] ([191.8.109.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc04ae0esm68860115ad.271.2024.10.29.11.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 11:59:12 -0700 (PDT)
Message-ID: <aad4c62e-6e4f-442c-a837-f84a4bcd32d4@ventanamicro.com>
Date: Tue, 29 Oct 2024 15:59:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] target/riscv: rvv: Replace VSTART_CHECK_EARLY_EXIT
 in vext_ldst_us
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 richard.henderson@linaro.org, negge@google.com
References: <20240918171412.150107-1-max.chou@sifive.com>
 <20240918171412.150107-3-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240918171412.150107-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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



On 9/18/24 2:14 PM, Max Chou wrote:
> Because the real vl (evl) of vext_ldst_us may be different (e.g.
> vlm.v/vsm.v/etc.), so the VSTART_CHECK_EARLY_EXIT checking function
> should be replaced by checking evl in vext_ldst_us.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 87d2399c7e3..967bb2687ae 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -276,7 +276,10 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    if (env->vstart >= evl) {
> +        env->vstart = 0;
> +        return;
> +    }
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < evl; env->vstart = ++i) {

