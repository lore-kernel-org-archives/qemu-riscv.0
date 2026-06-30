Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E9C43602
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 17:34:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wecLC-0006u4-E6; Tue, 30 Jun 2026 13:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wecKi-0006n2-Od
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:33:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wecKf-0001qa-RC
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:33:16 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2c82538b6c0so30929995ad.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782840791; x=1783445591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YO+B+ZiXktj6oN262Vp+dQOZ7sT+QIXOTjCy7uqzCYw=;
 b=zR3YZskMYayX3XphggGmy8iOC55J7hCgNpFwIvo687fJpveOk8jIc3KRiow5NtTiiu
 A5HwkkMqfe11XDa+Q4MsnoLFhTCfiiLkasbI5Hqh0W0lVWIYmo8q19q2Vney8YJJcsOH
 ftPnBPV+C/kaXYfqtBM+XTPbLmoFCpqKG9MNasta+s093cqb2xu5+II9GWYwi4j3pqAr
 3XTfCBdj/YxW9VK+dK+dreyIadRX0pSSjJojXpwlQpfYTXL9BzZ58byAsGBYK1QM2dAu
 5UjwcxFMzAPHpnYBKbaP/C44FANTZzYWU50eXG7zMzxtLWMKqwPR7WXNRiKm2f9ha63A
 romw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782840791; x=1783445591;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YO+B+ZiXktj6oN262Vp+dQOZ7sT+QIXOTjCy7uqzCYw=;
 b=SVqWmCVXaaKlTKiSoOp/jAfd+SaAF73vXOe5BRIp1PKG7k7lMLqnAnjYnUFz1jpS8w
 tTrISTQX7ryfq6bDSY9k3fyUpCdRnFBA75lW3OZbgSg6293K48wFync15NajQ3owHYZ0
 UlQ1WWjPZ/ibIczmxeuB8z3fuKH+5xdZt18D3g9YXQo5YfjBE59iCBObpX3YKfgTiXV+
 wm5BC/fc5gy4ogt03KSZUmSElpn1Mo1IE6YQfISJ+067Kfcy6Teg719XlSF1zFJyqkDP
 nF3yrmMMMfkJ95knYxB0fx7QQVC+EFQ7IJJfYgwkNUCLNXxuZA+h+I/N2kKqfOPiP86n
 nWCg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoeDX3o0Bb05F9LfrLk41yYomdEiIDVlKDmERx69pFSDHsXreO1oq0p1xuvtiM/5j9rPiymR6MbErXX@nongnu.org
X-Gm-Message-State: AOJu0Yye5gfHqDRTkbXM4DH60UdDCYKg/Ju5QBTuvCU9UMk8kvsBvE9/
 a1Nnqc1nueWm4Dt+DxK3PAej10HXjeiNFcshRbLVKj8etRC7bw4iNWPr/3nOcnMBVfo=
X-Gm-Gg: AfdE7ck7aLE6V/YdVkFlpttF/um8zDZ8Q0c+SH0/HrpcRw4OGwD1Vl2yOmhdBR+cApn
 gK41kK4qe66A4v8URFFHM6kf30+vfcs4n0uKLVSNfSFUP4k0lXSUwALeiZqnrX9QWqa4CRfKkxw
 f8VzCUfOQM15gHQMJCi10oc3huzOKMuvaGcjwjr3Hyvk5AoCJMJ+w61lVgZTaCGOn6Ld9cFN6WD
 ojlJL6syjfjnJyuNhxFn5vQpKkoAIfnXMjJrh11qtickoW2cwTDT7Im9/cQgbj2M8e3qQRxYtUG
 AGU4Hqcal9awxJIbJLP4rtT5fcrg7LxhWPdkHg2vqhUfGY1LhTxPgwzVg+5t5nSBGlpaSIIc/J9
 UvWmEbjNc24ji3JZbuPZ8jRxhYwADkGPeObe10j5Iz06Fr2sBRibZOflbE5HfkdvZN2SbMwuMjG
 q1xetVcBLo2HYQzqyfzaX6VEcjT/bMRWLzi7lma2R1J8mQhQVqb3bZV1ZwfQ==
