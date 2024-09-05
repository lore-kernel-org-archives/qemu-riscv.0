Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A96CD4F4D
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 06:03:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sm5aS-0000KX-DX; Thu, 05 Sep 2024 02:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm5aQ-0000JX-WE
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 02:03:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm5aO-0006ow-QB
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2024 02:03:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-715cdc7a153so291546b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Sep 2024 23:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725516194; x=1726120994; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pEHZ6YmnsV8pPx6mFXb6Dm8oe8LNxvzRchuDmJSWiWA=;
 b=AgjgGM9jvVfxieQW2vjLrC8vzlYRIdXKa10ezXabZv5WcxvFv8WqiIlWgvWOCVwX09
 dkAIdNq+Ss+goGpIKv9qc9+E88OaDvwOCQ6D0FYPndybsTMhVdo8Gsf0qAfa0CyIba4r
 DwQ/NzZVpIq9+d1IWUplJE1FgUuRXsZt6qwsxeY9ToLncLDFdvN3qmKMY8RFqKF2R/ZP
 OPPhsSbLUcTP6wsztQ9eiMEYBev2jGU9l9WdOIFCwlecOu3v90N6/ZbX6FEwdLMSFHXm
 izpq58APem45k/ETlPfHUVodtd8I83NKsPqzZ5/pv/sgoLUdt4Q0PWK8wZ8SjLX9KWSh
 nFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725516194; x=1726120994;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pEHZ6YmnsV8pPx6mFXb6Dm8oe8LNxvzRchuDmJSWiWA=;
 b=aL7iNd+wLuRg8spslZiH/WFGP7Kx9Bks8BP/h7378CY5e1/YmurwRLfab/5EJJGDbC
 7hOD7y9ZZluyqtScN0UBkfsd7cx13/LuMDSLpeCtFYym0IIz88SHXenGCLp6FEdrrv5c
 y+xzeCbh/PmRuz09tI+YeFoJqP1gFmNZvJvlDwI3nR1asNaxM8vE3AW73yZ0rXLEmjy5
 WEiDS8OnJvbkkeMaPrIUCqPZbmxjWMdGJ7geC/d90RG9HDwQH3OyM9oi60psLvS4/NTJ
 boSyMw4c07ELhL5FHB5uUrAiFGcKm9yk9SBS8uBB/k8Si5OSRQJ4QwZvh5mKM7Glaxen
 AYxg==
X-Gm-Message-State: AOJu0YysjYBfrBqFt2gBh+FxRpPKIxwovdGh7O2ZX+lrvLLpNCkgr+Iz
 sIKEZwosvimGyYRHpjitzdoBbarWekxJ/yvqI7UftyIiDIs3iBPymID5PI/gue0=
X-Google-Smtp-Source: AGHT+IEen0hjC+W2KNtGuMdjRZgu+41bLM/swULpuYbI+MbgNunzMH5MJ5Hwlpim4gy83EfFGdeKgQ==
X-Received: by 2002:a05:6a21:3103:b0:1cc:b09f:4776 with SMTP id
 adf61e73a8af0-1cf07e5cdcdmr7857770637.0.1725516194296; 
 Wed, 04 Sep 2024 23:03:14 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7177859879csm2513268b3a.156.2024.09.04.23.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 23:03:13 -0700 (PDT)
Message-ID: <efa2bcd4-3ed6-4943-8dee-f764ee5afe87@linaro.org>
Date: Wed, 4 Sep 2024 23:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] tcg/riscv: Add riscv vset{i}vli support
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240904142739.854-1-zhiwei_liu@linux.alibaba.com>
 <20240904142739.854-5-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240904142739.854-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/4/24 07:27, LIU Zhiwei wrote:
