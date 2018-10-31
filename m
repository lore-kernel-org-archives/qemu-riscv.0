Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHx7S-0002KF-Ri
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:29:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx7Q-0002J8-VI
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:29:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx7J-0001up-43
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:29:35 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHx76-0001q6-RB; Wed, 31 Oct 2018 16:29:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id w3-v6so7903790pgs.11;
	Wed, 31 Oct 2018 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mxJgiNLnv5FqS4RtyGocHb+Pqs0A+siSuAh6k4szl1s=;
	b=k8w4DjFnM6UP4KqrR5RHvy3UGVU5jRt0li/St6O+qrjU6aWzZuwX6zW2iSWjw3kbsA
	4jCLsC497w11Bm9du8NYNeYUt5m7igYQLAi/GAWIiIgcBoris3FisTEDnPSQnnMfdPro
	rmlhy77f8S83lFdufE3HUm+R1FXVDgk3jS9P1Hp0h8PqydwtiJxDge4akiFPHKVZjdBe
	x4rMA888a7FPkot6Z1WKwTFtYqZPZ3T9E/W/WXcJIwafCPcoX4+QtJVB9p11JVQ3QD5x
	YVaYqkWC9IbUN2V+pMnxG0OBFdln/eJpI2Xu5L/gsCrcWwInw0AiwttlazENzlLyhQDj
	bnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mxJgiNLnv5FqS4RtyGocHb+Pqs0A+siSuAh6k4szl1s=;
	b=TLrXXB+AofZt+U9KwmiB0emvcC+XCALmPd8SUNJH0bUWbRu/97R54lBMahRL1SF2ir
	n/wMIf2xhRDmG0GVjY8X98Q0ZAQZ7S200qOH01kf7pb2ARndjxn8PtSyhtULuegnh3xv
	mWPGyIUPN6pPvH5pUwmZm+3cLEdk5mjs671Z6/4OyoNKVGAyLIYpKQ6ofFz95Wdv/LhU
	gAnQssZ7SfPi+3nnquPlFerKHEm/Dh0BUMnDoNq2NxtBDIwa9I/anVtzjuWFZwuEOq1n
	z2HhQFgWG/+4K8RmRZMthhTbWpgO7vAVAkTRIzLhY3w4G1ArrG5sS9M72T3aU2VEWRaW
	Qadg==
X-Gm-Message-State: AGRZ1gJUcvUzONYt2CvQsbitAcPivNfF8IsuXO97cGQSG205QkloSK15
	x0Cq/chxTYgh44MiR3rF2zNQtgVi
X-Google-Smtp-Source: AJdET5dE49UJIW4xGZTSol+ahShWy0H4Fu+aVZNU9rKmoMatnzigQEMq7MAnlUmXKFQgZpppdcVYgA==
X-Received: by 2002:a63:e348:: with SMTP id o8mr4492359pgj.158.1541017755297; 
	Wed, 31 Oct 2018 13:29:15 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	72-v6sm37360081pfl.126.2018.10.31.13.29.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:29:14 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-7-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <afa85899-90ba-5d0d-80d3-83268e923511@gmail.com>
Date: Wed, 31 Oct 2018 13:29:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-7-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 06/35] target/riscv:
 Convert RVXI arithmetic insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 20:29:38 -0000

