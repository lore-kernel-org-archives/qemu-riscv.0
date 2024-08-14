Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72767C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 09:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1seA3F-0003q9-2A; Wed, 14 Aug 2024 05:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1seA3D-0003p0-61
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:12:15 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1seA31-0001lN-Ao
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:12:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2cd5d6b2581so4261301a91.2
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2024 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723626720; x=1724231520; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vo+Q7nKaCEGxhm2sz+3gwndBpFPUEHdxfFB1pkFylYw=;
 b=ocpWZvfeD5XH4fhgNZeFds7lER5jW8gXzyg9QHQWP29sMYn/3lOXAkGeKt/XbOCS+W
 DDFmKGUhhort+GT6tdTweCqCWHFuBEQklO5c6us0B0yTB+d2+1vOxZ6Zd65+OIj5VB1k
 J/jVHlpf3JUV5X4V5y8OvBzzj4ydDw8lRdsM8f9p8vhOfxm1gcwBP5ZzW3UeTAKkbRrl
 6BKzPbemin/aXJYY4h3mNH6WyoxKsdhZFSnOYv38f1QL0HEQMBCIvJpUl2pZQySJjLRM
 Bsi+ncI58vmF3v0fExenDaOnLUp4UXa30YBcBAmQxgDwJk0NhvW5QMPRCPuZXA3C0D6w
 DCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723626720; x=1724231520;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vo+Q7nKaCEGxhm2sz+3gwndBpFPUEHdxfFB1pkFylYw=;
 b=eJnig0/pGJI6BcLvIz9srDi6BA85jrJaT4Tgzlx/D90dnK6O9yD6PJLCNMgDXdJduI
 PSGatjMsOj5F+DZraN98yWjYWelFUcu2+RQ/pbTQKWi2OGC/pL/dX8pwB3xpTxjQdQZa
 6iEVb3dZGFZ0lg0yXJfhfMG2YiHuVTtxrTagRbz0v41XwbLZqxWQ+rE/Ay3ODaPyZida
 5eUZaGHCFNhZLCY+nPlo6yw7RBJm5vx+yk9DxuCiv4UkJOcU/SJVZ74ralq+J7dGOXox
 KxLPt79knS73sJtjvHac3mwjMUQF2SKWBxgoOuzNq8KvpKEqdQ1PVVqJY+lTj5jdI5+1
 QZRw==
X-Gm-Message-State: AOJu0YxL947V38W5zmSPg7ag+VQXNZRs5XshQFu6SG1fIzrHvwMKFLB3
 Yfe5CqzdZBUzy+NLpGXZA7+gGy/q+Ek5oi1dSoauvoHRC4IJfJcn2DmEAX422z0=
X-Google-Smtp-Source: AGHT+IHPl600IyqepDyveRozTqQnRwhp7nkCRFSm9E2N1XgXm15zg9a6uJhA+J5IO3q+jFt38xdang==
X-Received: by 2002:a17:90a:510d:b0:2cc:ff56:5be1 with SMTP id
 98e67ed59e1d1-2d3aaa7cea2mr2247483a91.7.1723626720222; 
 Wed, 14 Aug 2024 02:12:00 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3ac7e8af3sm1142475a91.18.2024.08.14.02.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 02:11:59 -0700 (PDT)
Message-ID: <21210e0f-457e-4858-befc-f869984d3315@linaro.org>
Date: Wed, 14 Aug 2024 19:11:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] tcg/riscv: Implement vector mov/dup{m/i}
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-8-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240813113436.831-8-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> @@ -641,6 +645,13 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>       case TCG_TYPE_I64:
>           tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
>           break;
> +    case TCG_TYPE_V64:
> +    case TCG_TYPE_V128:
> +    case TCG_TYPE_V256:
> +        tcg_debug_assert(ret > TCG_REG_V0 && arg > TCG_REG_V0);
> +        tcg_target_set_vec_config(s, type, prev_vece);
> +        tcg_out_opc_vv(s, OPC_VMV_V_V, ret, TCG_REG_V0, arg, true);

I suggest these asserts be in tcg_out_opc_*
That way you don't need to replicate to all uses.

> +static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
> +                                   TCGReg dst, TCGReg src)

Oh, please drop all of the inline markup, from all patches.
Let the compiler decide.

> +static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
> +                                    TCGReg dst, TCGReg base, intptr_t offset)
> +{
> +    tcg_out_ld(s, TCG_TYPE_REG, TCG_REG_TMP0, base, offset);
> +    return tcg_out_dup_vec(s, type, vece, dst, TCG_REG_TMP0);
> +}

Is this really better than using strided load with rs2 = r0?


r~

