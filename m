Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF5AC7115B
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 21:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uTosh-0006f1-Vp; Mon, 23 Jun 2025 17:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uTosg-0006eo-EH
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 17:39:10 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uTose-0005L3-LM
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 17:39:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2363616a1a6so37835955ad.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Jun 2025 14:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750714747; x=1751319547; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/SJ8XGZKOSTcdSpimrphHSXihH5db5LKplkn5InuLGk=;
 b=TgfxFl3G8Ldu13X5jA68YOty7Iib+KIwxkOl6tT2wMxKwVxqtDHSEqXuLqFy3dOd2/
 HphxSW2p5oqLj4gvyiJJhL7ye+I0OqJodvHqyQkcMW80ERJ1VGWTD+t/+tEzZqoHlhFl
 /DB/avpB0Nb9qniuyJyr2IfkMkzDRz4qf6X9jnYXjFt3lG+nYbcbOcU1y+s/7TE20yMe
 tW6XdIvvl0oM6v+79P/16criO1ehWfRN+0kf/ZjdfqNCgZ6hACHTDHB+DyCWywAdTyyZ
 M/VespfnjMN9rgMCoYtwo5oKUHjlppxC1uqF/5wUraB9eAWnsEADeOQHstqf4o+kRFkH
 NodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750714747; x=1751319547;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/SJ8XGZKOSTcdSpimrphHSXihH5db5LKplkn5InuLGk=;
 b=nIyHgJh5coe8l83iszoQDdOufnO0ltXoBiVKB8oEZ23PeujlkAq3FQPrQ8dyPOwRyK
 q7Bm+pxpGbxOlas031oYudTad6nfloSGIyg+9rx3qutdlTg3zV5hbYRSD+zHIMcwPw6E
 X/0fAUtYv3VaSSy20vRV3ck1jN8vDDEowTyO2ZPts/UPN3akxLkV8ZQ8MH7Mq43deS5e
 0D5BdNkAQZVvBkkJEZ1qvhogVOvgXhwTHQ0TqIVwzGHV330Dd7fetRCP6ePFgn5vO15j
 LC8KB6W8LSTRBGyx6P5KyuOfGo+ZAQnwS0bOUILuDcpqjKLZClGT1/OcI9aIXPihrRJs
 u4ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxYL/6YjCFgDsKiyGQvwgW0dGUqoAYDYcF+drH0s3pwFu3L08eLP77Z6cnbDdiGF9Tg3Xy26QiUoGi@nongnu.org
X-Gm-Message-State: AOJu0YwSeCKp0jxdq8K7dUndRMV7qwfDAEa+1rFcs20XOGhb5kSEyJmg
 0CcDccHSLGuP3GwESM+NLP8GZUejH96i0pBLOWWcep5XMR+cNVi9G2MpbMYIe+fvRWc=
X-Gm-Gg: ASbGnctpeMJ+8+z2Zl3cyB4KDQeKp513hreQR93gowaBnDhYRFxWufIuyun5lU8+XRQ
 3o+CrKQTfYP3UTgwdMz4jXnWeIko6r5eMjBTygTLDcRBiuIKHxjDAA471mU5L6hGNwdf7cudXD0
 a7oRouin9UrQvLnyI46+pVOlJt7zLmYtcpYA1MSX8NAq050rdi6umvVYZj+NhTn5MZCL80CXu8G
 BDpMp5SARvtC5Oh0sJNFvS5pNsW65pFFN8+YHrwVLmeAjryiCtmbTYd6SEAmmNeK0VJVYYXPjRG
 m4+uqRYOnT6XU/C/KSysBBQ+ufbazdVXC2zP8pVARyOm7NZfAchwNxI6HWUnXUBUUMQ+MQVZeqE
 p
