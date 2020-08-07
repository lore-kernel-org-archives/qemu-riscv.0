Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3prj-0006Uw-EN
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 20:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3prh-0006TJ-5W
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 20:04:05 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3prf-0006OH-GB
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 20:04:04 -0400
Received: by mail-pg1-x52e.google.com with SMTP id o13so18634pgf.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 17:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ho45DBGj9ihQx+//JMUAsoSDjVWvwe+kK/BHEcqW30M=;
 b=YYCv/iJjhGtSNYahuG6YuHgDfOWjqkrMO6zijJz0fnLQY0aVqTx5e43WrsRqpFA6Ro
 Kbcq73XPe+wfnk6HGhaUqpXvR4e0FffexQQDveJ0WjY1FglVYc0hBpT9J6kDORBGqZVT
 iP7CcKKv2Cjrz9sj0mTKJxsbBtVFHeR6c+hDDU3Dyun8S3wRlu1qGjvAWfB9YgF2gYsA
 z4TnrZr9I32oA/kbckunlAL1ZxExtxlE3y8B5NOET9bcuv0qpnHDuLd4NUn0WE6pvlC5
 ayH5eWT4VABzJDwX/8zFeHr70tzdDub1hqIZdVpVgMobNWGt38PFX0vkF67dlu2LfE4b
 APuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ho45DBGj9ihQx+//JMUAsoSDjVWvwe+kK/BHEcqW30M=;
 b=A1uDI/BGgpmRAGh6LGie9FD9uP1r1pUFg5H9ADT0z+4eMBwSYrQvYBOnueMijPaais
 yKd/77u37hB8fpIKeNBHX9PEgR9emN4GHnrrxu5WcCIEyLxwKpXdRlWptVxG/cCLJvxu
 rY2VgI/tjP+DESVsqHy9FKjpjG91PArPiLUPo5JaR2VOwqwxqHYkCLBZZBqaF1SDyXD4
 z3DqDthij4286lIgaFyUTsZtljyZMXsBFYACi6yZVKn+itAHdmmEl3pscQvrp4Tbbgh4
 X9yOZcXT3Z+3XxCumeycOjta1EEUQWZAcYf7QsNZdJt6kXwW3surfdykTXH0fgwrEigO
 IaGw==
X-Gm-Message-State: AOAM530kI+F0FIRYqvSVNsXk+tqZ5U32xmqnbGJbOj1lLMaTUxwGIuoJ
 TPCDPxquqkO6L6J2LBHv6tJAMQ==
X-Google-Smtp-Source: ABdhPJxY/JDNh6ff59xzGYiE0Sl24m18pTEyQyridsU2r3YLx1KQWpXWeqFPcKl3TArN324+3D4YnQ==
X-Received: by 2002:a63:3589:: with SMTP id c131mr9344919pga.158.1596758641682; 
 Thu, 06 Aug 2020 17:04:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 144sm9754565pfu.114.2020.08.06.17.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 17:04:01 -0700 (PDT)
Subject: Re: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-27-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90f01984-54a4-2a56-c52f-d1f4332b39d4@linaro.org>
Date: Thu, 6 Aug 2020 17:03:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-27-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Aug 2020 00:04:05 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> +static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz, bool is_ldst)
>  {
> -    return simd_maxsz(desc) << vext_lmul(desc);
> +    /*
> +     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
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
> +        uint32_t eew = ctzl(esz);
> +        uint32_t sew = vext_sew(desc);
> +        uint32_t lmul = vext_lmul(desc);
> +        int32_t emul = eew - sew + lmul;
> +        uint32_t emul_r = emul < 0 ? 0 : emul;
> +        return 1 << (ctzl(vlenb) + emul_r - ctzl(esz));

As I said before, the is_ldst instructions should put the EEW and EMUL values
into the SEW and LMUL desc fields, so that this does not need to be
special-cased at all.

> +        /* Return VLMAX */
> +        return 1 << (ctzl(vlenb) + vext_lmul(desc) - ctzl(esz));

This is overly complicated.

(1) 1 << ctzl(vlenb) == vlenb.
(2) I'm not sure why esz is not already a log2 number.

This ought to look more like

  int scale = lmul - esz;
  return (scale < 0
          ? vlenb >> -scale
          : vlenb << scale);


r~

