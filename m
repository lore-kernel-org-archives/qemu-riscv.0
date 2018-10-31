Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHx4G-0007qt-4U
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx4E-0007pi-7P
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:26:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx4C-0000mA-Hj
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:26:18 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHx47-0000lP-Vb; Wed, 31 Oct 2018 16:26:12 -0400
Received: by mail-pg1-x541.google.com with SMTP id w3-v6so7900282pgs.11;
	Wed, 31 Oct 2018 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FAY8gSnp6INoeVKX9UE1r/yxRMk2d3CPOznX/KN6Pgg=;
	b=Up3v4sPtHY2Y8r/1Nwu1OUmnrC366AOL69u3xnFvsYlMhh2JtnHN65jpfRzRwVVZi8
	E2TgOdd5ho6x+7rxMgHUVVEKM79V+8bZBhk91lb8m19q0VUlXJXVxhwpJRtoXKf6cq9b
	S5Fi8GDW1FLh8D4vmvEf/y+PRomnUWPlIF0tuYW+Rjleg5ShMRjptLlqSoMH2NcAMWSZ
	a4a75tNP9aV0ZX24PqQrBjpzMYHbvBuiCMKSGH8SMKk593QUlxoLDF9ZHZMgPaANwEa1
	w0Cepzz1Sb7oaehckOFyeSlTB1O3nAGXnU1NHo/LNkDYoysbNzk2urlzmATZFyUT1Mhg
	TpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FAY8gSnp6INoeVKX9UE1r/yxRMk2d3CPOznX/KN6Pgg=;
	b=GTZnR0fIgbrbPTlTIN5l2B6+yxkEsmSHjP2NJDE8tY2yK2/mx7ggPT8iMq2EY0FJaQ
	tpemUqhZise0s4lwg+VfI6is1jTA28zySWgW/XeSajWdHl4rOIg+jlww/4SwgJzADs76
	yEgPR6RtU28KJLEn7Z4bW9X/K5vLqzI/riQLnHEUGkA95OE5/v8cSEgyduRV6xtLGWoM
	4g7gzEL+Youtouw/x9VKi3o4I6hYjQ/Zdfb8qRSZ1wXynTSlO6K5vI+mPXiCe9s0tYfK
	esMcZ3d8GY0pqj0OQUmdxNap+AHmjU4k1Phr0lwGt5xNCVekVDGR+ZXiQl7bOnV9kE1n
	DWPQ==
X-Gm-Message-State: AGRZ1gITb7PmdY9XlG17E7z5qAIESw9OLAjOwZEEstgXvDeUKPEmjj92
	1gFeeD4/pdFIGEX5jTt6XXcoosp3
X-Google-Smtp-Source: AJdET5eoSmSLHPEvG9A38Za+fX4HKpM8Bjnc+iJxcampUUmBIfaznCZuAUogTOXn6gs4r4yprx7J9g==
X-Received: by 2002:a63:314c:: with SMTP id x73mr4562732pgx.323.1541017570119; 
	Wed, 31 Oct 2018 13:26:10 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	u76-v6sm8351116pfa.176.2018.10.31.13.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:26:08 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-6-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <a9587cb7-3c4f-2d0c-6651-99cd122f4a75@gmail.com>
Date: Wed, 31 Oct 2018 13:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-6-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 05/35] target/riscv:
 Convert RV64I load/store insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 20:26:19 -0000

On 10/31/18 6:19 AM, Bastian Koppelmann wrote:
> this splits the 64-bit only instructions into its own decode file such
> that we generate the decoder for these instructions only for the RISC-V
> 64 bit target.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/riscv/Makefile.objs              |  8 +++++---
>   target/riscv/insn64.decode              | 25 +++++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvi.inc.c | 20 ++++++++++++++++++++
>   target/riscv/translate.c                |  7 -------
>   4 files changed, 50 insertions(+), 10 deletions(-)
>   create mode 100644 target/riscv/insn64.decode
> 
> diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> index ee995b3fc7..b9b8152cc2 100644
> --- a/target/riscv/Makefile.objs
> +++ b/target/riscv/Makefile.objs
> @@ -2,10 +2,12 @@ obj-y += translate.o op_helper.o cpu_helper.o cpu.o fpu_helper.o gdbstub.o pmp.o
>   
>   DECODETREE = $(SRC_PATH)/scripts/decodetree.py
>   
> -target/riscv/decode_insn32.inc.c: \
> -  $(SRC_PATH)/target/riscv/insn32.decode $(DECODETREE)
> +decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
> +decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn64.decode
> +
> +target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
>   	$(call quiet-command, \
> -	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $<, \
> +	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
>   	  "GEN", $(TARGET_DIR)$@)
>   
>   target/riscv/translate.o: target/riscv/decode_insn32.inc.c
> diff --git a/target/riscv/insn64.decode b/target/riscv/insn64.decode
> new file mode 100644
> index 0000000000..439d4e2c58
> --- /dev/null
> +++ b/target/riscv/insn64.decode
> @@ -0,0 +1,25 @@
> +#
> +# RISC-V translation routines for the RV Instruction Set.
> +#
> +# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
> +#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
> +#
> +# This program is free software; you can redistribute it and/or modify it
> +# under the terms and conditions of the GNU General Public License,
> +# version 2 or later, as published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope it will be useful, but WITHOUT
> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> +# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> +# more details.
> +#
> +# You should have received a copy of the GNU General Public License along with
> +# this program.  If not, see <http://www.gnu.org/licenses/>.
> +
> +# This is concatenated with insn32.decode for risc64 targets.
> +# Most of the fields and formats are there.
> +
> +# *** RV64I Base Instruction Set (in addition to RV32I) ***
> +lwu      ............   ..... 110 ..... 0000011 @i
> +ld       ............   ..... 011 ..... 0000011 @i
> +sd       ....... .....  ..... 011 ..... 0100011 @s
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index f3b88ebb69..39a20a70e8 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -130,3 +130,23 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
>       gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
>       return true;
>   }
> +
> +#ifdef TARGET_RISCV64
> +static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
> +{
> +    gen_load(ctx, OPC_RISC_LWU, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_ld(DisasContext *ctx, arg_ld *a)
> +{
> +    gen_load(ctx, OPC_RISC_LD, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_sd(DisasContext *ctx, arg_sd *a)
> +{
> +    gen_store(ctx, OPC_RISC_SD, a->rs1, a->rs2, a->imm);
> +    return true;
> +}
> +#endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 909f7cd013..244855c82d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1701,13 +1701,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>       imm = GET_IMM(ctx->opcode);
>   
>       switch (op) {
> -    case OPC_RISC_LOAD:
> -        gen_load(ctx, MASK_OP_LOAD(ctx->opcode), rd, rs1, imm);
> -        break;
> -    case OPC_RISC_STORE:
> -        gen_store(ctx, MASK_OP_STORE(ctx->opcode), rs1, rs2,
> -                  GET_STORE_IMM(ctx->opcode));
> -        break;
>       case OPC_RISC_ARITH_IMM:
>   #if defined(TARGET_RISCV64)
>       case OPC_RISC_ARITH_IMM_W:
> 

