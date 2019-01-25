Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9sn-0007qw-Sq
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9si-0007pN-Fh
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:23:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9sg-0002Bi-9U
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:23:24 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gn9sc-00028z-71; Fri, 25 Jan 2019 17:23:18 -0500
Received: by mail-pg1-x544.google.com with SMTP id z10so4756151pgp.7;
	Fri, 25 Jan 2019 14:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UgHC9zRIfcxQEdG96aje6w7rCoZqiiyhsWRtJLCLWE8=;
	b=LqMwaF2bKoUR3QxlWKVPI0uvPKXXqfJKuARXysmVuEA+sWuW+BQwUQY7LUYG25Cipy
	j9WZ/ecltCp926hCiLakcNhj0nB7jZGX+gcR3AMRpWrOeOz9Kxk8FpeXfpvQqNVwff0N
	WOOy0RvHsAmq1Wtu7+/iRIh70Bg5o6I8OGEfz8kBwd6zyhq9tYuxciyIwQhNnplyeGGd
	fdEJCSSyd+XXuFx54BginAYOLFgyYQWXiz3fXuQGHhXanxkazwmWfT0PCR5YclkN8VLu
	yIp9IuoPBWHS2MhWB9I6ff8mDOGJEVuwXTjQCk7JepvY+DgbXb9C5VjciWHi9LyfcYC0
	1wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UgHC9zRIfcxQEdG96aje6w7rCoZqiiyhsWRtJLCLWE8=;
	b=kSi7gEjyR4SgvljsklTPX0MtIHcJYMmsJxDk76ltUuCdITl5V2RAD+v4KyWclAV8B8
	1cH+84m41fWvbLLVt5Oh8QEHg72CR7OibUJolLHJ8juo3LjdTHFrjz5Q3Udgqwz0O+vg
	O8C5ee45U02gLfku6v12L61Yyryeo3fZ2WSjCA7kdG3Inhc3fGu8hr4cLjZs+nyc/WIU
	6kfKPSPxtDOdT25AfNP53WUuh5UOGUAjTuwUMU+eEU+r5W7A3hWthv/GGCI+XoRcqm2I
	GFtaq310eZ0GtGUWiBO2veDEChxLt24oKgFTA+jnPpkugTAy1qcRjghAxdVyFbrus0VV
	Cbdw==
X-Gm-Message-State: AJcUukeoHuEz+1qxniy+VH/4fyn4w8OpxmyrZKRei3zoVyTJOJXhELd+
	dr+SgFKWsXI7hzasJ57spZk3XeMG
X-Google-Smtp-Source: ALg8bN7HJ5YbKnb6XyhOG/9bhKbnWNUqcCABplO0s5N45yryRMDoznezuopHaKWdD+tggAzstmF7kg==
X-Received: by 2002:a63:f844:: with SMTP id v4mr11486298pgj.82.1548454996500; 
	Fri, 25 Jan 2019 14:23:16 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	t67sm44807690pfd.90.2019.01.25.14.23.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:23:15 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<20190123092538.8004-22-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <e949c7da-043d-036c-ff44-44561c9680cb@gmail.com>
Date: Fri, 25 Jan 2019 14:23:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123092538.8004-22-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 21/35] target/riscv: Remove
 manual decoding from gen_branch()
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2019 22:23:28 -0000