On 10/31/18 6:20 AM, Bastian Koppelmann wrote:
> we cannot remove the call to gen_arith() in decode_RV32_64G() since it
> is used to translate multiply instructions.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2 -> v3:
>      - moved 64-bit only insn to insn64.decode
>      - dropped insn argument of trans_foo functions
> 
>   target/riscv/insn32.decode              |  25 ++++
>   target/riscv/insn64.decode              |  13 ++
>   target/riscv/insn_trans/trans_rvi.inc.c | 168 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   9 --
>   4 files changed, 206 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 076de873c4..4fd88f48d2 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -21,6 +21,8 @@
>   %rs1       15:5
>   %rd        7:5
>   
> +%sh6    20:6
> +
>   # immediates:
>   %imm_i    20:s12
>   %imm_s    25:s7 7:5
> @@ -30,14 +32,18 @@
>   
>   # Argument sets:
>   &b    imm rs2 rs1
> +&shift     shamt rs1 rd
>   
>   # Formats 32:
> +@r       .......   ..... ..... ... ..... .......                   %rs2 %rs1 %rd
>   @i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
>   @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
>   @s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
>   @u       ....................      ..... .......         imm=%imm_u          %rd
>   @j       ....................      ..... .......         imm=%imm_j          %rd
>   
> +@sh6     ......  ...... .....  ... ..... ....... &shift  shamt=%sh6      %rs1 %rd
> +
>   # *** RV32I Base Instruction Set ***
>   lui      ....................       ..... 0110111 @u
>   auipc    ....................       ..... 0010111 @u
> @@ -57,3 +63,22 @@ lhu      ............     ..... 101 ..... 0000011 @i
>   sb       .......  .....   ..... 000 ..... 0100011 @s
>   sh       .......  .....   ..... 001 ..... 0100011 @s
>   sw       .......  .....   ..... 010 ..... 0100011 @s
> +addi     ............     ..... 000 ..... 0010011 @i
> +slti     ............     ..... 010 ..... 0010011 @i
> +sltiu    ............     ..... 011 ..... 0010011 @i
> +xori     ............     ..... 100 ..... 0010011 @i
> +ori      ............     ..... 110 ..... 0010011 @i
> +andi     ............     ..... 111 ..... 0010011 @i
> +slli     000000 ......    ..... 001 ..... 0010011 @sh6
> +srli     000000 ......    ..... 101 ..... 0010011 @sh6
> +srai     010000 ......    ..... 101 ..... 0010011 @sh6
> +add      0000000 .....    ..... 000 ..... 0110011 @r
> +sub      0100000 .....    ..... 000 ..... 0110011 @r
> +sll      0000000 .....    ..... 001 ..... 0110011 @r
> +slt      0000000 .....    ..... 010 ..... 0110011 @r
> +sltu     0000000 .....    ..... 011 ..... 0110011 @r
> +xor      0000000 .....    ..... 100 ..... 0110011 @r
> +srl      0000000 .....    ..... 101 ..... 0110011 @r
> +sra      0100000 .....    ..... 101 ..... 0110011 @r
> +or       0000000 .....    ..... 110 ..... 0110011 @r
> +and      0000000 .....    ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn64.decode b/target/riscv/insn64.decode
> index 439d4e2c58..9a35f2aa19 100644
> --- a/target/riscv/insn64.decode
> +++ b/target/riscv/insn64.decode
> @@ -19,7 +19,20 @@
>   # This is concatenated with insn32.decode for risc64 targets.
>   # Most of the fields and formats are there.
>   
> +%sh5    20:5
> +
> +@sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
> +
>   # *** RV64I Base Instruction Set (in addition to RV32I) ***
>   lwu      ............   ..... 110 ..... 0000011 @i
>   ld       ............   ..... 011 ..... 0000011 @i
>   sd       ....... .....  ..... 011 ..... 0100011 @s
> +addiw    ............   ..... 000 ..... 0011011 @i
> +slliw    0000000 .....  ..... 001 ..... 0011011 @sh5
> +srliw    0000000 .....  ..... 101 ..... 0011011 @sh5
> +sraiw    0100000 .....  ..... 101 ..... 0011011 @sh5
> +addw     0000000 .....  ..... 000 ..... 0111011 @r
> +subw     0100000 .....  ..... 000 ..... 0111011 @r
> +sllw     0000000 .....  ..... 001 ..... 0111011 @r
> +srlw     0000000 .....  ..... 101 ..... 0111011 @r
> +sraw     0100000 .....  ..... 101 ..... 0111011 @r
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 39a20a70e8..01f751650a 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -150,3 +150,171 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
>       return true;
>   }
>   #endif
> +
> +static bool trans_addi(DisasContext *ctx, arg_addi *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_ADDI, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_slti(DisasContext *ctx, arg_slti *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SLTI, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SLTIU, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_xori(DisasContext *ctx, arg_xori *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_XORI, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +static bool trans_ori(DisasContext *ctx, arg_ori *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_ORI, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +static bool trans_andi(DisasContext *ctx, arg_andi *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_ANDI, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +static bool trans_slli(DisasContext *ctx, arg_slli *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SLLI, a->rd, a->rs1, a->shamt);
> +    return true;
> +}
> +
> +static bool trans_srli(DisasContext *ctx, arg_srli *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt);
> +    return true;
> +}
> +
> +static bool trans_srai(DisasContext *ctx, arg_srai *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, a->rd, a->rs1, a->shamt | 0x400);
> +    return true;
> +}
> +
> +static bool trans_add(DisasContext *ctx, arg_add *a)
> +{
> +    gen_arith(ctx, OPC_RISC_ADD, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sub(DisasContext *ctx, arg_sub *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SUB, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sll(DisasContext *ctx, arg_sll *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SLL, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_slt(DisasContext *ctx, arg_slt *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SLTU, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_xor(DisasContext *ctx, arg_xor *a)
> +{
> +    gen_arith(ctx, OPC_RISC_XOR, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_srl(DisasContext *ctx, arg_srl *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SRL, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sra(DisasContext *ctx, arg_sra *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SRA, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_or(DisasContext *ctx, arg_or *a)
> +{
> +    gen_arith(ctx, OPC_RISC_OR, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_and(DisasContext *ctx, arg_and *a)
> +{
> +    gen_arith(ctx, OPC_RISC_AND, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +#ifdef TARGET_RISCV64
> +static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_ADDIW, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SLLIW, a->rd, a->rs1, a->shamt);
> +    return true;
> +}
> +
> +static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW, a->rd, a->rs1, a->shamt);
> +    return true;
> +}
> +
> +static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
> +{
> +    gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_IW , a->rd, a->rs1,
> +                  a->shamt | 0x400);
> +    return true;
> +}
> +
> +static bool trans_addw(DisasContext *ctx, arg_addw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_ADDW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_subw(DisasContext *ctx, arg_subw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SUBW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +
> +static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
> +{
> +    gen_arith(ctx, OPC_RISC_SRAW, a->rd, a->rs1, a->rs2);
> +    return true;
> +}
> +#endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 244855c82d..855c241e97 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1701,15 +1701,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>       imm = GET_IMM(ctx->opcode);
>   
>       switch (op) {
> -    case OPC_RISC_ARITH_IMM:
> -#if defined(TARGET_RISCV64)
> -    case OPC_RISC_ARITH_IMM_W:
> -#endif
> -        if (rd == 0) {
> -            break; /* NOP */
> -        }
> -        gen_arith_imm(ctx, MASK_OP_ARITH_IMM(ctx->opcode), rd, rs1, imm);
> -        break;
>       case OPC_RISC_ARITH:
>   #if defined(TARGET_RISCV64)
>       case OPC_RISC_ARITH_W:
> 

