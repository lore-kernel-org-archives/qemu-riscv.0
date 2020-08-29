Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC394-0004I1-Oy
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 11:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC393-0004Ht-OQ
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 11:51:57 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC392-0001JU-2j
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 11:51:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id p11so2193125pfn.11
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EfTB96CZG/YyqZ04HiL+zf3EWviG8+PcrFr9rhhJ3+g=;
 b=tZd2Aa9OanyF+tZ9bS/QStgBlqyqD7oQzzunqJ9Dzdm76Siy3/lwEzv+jt9EmlrWoF
 ZDWJuup0KOPMVL4lQnNdUA5yihR+0EhhV9vwqV/f8yf/Sym4L4n0mVv7rQH9AJeqCR9e
 XXxHi25BB4/nkhwagThV1Ct6hRO+sfRkK4ZYKRKe/0qloqkwYe9xx/IPYhKMbYqOkqKf
 fAKkkDHWbd2n8aPuBNSGgvzR3YGlGIaxlVcfQNBpGgqqRvdi7gLJF+86K/VMYAej6Hvv
 ASUldnkyqbiq8sv6+XOzBJUhqvz5A26/mx6512+BIr2B0LSLDoj96K+LAMsmldUQTJMZ
 TGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EfTB96CZG/YyqZ04HiL+zf3EWviG8+PcrFr9rhhJ3+g=;
 b=NTsRp1WnXHHH58MjpOusLxkySRIuhTSpZ9ZjhAF4hstYsppxg9tHNSkb5+NwCbsB+C
 qHRMFwTcyAPUMQPaNMzTwCtqlGXLyAICImCEPBmuwj5RXeZlxx4JeHCJcHKuz8XpdIQf
 W16TN5geD79ziYhXinkBNJTRw3VFRsp4ba8UQt8Liu7AQlGuEqrnqoSlS/xO82kJ2U97
 MhH/yXVF88bzE0SmDLlZgNCE7yVKZsFaxUGlaUihuHlDwuWPVY512gzcbQZL6tHOYhGL
 8xT3AiCCyLqNU4hx08pDWIGww9PLRRkAIREegRpL9g6dj+5R6VPpjvKikUXirElcyjWt
 3Pkw==
X-Gm-Message-State: AOAM53329uxIL2RdLK5tDENum3EU51mzbPNC91QpJTbk+dfqdYHTq7Yx
 gs/d0HHoISriQ3GcXC9AXt1lhw==
X-Google-Smtp-Source: ABdhPJystVzGPe7UkTyMpuKtIbs/ab4tJRg+Iq070fBBIA6TZd9kAjV6cmt1O0KeqtVglQPX9f2j+Q==
X-Received: by 2002:a63:5d4a:: with SMTP id o10mr2683171pgm.200.1598716314537; 
 Sat, 29 Aug 2020 08:51:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a1sm3166319pfd.65.2020.08.29.08.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:51:53 -0700 (PDT)
Subject: Re: [RFC v4 12/70] target/riscv: rvv-1.0: add fractional LMUL
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f4cffc7-86dc-92c9-ff61-c3ae1144ecc5@linaro.org>
Date: Sat, 29 Aug 2020 08:51:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 15:51:57 -0000

On 8/17/20 1:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Introduce the concepts of fractional LMUL for RVV 1.0.
> In RVV 1.0, LMUL bits are contiguous in vtype register.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h           | 15 ++++++++-------
>  target/riscv/translate.c     | 16 ++++++++++++++--
>  target/riscv/vector_helper.c | 16 ++++++++++++++--
>  3 files changed, 36 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


