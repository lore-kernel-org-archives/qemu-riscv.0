Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D24BCCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 16:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7G9I-0003EO-CF; Fri, 10 Oct 2025 12:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v7G93-00036J-Tq
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 12:39:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1v7G8t-00022o-HG
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 12:39:04 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8FEC33F857
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1760114331;
 bh=Y4iIKwW/REG2fy7zqN/4K0VxvoaFykjEUhPEfuHJTMk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Ph8scYjSKJxw48lGhaMiTPyIcSfob9Baez/q986mjt7hmCW/y6l7k27cv9CqcIu8K
 3WHQLYRL/I6Kjp/Pts8dwNoQpvZpfgAGNr8gYNrorhUcoNUZLG9x+OSzMMYWjYTJRM
 EX5i7ej6Y252LTD0V25mpFMIamgLcNwZ7wh4kww5zSRDPc5jPQTwA+V0/SvVV+od+6
 Gcuey7NjLQcL9l23treV+yQeDJx2gL890xz/F5fcjyGVWh272xgSwRCtFG79ZvfCa/
 C2x93GbOWXwuWT/Gx1EDWD4fT3TAJ+YMfaMhHaIdvFIWV7X0DWicSeQlVI7Fsj/Sb+
 nrDX7cQkt0AaJYpZk/0MgG5wbX9095kk9sBQkmVOkB/gusyw+WrThbgb6dIHWtJbQl
 OWsjTaurcdx7AkTlCjYMQHzYY8I6AxT7zjk8SIDMQh1yDhTskSHkmfVpYUBT9UrRA4
 S2uN55K30UEysIrzWC7fRuj0nX/lPZBxwiy4ifGaP8rX2xelUJubVVlZPZgMI6e8lx
 DClO8xPizWfSwzvM/5ESsDazknvof3KHi1ujROk7oz5uQU9nYtw1dwGpjA0lA/wk14
 sqms/4AStxvnhk9dTGMsKxETbXorV0B4d+JgAt2MJBRPIzFWJTIEHr03C4M0C2T0oU
 ZLyJFDyH7bsFV/TXr37MgQGg=
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e39567579so11585675e9.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 09:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760114329; x=1760719129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4iIKwW/REG2fy7zqN/4K0VxvoaFykjEUhPEfuHJTMk=;
 b=P0lZ3EpqSPxKB4w5iAocl9KW+Ne0JUe5ByUKYBmWF7xdAx58Aw02g9nsUpuRvM0mo9
 whEy6hUC3uXBq7vMufhebFkAhXYU04JUXMMro4BnU7c4n6giRzHuiYrJbYc8g5qf/FQP
 NfxWgTzPWgWE4xOePBh57CZJmwVh7Z77IFEHpYD8dxagvjjU2KdvZZiJXLpWT4cVg0pP
 JvQpCpqHmAr3G6tqo6U6SIhNPywqec3vKw5xXri0ZTsfsMrjU7uMKuv6uzposT/iVIZ/
 L9OF4BD0bLxQE6Jnj+HAeY48D67rc9U1xtACq0p+ZZUhKB2qvFmEZqVeWuSeh5Al3FhQ
 L0Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWToxtssBd0/rIuHYSJma/74MTkY6VJ5b8iTArDTcejEsjf3jBJcmzS+Yc0/GpsusVSuMa65WLHTHsJ@nongnu.org
X-Gm-Message-State: AOJu0YwBeJPUnO9tZ4RLQ7+mMFWUeColu+KwUoYRvjTKSFGsEuixzPkd
 aZzCxkNRoox2Yf5HOTRPlft/24UL3nMWI5x9bBzHXQpGxDUgrfQRKSrAy4mGLlrIywA7bCHMdc6
 hr/4SiG7oe6ZSerL6JC/Xlz34TFvSjdaXbsX8mxBJhHzliepqUud9e78uAgSjORh/EojCTeID
X-Gm-Gg: ASbGncs82c4tJGtfmfsb0PsndGu4B3S89RFxS9VkdqvE+DO6kfHpfTnADHmOJ0iEsqj
 GD7Mab1UTI3AT3dSbLxVvVDPGW7MxyVamKjOw3ElGNzCHNWw70sm/TZKsviYUkc3yXP6YTN4+zl
 XGrVmPQ8Fh2MGBh+8DBdhN796B3yp7LSDqSW9NBEa23w1VVvsdHTg89TREjcJiIWMYxuEgGpoog
 axwpYyFk/7KQ96/wN+gMIibpuA1IbOdO4CE1Io5rZ4mFVxuPWm8e2FA/wLhYDQ0hGruswimMXxg
 iIBg1FxqAGfazLnDiGL99Bdzto82ewzS17CSEPw9j2FVggcF+upomXcJsPkDOEKX+WpNC5onD70
 D5mfqexkcbddEkgRHfUr2Z/BRJlxfA8VJ1vTqWFyz/akZ0hn9
