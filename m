Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onTRt-0008L9-Gc
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 19:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onTRs-0008J0-1n; Tue, 25 Oct 2022 19:35:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onTRq-0000kJ-5t; Tue, 25 Oct 2022 19:35:07 -0400
Received: by mail-pg1-x529.google.com with SMTP id e129so13099449pgc.9;
 Tue, 25 Oct 2022 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jC+zLcb5OVzxScl55vgS23DVPSKaPNsDvR/tNZn88Jk=;
 b=dZGCAIbWvTeCIMvP0BeAkpEjgpJH9kjMVJBVqTo85piv2VcUCv1Qi3y4xm5KlAoq07
 tDlmc7WCRCxKwrOgF57vQe3zRKLAGftL1tnKIBeW54SGMSExqD+iXNK2OjTzISnIERoX
 ZUQMRU9gvx2u/hxz84Yvus7HpyhUaDRB/h48gkLwI5bc5CCnpZibGfArkAvWxPBZE9SN
 DFQsZ2gdj2x7qktbfTrDYYVgIaNvBVMlCnjT8yc+xcJjBiBoH1oZuYTBWbw1SldgXwWz
 kIE/doKH4URK2fsz2E7t7/qT6sq5yaXMpdbTwTReaWzPd7sJ+bJ0LnzDkCWCFxslfE9/
 IMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC+zLcb5OVzxScl55vgS23DVPSKaPNsDvR/tNZn88Jk=;
 b=y5+5lzrdXRKyDR2da6gi4MPV+9IQ7ktJd7/fehTCUKm5q3vDhs5go1gVb8At+/h8lF
 Ajxj1SBFxsvx3GGD/+v+0Gqwq5XOEBhCWzUYWlT0r+2rMvubt9b7tIt91eWWH4raaz1B
 so8xhc6kW/tEGbfs73toKEo8uDIi26zNafBoFgnA2gj12s4Uqn7wMxE+X7nFlUEId7LK
 955VpMfmuZ9ttvMKzcMzCELKgW1DdFagWP7LgnmPac8EbKbtqsb88wMjKIXtxSZCypbL
 +p0ewDACvDWgczHrcTqdAJb42uN2YYdVq3mdwEEtTj39VGWB4LXvtlU842TNBxLWkpjH
 CKIw==
X-Gm-Message-State: ACrzQf0aB7FaEF4ZVnyI5rAgIKt3PjzEaEfxMxOaPcmbZ3DS/xYcZS+t
 pNYyJ7wLWQIrJYBxJIYAPzPI0gNthlI4Kvh7fKA=
X-Google-Smtp-Source: AMsMyM5716UCk1gXoYAmz5t+HrQ0t8d9cnEviPbsjXwKwJda6o8oCV59RxToye1h/sa+aqg3PxeXENmtIPZ6AEKSnck=
X-Received: by 2002:a63:1a65:0:b0:460:d5db:8688 with SMTP id
 a37-20020a631a65000000b00460d5db8688mr34759223pgm.221.1666740904178; Tue, 25
 Oct 2022 16:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221023233337.2846860-1-richard.henderson@linaro.org>
In-Reply-To: <20221023233337.2846860-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Oct 2022 09:34:37 +1000
Message-ID: <CAKmqyKOW1NcT8+yNoeX9A-yecwEfJJ35EB4iR+GKYkXK4DQocA@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix base register for user-only qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Oct 2022 23:35:08 -0000

On Mon, Oct 24, 2022 at 1:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When guest_base != 0, we were not coordinating the usage of
> TCG_REG_TMP0 as base properly, leading to a previous zero-extend
> of the input address being discarded.
>
> Shuffle the alignment check to the front, because that does not
> depend on the zero-extend, and it keeps the register usage clear.
> Set base after each step of the address arithmetic instead of before.
>
> Return the base register used from tcg_out_tlb_load, so as to
> keep that register choice localized to that function.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 39 +++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 2a84c57bec..e3b608034f 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -923,9 +923,9 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
>      tcg_debug_assert(ok);
>  }
>
> -static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
> -                             TCGReg addrh, MemOpIdx oi,
> -                             tcg_insn_unit **label_ptr, bool is_load)
> +static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
> +                               TCGReg addrh, MemOpIdx oi,
> +                               tcg_insn_unit **label_ptr, bool is_load)
>  {
>      MemOp opc = get_memop(oi);
>      unsigned s_bits = opc & MO_SIZE;
> @@ -975,6 +975,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
>          addrl = TCG_REG_TMP0;
>      }
>      tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
> +    return TCG_REG_TMP0;
>  }
>
>  static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
> @@ -1177,7 +1178,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>  #else
>      unsigned a_bits;
>  #endif
> -    TCGReg base = TCG_REG_TMP0;
> +    TCGReg base;
>
>      data_regl = *args++;
>      data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> @@ -1187,23 +1188,25 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>      opc = get_memop(oi);
>
>  #if defined(CONFIG_SOFTMMU)
> -    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
> +    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
>      tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
>      add_qemu_ldst_label(s, 1, oi,
>                          (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                          data_regl, data_regh, addr_regl, addr_regh,
>                          s->code_ptr, label_ptr);
>  #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addr_regl);
> -        addr_regl = base;
> -    }
>      a_bits = get_alignment_bits(opc);
>      if (a_bits) {
>          tcg_out_test_alignment(s, true, addr_regl, a_bits);
>      }
> +    base = addr_regl;
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, base);
> +        base = TCG_REG_TMP0;
> +    }
>      if (guest_base != 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
> +        base = TCG_REG_TMP0;
>      }
>      tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
>  #endif
> @@ -1249,7 +1252,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>  #else
>      unsigned a_bits;
>  #endif
> -    TCGReg base = TCG_REG_TMP0;
> +    TCGReg base;
>
>      data_regl = *args++;
>      data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> @@ -1259,23 +1262,25 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>      opc = get_memop(oi);
>
>  #if defined(CONFIG_SOFTMMU)
> -    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
> +    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
>      tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
>      add_qemu_ldst_label(s, 0, oi,
>                          (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                          data_regl, data_regh, addr_regl, addr_regh,
>                          s->code_ptr, label_ptr);
>  #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addr_regl);
> -        addr_regl = base;
> -    }
>      a_bits = get_alignment_bits(opc);
>      if (a_bits) {
>          tcg_out_test_alignment(s, false, addr_regl, a_bits);
>      }
> +    base = addr_regl;
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, base);
> +        base = TCG_REG_TMP0;
> +    }
>      if (guest_base != 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
> +        base = TCG_REG_TMP0;
>      }
>      tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
>  #endif
> --
> 2.34.1
>
>

