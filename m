Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3lFW-0000qj-28
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 15:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3lFU-0000pw-K5
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 15:08:20 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3lFS-0005MO-HT
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 15:08:20 -0400
Received: by mail-pl1-x643.google.com with SMTP id q17so28248113pls.9
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3FGZbvy63alEeHx3geKeU66ziE0QKJtOUWdcm+cD4bU=;
 b=FVHM+SHCoX56RADzvmm+nuv1KoBNOU+3p/u3262tKtG6nF6NqGr1jynX0wHiKQhi5G
 0aRbYLUomfBqrbtsnwURuL4PZ+Q5OpwhElDi69vMGMa1cFnZ7Acx8PrwyegEh3+nXa/5
 moMUHze5cywnHrgZVsA+IwycvyKpjCDUgq3XfDAYC8lRcllVTMa7kovwSJpASk/9b6Wq
 g+N94HQ1HPb+6DvnWm05GxihP3UTykwovkhCR4NUIuOtDuV38oEXT6gXvoH5RB8PVhOV
 hwwCknYtMO3kVEH5uHwTZsxOhPpjTkVkHYw5FL+0E1zmMWRpLo63l9Z5j08HfC4l1jFp
 AlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3FGZbvy63alEeHx3geKeU66ziE0QKJtOUWdcm+cD4bU=;
 b=rCvRDMRpQ6YwBz0lbquu+l+Xn97BImKYmEOe5VJyfQGt2sLJkn+KxPHw09khcC5BPs
 GkDKYoM2mZXewA4AD5sMEjzjIkj5uoOJzJNuhr7oRXfPeKpve7FCpKv2p/VZWUawpJ4N
 iYgiCosjrYnViWEI2Cc99Tg++ph2F8gcDRVMU85f1U0gfeFUAu33Uv+90j7B0RBm21R5
 IDwDqXGC0nbyomFOR7HKvDd+Uvqltiq5ZH+L7JWSkL1Mof0cqMqhgyTml29a1Y+JZjdm
 hYcEwGdPmM9x8htqwy5RIU8azeAe3G4xf2vudGFHcNnwV4BAeQ197OI74vI8dLbW+9OV
 cS5Q==
X-Gm-Message-State: AOAM531kwDNKFQu/yKwOaz4v/vxYOHeaiqsNlGRFzg+92nBmWTu5JXq3
 zrKy7z4nY5EPt288O526hkX87g==
X-Google-Smtp-Source: ABdhPJyY9MW1+B6mTccRuWDBEDZNd6Amuscuehs6H+onNUgFgNccK5dl/yTLIoxkP2CkUu1ed/4jOQ==
X-Received: by 2002:a17:902:b683:: with SMTP id
 c3mr9255040pls.248.1596740896722; 
 Thu, 06 Aug 2020 12:08:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o190sm9748540pfd.194.2020.08.06.12.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 12:08:15 -0700 (PDT)
Subject: Re: [RFC v3 13/71] target/riscv: rvv-1.0: add VMA and VTA
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0556dc9f-201b-e8e3-96f4-2c11f3c87bad@linaro.org>
Date: Thu, 6 Aug 2020 12:08:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 19:08:20 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Introduce vma and vta fields in vtype register.
> 
> According to RVV 1.0 spec (section 3.3.3):
> 
> When a set is marked agnostic, the corresponding set of destination
> elements in any vector or mask destination operand can either retain
> the value they previously held, or are overwritten with 1s.
> 
> So, either vta/vma is set to undisturbed or agnostic, it's legal to
> retain the inactive masked-off elements and tail elements' original
> values unchanged. Therefore, besides declaring vta/vma fields in vtype
> register, also remove all the tail elements clean functions in this
> commit.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h           |    2 +
>  target/riscv/vector_helper.c | 1927 ++++++++++++++++------------------
>  2 files changed, 891 insertions(+), 1038 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

