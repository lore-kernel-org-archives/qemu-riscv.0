Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k17vQ-000176-KG
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 08:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k17vO-00016w-Vu
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 08:44:43 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k17vN-0008Kn-9f
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 08:44:42 -0400
Received: by mail-pl1-x634.google.com with SMTP id u10so4510088plr.7
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oV6rcCkMbsnQHABAX/akD/HhRI9cAoksbDq35cDB1mQ=;
 b=RpBwqqzT7JIuoOJOnsvGsBrzWsseWUigb/UPbBkHuInX6TdspEPxMTIzLyjP3KLzdZ
 CHu00LIBJ/zGghzXzlWutt5nr7KWPxUthMYHn/hKnyuLZmzE3GZx8k6teR1u9AAhhRLz
 LqijUCQObj+Dgh7UbOTaRLbHBIUuBgEICYFY1iuKpFIgz+8m3JDfeCy2SqPR3rMR8a3+
 22r316lSN726YLqa0RpQeMX3qehKWiebrWBcys3qaE7v29Noaw4c9b+9Ldb0zHQYyy64
 MAnEqQanVKft7pyDpO3ABwSRCnPRRD9HJ515cLvLuYoqTdc/1CywUySvXc48SsCeloOo
 CH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oV6rcCkMbsnQHABAX/akD/HhRI9cAoksbDq35cDB1mQ=;
 b=GpxQ7wRWGgE3re30+yOZnFPIyA69GoXUa6atGLkPIqxtXm82R5p0eHfkU+2qvztPWb
 BbP2ZirggnCDPA+9Ct9ekDt4Bbh89fOXH/ENfeWTqWaIjWn1yL0RnqOSxZ/M/cNIHdga
 u4sNIh7VWEDeGHMT4HDB4Yqmpx5kI1ER1cSGMH69/cbioa1O2HwOAV2amL0s2bTld6sL
 4r/0gk8s4yQouElfpdie+EZEuLT4DKzD7jKjnxve+XmtFutwtDjs2JsFkHdnbLD33Ddy
 niVL2fMVyxTF1JRE1SANXnpfwJozbNQMdu553OtBBp0HncjrpaY1Dlb0pv/6c62XOY7K
 4TLA==
X-Gm-Message-State: AOAM531PUsd78bx6EUjBGBsU+o+QUVM5xaq0G2U1/dOUGhN0v1MiJrUW
 2BgnK0VZCsafHTAcNgnzouCHhg==
X-Google-Smtp-Source: ABdhPJyOe2XEMpw0CwBbCqBnrWACYnPfm350YwVe5RKPLgUyJGiBrTDfqWArb6A96Lnx6GvG93VZTQ==
X-Received: by 2002:a17:90a:1fca:: with SMTP id
 z10mr1018067pjz.209.1596113079350; 
 Thu, 30 Jul 2020 05:44:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z1sm5908720pgk.89.2020.07.30.05.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 05:44:38 -0700 (PDT)
Subject: Re: [RFC v2 28/76] target/riscv: rvv-0.9: update vext_max_elems() for
 load/store insns
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-29-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c841182e-8ef2-3793-e580-f4abde5f8f2d@linaro.org>
Date: Thu, 30 Jul 2020 05:44:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-29-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 12:44:43 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> -static inline uint32_t vext_maxsz(uint32_t desc)
> +static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz, bool is_ldst)
>  {
> -    return simd_maxsz(desc) << vext_lmul(desc);
> +    /*
> +     * As simd_desc support at most 256, the max vlen is 512 bits,
> +     * so vlen in bytes (vlenb) is encoded as maxsz.
> +     */
> +    uint32_t vlenb = simd_maxsz(desc);
> +
> +    if (is_ldst) {
> +        /*
> +         * Vector load/store instructions have the EEW encoded
> +         * directly in the instructions. The maximum vector size is
> +         * calculated with EMUL rather than LMUL.
> +         */
> +        uint32_t eew = esz << 3;
> +        uint32_t sew = vext_sew(desc);
> +        float flmul = vext_vflmul(desc);
> +        float emul = (float)eew / sew * flmul;
> +        uint32_t emul_r = emul < 1 ? 1 : emul;
> +        return vlenb * emul_r / esz;
> +    } else {
> +        /* Return VLMAX */
> +        return vlenb * vext_vflmul(desc) / esz;
> +    }
>  }

We do not want to be doing all of this arithmetic at runtime.  We want to be
doing it at translation time and pass the result to the helper.

If we must do any arithmetic at runtime, we would very much prefer to pass
log2(esz) so that we can use shifts instead of full integer division.

We really really want to avoid a bunch of floating-point conversions and
operations.

If you need to adjust the vext descriptor to make this happen, do so.  Do not
feel that load/store needs to pass the *same* descriptor to the helpers as
everything else.


r~

