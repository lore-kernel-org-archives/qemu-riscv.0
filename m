Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMCcZ-0005Rt-7Y
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 13:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCcX-0005Kz-Ty
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 13:04:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCcQ-0007qb-9F
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 13:04:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id b10so9172598wru.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aCvVztgefZqw2zoWblNqQjaMz2QZeaFdKupDkAe/l6U=;
 b=sqXcm8R36EJGl4fhTxzVWZhD4rmPCoPVAh/bkgcgXNZKcRnYq3RQYfGZzIqOQLpw+O
 gGJ+MiT4/z/iDrU5NnVAWjj/6V2egyF42O72gKjHE4aAmNohozTogltlVG7VknCFKgq/
 CimcyLmyfOy7r+rxLOZJY1HwKtZCDUOlRfw5mK5j5T7XzW+ogJTiz8A/iDHuTU6CUTx9
 7XiWRuMXsCz+owAb6wocRfWqWl5kC98hwQ41wv96OwjTnrZk2K5z/XXWe6i7HgfkITJa
 tWcCxn5zuPiJg+OU4fulG6seQC84niT8CA73dZ3/jp7ZAZjxvjbLcNxVVNLQynNYOwiH
 Wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aCvVztgefZqw2zoWblNqQjaMz2QZeaFdKupDkAe/l6U=;
 b=Ha/MpKTXpuG6hUWqDh+UAmJh962B0tZEX8VaTNq+qNg7W8f0pRId60h5cBa5QKzlwM
 o/3okDiIBiN/QsSnq7CXCpCNfxwZkl8mU0JJRu+nv3Wxlje9OyLFyHsCXJW3Aw4zNdur
 fHNZ4SACOIDcAOJykbi9NebjRse0vmSVwcdUUG0E4RaqmRW6FecJcAGr5jurBAK+6XOe
 YQGapY3dehxP086WBUiaiTg5c2QgUQL3sZ1/iswCuDlt0VDgANnHAyOoMcLXdIZwLN76
 aFxTei3WhI++uV541N7RPMgBSpO8x5GZty0xu9LzrD4x/U2Tdjsxz3EP/Jonouem4UZf
 knHg==
X-Gm-Message-State: AOAM533+XanIEs3u2czasM68k1IEI4DW8rp8tXOY+00FZl2El9k5EE07
 eEj9KGGTPwmdSdgPWjwkGERIHQ==
X-Google-Smtp-Source: ABdhPJw0sBqyp1rARfaiUghxahAYyb4EobYjz9osAR1XerC1XImjOwt5A5++LDRa9MNB6dhDuDTY5w==
X-Received: by 2002:adf:c402:: with SMTP id v2mr85774wrf.130.1630688684449;
 Fri, 03 Sep 2021 10:04:44 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l10sm5728859wrg.50.2021.09.03.10.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:04:44 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <cover.1630624983.git.alistair.francis@wdc.com>
 <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <071cf027-72f9-756f-36af-758f35bb4123@linaro.org>
Date: Fri, 3 Sep 2021 19:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 17:04:54 -0000

On 9/3/21 1:23 AM, Alistair Francis wrote:
> +    target_ulong bins;

Surely uint32_t, at least until 64-bit insn width is required.


> +    TCGv tmp = temp_new(ctx);
> +
> +    tcg_gen_movi_tl(tmp, ctx->opcode);
> +    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, bins));

   tcg_gen_st_i32(tcg_constant_i32(ctx->opcode),
                  cpu_env, offsetof(CPURISCVState, bins));


r~

