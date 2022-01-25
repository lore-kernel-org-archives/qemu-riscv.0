Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCTae-0003qL-PA
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 16:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTac-0003oD-Sd
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 16:42:58 -0500
Received: from [2607:f8b0:4864:20::531] (port=43651
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTaa-00087d-JT
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 16:42:58 -0500
Received: by mail-pg1-x531.google.com with SMTP id g20so1273394pgn.10
 for <qemu-riscv@nongnu.org>; Tue, 25 Jan 2022 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kyhcw1i1SBBoYowtsywmXmAedG72zAVOvX1eb/yfMAE=;
 b=N78VcB4fEwKXxtUiociPqDt5s29RGpJPIMA6mdo2Yfk4HiSxnZMDHl4bgjGMc59MJ3
 A1EEQ1wNVUX4M9aaqf0SO3/ej9W35MdLecw41NoEm0/YjDTjfgd/XRPDHQ1yuRSJJDlt
 YSVgGgcSUfJXz/FXkQVffeQD4k4XLUcD3BfrWh1SaP+jqSWhAJm8uWmPbOGzFLPeA6T0
 joMSH4HJMOc4fG7Wk+rR0Nt5SRByxJXQR6/G5DSvMXChs/qxvK/0GmmE7Rpf7K5XSTzL
 1m7SpWt/dCvH33zD0xex7/iv4crflgNrIrm9fL1UbmS2VmRtL0xz6Y2Xw0AAhNBYS2zP
 g5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kyhcw1i1SBBoYowtsywmXmAedG72zAVOvX1eb/yfMAE=;
 b=nLq2xE91TzSMctf1g4hpTZEcR7oxFI8i0SzkJajGN3tJbByXHX5TrLRhCaGE8STxLR
 UlPrqgT64s8dhBu2XWKSwB2MH7bCxC2L7nIxp9Pz7ElhVJjZ2we634Srk4m8n4lMHKkB
 0YYZdHENaeNLDTOMYP9Q6oI5xmtvzX8Nw5IKMjTZVg6HK1NaUHORF93glpx8nCwRs3ms
 +NshkkSaVPmdjttzxK8VczX9FC9KKW1IFJN3NGjbKiaTI/hIJjHKEl9NpSl30RtSmOGh
 JxNCIbCNBZPTn5fKqMl/2AoydmXM+1I+3qG0wiQ4kY68XAroyQgo8GDHjvw6ZABtXPIx
 bssw==
X-Gm-Message-State: AOAM533jhPaSYLlz3mccglPGEpIK03UpX6zG9yJiYwxBkTgK+3OE2fkA
 THgQaXUl9cf/tAZHE0gq+uC7Ag==
X-Google-Smtp-Source: ABdhPJyCAlLfbhnfIyS0BEEx2DsBR0sxsdXvINHqt7o5HPZE28/AKo4ukYDEVc15lwVqRmngUvxu2w==
X-Received: by 2002:a63:ce4c:: with SMTP id r12mr16645492pgi.21.1643146974811; 
 Tue, 25 Jan 2022 13:42:54 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id l26sm15342635pgm.73.2022.01.25.13.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 13:42:54 -0800 (PST)
Subject: Re: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Greg Favor <gfavor@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
 <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <279dadc7-496b-6b04-a011-b5eb27162cf7@linaro.org>
Date: Wed, 26 Jan 2022 08:42:47 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 25 Jan 2022 21:42:59 -0000

On 1/14/22 7:20 AM, Philipp Tomsich wrote:
> new file mode 100644
> index 0000000000..b8a5d031b5
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_xventanacondops.inc

The filename suffix should be ".c.inc".

> +static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
> +{
> +    return gen_condmask(ctx, a, TCG_COND_NE);
> +}
> +
> +static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
> +{
> +    return gen_condmask(ctx, a, TCG_COND_EQ);
> +}

Implementation looks good.

> +#define MATERIALISE_EXT_PREDICATE(ext)  \
> +    static inline bool has_ ## ext ## _p(CPURISCVState *env, \
> +                                         DisasContext *ctx  __attribute__((__unused__)))  \
> +    { \
> +        return RISCV_CPU(ctx->cs)->cfg.ext_ ## ext ; \
> +    }

Again, no inline.

Don't look back to RISCV_CPU here.  We shouldn't even have access to that here, as it 
leads to temptation to do invalid things at translation time (this isn't one of them, 
since it only accesses constant state).  What we have been doing is copying ext_foo into 
DisasContext in riscv_tr_init_disas_context.  Though it might be time to revisit that.

Perhaps give the cpu->cfg structure type a name, e.g. RISCVCPUConfig.  Add  "const 
RISCVCPUConfig *cfg" to DisasContext and copy the pointer across in init_disas_context.


r~

