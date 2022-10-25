Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onSgq-0000Wm-DZ
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 18:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onSgo-0000GH-Py; Tue, 25 Oct 2022 18:46:30 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onSgm-0002tu-7r; Tue, 25 Oct 2022 18:46:30 -0400
Received: by mail-pf1-x433.google.com with SMTP id y13so8874897pfp.7;
 Tue, 25 Oct 2022 15:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xL5pju1ZGlr10niKOO7BDyu/UjM6zSvTW38fF30MvtU=;
 b=nv8TVrAzyGpdvn5ziUMtQQ3BYnpm18hxPLfn/y2Hvk//QcNkUvuJReGBz3IJEUIf1m
 j1xnYLY3gjomE9JFSh1pHQfqNywxMQ/0WaCNBgcS9a0KgQMWba/dg4v9UWTMz2NjWIod
 n03UT8Te6LK18tCcj1xY2YQKBlOuUoYBADHjuDfHUvZSO02xqYb76V7dAHWqRRNC3gCD
 Ec10e7JC2rbvLSIEj5jmofkvvQh5fQ/ncFtkfnUyzB3RZYxk4RtWlQbCyNzobr2ZyDs6
 RUL7lXzFnOEf0txh/haT+zk8tyicLT/8RmCrUEpPF+p+WMiPb2k13yNcfLc40VLpmlaC
 xxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xL5pju1ZGlr10niKOO7BDyu/UjM6zSvTW38fF30MvtU=;
 b=CyFKWtEcBRSNR13oHtBvxm1tlheZY2Ebbku0d/OpF4ox9MslQo0Vd5eSZbrZTycXsR
 1cM289OM7x1xlXEfkLXh52ctd36nbaza5nsVOgRsJNHHp3Vdi7MxFB5XARbwT/03v49F
 io5GuRVq0OdByOGj5n2B+2aUbetfmbUVgB57WAmW/BaSFViRgv+qhxgdcDZJxecjnHWK
 iOC9yvEFXgzXkX1/aR6pBmCOgOtFoRaAODYkXr245P+5WCujUp0d8kZhm9m4/L2Io1Ri
 w7Zq5jULyVPkDqCH2r58FRcBubEyEWpA3dPXnSLtQi7S+6cqgtiEgxBiZmcTKALSoXUG
 Ao9Q==
X-Gm-Message-State: ACrzQf3rKvLOUu/sR5tu3m9E1NTRWjWUlYiaj5LvFnPCoBWZZnuImwFp
 1Pt7i2JtFoX2fo51hr3K7KcdvHgw4n3FcAFKUBE=
X-Google-Smtp-Source: AMsMyM7BFYHTHlgvzp9sWHOWsCgl3ASk+rgmQqjglwaJFO10MNu+u9uZTtkV2M8X32OLD8W7CgBb821EZu1QbHe4Cxw=
X-Received: by 2002:a65:604e:0:b0:43c:428d:16a9 with SMTP id
 a14-20020a65604e000000b0043c428d16a9mr7360198pgp.423.1666737983575; Tue, 25
 Oct 2022 15:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221023233337.2846860-1-richard.henderson@linaro.org>
In-Reply-To: <20221023233337.2846860-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Oct 2022 08:45:56 +1000
Message-ID: <CAKmqyKNUrA+jUEYc0hxSbq-kUwjyhwJRfLO0aXb4t+Y=4MzawQ@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix base register for user-only qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 22:46:31 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

