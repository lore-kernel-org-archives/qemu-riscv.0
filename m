Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038E4CD4F4E
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 03:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sm3G5-0002HO-TD; Wed, 04 Sep 2024 23:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm3G4-0002Fr-Rg
 for qemu-riscv@nongnu.org; Wed, 04 Sep 2024 23:34:08 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sm3G3-00078e-8F
 for qemu-riscv@nongnu.org; Wed, 04 Sep 2024 23:34:08 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-70f63afb792so187462a34.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Sep 2024 20:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507245; x=1726112045; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHwlMf84KFKss0TW9r+iXeBGgio8PofwOT2ONfCSN/8=;
 b=jHFh7Wym6R7X4VOFiSxp0IN/t06RsxSmP/HXtUGzXsgTSSe5ackUgQ5uygx+e3LcET
 03YYXxeOWEdvD97os83Phv+HVCKOvC2wfkJm67KQhbUyMZSfA9UTRfghmN92O5Neeh+E
 FtMHETxegeG/gJgwo2wF30uJfFanJPKSQAbp7esvTvvR5cpx0jACBoZ2AnEm8Qe48tJC
 6kc2L3V/CDGOb58j/SJvaFJ6K75LD9hOejZ6xs7RM7xwVoCJShSUHVuaQxmKyV7lsd/x
 s12ui7B26WgLm5VRFNtflUhiwoe2Y2CHp1bpHKnWz2j6i+Z724C30csMXjlEM3QeiqrV
 NgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507245; x=1726112045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rHwlMf84KFKss0TW9r+iXeBGgio8PofwOT2ONfCSN/8=;
 b=xDDkYOgjvoFmS0XgH+6RSKNq5aGLR7wqvg+s7CGqGp8HBixQoaiZwhkeIvLbniT8Sz
 OXYAO86tiLXuDdi9OEa7b1Ow6R4OWu66KVrcyQi+RN+MszTS9WLaIxake6ENlbMMa1mN
 UkWnmeCWVQAgNBhI50uMRi9qRzaY+g6FMIjHLwo/w9n966xw3FnqTKGuLlTrB8pZ/501
 +sX+5wNIIGyz1nSxy0oO/SYOgHz5JnEr4oaG3/d+XaweR7mbMVy5QakbvDIoInxq02Ub
 HPIGGu7Z1UBE4mdoj1nLdHsjdox4qeqFzIi2krLTr1cfTYltxLGVssbEg//AceDzAXeX
 hgZg==
X-Gm-Message-State: AOJu0Yzpb5UQ9IIXYa7SgY+PEthefBhjZhEhmdP19KjT1YBYZACbtY+g
 Xr/3VrPbFXp7dHAHlTb1FEO0dA+APzt+pUcvLYIck3fAJa/gn+xvnt8n5phuFfg=
X-Google-Smtp-Source: AGHT+IEcSDV7kTouNqvoDpWM2XA+jZ6yBiYAUUSBI/CQzbqyoTAuUwWGlE7hs4iJEdsEZwiqLrq4jA==
X-Received: by 2002:a05:6358:430c:b0:19f:4967:4e8f with SMTP id
 e5c5f4694b2df-1b7e393339cmr2416818255d.22.1725507245304; 
 Wed, 04 Sep 2024 20:34:05 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7177859a470sm2295198b3a.180.2024.09.04.20.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 20:34:04 -0700 (PDT)
Message-ID: <286685da-74e3-401a-afe4-fed0831fd97c@linaro.org>
Date: Wed, 4 Sep 2024 20:34:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] util: Add RISC-V vector extension probe in
 cpuinfo
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240904142739.854-1-zhiwei_liu@linux.alibaba.com>
 <20240904142739.854-3-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240904142739.854-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
> +    if (info & CPUINFO_ZVE64X) {
> +        /*
> +         * Get vlenb for Vector: vsetvli rd, x0, e64.
> +         * VLMAX = LMUL * VLEN / SEW.
> +         * The "vsetvli rd, x0, e64" means "LMUL = 1, SEW = 64, rd = VLMAX",
> +         * so "vlenb = VLMAX * 64 / 8".
> +         */
> +        unsigned long vlmax = 0;
> +        asm volatile(".insn i 0x57, 7, %0, zero, (3 << 3)" : "=r"(vlmax));
> +        if (vlmax) {
> +            riscv_vlenb = vlmax * 8;
> +            assert(riscv_vlen >= 64 && !(riscv_vlen & (riscv_vlen - 1)));
> +        } else {
> +            info &= ~CPUINFO_ZVE64X;
> +        }
> +    }

Surely this does not compile, since the riscv_vlen referenced in the assert does not exist.

That said, I've done some experimentation and I believe there is a further simplification 
to be had in instead saving log2(vlenb).

     if (info & CPUINFO_ZVE64X) {
         /*
          * We are guaranteed by RVV-1.0 that VLEN is a power of 2.
          * We are guaranteed by Zve64x that VLEN >= 64, and that
          * EEW of {8,16,32,64} are supported.
          *
          * Cache VLEN in a convenient form.
          */
         unsigned long vlenb;
         asm("csrr %0, vlenb" : "=r"(vlenb));
         riscv_lg2_vlenb = ctz32(vlenb);
     }

I'll talk about how this can be used against the next patch with vsetvl.


r~

