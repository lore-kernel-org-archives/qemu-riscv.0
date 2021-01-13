Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzelt-00085O-33
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 06:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kzelr-00083u-Ob
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 06:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kzeln-00056R-Bh
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 06:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610539018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0RvnvH2KViIeOa6XMFVti+qF1Pl86CY47En+Mt8Veo=;
 b=LC+ZrxwMwdlL05Sxhn5410BCj3TYxhxigHXntgDWxEIBePlusiIvca2tjEoryOURY4ciMd
 KVWNdZ7c4yFVMMCyk4u7EXtAoX9ntcfIOmBGFdsk3TpR1Bgzdf9ogf3shUy6zkNQD2wT9h
 P6Fghe+mFM0iMWvKqxgFg66HXCQ6V70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-hqBf9LccMj-FX2BFHyGHZg-1; Wed, 13 Jan 2021 06:56:54 -0500
X-MC-Unique: hqBf9LccMj-FX2BFHyGHZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D9ABBEE1;
 Wed, 13 Jan 2021 11:56:52 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD40F60CE0;
 Wed, 13 Jan 2021 11:56:47 +0000 (UTC)
Date: Wed, 13 Jan 2021 12:56:44 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/5] tcg/s390: Hoist common argument loads in tcg_out_op()
Message-ID: <20210113115644.bemac6oxc5243t4f@lws.brq.redhat.com>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <20210111150114.1415930-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210111150114.1415930-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 11:57:04 -0000

On Mon, Jan 11, 2021 at 04:01:12PM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tcg/s390/tcg-target.c.inc | 252 ++++++++++++++++++--------------------
>  1 file changed, 122 insertions(+), 130 deletions(-)
> 
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index d7ef0790556..74b2314c78a 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1732,15 +1732,23 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>          case glue(glue(INDEX_op_,x),_i64)
>  
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      S390Opcode op, op2;
>      TCGArg a0, a1, a2;
> +    int c2, c3, c4;
> +
> +    a0 = args[0];
> +    a1 = args[1];
> +    a2 = args[2];
> +    c2 = const_args[2];
> +    c3 = const_args[3];
> +    c4 = const_args[4];
>  

Hi Philippe,

why isn't c1 declared? You are using it in the code?


