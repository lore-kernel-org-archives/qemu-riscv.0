Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHxQU-00068H-J9
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:49:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHxQS-00065f-J9
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHxQR-0002sO-7a
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:49:16 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHxQK-0002q4-Nh; Wed, 31 Oct 2018 16:49:09 -0400
Received: by mail-pl1-x641.google.com with SMTP id y11-v6so7858089plt.3;
	Wed, 31 Oct 2018 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Qglhtzrgw1zLwMWdkPMwbsNtLcY4HpcM41kDfPXBZX4=;
	b=uUZiCVYTxBpmTNwovyWdfkHUatQwoSiFS5lzAByGQYSF4AYdmZveczZMkUZclPRs/+
	IPOp7r7xGDvQj0ChjMvu72/SJQu745MZwzp84BblRyBod2WkSdVXbxHul9adqcalcxYM
	3uPXI2UcloM6fmRjFP6HwnwimNt1/mh14T4xsIxeDwh7DsSnlsZE9v7Y7ttU57f/Mrfz
	PTvY8WuXoE4zif9Yc5lDAJyN8FMSIUyKZo6cWYU86r5sH6sfUvgTNnYNbsIlsraBGM7J
	FyyZw2l8JQKIUnBt2aLc/f/80fE757PUeeKymlf7SXP0eudwrna+hy/EPfzCRlRZRkow
	nejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Qglhtzrgw1zLwMWdkPMwbsNtLcY4HpcM41kDfPXBZX4=;
	b=DbmRSm1WVhNq2D7P7so40BIKBFUOmFrKCRJ0t0EueaJt0bT28ESWSpCjd9HiiNbvlI
	d2C1eg6cBKwgFAQg6UP8hHWexWq5am6NCzP7j5jPuFkmbiOe3eOGmOkytdB3AaIVKMIJ
	At616z7t4J0A3+xKdUNbthtUr/OUmUX0j1b+C2pvkoQt2gFBX4bX+wICiMdhspBsgX++
	aPmTn2viNO2U8aCrfCTgW3C4OTeiLqQQoYJuT1Ytu22ZTb8KyKdNpfyRWC5DDnCiM6lG
	BLT+lnSh5GbW4Fo7R9HkAinU2Df2JzQFcse0NPI5Ib6RjMwuYS/o4rdHaWmfZloIT6M9
	U7Uw==
X-Gm-Message-State: AGRZ1gIr8VJXLzw3Kcqwapw7/2Nj/jkTPSc+oDWJxl/35NMtj1mfLXUr
	Zh49yRbIiX65AbEGBiouKczbjWDU
X-Google-Smtp-Source: AJdET5cWA5tqaCrZDGJFIfOCAdipiVyhU93IW5JpX4uD6VTng9HyLa0gO4hyo2ucOA/jrr8LRBLJjg==
X-Received: by 2002:a17:902:4281:: with SMTP id
	h1-v6mr4941051pld.114.1541018947161; 
	Wed, 31 Oct 2018 13:49:07 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	126-v6sm31009672pff.105.2018.10.31.13.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:49:05 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-12-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <c2f3a2ea-fed2-98f6-2412-5a93aec137db@gmail.com>
Date: Wed, 31 Oct 2018 13:49:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-12-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 11/35] target/riscv:
 Convert RV64A insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 20:49:17 -0000

