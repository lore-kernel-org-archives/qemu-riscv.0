Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0281E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:35:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNx0l-0002Oh-IU; Wed, 18 Dec 2024 11:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx0k-0002Mw-4R
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:34:58 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx0Z-0002hx-Mi
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:34:57 -0500
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30036310158so58311901fa.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734539682; x=1735144482; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TZNMU5mJp4n3DAzXD6l59ElxvfOJRtsCerBsyZUvp2o=;
 b=vty4dO908GfKxlfxs+Y4wx6Rk7KB7dtTyYW6s1786xQhnM8G492x/1lHWZCjsvbJyy
 /UtKOdD7qmcK9VkT3mHp+E/kK7pNwcnZRwOLY8uEVWW6KbBG/LnfCeqcV6EHBgszeS0+
 xGb7Q8m8uVI5SA8My/7/3CQHUKaAQk52QahCea/juRjA7WlJ2VW0XAoTaa6fsvvJjMuR
 jEU6POZD3W0QuVahX2B70zw3zuKWBVvIK2N9eBTRemmLlgk02/muGrEFcDFCmrBYmFUJ
 WsnGjUcNSy/BIE+RM7hD5LEiOtt+q2QQmv5daQ3KhbIBKjMr2RGJVlMUXuMTXq9GBDJM
 LgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734539682; x=1735144482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZNMU5mJp4n3DAzXD6l59ElxvfOJRtsCerBsyZUvp2o=;
 b=pkFZebfKzLhFUX9d1XDB2QrSSrdO/g9rVPA45NUNR9GgSKNhXIEK/xqgNm8ThKTmpN
 h3qyB8iddPOX5amiScPtX/HtvjpuA/+q1EGxkMfpMhR6+1It6VszzW1+04A37mfY6qDM
 53lOn2hbzODJnvcv5bQzeTf7TFwngmR1YSjPiGCtU8kIL8C1Lu0pMadZW5WM1PMrQe7a
 Ght7FmRhMtKhNvG0ltKRRnfuboQAhm7gFPKDB197T3OafYexkBEbmJJ+NyYjf5ELbWiO
 KhsdT/Hye3xE2WABEf2cT/vHRxtNqDSuxIEZGsRoqbBHs7pjOsS6lDYyiK4A0pYISURZ
 h4lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEDQl5UErbGa/lHoljqOiP2Ps8WCW8Gljip2Sd5AMPUj0tk+xv8MPYqi62HworH7U4GEOuJoaNLcO4@nongnu.org
X-Gm-Message-State: AOJu0YyIBqT476kkSa7yLXlTEVdvcGotHWvnFtVemDsPq+zuts7adUIG
 aHGisJ4155gzTFsiPLmZbfi8FyJZ1Ng6NMz6E7IhM2y66jpnyD67zYEuch1t5u4=
X-Gm-Gg: ASbGncuOOrPZvBD5yzgWjYBzh1hVC8vBbkwfrYWw4r8YpHCezCyVQfuXJLlOnaTjfUP
 wXRLaVJHVN4RlE7nFvDBiynPau9bD5Qs9XJg5GNa9H3020MjUqes+ik7NNqiUWf4elenPZZGulO
 2ilzhNvKHembprKUWQgoL6L5sq0jT50MtvoETePpuvoCGN/b4WvGkmZOK0AN/A/ku3svVSgK8tZ
 Lhl5+emymmr1Mn8mth+ml1oMOPHiIjlPumah8Ir32KjWI+EAT9fKwibm9LgoqPFimSdu9wlO9k=
X-Google-Smtp-Source: AGHT+IGsTDeaY2n3Z3ZUPUyJw8KH+LhtCLF6gJs9F2k5QDDm2AySFesG+r9FvrR+JmbZ8vJpbhPk2A==
X-Received: by 2002:a2e:93cf:0:b0:302:210d:3b5a with SMTP id
 38308e7fff4ca-3044db52b29mr10969621fa.39.1734539681726; 
 Wed, 18 Dec 2024 08:34:41 -0800 (PST)
Received: from [192.168.242.227] ([91.209.212.65])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303440452a8sm16464311fa.40.2024.12.18.08.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:34:41 -0800 (PST)
Message-ID: <4eed5256-ca6f-4916-8a9e-5c874eacbe5e@linaro.org>
Date: Wed, 18 Dec 2024 10:34:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] target/riscv: rvv: fix typo in vext continuous
 ldst function names
To: Craig Blackmore <craig.blackmore@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
References: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
 <20241218142353.1027938-2-craig.blackmore@embecosm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241218142353.1027938-2-craig.blackmore@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 12/18/24 08:23, Craig Blackmore wrote:
> Replace `continus` with `continuous`.
> 
> Signed-off-by: Craig Blackmore<craig.blackmore@embecosm.com>
> ---
>   target/riscv/vector_helper.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