>      switch (opc) {
>      case INDEX_op_exit_tb:
>          /* Reuse the zeroing that exists for goto_ptr.  */
> -        a0 = args[0];
>          if (a0 == 0) {
>              tgen_gotoi(s, S390_CC_ALWAYS, tcg_code_gen_epilogue);
>          } else {
> @@ -1750,7 +1758,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_goto_tb:
> -        a0 = args[0];
>          if (s->tb_jmp_insn_offset) {
>              /*
>               * branch displacement must be aligned for atomic patching;
> @@ -1784,7 +1791,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_goto_ptr:
> -        a0 = args[0];
>          if (USE_REG_TB) {
>              tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
>          }
> @@ -1794,45 +1800,43 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>      OP_32_64(ld8u):
>          /* ??? LLC (RXY format) is only present with the extended-immediate
>             facility, whereas LLGC is always present.  */
> -        tcg_out_mem(s, 0, RXY_LLGC, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LLGC, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      OP_32_64(ld8s):
>          /* ??? LB is no smaller than LGB, so no point to using it.  */
> -        tcg_out_mem(s, 0, RXY_LGB, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LGB, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      OP_32_64(ld16u):
>          /* ??? LLH (RXY format) is only present with the extended-immediate
>             facility, whereas LLGH is always present.  */
> -        tcg_out_mem(s, 0, RXY_LLGH, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LLGH, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      case INDEX_op_ld16s_i32:
> -        tcg_out_mem(s, RX_LH, RXY_LHY, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, RX_LH, RXY_LHY, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      case INDEX_op_ld_i32:
> -        tcg_out_ld(s, TCG_TYPE_I32, args[0], args[1], args[2]);
> +        tcg_out_ld(s, TCG_TYPE_I32, a0, a1, a2);
>          break;
>  
>      OP_32_64(st8):
> -        tcg_out_mem(s, RX_STC, RXY_STCY, args[0], args[1],
> -                    TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, RX_STC, RXY_STCY, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      OP_32_64(st16):
> -        tcg_out_mem(s, RX_STH, RXY_STHY, args[0], args[1],
> -                    TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, RX_STH, RXY_STHY, a0, a1, TCG_REG_NONE, a2);
>          break;
>  
>      case INDEX_op_st_i32:
> -        tcg_out_st(s, TCG_TYPE_I32, args[0], args[1], args[2]);
> +        tcg_out_st(s, TCG_TYPE_I32, a0, a1, a2);
>          break;
>  
>      case INDEX_op_add_i32:
> -        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
> -        if (const_args[2]) {
> +        a2 = (int32_t)a2;
> +        if (c2) {
>          do_addi_32:
>              if (a0 == a1) {
>                  if (a2 == (int16_t)a2) {
> @@ -1852,8 +1856,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          }
>          break;
>      case INDEX_op_sub_i32:
> -        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
> -        if (const_args[2]) {
> +        a2 = (int32_t)a2;
> +        if (c2) {
>              a2 = -a2;
>              goto do_addi_32;
>          } else if (a0 == a1) {
> @@ -1864,8 +1868,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_and_i32:
> -        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
> -        if (const_args[2]) {
> +        a2 = (uint32_t)a2;
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
>              tgen_andi(s, TCG_TYPE_I32, a0, a2);
>          } else if (a0 == a1) {
> @@ -1875,8 +1879,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          }
>          break;
>      case INDEX_op_or_i32:
> -        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
> -        if (const_args[2]) {
> +        a2 = (uint32_t)a2;
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
>              tgen_ori(s, TCG_TYPE_I32, a0, a2);
>          } else if (a0 == a1) {
> @@ -1886,30 +1890,30 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          }
>          break;
>      case INDEX_op_xor_i32:
> -        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
> -        if (const_args[2]) {
> +        a2 = (uint32_t)a2;
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
>              tgen_xori(s, TCG_TYPE_I32, a0, a2);
>          } else if (a0 == a1) {
> -            tcg_out_insn(s, RR, XR, args[0], args[2]);
> +            tcg_out_insn(s, RR, XR, a0, a2);
>          } else {
>              tcg_out_insn(s, RRF, XRK, a0, a1, a2);
>          }
>          break;
>  
>      case INDEX_op_neg_i32:
> -        tcg_out_insn(s, RR, LCR, args[0], args[1]);
> +        tcg_out_insn(s, RR, LCR, a0, a1);
>          break;
>  
>      case INDEX_op_mul_i32:
> -        if (const_args[2]) {
> -            if ((int32_t)args[2] == (int16_t)args[2]) {
> -                tcg_out_insn(s, RI, MHI, args[0], args[2]);
> +        if (c2) {
> +            if ((int32_t)a2 == (int16_t)a2) {
> +                tcg_out_insn(s, RI, MHI, a0, a2);
>              } else {
> -                tcg_out_insn(s, RIL, MSFI, args[0], args[2]);
> +                tcg_out_insn(s, RIL, MSFI, a0, a2);
>              }
>          } else {
> -            tcg_out_insn(s, RRE, MSR, args[0], args[2]);
> +            tcg_out_insn(s, RRE, MSR, a0, a2);
>          }
>          break;
>  
> @@ -1924,16 +1928,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          op = RS_SLL;
>          op2 = RSY_SLLK;
>      do_shift32:
> -        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
> +        a2 = (int32_t)a2;
>          if (a0 == a1) {
> -            if (const_args[2]) {
> +            if (c2) {
>                  tcg_out_sh32(s, op, a0, TCG_REG_NONE, a2);
>              } else {
>                  tcg_out_sh32(s, op, a0, a2, 0);
>              }
>          } else {
>              /* Using tcg_out_sh64 here for the format; it is a 32-bit shift.  */
> -            if (const_args[2]) {
> +            if (c2) {
>                  tcg_out_sh64(s, op2, a0, a1, TCG_REG_NONE, a2);
>              } else {
>                  tcg_out_sh64(s, op2, a0, a1, a2, 0);
> @@ -1951,112 +1955,108 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>  
>      case INDEX_op_rotl_i32:
>          /* ??? Using tcg_out_sh64 here for the format; it is a 32-bit rol.  */
> -        if (const_args[2]) {
> -            tcg_out_sh64(s, RSY_RLL, args[0], args[1], TCG_REG_NONE, args[2]);
> +        if (c2) {
> +            tcg_out_sh64(s, RSY_RLL, a0, a1, TCG_REG_NONE, a2);
>          } else {
> -            tcg_out_sh64(s, RSY_RLL, args[0], args[1], args[2], 0);
> +            tcg_out_sh64(s, RSY_RLL, a0, a1, a2, 0);
>          }
>          break;
>      case INDEX_op_rotr_i32:
> -        if (const_args[2]) {
> -            tcg_out_sh64(s, RSY_RLL, args[0], args[1],
> -                         TCG_REG_NONE, (32 - args[2]) & 31);
> +        if (c2) {
> +            tcg_out_sh64(s, RSY_RLL, a0, a1,
> +                         TCG_REG_NONE, (32 - a2) & 31);
>          } else {
> -            tcg_out_insn(s, RR, LCR, TCG_TMP0, args[2]);
> -            tcg_out_sh64(s, RSY_RLL, args[0], args[1], TCG_TMP0, 0);
> +            tcg_out_insn(s, RR, LCR, TCG_TMP0, a2);
> +            tcg_out_sh64(s, RSY_RLL, a0, a1, TCG_TMP0, 0);
>          }
>          break;
>  
>      case INDEX_op_ext8s_i32:
> -        tgen_ext8s(s, TCG_TYPE_I32, args[0], args[1]);
> +        tgen_ext8s(s, TCG_TYPE_I32, a0, a1);
>          break;
>      case INDEX_op_ext16s_i32:
> -        tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
> +        tgen_ext16s(s, TCG_TYPE_I32, a0, a1);
>          break;
>      case INDEX_op_ext8u_i32:
> -        tgen_ext8u(s, TCG_TYPE_I32, args[0], args[1]);
> +        tgen_ext8u(s, TCG_TYPE_I32, a0, a1);
>          break;
>      case INDEX_op_ext16u_i32:
> -        tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
> +        tgen_ext16u(s, TCG_TYPE_I32, a0, a1);
>          break;
>  
>      OP_32_64(bswap16):
>          /* The TCG bswap definition requires bits 0-47 already be zero.
>             Thus we don't need the G-type insns to implement bswap16_i64.  */
> -        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
> -        tcg_out_sh32(s, RS_SRL, args[0], TCG_REG_NONE, 16);
> +        tcg_out_insn(s, RRE, LRVR, a0, a1);
> +        tcg_out_sh32(s, RS_SRL, a0, TCG_REG_NONE, 16);
>          break;
>      OP_32_64(bswap32):
> -        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
> +        tcg_out_insn(s, RRE, LRVR, a0, a1);
>          break;
>  
>      case INDEX_op_add2_i32:
> -        if (const_args[4]) {
> -            tcg_out_insn(s, RIL, ALFI, args[0], args[4]);
> +        if (c4) {
> +            tcg_out_insn(s, RIL, ALFI, a0, args[4]);
>          } else {
> -            tcg_out_insn(s, RR, ALR, args[0], args[4]);
> +            tcg_out_insn(s, RR, ALR, a0, args[4]);
>          }
> -        tcg_out_insn(s, RRE, ALCR, args[1], args[5]);
> +        tcg_out_insn(s, RRE, ALCR, a1, args[5]);
>          break;
>      case INDEX_op_sub2_i32:
> -        if (const_args[4]) {
> -            tcg_out_insn(s, RIL, SLFI, args[0], args[4]);
> +        if (c4) {
> +            tcg_out_insn(s, RIL, SLFI, a0, args[4]);
>          } else {
> -            tcg_out_insn(s, RR, SLR, args[0], args[4]);
> +            tcg_out_insn(s, RR, SLR, a0, args[4]);
>          }
> -        tcg_out_insn(s, RRE, SLBR, args[1], args[5]);
> +        tcg_out_insn(s, RRE, SLBR, a1, args[5]);
>          break;
>  
>      case INDEX_op_br:
> -        tgen_branch(s, S390_CC_ALWAYS, arg_label(args[0]));
> +        tgen_branch(s, S390_CC_ALWAYS, arg_label(a0));
>          break;
>  
>      case INDEX_op_brcond_i32:
> -        tgen_brcond(s, TCG_TYPE_I32, args[2], args[0],
> -                    args[1], const_args[1], arg_label(args[3]));
> +        tgen_brcond(s, TCG_TYPE_I32, a2, a0, a1, c1, arg_label(args[3]));

This is the place os usage c1 - not defined before.


>          break;
>      case INDEX_op_setcond_i32:
> -        tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
> -                     args[2], const_args[2]);
> +        tgen_setcond(s, TCG_TYPE_I32, args[3], a0, a1, a2, c2);
>          break;
>      case INDEX_op_movcond_i32:
> -        tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
> -                     args[2], const_args[2], args[3], const_args[3]);
> +        tgen_movcond(s, TCG_TYPE_I32, args[5], a0, a1, a2, c2, args[3], c3);
>          break;
>  
>      case INDEX_op_qemu_ld_i32:
>          /* ??? Technically we can use a non-extending instruction.  */
>      case INDEX_op_qemu_ld_i64:
> -        tcg_out_qemu_ld(s, args[0], args[1], args[2]);
> +        tcg_out_qemu_ld(s, a0, a1, a2);
>          break;
>      case INDEX_op_qemu_st_i32:
>      case INDEX_op_qemu_st_i64:
> -        tcg_out_qemu_st(s, args[0], args[1], args[2]);
> +        tcg_out_qemu_st(s, a0, a1, a2);
>          break;
>  
>      case INDEX_op_ld16s_i64:
> -        tcg_out_mem(s, 0, RXY_LGH, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LGH, a0, a1, TCG_REG_NONE, a2);
>          break;
>      case INDEX_op_ld32u_i64:
> -        tcg_out_mem(s, 0, RXY_LLGF, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LLGF, a0, a1, TCG_REG_NONE, a2);
>          break;
>      case INDEX_op_ld32s_i64:
> -        tcg_out_mem(s, 0, RXY_LGF, args[0], args[1], TCG_REG_NONE, args[2]);
> +        tcg_out_mem(s, 0, RXY_LGF, a0, a1, TCG_REG_NONE, a2);
>          break;
>      case INDEX_op_ld_i64:
> -        tcg_out_ld(s, TCG_TYPE_I64, args[0], args[1], args[2]);
> +        tcg_out_ld(s, TCG_TYPE_I64, a0, a1, a2);
>          break;
>  
>      case INDEX_op_st32_i64:
> -        tcg_out_st(s, TCG_TYPE_I32, args[0], args[1], args[2]);
> +        tcg_out_st(s, TCG_TYPE_I32, a0, a1, a2);
>          break;
>      case INDEX_op_st_i64:
> -        tcg_out_st(s, TCG_TYPE_I64, args[0], args[1], args[2]);
> +        tcg_out_st(s, TCG_TYPE_I64, a0, a1, a2);
>          break;
>  
>      case INDEX_op_add_i64:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[2]) {
> +        if (c2) {
>          do_addi_64:
>              if (a0 == a1) {
>                  if (a2 == (int16_t)a2) {
> @@ -2084,8 +2084,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          }
>          break;
>      case INDEX_op_sub_i64:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[2]) {
> +        if (c2) {
>              a2 = -a2;
>              goto do_addi_64;
>          } else if (a0 == a1) {
> @@ -2096,19 +2095,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_and_i64:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[2]) {
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
> -            tgen_andi(s, TCG_TYPE_I64, args[0], args[2]);
> +            tgen_andi(s, TCG_TYPE_I64, a0, a2);
>          } else if (a0 == a1) {
> -            tcg_out_insn(s, RRE, NGR, args[0], args[2]);
> +            tcg_out_insn(s, RRE, NGR, a0, a2);
>          } else {
>              tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
>          }
>          break;
>      case INDEX_op_or_i64:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[2]) {
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
>              tgen_ori(s, TCG_TYPE_I64, a0, a2);
>          } else if (a0 == a1) {
> @@ -2118,8 +2115,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          }
>          break;
>      case INDEX_op_xor_i64:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[2]) {
> +        if (c2) {
>              tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
>              tgen_xori(s, TCG_TYPE_I64, a0, a2);
>          } else if (a0 == a1) {
> @@ -2130,21 +2126,21 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      case INDEX_op_neg_i64:
> -        tcg_out_insn(s, RRE, LCGR, args[0], args[1]);
> +        tcg_out_insn(s, RRE, LCGR, a0, a1);
>          break;
>      case INDEX_op_bswap64_i64:
> -        tcg_out_insn(s, RRE, LRVGR, args[0], args[1]);
> +        tcg_out_insn(s, RRE, LRVGR, a0, a1);
>          break;
>  
>      case INDEX_op_mul_i64:
> -        if (const_args[2]) {
> -            if (args[2] == (int16_t)args[2]) {
> -                tcg_out_insn(s, RI, MGHI, args[0], args[2]);
> +        if (c2) {
> +            if (a2 == (int16_t)a2) {
> +                tcg_out_insn(s, RI, MGHI, a0, a2);
>              } else {
> -                tcg_out_insn(s, RIL, MSGFI, args[0], args[2]);
> +                tcg_out_insn(s, RIL, MSGFI, a0, a2);
>              }
>          } else {
> -            tcg_out_insn(s, RRE, MSGR, args[0], args[2]);
> +            tcg_out_insn(s, RRE, MSGR, a0, a2);
>          }
>          break;
>  
> @@ -2165,10 +2161,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>      case INDEX_op_shl_i64:
>          op = RSY_SLLG;
>      do_shift64:
> -        if (const_args[2]) {
> -            tcg_out_sh64(s, op, args[0], args[1], TCG_REG_NONE, args[2]);
> +        if (c2) {
> +            tcg_out_sh64(s, op, a0, a1, TCG_REG_NONE, a2);
>          } else {
> -            tcg_out_sh64(s, op, args[0], args[1], args[2], 0);
> +            tcg_out_sh64(s, op, a0, a1, a2, 0);
>          }
>          break;
>      case INDEX_op_shr_i64:
> @@ -2179,87 +2175,83 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          goto do_shift64;
>  
>      case INDEX_op_rotl_i64:
> -        if (const_args[2]) {
> -            tcg_out_sh64(s, RSY_RLLG, args[0], args[1],
> -                         TCG_REG_NONE, args[2]);
> +        if (c2) {
> +            tcg_out_sh64(s, RSY_RLLG, a0, a1,
> +                         TCG_REG_NONE, a2);
>          } else {
> -            tcg_out_sh64(s, RSY_RLLG, args[0], args[1], args[2], 0);
> +            tcg_out_sh64(s, RSY_RLLG, a0, a1, a2, 0);
>          }
>          break;
>      case INDEX_op_rotr_i64:
> -        if (const_args[2]) {
> -            tcg_out_sh64(s, RSY_RLLG, args[0], args[1],
> -                         TCG_REG_NONE, (64 - args[2]) & 63);
> +        if (c2) {
> +            tcg_out_sh64(s, RSY_RLLG, a0, a1,
> +                         TCG_REG_NONE, (64 - a2) & 63);
>          } else {
>              /* We can use the smaller 32-bit negate because only the
>                 low 6 bits are examined for the rotate.  */
> -            tcg_out_insn(s, RR, LCR, TCG_TMP0, args[2]);
> -            tcg_out_sh64(s, RSY_RLLG, args[0], args[1], TCG_TMP0, 0);
> +            tcg_out_insn(s, RR, LCR, TCG_TMP0, a2);
> +            tcg_out_sh64(s, RSY_RLLG, a0, a1, TCG_TMP0, 0);
>          }
>          break;
>  
>      case INDEX_op_ext8s_i64:
> -        tgen_ext8s(s, TCG_TYPE_I64, args[0], args[1]);
> +        tgen_ext8s(s, TCG_TYPE_I64, a0, a1);
>          break;
>      case INDEX_op_ext16s_i64:
> -        tgen_ext16s(s, TCG_TYPE_I64, args[0], args[1]);
> +        tgen_ext16s(s, TCG_TYPE_I64, a0, a1);
>          break;
>      case INDEX_op_ext_i32_i64:
>      case INDEX_op_ext32s_i64:
> -        tgen_ext32s(s, args[0], args[1]);
> +        tgen_ext32s(s, a0, a1);
>          break;
>      case INDEX_op_ext8u_i64:
> -        tgen_ext8u(s, TCG_TYPE_I64, args[0], args[1]);
> +        tgen_ext8u(s, TCG_TYPE_I64, a0, a1);
>          break;
>      case INDEX_op_ext16u_i64:
> -        tgen_ext16u(s, TCG_TYPE_I64, args[0], args[1]);
> +        tgen_ext16u(s, TCG_TYPE_I64, a0, a1);
>          break;
>      case INDEX_op_extu_i32_i64:
>      case INDEX_op_ext32u_i64:
> -        tgen_ext32u(s, args[0], args[1]);
> +        tgen_ext32u(s, a0, a1);
>          break;
>  
>      case INDEX_op_add2_i64:
> -        if (const_args[4]) {
> +        if (c4) {
>              if ((int64_t)args[4] >= 0) {
> -                tcg_out_insn(s, RIL, ALGFI, args[0], args[4]);
> +                tcg_out_insn(s, RIL, ALGFI, a0, args[4]);
>              } else {
> -                tcg_out_insn(s, RIL, SLGFI, args[0], -args[4]);
> +                tcg_out_insn(s, RIL, SLGFI, a0, -args[4]);
>              }
>          } else {
> -            tcg_out_insn(s, RRE, ALGR, args[0], args[4]);
> +            tcg_out_insn(s, RRE, ALGR, a0, args[4]);
>          }
> -        tcg_out_insn(s, RRE, ALCGR, args[1], args[5]);
> +        tcg_out_insn(s, RRE, ALCGR, a1, args[5]);
>          break;
>      case INDEX_op_sub2_i64:
> -        if (const_args[4]) {
> +        if (c4) {
>              if ((int64_t)args[4] >= 0) {
> -                tcg_out_insn(s, RIL, SLGFI, args[0], args[4]);
> +                tcg_out_insn(s, RIL, SLGFI, a0, args[4]);
>              } else {
> -                tcg_out_insn(s, RIL, ALGFI, args[0], -args[4]);
> +                tcg_out_insn(s, RIL, ALGFI, a0, -args[4]);
>              }
>          } else {
> -            tcg_out_insn(s, RRE, SLGR, args[0], args[4]);
> +            tcg_out_insn(s, RRE, SLGR, a0, args[4]);
>          }
> -        tcg_out_insn(s, RRE, SLBGR, args[1], args[5]);
> +        tcg_out_insn(s, RRE, SLBGR, a1, args[5]);
>          break;
>  
>      case INDEX_op_brcond_i64:
> -        tgen_brcond(s, TCG_TYPE_I64, args[2], args[0],
> -                    args[1], const_args[1], arg_label(args[3]));
> +        tgen_brcond(s, TCG_TYPE_I64, a2, a0, a1, c1, arg_label(args[3]));

Another c1 usage.

>          break;
>      case INDEX_op_setcond_i64:
> -        tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
> -                     args[2], const_args[2]);
> +        tgen_setcond(s, TCG_TYPE_I64, args[3], a0, a1, a2, c2);
>          break;
>      case INDEX_op_movcond_i64:
> -        tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
> -                     args[2], const_args[2], args[3], const_args[3]);
> +        tgen_movcond(s, TCG_TYPE_I64, args[5], a0, a1, a2, c2, args[3], c3);
>          break;
>  
>      OP_32_64(deposit):
> -        a0 = args[0], a1 = args[1], a2 = args[2];
> -        if (const_args[1]) {
> +        if (c1) {

Another c1 usage.

>              tgen_deposit(s, a0, a2, args[3], args[4], 1);
>          } else {
>              /* Since we can't support "0Z" as a constraint, we allow a1 in
> @@ -2277,17 +2269,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          break;
>  
>      OP_32_64(extract):
> -        tgen_extract(s, args[0], args[1], args[2], args[3]);
> +        tgen_extract(s, a0, a1, a2, args[3]);
>          break;
>  
>      case INDEX_op_clz_i64:
> -        tgen_clz(s, args[0], args[1], args[2], const_args[2]);
> +        tgen_clz(s, a0, a1, a2, c2);
>          break;
>  
>      case INDEX_op_mb:
>          /* The host memory model is quite strong, we simply need to
>             serialize the instruction stream.  */
> -        if (args[0] & TCG_MO_ST_LD) {
> +        if (a0 & TCG_MO_ST_LD) {
>              tcg_out_insn(s, RR, BCR,
>                           s390_facilities & FACILITY_FAST_BCR_SER ? 14 : 15, 0);
>          }
> -- 
> 2.26.2
> 
> 