X-Google-Smtp-Source: AGHT+IEvLgtN+QpHnET40nBbowAZlEHraQVlxeSDZ+WFAZphavKvB8qi4YWB1t11DFzO6VSRGn8myQ==
X-Received: by 2002:a17:903:2f4b:b0:235:f70:fd44 with SMTP id
 d9443c01a7336-237d9870d24mr201928405ad.21.1750714747045; 
 Mon, 23 Jun 2025 14:39:07 -0700 (PDT)
Received: from [192.168.68.110] ([191.255.35.152])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8391494sm93564425ad.1.2025.06.23.14.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 14:39:06 -0700 (PDT)
Message-ID: <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
Date: Mon, 23 Jun 2025 18:39:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: disable *stimecmp interrupts without
 *envcfg.STCE
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Patra <atishp@rivosinc.com>
References: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
 <20250623165329.2759651-2-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250623165329.2759651-2-rkrcmar@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

Hi Radim,

It seems like this patch is breaking 'make check-functional':

12/12 qemu:func-quick+func-riscv64 / func-riscv64-riscv_opensbi   TIMEOUT         90.06s   killed by signal 15 SIGTERM

Checking the logs I verified that the problem can be reproduced by running the
'spike' machine as follows:

$ ./build/qemu-system-riscv64 -M spike   --nographic
Segmentation fault (core dumped)

The expected result is to boot opensbi. The problem can't be reproduced with
the 'virt' board, so something that you did here impacted 'spike' in particular
for some reason.


Thanks,

Daniel

On 6/23/25 1:53 PM, Radim Krčmář wrote:
> The specification states that menvcfg.STCE=0 prevents both *stimecmp
> CSRs from having an effect on the pending interrupts.
> henvcfg.STCE=0 disables only vstimecmp.
> 
> Make sure that when *envcfg.STCE is not set:
> * writing the *stimecmp CSRs doesn't modify the *ip CSRs,
> * and that the interrupt timer is disarmed.
> 
> Call the *stimecmp CSR update functions when *envcfg.STCE is toggled,
> because the *ip CSRs need to immediately reflect the new behavior.
> 
> Fixes: 43888c2f1823 ("target/riscv: Add stimecmp support")
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> ---
>   target/riscv/csr.c         | 12 ++++++++++++
>   target/riscv/time_helper.c | 10 ++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fb149721691d..43eae9bcf153 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3181,6 +3181,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>       const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
>       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
>                       MENVCFG_CBZE | MENVCFG_CDE;
> +    typeof(env->menvcfg) old = env->menvcfg;
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> @@ -3208,6 +3209,11 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>           }
>       }
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
> +
> +    if ((old ^ env->menvcfg) & MENVCFG_STCE) {
> +        riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
> +    }
> +
>       return write_henvcfg(env, CSR_HENVCFG, env->henvcfg, ra);
>   }
>   
> @@ -3314,6 +3320,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                       target_ulong val, uintptr_t ra)
>   {
>       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    typeof(env->henvcfg) old = env->henvcfg;
>       RISCVException ret;
>   
>       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> @@ -3347,6 +3354,11 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>           env->vsstatus &= ~MSTATUS_SDT;
>       }
>   
> +    if ((old ^ env->henvcfg) & HENVCFG_STCE) {
> +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
> +                                  env->htimedelta, MIP_VSTIP);
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index bc0d9a0c4c35..8198a2d8d92d 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -49,6 +49,16 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>       uint32_t timebase_freq = mtimer->timebase_freq;
>       uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
>   
> +    /*
> +     * *envcfg.STCE disables *stimecmp interrupts, but still allows higher
> +     * privileges to write the *stimecmp CSRs.
> +     */
> +    if (!get_field(env->menvcfg, MENVCFG_STCE) ||
> +        (timer_irq == MIP_VSTIP && !get_field(env->henvcfg, HENVCFG_STCE))) {
> +        timer_del(timer);
> +        return;
> +    }
> +
>       if (timecmp <= rtc_r) {
>           /*
>            * If we're setting an stimecmp value in the "past",


