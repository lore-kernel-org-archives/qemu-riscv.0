Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHxG8-0000L5-MG
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHxG5-0000IT-N0
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHxG4-00057L-9R
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:38:33 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHxFy-00055x-MX; Wed, 31 Oct 2018 16:38:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id c10-v6so7929371pgq.4;
	Wed, 31 Oct 2018 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pWapVPrpcIsRna9Jg3K4Q/SZuMkbTBVhZ1npyJldIQk=;
	b=dvzb5IypuGxNC+UAvGxj1pWki2OAaEboa4mHsdOd4224tKUEDd0EAoKOadfZdG+lcb
	kzs8uoPvl358pw6XD/qDq86iet7LD/XgW6iRSY4iHDWperVwgxrs80PSWVKBj3D8mDe8
	r86AAX+6QISh8fdXPzTR8Rk9yA3xHF3Zf8lBW6T+AD95QqprWLeRA9cPpLpSjDeLo7J5
	Rhg+SGOhZusbnX9UdbGy5flO3dDxvpL8O65GIv5+lgH4G03tcE1v3MRM8sni3QTWMw09
	uHeshvcMV39Wrn0j++qGs1fDckhgJir+qJo0MN6RTQR4AOdIQEJZQPOnvJdqyJuOEqoj
	LtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pWapVPrpcIsRna9Jg3K4Q/SZuMkbTBVhZ1npyJldIQk=;
	b=DzTX+dnkdq8xjFpwaWu861EzwuJvgbv3J4hinMr6QSIXgPl5HyPrtiZUwKPNpLM0Ol
	jxKHkQk7BcK/h+UzR2AwAtVyd+MgIiyN0Lisn6UCl2LPksFF4sIec6nN+diWFuFLG4TB
	LQa69M6OC5XRfBVR6O+4ZNi9aLmwheVOPeKkOvijCkoPfoBUwnWVGUVRqoFQZI/TS+e4
	E5pMTeyiAzJ15i1TG3n1/NDekBFvNwrmrF7ISF6lXEMj68FzgDJSvHP6DQaWx4WswKZc
	BraU8dYRJzafrV2iOLM3Po95PuWhNo84VTFN6e9Sh8qdKRQNad7ueMj+Y94u9zpxYmCC
	LI6g==
X-Gm-Message-State: AGRZ1gKRPDIfml38knAb+MIvpG+iYtTrnzmD4zpdLsSAs11gpcO+OBZs
	SsbCshSzJCr2xgLled4ymtrZ9e3w
X-Google-Smtp-Source: AJdET5dpLeR3tvIihOUJQO8lOtrkFV7fxR78lJAao06KSxybRt6e9xUXZHw57kwXsv/QI89+eiHHTQ==
X-Received: by 2002:a63:8ac4:: with SMTP id y187mr4568791pgd.446.1541018304655;
	Wed, 31 Oct 2018 13:38:24 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	g5-v6sm1270578pgj.87.2018.10.31.13.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:38:23 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-10-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <537412dc-cd5c-0584-32af-ca9fa7572645@gmail.com>
