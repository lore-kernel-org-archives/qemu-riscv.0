Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmgxM-000077-Lx
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 16:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgxK-0008Rk-Nu
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 16:20:38 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmgxH-0005rF-LF
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 16:20:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-184518754bfso11558405fac.5
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 13:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681330834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+5Y31DzLoltDr5BDRmGw2yTc5HJ9pHuhMLv6VWPNHM=;
 b=INu58I0NorIcKoatAYT9+P4pl2LJzxAjtoGuTQ542yiSsBHBpMnHjq/37bZBWwSBXy
 SZMsKdZJ0Z8FoErctictKinXFTX6hRQXXI8W/O2/s4ZzYeUJFx5IiT5W8TOX9IROaQSz
 GhBGGQ5/TOxhA1kh8k3rRsg61DDZ8MLqhx6raQeCEwOhZ4jGpXv4UmJhBiv1dSf7sOmo
 i27ZpmMUVXFp9pvbnaHi+rN3XEI7jUmBLoYItlZTZOuBnr2gbxzVIwxKL8SKl65y2uVz
 3ONNk+XYUkW/199CBnH9OXhFnXGTdhiZwovZhoBHWnw5cuiFfRsTExQHBKYTOmDJhSDa
 xkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+5Y31DzLoltDr5BDRmGw2yTc5HJ9pHuhMLv6VWPNHM=;
 b=HDMDfY6zRwZsRg6mB0/jxnBte6woOe16VDY1p2XOK9G1Erd2dThkytbbpdUDaZuEYc
 WhPVegjc+5uiw+SjTBR8j2NmCvYR/ZUTFvshVe4ZH9b64ym3hWLa9YApC0W/FbB80nur
 c3w8/RSeAoCgc3GrRRTpEGQdmN/MUt8cPwyrWtPzCR4bOqcsR3jaI+pHOsLqO09HlKHd
 4+/sIuZWK97PTaEat8MdpvXagih6iLK/2uAXthNGpa9aJAnlPleR3tk1xud7rV4cQD5D
 mNWMI2uToi7bYK6ifpJ2iAVQmV895//wrePTleAKda5bg05G8cTcKp5Py/pbn2SMitJa
 G7uw==
X-Gm-Message-State: AAQBX9cm1f62ScNhx70ayzIHq+rTcFtSP4bbPC+gQIoU/wZr4PGoEpLA
 94Ha8otn69c3x7PxKzxw/lHfQw5WkW5HH3NGeoY=
X-Google-Smtp-Source: AKy350Yvvxf1a2SQNCSkseFgH9EL8zVx2Zg43mErSqeUnkb/uq1pC3C73pEGq/UR2Hrp92vKE+isOw==
X-Received: by 2002:a05:6870:638d:b0:177:81bb:1b30 with SMTP id
 t13-20020a056870638d00b0017781bb1b30mr83678oap.31.1681330834435; 
 Wed, 12 Apr 2023 13:20:34 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a4a8c4f000000b0052a77e38722sm7417046ooj.26.2023.04.12.13.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:20:34 -0700 (PDT)
Message-ID: <6afd45ad-d11c-860f-6ba6-a8cc73683447@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:20:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 52/54] tcg/riscv: Simplify constraints on qemu_ld/st
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-53-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230411010512.5375-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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
X-List-Received-Date: Wed, 12 Apr 2023 20:20:39 -0000



On 4/10/23 22:05, Richard Henderson wrote:
> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target-con-set.h |  2 --
>   tcg/riscv/tcg-target-con-str.h |  1 -
>   tcg/riscv/tcg-target.c.inc     | 16 +++-------------
>   3 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
> index c11710d117..1a8b8e9f2b 100644
> --- a/tcg/riscv/tcg-target-con-set.h
> +++ b/tcg/riscv/tcg-target-con-set.h
> @@ -10,11 +10,9 @@
>    * tcg-target-con-str.h; the constraint combination is inclusive or.
>    */
>   C_O0_I1(r)
> -C_O0_I2(LZ, L)
>   C_O0_I2(rZ, r)
>   C_O0_I2(rZ, rZ)
>   C_O0_I4(rZ, rZ, rZ, rZ)
> -C_O1_I1(r, L)
>   C_O1_I1(r, r)
>   C_O1_I2(r, r, ri)
>   C_O1_I2(r, r, rI)
> diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
> index 8d8afaee53..6f1cfb976c 100644
> --- a/tcg/riscv/tcg-target-con-str.h
> +++ b/tcg/riscv/tcg-target-con-str.h
> @@ -9,7 +9,6 @@
>    * REGS(letter, register_mask)
>    */
>   REGS('r', ALL_GENERAL_REGS)
> -REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>   
>   /*
>    * Define constraint letters for constants:
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 425ea8902e..35f04ddda9 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -125,17 +125,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>   #define TCG_CT_CONST_N12   0x400
>   #define TCG_CT_CONST_M12   0x800
>   
> -#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
> -/*
> - * For softmmu, we need to avoid conflicts with the first 5
> - * argument registers to call the helper.  Some of these are
> - * also used for the tlb lookup.
> - */
> -#ifdef CONFIG_SOFTMMU
> -#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
> -#else
> -#define SOFTMMU_RESERVE_REGS  0
> -#endif
> +#define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
>   
>   #define sextreg  sextract64
>   
> @@ -1653,10 +1643,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>   
>       case INDEX_op_qemu_ld_i32:
>       case INDEX_op_qemu_ld_i64:
> -        return C_O1_I1(r, L);
> +        return C_O1_I1(r, r);
>       case INDEX_op_qemu_st_i32:
>       case INDEX_op_qemu_st_i64:
> -        return C_O0_I2(LZ, L);
> +        return C_O0_I2(rZ, r);
>   
>       default:
>           g_assert_not_reached();

