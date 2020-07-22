Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyHhp-0000Qi-Ag
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHhn-0000NV-Mg
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:34:55 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHhk-0007lc-OI
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:34:55 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a24so1555165pfc.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oabH2Z/oRLSIBk9EzJXgASRsXMWhHmXzr/gix3fmPZ8=;
 b=XQFzOTA3SyGwNM5xtm1S5zAmHb6SBwzpEkEQkI9mBJQasFe67NzszqZNOTqgDThScm
 O8q31dgtv0zumcK+McjoscNraCtPq05wmJunuZBAq/LTQ5dpmXnu3B/dEYrymBMpeW5i
 rmkNqmXxh4z9OeTdQrZhhXaYTqVORLd7qkTyi4ctxB4S7YpgIdmdiZTaHgndDQ0NtQSZ
 TOKSuHyOhC5UsvXWEoSnOOzNji2AR+zL2UF6qWwQbN9RMfZ9RSNCwrh8xWDLlsFcMasp
 zqwcp5EHNxJzei9Ehkrle8v3Fd8xzZU/QL8WN9WY9VT7ytV0ECNAfRUgIi/T0ceVcjCs
 QL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oabH2Z/oRLSIBk9EzJXgASRsXMWhHmXzr/gix3fmPZ8=;
 b=rwaC7XasuvtPhaKGtvozydwzlZsyZsv7M4JK62wHbVAxq9pwhwi7YX4D/ytjDwwo+O
 7re538vgl57Tim5NmGyLPU8lH28lvO1rvVaxg4bhelFftHnOPOcW8eXdezeu07btQyxb
 PXSNrUeOJhMWqI47dSVZkWVu/QgL3H4dQAUWv7lytvQhqwKo/+joMAiTFgEk7/8Ufq2i
 jKYfg4aqwIIRJwpKzvWWK8wXVqNz2a8Uedsr/Ak1Wd17V0RF4+4b01zK2qVB2seqEAmD
 kzOl0Eh2cmEyF7c31ZRrj52QWa22TvzvhiNBp7a7PA1qDd+2ru9GLm90NxuA3+IbyeN4
 GLzg==
X-Gm-Message-State: AOAM532WBqjy/vdX6T2oho8CTIgzhFkpeeikZ5+GknZ8vcb4YSMnyswl
 O13XQlBu1bYc56DwV3JdmvaGaA==
X-Google-Smtp-Source: ABdhPJxLnrtLtDGGXgTNTgn4GqO1SXXZbcPvolKDS/poXDjLtcfPr5DhTfc899Lz2A9/GpELDQn2zA==
X-Received: by 2002:a63:7d08:: with SMTP id y8mr589578pgc.224.1595435691306;
 Wed, 22 Jul 2020 09:34:51 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 n18sm100628pfd.99.2020.07.22.09.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:34:50 -0700 (PDT)
Subject: Re: [RFC v2 09/76] target/riscv: rvv-0.9: add sstatus VS field
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6e02a1d-fabd-75ad-eca9-4a5236b81867@linaro.org>
Date: Wed, 22 Jul 2020 09:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 16:34:56 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


