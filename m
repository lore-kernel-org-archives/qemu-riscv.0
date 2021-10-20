Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdFQr-0003HC-G6
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 13:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFQp-0003FW-4D
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 13:31:15 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdFQm-00077p-SU
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 13:31:14 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c4so16093284pgv.11
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EfkdZjom+WhcDzmHdJvFHJNYxJnGonGza0DydxQyhCU=;
 b=bvwVre2q+3bByC95YgbQDMSfz1M8DXp8sxrScznNPqkTB8/pDWtiO+46M6bl2BYlLD
 7gqflC5LbLoL/ldvfhf067ICAAZqVTBlcJB8PNDd0Y0yqdU+Q1ve5YSd+oU/ebZZtufu
 N9OCs7PTDbcOgAcTk/g8nnCSbjszqsNvqkCmxBYC1pfJxRNcMZpCZmN5tznEp8thQ/1H
 7nncKTLDvzGkK5t3rva0X0EoPJOKu64jTeSSfxQHne1mV5BrRmjhyl+YUKpLsbMLon/A
 4iu2yvbZXG03D1zaoE/v7dQwahzRU6PnAB07edoE1Six9PbqUkdIyL2YGPN2bhwJOJaS
 PXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EfkdZjom+WhcDzmHdJvFHJNYxJnGonGza0DydxQyhCU=;
 b=ppiFr+V7SwI3RFeUqWLyqPyJ0LhtKiana2igRL10xIIYtx7JPnrvdH7JmPe5YR1ePv
 oZXZT+nH7fzXUaZt0c19SiGs8aF4MMCJC3n8piB6kIcGFlNHYYFlB5gwyI5hbUzdV8ND
 AaOA9kNQyNIC8uJ3pTVLort5g9B1K+0m+hycy2a/QsBvrhQIS7RbbK9GkVeJ0TvGy5Fn
 J6hP8rGaNV++5bNBQYGJaZY2Cw8N4z/4xrMiFF2RcQmIL2uzhqoItlzDoce6gdEMdGvG
 y39UEH5laBcBReaYCxl7qTLEvcHPSu8duIvUIqqw1dZOszcLeJ+d0Wnd2DCl3MmI9cfK
 2y1g==
X-Gm-Message-State: AOAM533UZkFGeNnOPVeoHZm7H+k75A9pjhx/firepRI6iJuAeEwlN6Al
 4Gb9cRtzv5FHa6qkeQBjM2YPww==
X-Google-Smtp-Source: ABdhPJyzYgXY8C7pA/AK3yTX3MW4b3aYdYB2AhmetrOab1CovMevvr/hjmHRhwS9IxWeq8LG0MgA0g==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr449322pgf.333.1634751069344;
 Wed, 20 Oct 2021 10:31:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x27sm3050320pfr.181.2021.10.20.10.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:31:08 -0700 (PDT)
Subject: Re: [PATCH v3 10/21] target/riscv: support for 128-bit loads and store
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-11-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51084314-f5aa-8d6f-e9e3-26cce8ee56f8@linaro.org>
Date: Wed, 20 Oct 2021 10:31:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-11-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 17:31:15 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +# Added for 128 bit support
> +%uimm_cl_q    5:2 10:3               !function=ex_shift_3
> +%uimm_6bit_lq 2:3 12:1 5:2           !function=ex_shift_3
> +%uimm_6bit_sq 7:3 10:3               !function=ex_shift_3
>   

These are incorrect.  LQ and LQSP are scaled by shift 4, not 3.  And the immediate bits 
are differently swizzled from LD and LW.


> -fld               001  ... ... .. ... 00 @cl_d
> +{
> +  fld             001  ... ... .. ... 00 @cl_d
> +  # *** RV128C specific Standard Extension (Quadrant 0) ***
> +  lq              001  ... ... .. ... 00 @cl_q
> +}

You need to move lq first, so that it overrides fld when RV128 is enabled.  Otherwise you 
have to invent some c_fld_not_rv32 pattern with the proper XLEN predicate inside.

Likewise for all of the other groups.

> +/*
> + * TODO: we should assert that src1h == 0, as we do not change the
> + *       address translation mechanism
> + */
> +static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src1h = get_gprh(ctx, a->rs1);
> +    TCGv destl = dest_gpr(ctx, a->rd);
> +    TCGv desth = dest_gprh(ctx, a->rd);
> +    TCGv addrl = tcg_temp_new();
> +    TCGv addrh = tcg_temp_new();
> +    TCGv imml = tcg_temp_new();
> +    TCGv immh = tcg_constant_tl(-(a->imm < 0));
> +
> +    /* Build a 128-bit address */
> +    if (a->imm != 0) {
> +        tcg_gen_movi_tl(imml, a->imm);
> +        tcg_gen_add2_tl(addrl, addrh, src1l, src1h, imml, immh);
> +    } else {
> +        tcg_gen_mov_tl(addrl, src1l);
> +        tcg_gen_mov_tl(addrh, src1h);
> +    }

Hmm.. I thought I remembered some clause by which the top N bits of the address could be 
ignored, but I can't find it now.

In any case, even if it should be done eventually, I don't think it's worthwhile to 
compute addrh at all right now.

> +    if (memop != (MemOp)MO_TEO) {

Why the cast?  MO_TEO is a MemOp enumerator.

> +        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
> +                           ctx->mem_idx, MO_TEQ);
> +        gen_addi2_i128(addrl, addrh, addrl, addrh, 8);
> +        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? destl : desth, addrl,
> +                           ctx->mem_idx, MO_TEQ);

In addition... we need an atomic load here for aligned 128-bit addresses (unaligned 
addresses are allowed to be non-atomic).

We don't currently have such an operation in TCG, though we need one (the Power8 LQ 
instruction is also only atomic when aligned).

We should either add this right away (shouldn't be too hard), or change the default to 
thread=single for -cpu rv128.  We should disable thread=multi if !HAVE_ATOMIC128, because 
we will be constantly trapping with EXCP_ATOMIC.

Similarly for store, of course.


r~

