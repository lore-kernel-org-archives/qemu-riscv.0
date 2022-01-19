Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9B6-0001nT-4z
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA9Az-0001gz-4X; Wed, 19 Jan 2022 06:30:54 -0500
Received: from [2607:f8b0:4864:20::52b] (port=35679
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA9Au-0004Pp-SA; Wed, 19 Jan 2022 06:30:51 -0500
Received: by mail-pg1-x52b.google.com with SMTP id p125so2154191pga.2;
 Wed, 19 Jan 2022 03:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ej0vmGelmEU05/ZQCgcGrDZolvzUZdt1Pp06L/DdvOw=;
 b=Rh7MXDzVbgGF5UOD/M1m7nrbV9d9blU6V3kU/A7USGivs9rerIuMDQJDs5F/mi1jGW
 hcfueDDq9tjhqgIDKr5oBl85RGjPt2Tcb4BWz2QMRFHMe8P8jmhKEEyJzv1mN+eW8CYB
 h4kzm1zGeSGdZMC/fW5zbD1ClyKMRMS3ioNw3VR9TRR1BDXMYmqyOfmCmd70bliq5pqa
 ZNKCwcFnTKCSOHP+8q4ArBcsYH6YUhNll3gMaojtUiJ3ROsmpAXPdhiH2ea19+F5fhXT
 JKISsT1w6atovPKchHtgbPzAmwd8Kc3MF8MLBrXNaRNkXmRKHJbSF7lsWpcfuzcLSslU
 yH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ej0vmGelmEU05/ZQCgcGrDZolvzUZdt1Pp06L/DdvOw=;
 b=61upZoV4C3f7UcDMCDoE6etvMkOTGtam6sHW8ch3mdoYFkhPJrC7k8rRfobQdsNG6s
 HjkC0LLKNRQEAoEzNkJ7DP6ijF3MGwwFlwuUyQ2fwmR4oRLgbk+hFA3OFUY9VpqLLXHU
 xjLX5GN7YvLyrY80kKlQp8XloJt5rwx25HQvvT5STpn9DuEd0oP6c4f/XVvW6+eQfWRY
 Lv9vduEVSWh4MkAiqj2yEfmYwC/SUsTj4QSp351Hhcvj/Nl2/T+zkJPrltJ012VCKcG+
 DAJGZAmduvNzFtFjkUahaER0UAXYMx8JQ87pF29+cSP+xlDHT8vI26kfyoB3xRLC4uc/
 RfPw==
X-Gm-Message-State: AOAM532qiZu6OEuwVpvg4YM8pHm8QUQQcadx995HDuJe/vepSGDmvXQI
 510kRVxI1GOF6ZmZ6jAd1Ac=
X-Google-Smtp-Source: ABdhPJy6VOEma+usakZT2PCFQGC4zs5uE4/W0d/ibVMj9X/2/ynaJOYHrhWLpVe7yIn1QQjEmuyy+Q==
X-Received: by 2002:aa7:9543:0:b0:4bf:2a07:5bc7 with SMTP id
 w3-20020aa79543000000b004bf2a075bc7mr30344941pfq.73.1642591841152; 
 Wed, 19 Jan 2022 03:30:41 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 14sm9232826pgp.86.2022.01.19.03.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:30:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <aaf525e8-7dc5-f93d-0cc5-5ba560b5650f@amsat.org>
Date: Wed, 19 Jan 2022 12:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] target/riscv: iterate over a table of decoders
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Greg Favor <gfavor@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 11:30:55 -0000

On 13/1/22 21:20, Philipp Tomsich wrote:
> To split up the decoder into multiple functions (both to support
> vendor-specific opcodes in separate files and to simplify maintenance
> of orthogonal extensions), this changes decode_op to iterate over a
> table of decoders predicated on guard functions.
> 
> This commit only adds the new structure and the table, allowing for
> the easy addition of additional decoders in the future.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v2:
> - (new patch) iterate over a table of guarded decoder functions
> 
>   target/riscv/translate.c | 38 ++++++++++++++++++++++++++++++++------
>   1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..2cbf9cbb6f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -116,6 +116,12 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>       return ctx->misa_ext & ext;
>   }
>   
> +static inline bool always_true_p(CPURISCVState *env  __attribute__((__unused__)),
> +                                 DisasContext *ctx  __attribute__((__unused__)))
> +{
> +    return true;
> +}
> +
>   #ifdef TARGET_RISCV32
>   #define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
> @@ -844,16 +850,28 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   
>   static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>   {
> -    /* check for compressed insn */
> +    /* If not handled, we'll raise an illegal instruction exception */
> +    bool handled = false;
> +
> +    /*
> +     * A table with predicate (i.e., guard) functions and decoder functions
> +     * that are tested in-order until a decoder matches onto the opcode.
> +     */
> +    const struct {
> +        bool (*guard_func)(CPURISCVState *, DisasContext *);
> +        bool (*decode_func)(DisasContext *, uint32_t);
> +    } decoders[] = {
> +        { always_true_p,  decode_insn32 },
> +    };
> +
> +    /* Check for compressed insn */
>       if (extract16(opcode, 0, 2) != 3) {
>           if (!has_ext(ctx, RVC)) {
>               gen_exception_illegal(ctx);
>           } else {
>               ctx->opcode = opcode;
>               ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> -                gen_exception_illegal(ctx);
> -            }
> +            handled = decode_insn16(ctx, opcode);
>           }
>       } else {
>           uint32_t opcode32 = opcode;
> @@ -862,10 +880,18 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>                                                ctx->base.pc_next + 2));
>           ctx->opcode = opcode32;
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> -        if (!decode_insn32(ctx, opcode32)) {
> -            gen_exception_illegal(ctx);
> +
> +        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> +            if (!decoders[i].guard_func(env, ctx))
> +                continue;
> +
> +            if ((handled = decoders[i].decode_func(ctx, opcode32)))
> +                break;

Again, while we might check whether "Vendor Extensions" are enabled or
not at runtime, they are specific to a (vendor) core model, so we know
their availability  at instantiation time.

I don't understand the need to iterate. You can check for vendor
extensions in riscv_tr_init_disas_context() and set a vendor_decoder()
handler in DisasContext, which ends calling the generic decode_opc()
one.

>           }
>       }
> +
> +    if (!handled)
> +        gen_exception_illegal(ctx);
>   }
>   
>   static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)


