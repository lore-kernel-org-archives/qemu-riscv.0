Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTQsJ-0001cV-Js
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 11:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQsI-0001bM-IA
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:10:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQsC-0006B9-Pr
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:10:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso1108769pje.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aoyuRnC3J6Loe7plIzdzcbzFllgKIVLP0JeaBRIPaGQ=;
 b=wOKhmhRof0aA2QWcjenn6EVDyoJxBZlhSHcrdZUMUlxUjjJhdkBX9msnZWK0bi+Hf6
 7BlWc0mH11sGVXaeQ0JlxJc/oIFcx8CVGi8nBnurm9mJ5ISjrmSC4P6pNlh1aLpSAMjt
 j6ZzalOKs9Z1TEQDT4VM8AdBDyRQE/Y7CxLgEfbgiAkYpM0tO+YwaOzio45n66wd2ZXx
 4Ehdlv+RSG6P5xSbSuksUQSOr2zPv2so/hrN7MR6Y3TPSm3WKRz81rWa7QhhlmcKMDZ7
 HsJ1Op+43MpphDztlwjqLcF11/IEImg20UiRl/MhYjzxzvbs05VsLPKdFE5c+1r2hVJW
 u55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aoyuRnC3J6Loe7plIzdzcbzFllgKIVLP0JeaBRIPaGQ=;
 b=mVe+hHNQwFsOGh7AwQkJztNym7vJm7A5PUe51464qAwoBaD5CC3i/tXxzf11o7YUSM
 6ya/C8PhPSXBONi4KvWzkM+bg3WXIfknBGClton9BoEunh+Yc4QUxIcJ0Ka0vtfWuqEH
 r6q6tlIkjD8qf/75Obkvp+0zhvubwzKK4fTAsP7V6yxZIDK4iW36Tn4RRetOtVLQWoya
 96CYVvNC/S+o/fwD/HLP52PjWqzZzKmSHx3sdpAOe7cykBxHwI9/D09R5jmBGh/3ewtm
 eyog9mD6ma2NYq93HQlHHvxjnubm/HNTw9Ur3oTlNbFZUp1qIdcREER5ARQh94HBfXw4
 L/cA==
X-Gm-Message-State: AOAM532lCdOsTgAPdnfM1IAD1zX0+g5Vl/BT9YtdCTc5XmEnWCqyMKHL
 h+tsksYHVxDj6f4uBqx7zzTtSg==
X-Google-Smtp-Source: ABdhPJzJXUAFDTNQcqFawvAbKVqtZMrfPTSehHaFqja7drImNk0yfvz8PMIGy1JB84SChibRterV6g==
X-Received: by 2002:a17:90b:1044:: with SMTP id
 gq4mr26732951pjb.232.1617635438959; 
 Mon, 05 Apr 2021 08:10:38 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id i14sm16556133pjh.17.2021.04.05.08.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 08:10:38 -0700 (PDT)
Subject: Re: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
Date: Mon, 5 Apr 2021 08:10:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Apr 2021 15:10:46 -0000

On 4/2/21 1:02 PM, Alistair Francis wrote:
> @@ -369,6 +369,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +
>       if (ctx->mstatus_fs == MSTATUS_FS) {
>           return;
>       }
> @@ -377,12 +380,24 @@ static void mark_fs_dirty(DisasContext *ctx)
>   
>       tmp = tcg_temp_new();
>       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
> +    if (riscv_cpu_is_32bit(env)) {

This is less than ideal, and will be incorrect long term.
You should check ctx->misa instead.

Eventually you'll need to change riscv_tr_init_disas_context to not just copy 
ctx->misa from env.  At present we flush all translation blocks when misa 
changes, which works.  But you won't want to do that when the hypervisor is 
64-bit and the guest is 32-bit.

Anyway, I think it would be a good idea to create a helper local to translate, 
akin to has_ext().

> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS32_SD);
> +    } else {
> +#if defined(TARGET_RISCV64)
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS64_SD);
> +#endif

The ifdefs are ugly.  I presume there's some sort of compiler warning here? 
Does it go away if you cast to target_ulong?

How about

     target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);


r~

