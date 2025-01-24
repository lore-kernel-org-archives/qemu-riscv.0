Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1318C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNJ7-0005qB-TT; Fri, 24 Jan 2025 12:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJ5-0005pa-K5
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:17:23 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJ3-0006zN-Uw
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:17:23 -0500
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7b6e5ee6ac7so193081685a.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739041; x=1738343841; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpxW8MxerAbm+Np/0rRPy4odW6Pnkt4zy9gY1/D9R70=;
 b=Jz7QSdF35HE71nst4xoNZ3zJt2yMRj1wzrFbtXBsP86Lz9O+SqJ4ibySxSrfala1gu
 odh0gBosKQ8+vUHiwb67lRMmxlFYCIw8OpDFfc3SJweJPgWKmqI00SVWfiWY2Squ5pzR
 2zoMH3iHE9ohG4oEwcRs+KnlUvfdfzdilGEaK/JvRhhBB/GsbDRyO1UbEVwKNst+qUBj
 V6OM2I+dGh7IuaiCH/EGqmk582mhVyL2TfiBxb+pfolZ9TZarIFbR+pUXEZEJ9Y/8QcC
 Gc0tKqzpH0VxvhBJxsp/NZ5aN8XTnHNMZVSzygrIcpb4b90aFpxAkvmx916s/yEPAKGu
 O0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739041; x=1738343841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CpxW8MxerAbm+Np/0rRPy4odW6Pnkt4zy9gY1/D9R70=;
 b=tEDNodD3JsmRR0h6E6NQxXYMqljz5Bj5RLPAJffKlo5V0utJcm/NN5xMUnfvO6MrIu
 Ivg4qyYv9r59yUuyCC2d7QG1U9w2nARqbAGi+hPgPG7RthClicIxB8SfPhMnFuev0KVZ
 xxeQORdPUURiPM0TnHwFrkZSckBl1nJHPh+n3F0NqmgNBxYT4474rB0b7WrldXTQnLKp
 JZOBQU2XoP0UpvfwCV7DQWgrB7KXzdv7gmEbLi1OKe99xNNj4ENAbDMl/eU2bKRjiyK+
 qIlx9rlmKMRGL5JxgP0aNMJUgr+B217OxVFY/SjiEZg6sHQRJhWZRMNGMeKIz+vlD0TF
 zLIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUww2m3u6BnYUCgzAAOaDX8xzYeqFeGfI50s+tVBHNmLor7PGfsaJWkoHPkQAlkvmkjwwT1UhzAof0P@nongnu.org
X-Gm-Message-State: AOJu0Yy199m2DZdGxVXPkYsY2pnN2PnSJWFv4qK5/UMdfzft5PGAlUp7
 nNWrIILMwPhcTwIGQEIDd2fFYLQSefgvtpEpFJbsVVv7tSgY0OvQYODtI4VqI2cmdvm1OtoLEJT
 0
X-Gm-Gg: ASbGncuVrDnYluUE2/BFd6YFXJAehvb5C+P5JmnCz0vU3Z6bCz44JUbCEWejq9Q4LWL
 woJo4Gp5zardBxbNcwtNUru0N/HARGGjGmtBZOsKd0xIZN/XDGN20G6BeEtikE38nmlgrGw5bUT
 iC5+dBelazr8jnFLP5SDgp2VgYB+gQZF83Ipp29WD1Q0n7+oNEPbTuu1tJjDNuzn1uCv1Ym8lt2
 qZAImhweZKnKuItJ57BuvHXN5UgFfns77fTIuZqlQioIQFSbRYJw60ovIaFWNCUNIaO/R2RF3Ea
 NS05kNd6FWKN8Y6bZKuiNig0yBBpB524C51eSnP/emxd36ZLt2f01NRl4EpPgX/imQ==
X-Google-Smtp-Source: AGHT+IE8sPM7ySgfWBuysxqsiv/qvZAyiZsk4w4l0DkHAYwmbJ7XI4QS2w0TANHnkWNVQ9N9mvvmQg==
X-Received: by 2002:a05:620a:2a15:b0:7b6:e888:6b0e with SMTP id
 af79cd13be357-7be63219d5dmr4527197785a.2.1737739040901; 
 Fri, 24 Jan 2025 09:17:20 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9ae8aaa9sm113008085a.34.2025.01.24.09.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:17:20 -0800 (PST)
Message-ID: <0bd61928-5bfc-44c7-8fc7-333f8e2e0b77@linaro.org>
Date: Fri, 24 Jan 2025 09:17:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/28] target/riscv: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu.h       | 9 +++++----
>   target/riscv/internals.h | 3 ---
>   target/riscv/cpu.c       | 8 +++-----
>   3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 97713681cbe..32e8e064f36 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -552,10 +552,6 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>   int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
>   uint8_t riscv_cpu_default_priority(int irq);
> -uint64_t riscv_cpu_all_pending(CPURISCVState *env);
> -int riscv_cpu_mirq_pending(CPURISCVState *env);
> -int riscv_cpu_sirq_pending(CPURISCVState *env);
> -int riscv_cpu_vsirq_pending(CPURISCVState *env);
>   bool riscv_cpu_fp_enabled(CPURISCVState *env);
>   target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
>   void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
> @@ -576,6 +572,11 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
>   bool riscv_cpu_option_set(const char *optname);
>   
>   #ifndef CONFIG_USER_ONLY
> +bool riscv_cpu_has_work(CPUState *cs);
> +uint64_t riscv_cpu_all_pending(CPURISCVState *env);
> +int riscv_cpu_mirq_pending(CPURISCVState *env);
> +int riscv_cpu_sirq_pending(CPURISCVState *env);
> +int riscv_cpu_vsirq_pending(CPURISCVState *env);
>   void riscv_cpu_do_interrupt(CPUState *cpu);
>   void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename);
>   void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 67291933f84..86def39aec2 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -142,9 +142,6 @@ static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>       }
>   }
>   
> -/* Our implementation of CPUClass::has_work */
> -bool riscv_cpu_has_work(CPUState *cs);
> -

Why move the declaration from internals.h to cpu.h?


r~