On 1/23/19 1:25 AM, Bastian Koppelmann wrote:
> We now utilizes argument-sets of decodetree such that no manual
> decoding is necessary.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/insn_trans/trans_rvi.inc.c | 46 +++++++++++++++++-------
>   target/riscv/translate.c                | 47 -------------------------
>   2 files changed, 33 insertions(+), 60 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 3b3aff4803..0db1f79d20 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -72,41 +72,61 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>       return true;
>   }
>   
> -static bool trans_beq(DisasContext *ctx, arg_beq *a)
> +static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   {
> -    gen_branch(ctx->env, ctx, OPC_RISC_BEQ, a->rs1, a->rs2, a->imm);
> +    TCGLabel *l = gen_new_label();
> +    TCGv source1, source2;
> +    source1 = tcg_temp_new();
> +    source2 = tcg_temp_new();
> +    gen_get_gpr(source1, a->rs1);
> +    gen_get_gpr(source2, a->rs2);
> +
> +    tcg_gen_brcond_tl(cond, source1, source2, l);
> +    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
> +    gen_set_label(l); /* branch taken */
> +
> +    if (!riscv_has_ext(ctx->env, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> +        /* misaligned */
> +        gen_exception_inst_addr_mis(ctx);
> +    } else {
> +        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
> +    }
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    tcg_temp_free(source1);
> +    tcg_temp_free(source2);
> +
>       return true;
>   }
>   
> +static bool trans_beq(DisasContext *ctx, arg_beq *a)
> +{
> +    return gen_branch(ctx, a, TCG_COND_EQ);
> +}
> +
>   static bool trans_bne(DisasContext *ctx, arg_bne *a)
>   {
> -    gen_branch(ctx->env, ctx, OPC_RISC_BNE, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_branch(ctx, a, TCG_COND_NE);
>   }
>   
>   static bool trans_blt(DisasContext *ctx, arg_blt *a)
>   {
> -    gen_branch(ctx->env, ctx, OPC_RISC_BLT, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_branch(ctx, a, TCG_COND_LT);
>   }
>   
>   static bool trans_bge(DisasContext *ctx, arg_bge *a)
>   {
> -    gen_branch(ctx->env, ctx, OPC_RISC_BGE, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_branch(ctx, a, TCG_COND_GE);
>   }
>   
>   static bool trans_bltu(DisasContext *ctx, arg_bltu *a)
>   {
> -    gen_branch(ctx->env, ctx, OPC_RISC_BLTU, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_branch(ctx, a, TCG_COND_LTU);
>   }
>   
>   static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>   {
> -
> -    gen_branch(ctx->env, ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_branch(ctx, a, TCG_COND_GEU);
>   }
>   
>   static bool trans_lb(DisasContext *ctx, arg_lb *a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1f59b02c84..a0e96b94a9 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -489,53 +489,6 @@ static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> -static void gen_branch(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
> -                       int rs1, int rs2, target_long bimm)
> -{
> -    TCGLabel *l = gen_new_label();
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> -    gen_get_gpr(source1, rs1);
> -    gen_get_gpr(source2, rs2);
> -
> -    switch (opc) {
> -    case OPC_RISC_BEQ:
> -        tcg_gen_brcond_tl(TCG_COND_EQ, source1, source2, l);
> -        break;
> -    case OPC_RISC_BNE:
> -        tcg_gen_brcond_tl(TCG_COND_NE, source1, source2, l);
> -        break;
> -    case OPC_RISC_BLT:
> -        tcg_gen_brcond_tl(TCG_COND_LT, source1, source2, l);
> -        break;
> -    case OPC_RISC_BGE:
> -        tcg_gen_brcond_tl(TCG_COND_GE, source1, source2, l);
> -        break;
> -    case OPC_RISC_BLTU:
> -        tcg_gen_brcond_tl(TCG_COND_LTU, source1, source2, l);
> -        break;
> -    case OPC_RISC_BGEU:
> -        tcg_gen_brcond_tl(TCG_COND_GEU, source1, source2, l);
> -        break;
> -    default:
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -
> -    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
> -    gen_set_label(l); /* branch taken */
> -    if (!riscv_has_ext(env, RVC) && ((ctx->base.pc_next + bimm) & 0x3)) {
> -        /* misaligned */
> -        gen_exception_inst_addr_mis(ctx);
> -    } else {
> -        gen_goto_tb(ctx, 0, ctx->base.pc_next + bimm);
> -    }
> -    ctx->base.is_jmp = DISAS_NORETURN;
> -}
> -
>   static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
>           target_long imm)
>   {
> 

