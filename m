Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C1C52D7F
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 09:02:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1se9t4-0005qW-GZ; Wed, 14 Aug 2024 05:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1se9t1-0005pd-PW
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:01:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1se9t0-0008TO-5r
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:01:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-201df0b2df4so1506105ad.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2024 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723626100; x=1724230900; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RPy2JHM1tbG6p1gt/0qA1Cv/ek4s+eznM+OJu+Bdyzk=;
 b=TBWvzCDs+Z0UY7BwYUMkgowv6AA+b2nDXR/tmjg7qATQXIBwYx0WY2TcnFAAGkaobZ
 VqtTV8/etOw2NwXL1HoUt9PiNIkJlhRcWQyKCjqpqxAHjvD1LnSUjfx+pLhgwKD6euyh
 TzYYJeDCV27praVYK3x/gwoMFEaCjBqflyiB7NkPXSROgYP2WGnjJogSBYXr3wXhmSn4
 GPVIjBaSMR3UxvFS6zZ6qiX3wOZYPnEXEpTp6lUh9mkKfXXIBw6TWLdFIVfAPTXS9fDO
 XCoVmdYiwb2ay3OGfJ3Y36WtXpBV17Ev5vDwZe6G2ukxjwe0QKo7VM/WdMLAQ2sr4E7H
 XDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723626100; x=1724230900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RPy2JHM1tbG6p1gt/0qA1Cv/ek4s+eznM+OJu+Bdyzk=;
 b=eM4aYiUx6a63HRYZ0KJ8eiPvgKSRR3b03rYLHlehHS+/TJH3BaTUSshwqgMGbMaEp/
 D/y1gUUtkULm82NTpuPOe6C+nkJIdhA5lgJPNa6C4a74jogiaqlYwZzxzZwsEvLhpH8o
 PvxP0Ma6LJ+GZcKdlsjsOiSmvDC8Wiwj9n4BVcW2/Azeb+dtQPv9K9xqVMizmZAcn1O3
 zfVbodH+8jHyWEgbt+LuhocF48fAGlITpwCLcuarWG/kP4n7ZT0Dz7XlEooGCJNmEkYQ
 BAME3wQyc1wuY556dOhfnMq1UjVlKhjJBmIj1+E3u65H4/dbcthtjCL6IHtaehV6Fnvm
 chOA==
X-Gm-Message-State: AOJu0Yy5sLds5g9YN5eC87IKIrASL0iqDJySYruOu7J1TTZa+5KoTvE0
 /VUbXj9iIk2LUu27cuPq4DxSXo5KyPu4AOc1RL4PQO+/mcA/dA15Eo8EJI4iZVk=
X-Google-Smtp-Source: AGHT+IH+XFjX1rLMlMnJwG3ECMmLjtHIQViEquRc8j98h4NmIiLwUIWhIvLm4DNibdFszEos+b2eJw==
X-Received: by 2002:a17:902:cf0b:b0:1fd:664b:224 with SMTP id
 d9443c01a7336-201d64d0260mr23480555ad.56.1723626100370; 
 Wed, 14 Aug 2024 02:01:40 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201e64ffb2dsm16915ad.29.2024.08.14.02.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 02:01:39 -0700 (PDT)
Message-ID: <2ecd1ccc-ce2b-4432-a2a1-9af2dc70f037@linaro.org>
Date: Wed, 14 Aug 2024 19:01:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/15] tcg/riscv: Implement vector load/store
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-7-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240813113436.831-7-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 8/13/24 21:34, LIU Zhiwei wrote:
> @@ -827,14 +850,59 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
>   static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
>                          TCGReg arg1, intptr_t arg2)
>   {
> -    RISCVInsn insn = type == TCG_TYPE_I32 ? OPC_LW : OPC_LD;
> +    RISCVInsn insn;
> +
> +    if (type < TCG_TYPE_V64) {
> +        insn = type == TCG_TYPE_I32 ? OPC_LW : OPC_LD;
> +    } else {
> +        tcg_debug_assert(arg >= TCG_REG_V1);
> +        switch (prev_vece) {
> +        case MO_8:
> +            insn = OPC_VLE8_V;
> +            break;
> +        case MO_16:
> +            insn = OPC_VLE16_V;
> +            break;
> +        case MO_32:
> +            insn = OPC_VLE32_V;
> +            break;
> +        case MO_64:
> +            insn = OPC_VLE64_V;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
>       tcg_out_ldst(s, insn, arg, arg1, arg2);

tcg_out_ld/st are called directly from register allocation spill/fill.
You'll need to set vtype here, and cannot rely on this having been done in tcg_out_vec_op.

That said, with a little-endian host, the selected element size doesn't matter *too* much. 
  A write of 8 uint16_t or a write of 2 uint64_t produces the same bits in memory.

Therefore you can examine prev_vtype and adjust only if the vector length changes.  But we 
do that -- e.g. load V256, store V256, store V128 to perform a 384-bit store for AArch64 
SVE when VQ=3.

Is there an advantage to using the vector load/store whole register insns, if the 
requested length is not too small?  IIRC the NF field can be used to store multiples, but 
we can't store half of a register with these.


r~

