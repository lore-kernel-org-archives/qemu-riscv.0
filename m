Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZB5p-0004c1-CD
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB5o-0004b3-6J
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:41:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB5m-0001Xc-CE
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:41:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8220444wms.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 05:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIAcJONwsfbrjoHzvRNgfKDT9/58C4UE0Y2wduh2oIU=;
 b=lPZYBMWyQFv5kempv7VpdVdA+FcOi4rKUFjTGwieiKmV4NC6/1F+GfnrF9+sPFTs6f
 0wiD1EMYjFtpf9K17lZ8+BYzDcZ54iD3lCuLv0cDhpAwXWdosofn63FP0SVy81nYmKy3
 NssyUPNbnCx0I+8TQNK5wVEt2xK6ryY8GJbIsEE4q96ce8CqxftpNfnzjg7mcKV4xtey
 T2aLuA1qHVkG0x24RuSms6EDq658bH7B/lceZCbU2ignYbc1XyRXZE3MudX4+GDZQ5s+
 RfaJzfYDiHitnGLehBlTff0UT8P9Jd7RJU9z7nBB9nWQq+cQ/LmqnQ8ObSyah4poTvVz
 6s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIAcJONwsfbrjoHzvRNgfKDT9/58C4UE0Y2wduh2oIU=;
 b=Gxsl0QwOQJ/bDdv4Etmrez3nAwcMNgdcC17QzrhI272Hv7vpEkbbqQeYVfuuXECI+K
 6CeR67tpEEikd401JNwGEPbhnDvG/PscwAGdB2Y86KhRhKj7rG+8yAe/pmTCM267ksO8
 xNKsBdmnluPe6B1prUx9CVPNww2WItLtjDL/lCep5qsKgZBBfUJTuh17je/Si8i0cJ95
 7SM0UGu8BpVPOu2tepuVb03+EqmNnF52Ez2MzUUycqhi4W/aigLXFw/uUielaFldfNFD
 ZyWqkJQLozhSzreY5PdHgc/jgeCIVpO2GdjhLtm5KRmzWNgA/t2BNMN6hFYIBYY+TJl+
 TZFg==
X-Gm-Message-State: AO0yUKUfUfdRq0QezGO9PXliIeRGj+yzZg+S4U2IO7idNBwEtVLp8FW1
 MufuA5pTB7gbR3zqY3VdUJwKUw==
X-Google-Smtp-Source: AK7set/fa8PR5am6yWygBUfNMniipZ8TFbyn6zkaL/K2ZlgjKQ44wUQg0cA97yRyYIXuJ/lwwADrWQ==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr9588319wmq.20.1678110088898; 
 Mon, 06 Mar 2023 05:41:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm16123902wms.19.2023.03.06.05.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:41:28 -0800 (PST)
Message-ID: <6fa6a043-2194-0749-18ff-7bd7b53c0e51@linaro.org>
Date: Mon, 6 Mar 2023 14:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 32/70] target/mips: Avoid tcg_const_tl in gen_r6_ld
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 06 Mar 2023 13:41:32 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Allocate a separate temp for modification.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