Date: Wed, 31 Oct 2018 13:38:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-10-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 09/35] target/riscv:
 Convert RVXM insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 20:38:35 -0000

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
>   target/riscv/insn32.decode              |  10 +++
>   target/riscv/insn64.decode              |   7 ++
>   target/riscv/insn_trans/trans_rvm.inc.c | 100 ++++++++++++++++++++++++
>   target/riscv/translate.c                |  10 +--
>   4 files changed, 118 insertions(+), 9 deletions(-)
>   create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b67d3a9437..b37fece633 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -92,3 +92,13 @@ csrrc    ............     ..... 011 ..... 1110011 @csr
>   csrrwi   ............     ..... 101 ..... 1110011 @csr
>   csrrsi   ............     ..... 110 ..... 1110011 @csr
>   csrrci   ............     ..... 111 ..... 1110011 @csr
> +
> +# *** RV32M Standard Extension ***
> +mul      0000001 .....  ..... 000 ..... 0110011 @r
> +mulh     0000001 .....  ..... 001 ..... 0110011 @r
> +mulhsu   0000001 .....  ..... 010 ..... 0110011 @r
> +mulhu    0000001 .....  ..... 011 ..... 0110011 @r
> +div      0000001 .....  ..... 100 ..... 0110011 @r
> +divu     0000001 .....  ..... 101 ..... 0110011 @r
> +rem      0000001 .....  ..... 110 ..... 0110011 @r
> +remu     0000001 .....  ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn64.decode b/target/riscv/insn64.decode
> index 9a35f2aa19..008f100546 100644
> --- a/target/riscv/insn64.decode
> +++ b/target/riscv/insn64.decode
> @@ -36,3 +36,10 @@ subw     0100000 .....  ..... 000 ..... 0111011 @r
>   sllw     0000000 .....  ..... 001 ..... 0111011 @r
>   srlw     0000000 .....  ..... 101 ..... 0111011 @r
>   sraw     0100000 .....  ..... 101 ..... 0111011 @r
> +
> +# *** RV64M Standard Extension (in addition to RV32M) ***
> +mulw     0000001 .....  ..... 000 ..... 0111011 @r
> +divw     0000001 .....  ..... 100 ..... 0111011 @r
> +divuw    0000001 .....  ..... 101 ..... 0111011 @r
> +remw     0000001 .....  ..... 110 ..... 0111011 @r
> +remuw    0000001 .....  ..... 111 ..... 0111011 @r
> diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
> new file mode 100644
> index 0000000000..ec3197ede8
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvm.inc.c
> @@ -0,0 +1,100 @@
> +/*
> + * RISC-V translation routines for the RV64M Standard Extension.
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
> + *                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +
> +static bool trans_mul(DisasContext *ctx, arg_mul *a)
> +{
> +    gen_arith(ctx, OPC_RISC_MUL, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
> +{
> +    gen_arith(ctx, OPC_RISC_MULH, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
> +{
> +    gen_arith(ctx, OPC_RISC_MULHSU, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
> +{
> +    gen_arith(ctx, OPC_RISC_MULHU, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_div(DisasContext *ctx, arg_div *a)
> +{
> +    gen_arith(ctx, OPC_RISC_DIV, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_divu(DisasContext *ctx, arg_divu *a)
> +{
> +    gen_arith(ctx, OPC_RISC_DIVU, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_rem(DisasContext *ctx, arg_rem *a)
> +{
> +    gen_arith(ctx, OPC_RISC_REM, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_remu(DisasContext *ctx, arg_remu *a)
> +{
> +    gen_arith(ctx, OPC_RISC_REMU, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +#ifdef TARGET_RISCV64
> +static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_MULW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_divw(DisasContext *ctx, arg_divw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_DIVW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_DIVUW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_remw(DisasContext *ctx, arg_remw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_REMW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_REMUW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +#endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index be03acd066..8c876187b1 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1639,6 +1639,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
>   #include "decode_insn32.inc.c"
>   /* Include insn module translation function */
>   #include "insn_trans/trans_rvi.inc.c"
> +#include "insn_trans/trans_rvm.inc.c"
>   
>   static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>   {
> @@ -1660,15 +1661,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>       imm = GET_IMM(ctx->opcode);
>   
>       switch (op) {
> -    case OPC_RISC_ARITH:
> -#if defined(TARGET_RISCV64)
> -    case OPC_RISC_ARITH_W:
> -#endif
> -        if (rd == 0) {
> -            break; /* NOP */
> -        }
> -        gen_arith(ctx, MASK_OP_ARITH(ctx->opcode), rd, rs1, rs2);
> -        break;
>       case OPC_RISC_FP_LOAD:
>           gen_fp_load(ctx, MASK_OP_FP_LOAD(ctx->opcode), rd, rs1, imm);
>           break;
> 

