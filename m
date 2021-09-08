Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNr3I-0005mV-SP
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 02:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNr3H-0005mF-S4
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 02:27:19 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNr3E-00063O-JG
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 02:27:19 -0400
Received: by mail-ej1-x631.google.com with SMTP id n27so1933783eja.5
 for <qemu-riscv@nongnu.org>; Tue, 07 Sep 2021 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q3oPmjmoRMuyVtlfEkor+TvFU77F3Ph81moVzNLNPKs=;
 b=JpMekY6FPfi/CyyNLC+DfKax8FsCQ1ErMwL3Sqju3q3ZhdvH+CSa7RqqlIISaEnadi
 qAkzJR5+VEo9c9sCnjWepWUSPT93zrW5FOlWJb9rOsWKcaKGMC3MtiNRKVaZG8a2DPUY
 LlltltVv92Z03tPl/XR+i/L+QJL2XFThgm/C0AsChHD43JKHU7M33fZWaxf1+Y5rzBUu
 mtUQpveWZSvUYVyCtyGSMmIzNTCmbSGyctsnVs8h2UW0vszLAHaTn66dhiu1k/NpeF0K
 7NJWw18X7p26ht8adOLR58fpf6AY0Jb1fiZzj2vpGqXYGUv0JSprmwzZf3eaPHqgS1Xh
 Fmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3oPmjmoRMuyVtlfEkor+TvFU77F3Ph81moVzNLNPKs=;
 b=C09RY5bmwF5672aVj3JoOyCKXNV8XHriHiKSd395yI1NhSJT0zY/gi+YAPrK1s05D4
 dBR/ALTcDjT/OAfUM4yQyYWSNGKocivckqyG/hvjcOH5kUhlDjGz82St7inr3su9h+7C
 RVzIH0UKVsWwknP1FStF6KVfqWPVZ8nLudeJKGCAQN1MOwUnGPtcFyDcP5Jl4dHMTQKp
 Dji6kiDekCWMrIiT4tmhgUYgG7oTx/w9QPq74IYb6pmqtkTysvihigqZrEhGJPFTWa6J
 aWgkjLygk1GJd2epNDGl1syhCCF+ctU9utgNcQ7YX6SXceblBsxyAeIzmrHd5y+KVj22
 FCRQ==
X-Gm-Message-State: AOAM531JvsaBQhYv3WjS21UP4KvsdcUNWPiOasDXgXKRdKqOmUVayAQ+
 oS+pwkhHsMckx9u0El5Lzl4n1A==
X-Google-Smtp-Source: ABdhPJzunV4NVDhU7oAX9Hd8WjmRJSm5dwzR6ruoKzhiNeVr9UPn6syr7PqqSlyhlDR3ovhTGOQcPw==
X-Received: by 2002:a17:906:bc4b:: with SMTP id
 s11mr2399872ejv.246.1631082433868; 
 Tue, 07 Sep 2021 23:27:13 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.138.20])
 by smtp.gmail.com with ESMTPSA id ly7sm438432ejb.109.2021.09.07.23.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:27:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee61fe15-5851-c896-f7f6-10b33bbf5d2a@linaro.org>
Date: Wed, 8 Sep 2021 08:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 08 Sep 2021 06:27:20 -0000

On 9/8/21 6:54 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/translate.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e356fc6c46..25670be435 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -485,20 +485,20 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   /* Include the auto-generated decoder for 16 bit insn */
>   #include "decode-insn16.c.inc"
>   
> -static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> +static void decode_opc(CPURISCVState *env, DisasContext *ctx)
>   {
>       /* check for compressed insn */
> -    if (extract16(opcode, 0, 2) != 3) {
> +    if (extract16(ctx->opcode, 0, 2) != 3) {
>           if (!has_ext(ctx, RVC)) {
>               gen_exception_illegal(ctx);
>           } else {
>               ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> +            if (!decode_insn16(ctx, ctx->opcode)) {
>                   gen_exception_illegal(ctx);
>               }
>           }
>       } else {
> -        uint32_t opcode32 = opcode;
> +        uint32_t opcode32 = ctx->opcode;
>           opcode32 = deposit32(opcode32, 16, 16,
>                                translator_lduw(env, ctx->base.pc_next + 2));

You needed to write back to ctx->opcode here.

I think that all of the other changes are less than ideal -- let the value stay in a 
register as long as possible and drop them to memory immediately before calling 
decode_insn{16,32}, just before the write to pc_succ_insn in both cases.


r~


>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> @@ -561,9 +561,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPURISCVState *env = cpu->env_ptr;
> -    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
> +    ctx->opcode = translator_lduw(env, ctx->base.pc_next);
>   
> -    decode_opc(env, ctx, opcode16);
> +    decode_opc(env, ctx);
>       ctx->base.pc_next = ctx->pc_succ_insn;
>       ctx->w = false;
>   
> 