X-Received: by 2002:a05:600c:4752:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-46fa9aa48d7mr91075685e9.15.1760114329211; 
 Fri, 10 Oct 2025 09:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiEuIKCmOtGqvJgAJqkvjEdLIdBMsg4fCh16P5xIzF/GR83E2w+iJm/EX3eLpvQ1mCPZ0RJQ==
X-Received: by 2002:a05:600c:4752:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-46fa9aa48d7mr91075405e9.15.1760114328766; 
 Fri, 10 Oct 2025 09:38:48 -0700 (PDT)
Received: from [192.168.103.116]
 (dynamic-046-114-109-147.46.114.pool.telefonica.de. [46.114.109.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4982b30sm53309035e9.6.2025.10.10.09.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 09:38:48 -0700 (PDT)
Message-ID: <174e2a19-85f4-48f5-9a22-aadd8c3848a6@canonical.com>
Date: Fri, 10 Oct 2025 18:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] target/riscv: Introduce mo_endian_env() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-14-philmd@linaro.org>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251010155045.78220-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/25 17:50, Philippe Mathieu-Daudé wrote:
> mo_endian_env() returns the target endianness from CPUArchState.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

LGTM

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   target/riscv/op_helper.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index c486f771d35..9d048089e2a 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -28,6 +28,18 @@
>   #include "exec/tlb-flags.h"
>   #include "trace.h"
>   
> +static inline MemOp mo_endian_env(CPURISCVState *env)
> +{
> +    /*
> +     * A couple of bits in MSTATUS set the endianness:
> +     *  - MSTATUS_UBE (User-mode),
> +     *  - MSTATUS_SBE (Supervisor-mode),
> +     *  - MSTATUS_MBE (Machine-mode)
> +     * but we don't implement that yet.
> +     */
> +    return MO_TE;
> +}
> +
>   /* Exceptions processing helpers */
>   G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>                                         RISCVException exception,
> @@ -633,7 +645,7 @@ target_ulong helper_hyp_hlv_hu(CPURISCVState *env, target_ulong addr)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>   
>       return cpu_ldw_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>   }
> @@ -642,7 +654,7 @@ target_ulong helper_hyp_hlv_wu(CPURISCVState *env, target_ulong addr)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>   
>       return cpu_ldl_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>   }
> @@ -651,7 +663,7 @@ target_ulong helper_hyp_hlv_d(CPURISCVState *env, target_ulong addr)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UQ, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UQ, mmu_idx);
>   
>       return cpu_ldq_mmu(env, adjust_addr_virt(env, addr), oi, ra);
>   }
> @@ -669,7 +681,7 @@ void helper_hyp_hsv_h(CPURISCVState *env, target_ulong addr, target_ulong val)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>   
>       cpu_stw_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>   }
> @@ -678,7 +690,7 @@ void helper_hyp_hsv_w(CPURISCVState *env, target_ulong addr, target_ulong val)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>   
>       cpu_stl_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>   }
> @@ -687,7 +699,7 @@ void helper_hyp_hsv_d(CPURISCVState *env, target_ulong addr, target_ulong val)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, false, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UQ, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UQ, mmu_idx);
>   
>       cpu_stq_mmu(env, adjust_addr_virt(env, addr), val, oi, ra);
>   }
> @@ -703,7 +715,7 @@ target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong addr)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, true, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UW, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UW, mmu_idx);
>   
>       return cpu_ldw_code_mmu(env, addr, oi, GETPC());
>   }
> @@ -712,7 +724,7 @@ target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong addr)
>   {
>       uintptr_t ra = GETPC();
>       int mmu_idx = check_access_hlsv(env, true, ra);
> -    MemOpIdx oi = make_memop_idx(MO_TE | MO_UL, mmu_idx);
> +    MemOpIdx oi = make_memop_idx(mo_endian_env(env) | MO_UL, mmu_idx);
>   
>       return cpu_ldl_code_mmu(env, addr, oi, ra);
>   }


