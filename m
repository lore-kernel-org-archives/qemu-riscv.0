Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piPpa-0004g3-3S
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPpY-0004fn-LF
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:14:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piPpX-0002ff-65
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:14:56 -0400
Received: by mail-pf1-x42c.google.com with SMTP id bt19so15928464pfb.3
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680311693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8E83b3zu7sVOwatE6svWVhG17utn6BFJjqvYYZzNec8=;
 b=bMJIiIdU8iz8NYrHHDRYvoN+uV3EOM8fPB6EHzkfEAaiMqFH3lw1r5MNl6ZkqJVvEk
 40Wvtp0VAztM+dzfgYEAF7TqjGtcdxkQzE9ehBS7vzAGLaASCMTpjiaKm1CjnRDWiQVG
 z00UoRLQ+3HACBkwAh7JarcK7qs5SWffDoFDLZje5OZVFctNi2XMZ3EXYVlZe6HsCPWr
 RUoAkLHRSuF3pTjbyyibggFCfFi07im0W/vVtLNbtXqmUT12aBbuRub4T6BHgSgviBSu
 mkGKkbjqaDpcaEgK45hYAi3dyCqYurMWRvS+TLJlEb8Op6107ds71tlD9uC867/d2mgu
 X5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680311693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8E83b3zu7sVOwatE6svWVhG17utn6BFJjqvYYZzNec8=;
 b=d8FHQWSUVuMaobibD6vmCYanIjds+9L1epzV5wT8Awhe+SYuJDGfnmNe8gwfqjAo4L
 nfTPKQfdFZwuPDpGAHbf14DzkV+qhsM6ET6nTbo1/fKDinGl+xOG8+P8HXB/4XCWb+2n
 bm//zMUikjfdg4ZDiq3pxHA6kMR2lidRX0jVcWj8azL+wsh24h3EZRrrXHXvssTspWFT
 QEBbeKwjyo/3AktuB2Omnib9e/Fh6l85zNN3IoX41AdMnOYKyEeoLEGcIgJ5STM8T4RC
 7ateE2lx0B3lwKQSTgLWitN5XZd2NqcvT2ON0Z8dgN/ZZWViQMkbBDlIrGV87T14O47R
 pxWg==
X-Gm-Message-State: AAQBX9f+dIV0yK2jCqNF7gGdsqiaj5G1GIbTtSq1Sb88tsXnXmJkXPzx
 dh8BFonm1GDGwEYdozYtRLO05Q==
X-Google-Smtp-Source: AKy350bLQM39wMVED0kNIW5XNrm0cXUZk95TqMKAWGnHMhwap1vEFfm/Mwyp5bbJP1PSXUfHOEz1Fw==
X-Received: by 2002:a62:1a8a:0:b0:624:1ab3:da1a with SMTP id
 a132-20020a621a8a000000b006241ab3da1amr25984454pfa.29.1680311693048; 
 Fri, 31 Mar 2023 18:14:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa78a0e000000b0062612b97cfdsm2399749pfa.123.2023.03.31.18.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:14:52 -0700 (PDT)
Message-ID: <ebba64fa-6a73-0662-0677-c3a0524d2946@linaro.org>
Date: Fri, 31 Mar 2023 18:14:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/8] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 01:14:56 -0000

On 3/31/23 08:06, Weiwei Li wrote:
> Add a base save_pc For PC-relative translation(CF_PCREL).
> Diable the directly sync pc from tb by riscv_cpu_synchronize_from_tb.
> Sync pc before it's used or updated from tb related pc:
>     real_pc = (old)env->pc + target_pc(from tb) - ctx->save_pc
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c                      | 29 +++++++++-----
>   target/riscv/insn_trans/trans_rvi.c.inc | 24 +++++++++--
>   target/riscv/translate.c                | 53 +++++++++++++++++++++----
>   3 files changed, 85 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>   {
> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
> +    assert(ctx->pc_save != -1);
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        TCGv target_pc = dest_gpr(ctx, a->rd);
> +        tcg_gen_addi_tl(target_pc, cpu_pc, a->imm + ctx->base.pc_next -
> +                                           ctx->pc_save);

Could use gen_get_target_pc.

> @@ -68,7 +76,14 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>       }
>   
> -    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
> +        TCGv succ_pc = dest_gpr(ctx, a->rd);
> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - ctx->pc_save);
> +        gen_set_gpr(ctx, a->rd, succ_pc);

Likewise.


r~

