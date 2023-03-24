Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfXk0-0003P7-S6
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 23:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfXjx-0003Ow-T1
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 23:05:17 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfXjq-0002HT-5J
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 23:05:17 -0400
Received: by mail-il1-f176.google.com with SMTP id s7so314353ilv.12
 for <qemu-riscv@nongnu.org>; Thu, 23 Mar 2023 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679627077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSNM0jBmgVeUpJCMKaboFDx+TVe5Dn0eLBK/AhWlw0c=;
 b=S6noTXbgZCCQst6wjKszJ7tQQabS/DzKUbFa7S/dRar6dHB7GjVT2kouNUvLwlVDMo
 qqR72Sw8ZFiD8PvPhQsOKLRfqn2cqWUlqhCijQGXhhGUN0NQIOMoSpmR5AlnuNx3ct6Y
 ZxGtnr7TA6bkK+lhkYRmergNLmLc1pW5jT02kYOjwY6CF0nSSwR4H9BGFlY84Q6PLAQu
 1TfDF3v0lP43i8IDpqxBysV6Q1i4K0oLNIO/2T4HhVkwtqv1MvTNmj776lapfIRqz5kJ
 6Tc2i2UZgVfpXUyqIb4wwijclXVJpzU50rFP6XomDNTJmLK6WIktOyDB+oZWOPkX+JtH
 8j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679627077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSNM0jBmgVeUpJCMKaboFDx+TVe5Dn0eLBK/AhWlw0c=;
 b=dwQ5Uh13U//VzYp5Pf2bVl4HoOwHSf4Ao91rEvXjEPmsUcLQL/SsZoQH6CfzIYz8ya
 3bBDTh3gcvG9gJDAsrDTc6V87HrAUI+joS97KtK3HPzhLRntWguOfdltisrEuihzQH/c
 hP22IkfNzUTjr7OROwjJoZUOomaolHnvKRoXuvMLVU/TE49/gfX7rMvYnLv33VwdVeHb
 E7jlXZy2uKWY30OFPX8hos52Lwwlyf7Y+pxpmnMPvHWuG4YAG2s0Bxf4J4YucINBV38W
 Y7+0buoJ26SVK9G/z0D3kFO1YG4m3gNvL9R0JyqY+GtbsszjxyZJXLm8kanCosc4RPXl
 yRLA==
X-Gm-Message-State: AAQBX9c8utQVpQcMusvTCdZpYVsjMraaCR2QJJzn2hvjfgimTpMpe/ey
 8ogZPJOvJtPKy1S7FQ2GpUzEZ446KBklloQn8qg=
X-Google-Smtp-Source: AKy350Zhgg0Iv7oOaRvI2RcelN2DBzOK+SGHcY4jhVkn+ygTVQIDGIhuziZOcY689w9kImT3SUe2GQ==
X-Received: by 2002:a17:90b:4b10:b0:23d:41:3582 with SMTP id
 lx16-20020a17090b4b1000b0023d00413582mr1119021pjb.8.1679625435196; 
 Thu, 23 Mar 2023 19:37:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:e8c0:e9ca:7e89:a462?
 ([2602:ae:1544:6601:e8c0:e9ca:7e89:a462])
 by smtp.gmail.com with ESMTPSA id
 jg11-20020a17090326cb00b0019c13d032d8sm12947609plb.253.2023.03.23.19.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 19:37:14 -0700 (PDT)
Message-ID: <4951f368-400f-9dac-524a-d3264f0b96ab@linaro.org>
Date: Thu, 23 Mar 2023 19:37:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
To: "Wu, Fei" <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
 <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
 <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.166.176;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-f176.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Mar 2023 03:05:18 -0000

On 3/23/23 18:20, Wu, Fei wrote:
> I lack some background here, why should tb_flags be preferred if env has
> the same info? Then for reading from tb_flags, we need to add it to
> tb_flags first.

We read from tb_flags in translate because that proves we've added the data to tb_flags 
for the TB hash.  It avoids errors like the one for vstart.

> Correct me if I'm wrong. The only strong reason we add some flag to
> tb_flags is that it causes codegen generate different code because of
> this flag change, and it looks like priv is not one of them, neither is
> mmu_idx, the generated code does use mmu_idx, but no different code
> generated for it.

PRIV definitely affects the generated code: for a supervisor instruction, such as 
REQUIRE_PRIV_MS, we emit gen_exception_illegal() if PRIV == U.

MMU_IDX definitely affects the generated code, because that immediate value makes its way 
into the memory offsets in the softmmu lookup sequence.  Have a look at the output of -d 
op_opt,out_asm.

> I think here we have some other reasons to include more, e.g. reference
> env can be error-prone in some way. So there are minimal flags must be
> in tb_flags, but we think it's better to add more?

We add the ones required for efficiency of execution.

We had not originally added PRIV, because the (original) few instructions in 
trans_privileged.c.inc all call helpers anyway, so it was easy enough to check PRIV in the 
helper.

Since then more uses have grown.  We *could* turn those into helper functions as well, but 
every other guest arch includes the privilege level in tb_flags, and it seems natural to 
do so.  Only if you completely run out of bits would I consider working hard to eliminate 
that one.


r~

