Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmfns-0001No-Bm
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 15:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfnq-0001Kx-0g; Wed, 12 Apr 2023 15:06:46 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfnn-0006yk-TL; Wed, 12 Apr 2023 15:06:45 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1841c57c221so17214563fac.3; 
 Wed, 12 Apr 2023 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681326401; x=1683918401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H8AVEyen8mGSfFPTpq6Mc01c5FGup3vBMa8fnyDOWj0=;
 b=P+ehcemfh+YdtNHM7oHBIVj+TEQLqrogw0XoN2csIPPN1P+VPkKMtDRSMxKUur4DVs
 1EgJXdsbb6qWoN5ev7Ce7/SvuXPwjmfEKzQ0DLfVVy5a3MYyCjDRq+cXSkq2ZrELmLxT
 fns/mEkUtDDeMjfu87v3bYMXq1hD98PiJmJaPOLw+gf4LgGgn8ksFgnfo+tHcFbtNFV/
 nJJs+LURMDw8QUWKFtonjdX3O9+mKchuVq25r7s7BA8uxMXJEY7Eru/rILDFpK4AlFzH
 IJ7rMNydXBwgGMmdMHyf2RigodvcubDIM9I5xs5JOlKZph9BRfls6hGbqJfHBUD1GMco
 T0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326401; x=1683918401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H8AVEyen8mGSfFPTpq6Mc01c5FGup3vBMa8fnyDOWj0=;
 b=bebTsmxURAP27pkHhzeZYcTQVO/WWbMXNcamO+VnWN3GXXfAh/EyzBApElUoEHSKas
 rIs12/cal0YygmcdA6c8S71e0OsQHGnXbzDjbXztRMdZP5iQnGhMXAZNg7wI6qAnZ/DC
 6mN0/c3EMUQOaX53QnDxnwBKxzYTl9ORz2UdpiodVTUKYkrAqYq1XRFGQVcMApMrgl67
 MM7bfpeYawng0U2rC8HsFS8toEGu0lYE/sR3Cn/IXgABb1Yy3liN5Fwok5MGrwcAKeFV
 8r7lIGtqwWXLK8rhb6Wp2P9E9MnEN8MpZB2ftGRYctyg12AB+PLsS6j+GiP+s8LllqR5
 pxzQ==
X-Gm-Message-State: AAQBX9esuTrlPLkRLH/dH+qBMNr68CbgPp/2XvbaDS5az3qqYbX8kd9q
 HTA9Dh1ZwrzuNLow+HSRDOM=
X-Google-Smtp-Source: AKy350bnmCBIX1B9feD7BmL0puX8o79P58VYZ+G3bB0xoe99Y3uaPFnaeoDBMJJoqb36a15w63sQOg==
X-Received: by 2002:a05:6871:a5:b0:17f:9239:f651 with SMTP id
 u37-20020a05687100a500b0017f9239f651mr4841015oaa.55.1681326401458; 
 Wed, 12 Apr 2023 12:06:41 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 zp2-20020a0568718e0200b0017ae909afe8sm6382766oab.34.2023.04.12.12.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:06:41 -0700 (PDT)
Message-ID: <1501aadd-5836-fa6c-bc9f-7a86c04dd7fb@gmail.com>
Date: Wed, 12 Apr 2023 16:06:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 42/54] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-43-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230411010512.5375-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 19:06:46 -0000



On 4/10/23 22:05, Richard Henderson wrote:
> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
>   1 file changed, 26 insertions(+), 62 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 90093a6509..1b60166d2f 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -2137,44 +2137,38 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
>       label->label_ptr[0] = lptr;
>   }
>   
> +static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
> +{
> +    if (arg < 0) {
> +        arg = TCG_REG_TMP1;
> +    }
> +    tcg_out32(s, MFSPR | RT(arg) | LR);
> +    return arg;
> +}
> +
> +/*
> + * For the purposes of ppc32 sorting 4 input registers into 4 argument
> + * registers, there is an outside chance we would require 3 temps.
> + * Because of constraints, no inputs are in r3, and env will not be
> + * placed into r3 until after the sorting is done, and is thus free.
> + */
> +static const TCGLdstHelperParam ldst_helper_param = {
> +    .ra_gen = ldst_ra_gen,
> +    .ntmp = 3,
> +    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
> +};
> +
>   static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   {
> -    MemOpIdx oi = lb->oi;
> -    MemOp opc = get_memop(oi);
> -    TCGReg hi, lo, arg = TCG_REG_R3;
> +    MemOp opc = get_memop(lb->oi);
>   
>       if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
>           return false;
>       }
>   
> -    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
> -
> -    lo = lb->addrlo_reg;
> -    hi = lb->addrhi_reg;
> -    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
> -    } else {
> -        /* If the address needed to be zero-extended, we'll have already
> -           placed it in R4.  The only remaining case is 64-bit guest.  */
> -        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
> -    }
> -
> -    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
> -    tcg_out32(s, MFSPR | RT(arg) | LR);
> -
> +    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
>       tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
> -
> -    lo = lb->datalo_reg;
> -    hi = lb->datahi_reg;
> -    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
> -        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
> -        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
> -    } else {
> -        tcg_out_movext(s, lb->type, lo,
> -                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
> -    }
> +    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
>   
>       tcg_out_b(s, 0, lb->raddr);
>       return true;
> @@ -2182,43 +2176,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   
>   static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   {
> -    MemOpIdx oi = lb->oi;
> -    MemOp opc = get_memop(oi);
> -    MemOp s_bits = opc & MO_SIZE;
> -    TCGReg hi, lo, arg = TCG_REG_R3;
> +    MemOp opc = get_memop(lb->oi);
>   
>       if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
>           return false;
>       }
>   
> -    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
> -
> -    lo = lb->addrlo_reg;
> -    hi = lb->addrhi_reg;
> -    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
> -    } else {
> -        /* If the address needed to be zero-extended, we'll have already
> -           placed it in R4.  The only remaining case is 64-bit guest.  */
> -        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
> -    }
> -
> -    lo = lb->datalo_reg;
> -    hi = lb->datahi_reg;
> -    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
> -        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
> -        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
> -    } else {
> -        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
> -                       arg++, lb->type, s_bits, lo);
> -    }
> -
> -    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
> -    tcg_out32(s, MFSPR | RT(arg) | LR);
> -
> +    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
>       tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
>   
>       tcg_out_b(s, 0, lb->raddr);

