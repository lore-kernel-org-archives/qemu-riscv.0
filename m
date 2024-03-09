Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586B2C54791
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 18:40:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rj1cD-0001YZ-8T; Sat, 09 Mar 2024 13:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rj1cA-0001Xv-0X
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 13:40:10 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rj1c7-0004SK-PS
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 13:40:09 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3c1f55ba3ecso1271471b6e.3
 for <qemu-riscv@nongnu.org>; Sat, 09 Mar 2024 10:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710009605; x=1710614405; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X1jJ8ENU4eG2Qk7hUuKetGnXnJJ8M4ZJe0brbMLOUWc=;
 b=YuAVLVs16TruAJDv30lK3mlIdsxQmM2+zuNQHbxZGMdVjhzzjHWSdg6c/nof1eGWPX
 yMNErCw5NV67Zk/xpgK9ZcONx4adNkhgVb8LpDP7IcorjwIhSsIydKn/HQ/EELA3D9a4
 uCgnQO9G/KXlit/xQ/3wTiTfQA24LX/4kotGetSmA6mYlsmJ9OU/C1MVdzbonRGGygj/
 LamuiBmxq+W2ZT0qlXRnTPCNQMP94Phz8GTSvcZrbARTPR4FMxZnd8fP2dSARY52YyHe
 k2xGPo1uD/m3GoVeyAy9lsBArAez/vzLuYS44uSZyz6F/w98QvdmC6QJBC5ykZtxhmsp
 vl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710009605; x=1710614405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X1jJ8ENU4eG2Qk7hUuKetGnXnJJ8M4ZJe0brbMLOUWc=;
 b=rUCZDB+iIj0vVURb8pH9rHRbz+MzlHzD7UvGdbzKgP5Qubhm+LnebH2X5btWk8WGmw
 io1o/jcWNwwcYE99MizlnlvL0qy7X3EQ9/c7WYgqFsFGOx/dqDEeVqc5Wgruh6JjULPo
 O9elFsFMPqsauEcDGeIimutmaAlzRnUFKBR97RBCkbL2tnVXW7m6hdPzpshKs3ImLYLi
 bWIHZ/DqZ4S6Vk52/gTjf67lEvuAN5TKq6DuEw01p4ZAfenlU1cn0NXWUoQWnn+KHCpi
 atXEEqRIKJFTeWuDEy2sMkLR2pjv8DdJb7IlaJvYyl+EUEEiOBIKjsHbUmO9VKO5cZ3o
 LfbQ==
X-Gm-Message-State: AOJu0Yx4n2nyNxdswsJyvpmma51RNKIWuZclUmiYjx9NKRMioiRm31gm
 iPOnevxsFaqoP6Jgh+SF1jwjiHL6lCF2UuL3vD2NyXFW2Wm5CHXr7jX2oYEfxcQ=
X-Google-Smtp-Source: AGHT+IHoGkkdfgDIZOMsXaU266tFSm/S/kg6SiDlelB/vI8agXEm+aa2tV623wGR9XtO7wwkr6vYnQ==
X-Received: by 2002:a05:6808:201a:b0:3c2:3e2b:73c7 with SMTP id
 q26-20020a056808201a00b003c23e2b73c7mr2538640oiw.3.1710009605695; 
 Sat, 09 Mar 2024 10:40:05 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 n6-20020a170903110600b001db717ed294sm1602328plh.120.2024.03.09.10.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 10:40:05 -0800 (PST)
Message-ID: <04ebf149-d735-46b0-9885-7e5972813e23@linaro.org>
Date: Sat, 9 Mar 2024 08:40:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] target/riscv: handle vstart >= vl in
 vext_set_tail_elems_1s()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240308215402.117405-1-dbarboza@ventanamicro.com>
 <20240308215402.117405-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240308215402.117405-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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

On 3/8/24 11:53, Daniel Henrique Barboza wrote:
> +static void vext_set_tail_elems_1s(CPURISCVState *env, void *vd,
> +                                   uint32_t desc, uint32_t esz,
> +                                   uint32_t max_elems)
>   {
>       uint32_t vta = vext_vta(desc);
> +    uint32_t nf = vext_nf(desc);
>       int k;
>   
> -    if (vta == 0) {
> +    /*
> +     * Section 5.4 of the RVV spec mentions:
> +     * "When vstart ≥ vl, there are no body elements, and no
> +     *  elements are updated in any destination vector register
> +     *  group, including that no tail elements are updated
> +     *  with agnostic values."
> +     */
> +    if (vta == 0 || env->vstart >= env->vl) {
>           return;
>       }

This isn't going to work for ...

> @@ -222,9 +230,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>               k++;
>           }
>       }
> +    vext_set_tail_elems_1s(env, vd, desc, esz, max_elems);
>       env->vstart = 0;

... ldst, because we also need to increment vstart in the load loop, for consumption by 
the exception path.

You'll need to structure the helper as

     if (vstart >= vl) {
        vstart = 0;
        return;
     }
     for (i = vstart; i < vl; vstart = ++i) {
         ...
     }
     set_tail_elems(...);
     vstart = 0;


r~