> From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> 
> In RISC-V, vector operations require initial configuration using
> the vset{i}vl{i} instruction.
> 
> This instruction:
>    1. Sets the vector length (vl) in bytes
>    2. Configures the vtype register, which includes:
>      SEW (Single Element Width)
>      LMUL (vector register group multiplier)
>      Other vector operation parameters
> 
> This configuration is crucial for defining subsequent vector
> operation behavior. To optimize performance, the configuration
> process is managed dynamically:
>    1. Reconfiguration using vset{i}vl{i} is necessary when SEW
>       or vector register group width changes.
>    2. The vset instruction can be omitted when configuration
>       remains unchanged.
> 
> This optimization is only effective within a single TB.
> Each TB requires reconfiguration at its start, as the current
> state cannot be obtained from hardware.
> 
> Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
> Signed-off-by: Weiwei Li <liwei1518@gmail.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   include/tcg/tcg.h          |   3 +
>   tcg/riscv/tcg-target.c.inc | 128 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 131 insertions(+)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 21d5884741..267e6ff95c 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -566,6 +566,9 @@ struct TCGContext {
>   
>       /* Exit to translator on overflow. */
>       sigjmp_buf jmp_trans;
> +
> +    /* For host-specific values. */
> +    int riscv_host_vtype;
>   };

(1) At minimum this needs #ifdef __riscv.
     I planned to think of a cleaner way to do this,
     but haven't gotten there yet.
     I had also planned to place it higher in the structure, before
     the large temp arrays, so that the structure offset would be smaller.

(2) I have determined through experimentation that vtype alone is insufficient.
     While vtype + avl would be sufficient, it is inefficient.
     Best to store the original inputs: TCGType and SEW, since that way
     there's no effort required when querying the current SEW for use in
     load/store/logicals.

     The bug here appears as TCG swaps between TCGTypes for different
     operations.  E.g. if the vtype computed for (V64, E8) is the same
     as the vtype computed for (V128, E8), with AVL differing, then we
     will incorrectly omit the vsetvl instruction.

     My test case was tcg/tests/aarch64-linux-user/sha1-vector


The naming of these functions is varied and inconsistent.
I suggest the following:


static void set_vtype(TCGContext *s, TCGType type, MemOp vsew)
{
     unsigned vtype, insn, avl;
     int lmul;
     RISCVVlmul vlmul;
     bool lmul_eq_avl;

     s->riscv_cur_type = type;
     s->riscv_cur_vsew = vsew;

     /* Match riscv_lg2_vlenb to TCG_TYPE_V64. */
     QEMU_BUILD_BUG_ON(TCG_TYPE_V64 != 3);

     lmul = type - riscv_lg2_vlenb;
     if (lmul < -3) {
         /* Host VLEN >= 1024 bits. */
         vlmul = VLMUL_M1;
         lmul_eq_avl = false;
     } else if (lmul < 3) {
         /* 1/8 ... 1 ... 8 */
         vlmul = lmul & 7;
         lmul_eq_avl = true;
     } else {
         /* Guaranteed by Zve64x. */
         g_assert_not_reached();
     }

     avl = tcg_type_size(type) >> vsew;
     vtype = encode_vtype(true, true, vsew, vlmul);

     if (avl < 32) {
         insn = encode_i(OPC_VSETIVLI, TCG_REG_ZERO, avl, vtype);
     } else if (lmul_eq_avl) {
         /* rd != 0 and rs1 == 0 uses vlmax */
         insn = encode_i(OPC_VSETVLI, TCG_REG_TMP0, TCG_REG_ZERO, vtype);
     } else {
         tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_TMP0, TCG_REG_ZERO, avl);
         insn = encode_i(OPC_VSETVLI, TCG_REG_ZERO, TCG_REG_TMP0, vtype);
     }
     tcg_out32(s, insn);
}

static MemOp set_vtype_len(TCGContext *s, TCGType type)
{
     if (type != s->riscv_cur_type) {
         set_type(s, type, MO_64);
     }
     return s->riscv_cur_vsew;
}

static void set_vtype_len_sew(TCGContext *s, TCGType type, MemOp vsew)
{
     if (type != s->riscv_cur_type || vsew != s->riscv_cur_vsew) {
         set_type(s, type, vsew);
     }
}


(1) The storing of lg2(vlenb) means we can convert all of the division into subtraction.
(2) get_vec_type_bytes() already exists as tcg_type_size().
(3) Make use of the signed 3-bit encoding of vlmul.
(4) Make use of rd != 0, rs1 = 0 for the relatively common case of AVL = 32.


r~

