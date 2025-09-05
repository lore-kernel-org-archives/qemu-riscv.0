Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5BDCA0FED
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:18:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuQiF-00078v-4e; Fri, 05 Sep 2025 03:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uuQiD-00078V-Ba
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 03:18:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uuQiA-0004k1-DM
 for qemu-riscv@nongnu.org; Fri, 05 Sep 2025 03:18:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso6837785e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Sep 2025 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757056695; x=1757661495; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x1rZnXyYQeXsor6QbFERTM6stkUtc/K583rwP288en0=;
 b=cSfvPqURcJ94X6CG9lQR2qJKF6s+sbQaZhZ/Y1wBoQMcYDmtlmFQGkeBJKMWsbZInC
 JftMrYaLh9uTx3ZHgo+dUmHlodq0T9OQwHZsigrc0NRRAlJCpwVKKDsX6FnnaSlLM6Co
 2u19LzbolxZxu2hR3Yje8T+ue0Qh2gbBO5ruV2iP8u0+sBbxtAobIIp6T4R8cKvyh98r
 DOOhmnRHtZ7pEtwHUrz5rkayUA4MID58hGdcU6SBZ77xp/zetRn9YLaANL2AyYK9ZOHq
 5bwT6veRzzwh7+Ue8Wq+tmBABqgxaPCEoxZjUL0hZi1iuRu2dx20J7uIDlrH619YPLNL
 qLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757056695; x=1757661495;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x1rZnXyYQeXsor6QbFERTM6stkUtc/K583rwP288en0=;
 b=QBpRJ2RwJeA+pD9+qwOf5rtKkcawhIQVj0zyTLzJliTufEw4Jp1REx+sVt7NtonzJj
 3GMboU+37sZZPIiqjWw6y7HWvriedI6+hZb4IBNmZvEucSU0j1M6BagUhywTJHxyCod+
 OyqoaP/y5frSRCcVmF+VKwq9Mjcu/H7UWTh3WUjukyIZnqcNdOZ6xxwxvfK/awvb54MP
 2g4Rd3/zFrZMx62YmN44H2W5X59mO4wGsh/O80Ee4//7YBukZdTc1ot4BRtpz94XdK+k
 vLfnyKGdHR8rcZxvRuxKqe4AHkdUGYAz/3dDPiRTzMcJy9knpUpM9Og4BkBINtlh36mv
 5AWQ==
X-Gm-Message-State: AOJu0YzPfXmaafl2LGWtA10yx1fQGQIIbOhhtbiwLZp0346aFNhn1xiS
 iJsFZShpb1tAy6JjORj3hssw9b3zLfoQ7I1TOnEETFc/yYHO7tM1BbzS6tSCCeTB5z8=
X-Gm-Gg: ASbGncsO6dblruKM8CY1+zcIVCqxJPZzpTYm4aNfeeVZqIkYT+ohLUiUfxEYVfzGe7A
 +6LWMjDSV/toxpYZbzWiYoPqqATvIEf1rxfkPaZu0M0NvdXBLM/sD2aSY1akd8aK6R4cS56lVxm
 faqA8dskhkaxL8IICbI5Vv68u3sImKNbhLEZgk02MJrYal8aQ+G9mtfinrP0zyOGK+/g3/bJfNU
 DSwHd1bo+Of7jgiW7i/V++7kWNivlEIiUS6Sv1DsvHKjUhgkekii2y9DMnWbPg553lKN6j0vkgv
 GYR0Xgk/rLZ/4vPkFnMaoJiz8bQI3slXoQLhKnqXydyxu+q7yLkb81SreRu13PnGK1qLhbLe7rn
 TryTjhk+myLwCmqTDcOlRjK4O/tX5vJt3Qvbd7ANnLtS1NIg=
X-Google-Smtp-Source: AGHT+IFsiNRYrUhXGkqlIeuwPRqxCctEpllByJe1vtxFe3OqCQbWssqiIs5M2dDWZ0VKwoG25ez3ZA==
X-Received: by 2002:a05:600c:a44:b0:45b:72a9:28b0 with SMTP id
 5b1f17b1804b1-45b8557d227mr184174905e9.28.1757056695580; 
 Fri, 05 Sep 2025 00:18:15 -0700 (PDT)
Received: from [10.175.133.6] ([131.175.126.3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd07480d5sm32393185e9.8.2025.09.05.00.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:18:15 -0700 (PDT)
Message-ID: <188f0525-154e-4d08-a155-68e8800e302d@linaro.org>
Date: Fri, 5 Sep 2025 09:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/risvc: Fix vector whole ldst vstart check
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org, Chao Liu <chao.liu@zevorn.cn>,
 Nicholas Joaquin <njoaquin@tenstorrent.com>,
 Ganesh Valliappan <gvalliappan@tenstorrent.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250903030114.274535-1-npiggin@gmail.com>
 <20250903030114.274535-3-npiggin@gmail.com>
 <6bff4c9d-1da4-40b3-901a-789923d8ef7e@ventanamicro.com>
 <qyikdqxxiewb7tqykt74gpx5oereckbepyptd3vr4flptmrvoc@midnt5c7agnc>
 <3dd9888f-be16-48f8-a858-f58a5b57825d@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <3dd9888f-be16-48f8-a858-f58a5b57825d@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/4/25 13:06, Daniel Henrique Barboza wrote:
> How hard it is to update the GCC version we're running in the docker images for
> "check-tcg"? We would like to use a RISC-V vector header that isn't supported
> ATM.
If debian packages the gcc version, then it's easy: change

   gcc-riscv-linux-gnu

to

   gcc-NN-riscv-linux-gnu

If the version isn't packaged, then it's harder, and we would need to either build our own 
gcc within the container (see dockerfiles/debian-microblaze-cross.d/build-toolchain.sh), 
or you can host a pre-built version somewhere (see dockerfiles/debian-loongarch-cross.docker).


r~