On 10/31/18 6:20 AM, Bastian Koppelmann wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2 -> v3:
>      - moved 64-bit only insn to insn64.decode
>      - dropped insn argument of trans_foo functions
> 
>   target/riscv/insn64.decode              |  13 +++
>   target/riscv/insn_trans/trans_rva.inc.c |  58 ++++++++++
>   target/riscv/translate.c                | 140 ------------------------
>   3 files changed, 71 insertions(+), 140 deletions(-)
> 
> diff --git a/target/riscv/insn64.decode b/target/riscv/insn64.decode
> index 008f100546..0bee95c984 100644
> --- a/target/riscv/insn64.decode
> +++ b/target/riscv/insn64.decode
> @@ -43,3 +43,16 @@ divw     0000001 .....  ..... 100 ..... 0111011 @r
>   divuw    0000001 .....  ..... 101 ..... 0111011 @r
>   remw     0000001 .....  ..... 110 ..... 0111011 @r
>   remuw    0000001 .....  ..... 111 ..... 0111011 @r
> +
> +# *** RV64A Standard Extension (in addition to RV32A) ***
> +lr_d       00010 . . 00000 ..... 011 ..... 0101111 @atom_ld
> +sc_d       00011 . . ..... ..... 011 ..... 0101111 @atom_st
> +amoswap_d  00001 . . ..... ..... 011 ..... 0101111 @atom_st
> +amoadd_d   00000 . . ..... ..... 011 ..... 0101111 @atom_st
> +amoxor_d   00100 . . ..... ..... 011 ..... 0101111 @atom_st
> +amoand_d   01100 . . ..... ..... 011 ..... 0101111 @atom_st
> +amoor_d    01000 . . ..... ..... 011 ..... 0101111 @atom_st
> +amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
> +amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
> +amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
> +amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
> diff --git a/target/riscv/insn_trans/trans_rva.inc.c b/target/riscv/insn_trans/trans_rva.inc.c
> index d42d36ebf7..fbfca7f835 100644
> --- a/target/riscv/insn_trans/trans_rva.inc.c
> +++ b/target/riscv/insn_trans/trans_rva.inc.c
> @@ -143,3 +143,61 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
>   {
>       return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
>   }
> +
> +#ifdef TARGET_RISCV64
> +
> +static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
> +{
> +    return gen_lr(ctx, a, MO_ALIGN | MO_TEQ);
> +}
> +
> +static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
> +{
> +    return gen_sc(ctx, a, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEQ));
> +}
> +
> +static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
> +{
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEQ));
> +}
> +#endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d8fe319f62..a1b949ad0a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -711,143 +711,6 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
>       tcg_temp_free(t0);
>   }
>   
> -static void gen_atomic(DisasContext *ctx, uint32_t opc,
> -                      int rd, int rs1, int rs2)
> -{
> -    TCGv src1, src2, dat;
> -    TCGLabel *l1, *l2;
> -    TCGMemOp mop;
> -    bool aq, rl;
> -
> -    /* Extract the size of the atomic operation.  */
> -    switch (extract32(opc, 12, 3)) {
> -    case 2: /* 32-bit */
> -        mop = MO_ALIGN | MO_TESL;
> -        break;
> -#if defined(TARGET_RISCV64)
> -    case 3: /* 64-bit */
> -        mop = MO_ALIGN | MO_TEQ;
> -        break;
> -#endif
> -    default:
> -        gen_exception_illegal(ctx);
> -        return;
> -    }
> -    rl = extract32(opc, 25, 1);
> -    aq = extract32(opc, 26, 1);
> -
> -    src1 = tcg_temp_new();
> -    src2 = tcg_temp_new();
> -
> -    switch (MASK_OP_ATOMIC_NO_AQ_RL_SZ(opc)) {
> -    case OPC_RISC_LR:
> -        /* Put addr in load_res, data in load_val.  */
> -        gen_get_gpr(src1, rs1);
> -        if (rl) {
> -            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> -        }
> -        tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
> -        if (aq) {
> -            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> -        }
> -        tcg_gen_mov_tl(load_res, src1);
> -        gen_set_gpr(rd, load_val);
> -        break;
> -
> -    case OPC_RISC_SC:
> -        l1 = gen_new_label();
> -        l2 = gen_new_label();
> -        dat = tcg_temp_new();
> -
> -        gen_get_gpr(src1, rs1);
> -        tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
> -
> -        gen_get_gpr(src2, rs2);
> -        /* Note that the TCG atomic primitives are SC,
> -           so we can ignore AQ/RL along this path.  */
> -        tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
> -                                  ctx->mem_idx, mop);
> -        tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
> -        gen_set_gpr(rd, dat);
> -        tcg_gen_br(l2);
> -
> -        gen_set_label(l1);
> -        /* Address comparion failure.  However, we still need to
> -           provide the memory barrier implied by AQ/RL.  */
> -        tcg_gen_mb(TCG_MO_ALL + aq * TCG_BAR_LDAQ + rl * TCG_BAR_STRL);
> -        tcg_gen_movi_tl(dat, 1);
> -        gen_set_gpr(rd, dat);
> -
> -        gen_set_label(l2);
> -        tcg_temp_free(dat);
> -        break;
> -
> -    case OPC_RISC_AMOSWAP:
> -        /* Note that the TCG atomic primitives are SC,
> -           so we can ignore AQ/RL along this path.  */
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_xchg_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOADD:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_add_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOXOR:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_xor_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOAND:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_and_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOOR:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_or_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOMIN:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_smin_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOMAX:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_smax_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOMINU:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_umin_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -    case OPC_RISC_AMOMAXU:
> -        gen_get_gpr(src1, rs1);
> -        gen_get_gpr(src2, rs2);
> -        tcg_gen_atomic_fetch_umax_tl(src2, src1, src2, ctx->mem_idx, mop);
> -        gen_set_gpr(rd, src2);
> -        break;
> -
> -    default:
> -        gen_exception_illegal(ctx);
> -        break;
> -    }
> -
> -    tcg_temp_free(src1);
> -    tcg_temp_free(src2);
> -}
> -
>   static void gen_set_rm(DisasContext *ctx, int rm)
>   {
>       TCGv_i32 t0;
> @@ -1669,9 +1532,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>           gen_fp_store(ctx, MASK_OP_FP_STORE(ctx->opcode), rs1, rs2,
>                        GET_STORE_IMM(ctx->opcode));
>           break;
> -    case OPC_RISC_ATOMIC:
> -        gen_atomic(ctx, MASK_OP_ATOMIC(ctx->opcode), rd, rs1, rs2);
> -        break;
>       case OPC_RISC_FMADD:
>           gen_fp_fmadd(ctx, MASK_OP_FP_FMADD(ctx->opcode), rd, rs1, rs2,
>                        GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
> 

