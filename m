Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHwz5-0003RP-0j
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwz2-0003Q4-D8
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwz1-0007Y9-6o
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:20:56 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHwyw-0007XL-A1; Wed, 31 Oct 2018 16:20:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id x6-v6so7831468pln.0;
	Wed, 31 Oct 2018 13:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NGZP6yiPeTz3CWocbs2d0ymE2SUfABJpa0MqucKDwTU=;
	b=Zqh3IVpacPTcj5VZi7DMzXi1wHog2yjpHVjmu4gEG6kQKcskMNgRB/RCRoLNl2iJmy
	BB4+M+RWrrPTF4LGCpEmamKnJV5zGeibaosOMz/uP0B9wNOWLi2tQ+yz8NG94SOIndWI
	Ou5ydlRn8LqFMpCsR5QH1nczL43LR0CFKz75ky7j2FLZ7hNriak3aucLBt8/5sEFF7T5
	mt68BfjMFzW8iHlw0v0iuZuJcEs0vp6cnLZRa3A5FoWMcEiQmvY+1gAqoObP3sarZjbL
	7db6+Ri/Igjq5I6NVR5wemCh3oq+vMdb3FOMw5oPxAZ7goIOWsz5/9CRNQGTWZG/M689
	DfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NGZP6yiPeTz3CWocbs2d0ymE2SUfABJpa0MqucKDwTU=;
	b=RC84+8yjz+pWF815+BCim4RCeTF0Z4AuFOUNYmnCNlAJ5QBoXvcK95kn9I32ybKIVy
	k8XCc1stKKf1HCZUPLa7/Nj7Up8aXyPh7Rx4pTUgM0RXulQFy1jflCXdhCbcO8JwJEX+
	552ukquZ37yLa21qB9UYsxMgrY9QmVaS221zjuBFgLFqEkdeRkVXjucUA1WHA2hzD6sp
	nZV9oUU5VNdHZyi3GAc1d3v+kGDg2vwWJzkjRI+f6eBJoEWBaZf4YRjWcqaKBAq40nBy
	uc3N5Of7tr5t/p09rFWV+j8DfPOvMy56VuVuOOnY4p0zrsKkS/z2i5BTvvKx+L+zmmNR
	q55g==
X-Gm-Message-State: AGRZ1gI2DiZTJLWsIcC8wYsz4CW9WmuUDwY5BbAr9J0Q36jzxQ/nZ04A
	Xhs5zMp3z8zjgoNSfPyx6D5jQfMj
X-Google-Smtp-Source: AJdET5cD0/Xi1tzyGXdJexKN//yygPXBwj1bMDtKHj5hJ6OgiFZUeUZAI3RlCQGt/2gi11J/f5tHaA==
X-Received: by 2002:a17:902:8ec2:: with SMTP id
	x2-v6mr4841877plo.157.1541017248790; 
	Wed, 31 Oct 2018 13:20:48 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	u69-v6sm42658742pfk.68.2018.10.31.13.20.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:20:47 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-3-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <c9363ae6-6984-f369-3072-0c69d0361e07@gmail.com>
Date: Wed, 31 Oct 2018 13:20:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-3-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 02/35] target/riscv:
 Activate decodetree and implemnt LUI & AUIPC
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
X-List-Received-Date: Wed, 31 Oct 2018 20:20:57 -0000