X-Received: by 2002:a17:903:46ce:b0:2c9:c083:cd3f with SMTP id
 d9443c01a7336-2ca2d52b5cfmr34199875ad.1.1782840790896; 
 Tue, 30 Jun 2026 10:33:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca382acd0csm18696955ad.62.2026.06.30.10.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 10:33:10 -0700 (PDT)
Message-ID: <7a1ac883-82d0-441a-817f-440875f71afe@linaro.org>
Date: Tue, 30 Jun 2026 10:33:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] riscv/debug: migrate debug_check_breakpoint to
 use GTree breakpoints
To: Shivang Upadhyay <shivangu@linux.ibm.com>, qemu-devel@nongnu.org,
 pbarbuda@microsoft.com, mohamed@unpredictable.fr
Cc: pbonzini@redhat.com, philmd@mailo.com, zhao1.liu@intel.com,
 laurent@vivier.eu, deller@gmx.de, pierrick.bouvier@oss.qualcomm.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, rathc@linux.ibm.com,
 harshpb@linux.ibm.com, adityag@linux.ibm.com
References: <20260630171555.114844-1-shivangu@linux.ibm.com>
 <20260630171555.114844-3-shivangu@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260630171555.114844-3-shivangu@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 6/30/26 10:15, Shivang Upadhyay wrote:
> as cpu->breakpoints is migrated to GTree, change the breakpoint
> looping from QTAILQ_FOREACH to g_tree_foreach.
> ---
>   target/riscv/debug.c | 71 +++++++++++++++++++++++++-------------------
>   1 file changed, 41 insertions(+), 30 deletions(-)

(1) This can't be a separate patch, because the first patch can't compile
(2) You can't use a global variable for bp_found.


r~

> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 30d39ee5cd..6b2ffd08db 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -939,53 +939,64 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>       }
>   }
>   
> -bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
> +static bool bp_found;
> +
> +static gboolean check_breakpoints(gpointer key, gpointer value, gpointer cpu_state)
>   {
> +    CPUState *cs = (CPUState*)cpu_state;
> +    CPUBreakpoint *bp = (CPUBreakpoint*)value;
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
> -    CPUBreakpoint *bp;
> +    int trigger_type;
>       target_ulong ctrl;
>       target_ulong pc;
> -    int trigger_type;
>       int i;
>   
> -    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> -            trigger_type = get_trigger_type(env, i);
> +    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        trigger_type = get_trigger_type(env, i);
> +
> +        if (!trigger_common_match(env, trigger_type, i)) {
> +            continue;
> +        }
> +
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +            ctrl = env->tdata1[i];
> +            pc = env->tdata2[i];
>   
> -            if (!trigger_common_match(env, trigger_type, i)) {
> -                continue;
> +            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> +                env->badaddr = pc;
> +                bp_found = true;
> +                return true;
>               }
> +            break;
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            ctrl = env->tdata1[i];
> +            pc = env->tdata2[i];
>   
> -            switch (trigger_type) {
> -            case TRIGGER_TYPE_AD_MATCH:
> -                ctrl = env->tdata1[i];
> -                pc = env->tdata2[i];
> -
> -                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> -                    env->badaddr = pc;
> -                    return true;
> -                }
> -                break;
> -            case TRIGGER_TYPE_AD_MATCH6:
> -                ctrl = env->tdata1[i];
> -                pc = env->tdata2[i];
> -
> -                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
> -                    env->badaddr = pc;
> -                    return true;
> -                }
> -                break;
> -            default:
> -                /* other trigger types are not supported or irrelevant */
> -                break;
> +            if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
> +                env->badaddr = pc;
> +                bp_found = true;
> +                return true;
>               }
> +            break;
> +        default:
> +            /* other trigger types are not supported or irrelevant */
> +            break;
>           }
>       }
>   
>       return false;
>   }
>   
> +bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
> +{
> +    bp_found = false;
> +    g_tree_foreach(cs->breakpoints, check_breakpoints, cs);
> +
> +    return bp_found;
> +}
> +
>   bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);


