Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0278C83030
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 12:58:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uXJSR-0007jq-FO; Thu, 03 Jul 2025 08:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXJSO-0007Ux-3q
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 08:54:28 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXJSK-0000UG-NM
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 08:54:26 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7d5d3f3f710so61573385a.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Jul 2025 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751547262; x=1752152062; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tkfBzDpddJr9lZn50dau+4PajXSOU4T2a0a2JU/cuOI=;
 b=J8clbtbxOER8u6aAnMLkoLfEz1f5m4+/+xThNY9SD3RyoHMIYjHj2fuj1XJ8zde5Xl
 Uqp8s7uNBc8+bluLKRSAWh0IBc4Gl/uJPD1oX+qFdA2SMluoHPyd13R0/IZJnjYzQ+zV
 Lc6CDvvQ9Jdj/tfgDA7XHJwZ7nwkV7BjYTKsYR/5kADTsqc5CJELmYCUsRRC/bjsJ6ke
 ZWpe6ZiGKxkzopTuDL+qYuxtADxwXaRTOfICoc9uNwuUIHg8KcqikthVfxKBv3HuWzpA
 7zinLd9HeXcKRNbBcRGLg6MAn708HmgdVZUvl7aSaGSHKU4QPNnW8r9ivSycXD0TgZI6
 vxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751547262; x=1752152062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tkfBzDpddJr9lZn50dau+4PajXSOU4T2a0a2JU/cuOI=;
 b=b/mBIpWw3zDjogmktoewxAALuT+FnoEACQ3Ht917UkduXd9JRapVIxH2tFYB6toY0I
 dodQxPyvvD8OXqVVG35LXZ+GU4pwRLBsU7UW9AvFEX1s/DFDB0hT165zt7HNzZxNVlvS
 5l6ezXuuMfkUJ+sQuD3Z8PVl4Ia7jByetlsRt0+TGZcxsaWtJSKa0znDV8uOzNYQlIhL
 JoDZOn9d4kFyWvomSoqh+4ZlFQigJeFLTeScIYLd4U+uKIQ8h4uFtZrntbXZTDQRy0Va
 DLc/IBPjQfXohLNEhTbI8E3O63thTmb7RNUZ/0ixnUSIYhR1s7rM7KjQjfoLcTB4D09o
 WV7w==
X-Gm-Message-State: AOJu0YzBG/K6kBe8NeviZ0iMyyM5P0OIWTy17wR7Z68vJB+d2cn4Gdp3
 95/ii4qsUyt50f2FBkRDN0S8XWMIMRezuoHHq2AzP7JkiToh51DP9Ah+7I3coWLIvYM=
X-Gm-Gg: ASbGncvpRvoNfHl1RkXz93tyKW2NpZ/boVfwEtcWnn0BIRyIlpj0Ka+SBL/K0JqVrit
 QvmC0szVyxDyh8tS7NLhUkEJEQlkSzryOmD6ZzlVlyDG2vxgHtUac19i7Twcjv7+iPTkjU0ZNHa
 QNge2qzPi40/EU0YM+iYPKTawmxrU6kPLF5xgwsv7QPY9HfdZ2Ny4w9WC4NvEpTHTr4rFO+iKgn
 PTjxq3hZsutgUahkuM6+MoGFv0f3WJp0eyJZLAUw7Fjk3H3KkuBSaSKOlj35UGYWlNCkHGLAZuI
 ZNiLp9cwWkEiZFUkUFNOyYAFsLACw3ZQYh8h+g8pxyGaggip+g/dR+Ttf0+pWtTZRyo4HjK1UCn
 3WQ==
X-Google-Smtp-Source: AGHT+IEBgS/H5ia4+tdim/wpP8Iw2YZ5rqmDuahfJJaU627vIX6VdZnGcDy+wGvktqTqlPDplnqYKw==
X-Received: by 2002:a05:620a:7003:b0:7ce:d04a:83c2 with SMTP id
 af79cd13be357-7d5d14a0209mr523900185a.50.1751547261741; 
 Thu, 03 Jul 2025 05:54:21 -0700 (PDT)
Received: from [192.168.68.110] ([189.110.107.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d443204ffasm1108236185a.70.2025.07.03.05.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 05:54:20 -0700 (PDT)
Message-ID: <73a34e0e-0451-4f5d-98b8-c0af00c0ff3a@ventanamicro.com>
Date: Thu, 3 Jul 2025 09:54:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] target/riscv: Add cpu_set_exception_base
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>
References: <20250703104925.112688-1-djordje.todorovic@htecgroup.com>
 <20250703104925.112688-3-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250703104925.112688-3-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qk1-x72d.google.com
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



On 7/3/25 7:49 AM, Djordje Todorovic wrote:
> Add a new function, so we can change reset vector from platforms
> during runtime.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu.c | 13 +++++++++++++
>   target/riscv/cpu.h |  4 ++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 629ac37501..e584bdc5ac 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,19 @@ bool riscv_cpu_option_set(const char *optname)
>       return g_hash_table_contains(general_user_opts, optname);
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address)
> +{
> +    CPUState *cpu_state = qemu_get_cpu(vp_index);
> +    if (cpu_state == NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "cpu_set_exception_base: invalid vp_index: %u",
> +                      vp_index);
> +    }
> +    RISCVCPU *vp = RISCV_CPU(cpu_state);
> +    vp->env.resetvec = address;
> +}
> +#endif
> +

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   static void riscv_cpu_cfg_merge(RISCVCPUConfig *dest, const RISCVCPUConfig *src)
>   {
>   #define BOOL_FIELD(x) dest->x |= src->x;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 229ade9ed9..fba0b0506b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -656,6 +656,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address);
> +#endif
> +
>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>   FIELD(TB_FLAGS, FS, 3, 2)
>   /* Vector flags */