On 10/31/18 6:19 AM, Bastian Koppelmann wrote:
> for now only LUI & AUIPC are decoded and translated. If decodetree fails, we
> fall back to the old decoder.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2 -> v3:
>      - ex_shift_amount returns int
>      - dropped insn argument of trans_foo functions
> 
>   target/riscv/Makefile.objs              | 10 +++++++
>   target/riscv/insn32.decode              | 30 +++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvi.inc.c | 35 +++++++++++++++++++++++++
>   target/riscv/translate.c                | 31 ++++++++++++----------
>   4 files changed, 92 insertions(+), 14 deletions(-)
>   create mode 100644 target/riscv/insn32.decode
>   create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
> 
> diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> index fcc5d34c1f..ee995b3fc7 100644
> --- a/target/riscv/Makefile.objs
> +++ b/target/riscv/Makefile.objs
> @@ -1 +1,11 @@
>   obj-y += translate.o op_helper.o cpu_helper.o cpu.o fpu_helper.o gdbstub.o pmp.o
> +
> +DECODETREE = $(SRC_PATH)/scripts/decodetree.py
> +
> +target/riscv/decode_insn32.inc.c: \
> +  $(SRC_PATH)/target/riscv/insn32.decode $(DECODETREE)
> +	$(call quiet-command, \
> +	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $<, \
> +	  "GEN", $(TARGET_DIR)$@)
> +
> +target/riscv/translate.o: target/riscv/decode_insn32.inc.c
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> new file mode 100644
> index 0000000000..44d4e922b6
> --- /dev/null
> +++ b/target/riscv/insn32.decode
> @@ -0,0 +1,30 @@
> +#
> +# RISC-V translation routines for the RVXI Base Integer Instruction Set.
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
> +# Fields:
> +%rd        7:5
> +
> +# immediates:
> +%imm_u    12:s20                 !function=ex_shift_12
> +
> +# Formats 32:
> +@u       ....................      ..... .......         imm=%imm_u          %rd
> +
> +# *** RV32I Base Instruction Set ***
> +lui      ....................       ..... 0110111 @u
> +auipc    ....................       ..... 0010111 @u
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> new file mode 100644
> index 0000000000..9885a8d275
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -0,0 +1,35 @@
> +/*
> + * RISC-V translation routines for the RVXI Base Integer Instruction Set.
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
> +static bool trans_lui(DisasContext *ctx, arg_lui *a)
> +{
> +    if (a->rd != 0) {
> +        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
> +    }
> +    return true;
> +}
> +
> +static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
> +{
> +    if (a->rd != 0) {
> +        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
> +    }
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e81b9f097e..ba57cb29f5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1667,6 +1667,19 @@ static void decode_RV32_64C(CPURISCVState *env, DisasContext *ctx)
>       }
>   }
>   
> +#define EX_SH(amount) \
> +    static int ex_shift_##amount(int imm) \
> +    {                                         \
> +        return imm << amount;                 \
> +    }
> +EX_SH(12)
> +
> +bool decode_insn32(DisasContext *ctx, uint32_t insn);
> +/* Include the auto-generated decoder for 32 bit insn */
> +#include "decode_insn32.inc.c"
> +/* Include insn module translation function */
> +#include "insn_trans/trans_rvi.inc.c"
> +
>   static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>   {
>       int rs1;
> @@ -1687,19 +1700,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>       imm = GET_IMM(ctx->opcode);
>   
>       switch (op) {
> -    case OPC_RISC_LUI:
> -        if (rd == 0) {
> -            break; /* NOP */
> -        }
> -        tcg_gen_movi_tl(cpu_gpr[rd], sextract64(ctx->opcode, 12, 20) << 12);
> -        break;
> -    case OPC_RISC_AUIPC:
> -        if (rd == 0) {
> -            break; /* NOP */
> -        }
> -        tcg_gen_movi_tl(cpu_gpr[rd], (sextract64(ctx->opcode, 12, 20) << 12) +
> -               ctx->base.pc_next);
> -        break;
>       case OPC_RISC_JAL:
>           imm = GET_JAL_IMM(ctx->opcode);
>           gen_jal(env, ctx, rd, imm);
> @@ -1802,7 +1802,10 @@ static void decode_opc(DisasContext *ctx)
>           }
>       } else {
>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> -        decode_RV32_64G(ctx->env, ctx);
> +        if (!decode_insn32(ctx, ctx->opcode)) {
> +            /* fallback to old decoder */
> +            decode_RV32_64G(ctx->env, ctx);
> +        }
>       }
>   }
>   
> 

