Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn9uc-0000pa-JW
	for mharc-qemu-riscv@gnu.org; Fri, 25 Jan 2019 17:25:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9uY-0000o4-MY
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:25:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gn9uX-0003Ud-MD
	for qemu-riscv@nongnu.org; Fri, 25 Jan 2019 17:25:18 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gn9uS-0003Ry-Kz; Fri, 25 Jan 2019 17:25:13 -0500
Received: by mail-pf1-x443.google.com with SMTP id w73so5352018pfk.10;
	Fri, 25 Jan 2019 14:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6H6W2By2BlFffVBu9jGxVb3KK3JXbP7DuLdPo0aNZNc=;
	b=JPPc8YigNFO2PdltTa1hCvVRPeKuO3km28Wm2MAgosQ4SNIbVpYTzuIw8dnyIcMLKv
	gUfl0K2Fv2kdQfEEIaIV2qHI+BULU86BE/3LkRev0cPX6aJ+j2nT9Qv2Dy2vzSGk1CcR
	/oevWiZGlf5StW0kWQGsr/AkyMWGFglTFJ9R+TezDknYII7wXeV6iy9FwGPpf4C1GXAS
	vjIKI3MS693Ajg5A/GiELNY2HCVRyBofpZIuXMBW9CbiPKXSJ1Jg618jfiLPdA+/KWgR
	M57TP2YjdVVhNf6MN7Mr8pLxWGGxrr8qfpmH53HDIROjvBhSFDpD/IVf6rbBC75t+4vy
	f3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6H6W2By2BlFffVBu9jGxVb3KK3JXbP7DuLdPo0aNZNc=;
	b=MYhJza5xw1BFHNBe4g3opFkcyD0HVKEnzm/bjQrZtbEABwq4JQAyE1zcfDunYK35Cm
	KR1o7aH6jw7rRlvxtwKHPlBVrmHB/Y75BkbajOmmgRFOQckCIORXFh3WG2rRlue9YnWr
	QxI99hWcn36zcZQKWOSQHRz6Mh6f/Y6aP68MXmZPU+cu3xym1wq+6fdjZozRhrVOdmHP
	G/N6LT6tDDjfJLW1k75eZy4rrSplglO5PZcD785M9MWbjR7BSRo4gRrnX6jxUePnPB5T
	5A30mHo2KkWrb9Ym19rdZcWIpLl3nBVMLXKuLQq5nNPpxHXXVgSZuk4nJn5scbgtPJZQ
	i8wg==
X-Gm-Message-State: AJcUukcRswZS7hLqTaXz3DhZAcCzyk7GokOC4XUaQPRyPJuB9mfiI8Ss
	M562kOhxikmyaOHhyUBvdQC7y1Qi
X-Google-Smtp-Source: ALg8bN4gOAXxuqSBDp3hm8tN76PbpJrcfOO1lqqo7q3KYrYKArj9wrRSRC7Cm4W/8cEu10BKI3EZHg==
X-Received: by 2002:a63:7154:: with SMTP id b20mr11547132pgn.342.1548455110554;
	Fri, 25 Jan 2019 14:25:10 -0800 (PST)
Received: from [10.196.159.136] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	184sm36362705pfe.106.2019.01.25.14.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 14:25:09 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
	<20190123092538.8004-24-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <c843cc70-966a-684f-7c73-0739dceb1dda@gmail.com>
Date: Fri, 25 Jan 2019 14:25:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123092538.8004-24-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 23/35] target/riscv: Remove
 manual decoding from gen_store()
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
X-List-Received-Date: Fri, 25 Jan 2019 22:25:21 -0000

On 1/23/19 1:25 AM, Bastian Koppelmann wrote:
> With decodetree we don't need to convert RISC-V opcodes into to MemOps
> as the old gen_store() did.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/insn_trans/trans_rvi.inc.c | 27 +++++++++++++++++--------
>   target/riscv/translate.c                |  8 +++++---
>   2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 1ad00bd776..da843b4e99 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -168,22 +168,34 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>       return gen_load(ctx, a, MO_TEUW);
>   }
>   
> -static bool trans_sb(DisasContext *ctx, arg_sb *a)
> +static bool gen_store(DisasContext *ctx, arg_sb *a, TCGMemOp memop)
>   {
> -    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
> +    TCGv t0 = tcg_temp_new();
> +    TCGv dat = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
> +    tcg_gen_addi_tl(t0, t0, a->imm);
> +    gen_get_gpr(dat, a->rs2);
> +
> +    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
> +    tcg_temp_free(t0);
> +    tcg_temp_free(dat);
>       return true;
>   }
>   
> +
> +static bool trans_sb(DisasContext *ctx, arg_sb *a)
> +{
> +    return gen_store(ctx, a, MO_SB);
> +}
> +
>   static bool trans_sh(DisasContext *ctx, arg_sh *a)
>   {
> -    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_store(ctx, a, MO_TESW);
>   }
>   
>   static bool trans_sw(DisasContext *ctx, arg_sw *a)
>   {
> -    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_store(ctx, a, MO_TESL);
>   }
>   
>   #ifdef TARGET_RISCV64
> @@ -199,8 +211,7 @@ static bool trans_ld(DisasContext *ctx, arg_ld *a)
>   
>   static bool trans_sd(DisasContext *ctx, arg_sd *a)
>   {
> -    gen_store(ctx, OPC_RISC_SD, a->rs1, a->rs2, a->imm);
> -    return true;
> +    return gen_store(ctx, a, MO_TEQ);
>   }
>   #endif
>   
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d0fefa8fb9..59452be191 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -55,6 +55,7 @@ typedef struct DisasContext {
>       CPURISCVState *env;
>   } DisasContext;
>   
> +#ifdef TARGET_RISCV64
>   /* convert riscv funct3 to qemu memop for load/store */
>   static const int tcg_memop_lookup[8] = {
>       [0 ... 7] = -1,
> @@ -68,6 +69,7 @@ static const int tcg_memop_lookup[8] = {
>       [6] = MO_TEUL,
>   #endif
>   };
> +#endif
>   
>   #ifdef TARGET_RISCV64
>   #define CASE_OP_32_64(X) case X: case glue(X, W)
> @@ -509,9 +511,8 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
>       tcg_temp_free(t0);
>       tcg_temp_free(t1);
>   }
> -#endif
>   
> -static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
> +static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
>           target_long imm)
>   {
>       TCGv t0 = tcg_temp_new();
> @@ -530,6 +531,7 @@ static void gen_store(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
>       tcg_temp_free(t0);
>       tcg_temp_free(dat);
>   }
> +#endif
>   
>   #ifdef TARGET_RISCV32
>   static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
> @@ -653,7 +655,7 @@ static void decode_RV32_64C0(DisasContext *ctx)
>       case 7:
>   #if defined(TARGET_RISCV64)
>           /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
> -        gen_store(ctx, OPC_RISC_SD, rs1s, rd_rs2,
> +        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
>                     GET_C_LD_IMM(ctx->opcode));
>   #else
>           /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
> 

