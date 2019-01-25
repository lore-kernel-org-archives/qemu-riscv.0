Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9yE-0003I5-FQ
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:29:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9yC-0003GI-3H
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:29:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9yA-0006cb-5U
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:29:04 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33242)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gn9tC-0002Tp-EI; Fri, 25 Jan 2019 17:23:54 -0500
Received: by mail-pg1-x541.google.com with SMTP id z11so4775306pgu.0;
	Fri, 25 Jan 2019 14:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Ge2f+DNZi42Zx57Uz24z2TEpyn8GkRdh0mNlXMv7jKQ=;
	b=pBzuZRl7uI/PUZkgMoy6zbnRz2qh11iobp5at8aIdEb7NCKc12ROyGjzTBXXzePO02
	W/fLQVZvx70HQ2nr3ALQ6RlEfhD5ODC4vVyRIGizfdAEzRpBCLf1QUt0MOrxwl/urgfi
	OMLXT9MKYekZhIOsbriaeWmveVma8qrLuYkXVCdlGDnKh0ssY9g6EH+yr0y64DR3F3jO
	bB9BI4UIY4YOUMqpWp/5ByQWK1CE8lIAJ+9rW1fVb0RTZn43PIu3FCLKV3HTd6wNqsmV
	ntXNPF9A774WFRCr1qz0fEYwE2QghgjtlI4Ft1TB6hXjeEVerVyEhfM4ezjfnm20DbpG
	DyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ge2f+DNZi42Zx57Uz24z2TEpyn8GkRdh0mNlXMv7jKQ=;
	b=OsI+Pkyh0BnOJQeUEvyMRC32uFsLQuHmlHYUaxiQVO/9NFDfD6thU200Miagz1+tU/
	PGnDQHSbTZwDcjj6yfI58q0w3Q7mL6W9rdEYALMqiRvApcMJrjXysgFlqYGfhTVX7lNA
	rBVT3d9RFDJjT1zmFQzISJrZr4lGK6zLhhocbGr4UmpNtP4e1yvXIovak1BQiTDdnO4F
	t7lYrJHqwcBOk9Dv6L/aMhbmv/Nq1lWftzGMZo9kHdz9ESNXnCwH51tqLfPJAbe7bPKZ
	EDKDAwep4SYzAAvqTTy+OTM+eUrXRbjZ/pHeU8/1UEFCCNMYJNBPJhplCMa96hDrtCi9
	fmIA==
X-Gm-Message-State: AJcUukejZsKU4A4xpXiyBhGPX8AQ4+IdxA7jX8e7WQ0fBavlH9AEVLvZ
	6mvNIgbHy/mTBNNHWitqUS3Sch/q
X-Google-Smtp-Source: ALg8bN7+SmuWQpl1Pg1u+K+ja/kTNzXAJGxlRI9wDQ0S00UXgG4EPHexGlkNHPgHP0Uc0hlxVBH1KA==
X-Received: by 2002:a63:b649:: with SMTP id v9mr11612809pgt.436.1548455032698; 
	Fri, 25 Jan 2019 14:23:52 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	a18sm31934394pgj.30.2019.01.25.14.23.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:23:51 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<20190123092538.8004-23-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <33d744d4-ae25-4f9c-f6d4-71352667191b@gmail.com>
Date: Fri, 25 Jan 2019 14:23:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123092538.8004-23-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 22/35] target/riscv: Remove
 manual decoding from gen_load()
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
X-List-Received-Date: Fri, 25 Jan 2019 22:29:05 -0000

On 1/23/19 1:25 AM, Bastian Koppelmann wrote:
> With decodetree we don't need to convert RISC-V opcodes into to MemOps
> as the old gen_load() did.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++----------
>   target/riscv/translate.c                |  6 +++--
>   2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 0db1f79d20..1ad00bd776 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -129,34 +129,43 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>       return gen_branch(ctx, a, TCG_COND_GEU);
>   }
>   
> -static bool trans_lb(DisasContext *ctx, arg_lb *a)
> +static bool gen_load(DisasContext *ctx, arg_lb *a, TCGMemOp memop)
>   {
> -    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv t1 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
> +    tcg_gen_addi_tl(t0, t0, a->imm);
> +
> +    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
> +    gen_set_gpr(a->rd, t1);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
>       return true;
>   }
>   
> +static bool trans_lb(DisasContext *ctx, arg_lb *a)
> +{
> +    return gen_load(ctx, a, MO_SB);
> +}
> +
>   static bool trans_lh(DisasContext *ctx, arg_lh *a)
>   {
> -    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_TESW);
>   }
>   
>   static bool trans_lw(DisasContext *ctx, arg_lw *a)
>   {
> -    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_TESL);
>   }
>   
>   static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
>   {
> -    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_UB);
>   }
>   
>   static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>   {
> -    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_TEUW);
>   }
>   
>   static bool trans_sb(DisasContext *ctx, arg_sb *a)
> @@ -180,14 +189,12 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
>   #ifdef TARGET_RISCV64
>   static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
>   {
> -    gen_load(ctx, OPC_RISC_LWU, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_TEUL);
>   }
>   
>   static bool trans_ld(DisasContext *ctx, arg_ld *a)
>   {
> -    gen_load(ctx, OPC_RISC_LD, a->rd, a->rs1, a->imm);
> -    return true;
> +    return gen_load(ctx, a, MO_TEQ);
>   }
>   
>   static bool trans_sd(DisasContext *ctx, arg_sd *a)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a0e96b94a9..d0fefa8fb9 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -489,7 +489,8 @@ static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
>       ctx->base.is_jmp = DISAS_NORETURN;
>   }
>   
> -static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
> +#ifdef TARGET_RISCV64
> +static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
>           target_long imm)
>   {
>       TCGv t0 = tcg_temp_new();
> @@ -508,6 +509,7 @@ static void gen_load(DisasContext *ctx, uint32_t opc, int rd, int rs1,
>       tcg_temp_free(t0);
>       tcg_temp_free(t1);
>   }
> +#endif
>   
>   static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
>           target_long imm)
> @@ -640,7 +642,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
>       case 3:
>   #if defined(TARGET_RISCV64)
>           /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
> -        gen_load(ctx, OPC_RISC_LD, rd_rs2, rs1s,
> +        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
>                    GET_C_LD_IMM(ctx->opcode));
>   #else
>           /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
> 

