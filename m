Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0cuw-0004AB-6J
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 00:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0cut-0003zX-UH
 for qemu-riscv@nongnu.org; Tue, 06 Jul 2021 00:42:39 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0cur-0006Ur-TL
 for qemu-riscv@nongnu.org; Tue, 06 Jul 2021 00:42:39 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b12so17278255pfv.6
 for <qemu-riscv@nongnu.org>; Mon, 05 Jul 2021 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hMpnLRpsoyGNatujH4EZ7bM8Cew4CtyBDhlLMRWsfhI=;
 b=sZ0DRUP23Sb/9HnJPOq0bCu9iOP2eK06s34bOv/bF6IYiVADFPPod2NabOl3d1t27L
 QqFsR55G1qkcel0osMDmXIHX6GejMFfGa0uxlJoGd+jc/Q5GBymEJomNDM6cjD8CqAEM
 a3TPU/ULcXZkE2TVdbh2cFehFrhooFu2rXLzOfIJGPqwPeA8iV3O6qn5mI//2sL3pyIQ
 nwIVZ0eHI9iMobyGsKteQOYha9IxuNqlu7sT5oevRUlIYjZDvweLJbTkWEd/XJzX+r84
 s1U6CYWTfRKJ2AuOhuT2VpdEcZQfBk4KMWrGoWmBq0r9kiznMEMdCVWGk+E0307Eukce
 nEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMpnLRpsoyGNatujH4EZ7bM8Cew4CtyBDhlLMRWsfhI=;
 b=hKnPFK45TKOIJz1GLn0Xq+GxQEK0KSKlcGXDxNPXzXk8CS+VTwI15vQjj4D59f/rKE
 UJJLQxO6iNt7iIZ9HzywNngW06D5SYFSo0RLg1pmZoJLtzzGkbBBM7kRu2ITZIcQcCNW
 s0FwUQQQy4daYHYV0MY96P/+ofSfKN1VhrLDwgZmVel9LGvlLavH+tOXGzV3+PI91HGp
 NiSZVYmrf9LocdNxsvuCwx2cbxo9xamQkF5ATPOdxyywyVze6yvvg+I+WKxbfs7T0cIH
 OlcFG07vnh7pfMXc6sGvAt/6XV3mRjo0oANY6iWX44A5VUho6FmHGe8LmuA3JSUgQobZ
 C5Yg==
X-Gm-Message-State: AOAM533Ai4OqyQJH2sMACr+cZ9DrJ7+vcuj+e95IgPcpHl228YZwtd9y
 5hz9t4eweZ3GZmJPtZO9k9oJwUTmw3SkAg==
X-Google-Smtp-Source: ABdhPJzhrnuv4G6sWxoq9Zyn/9Y0/wDfeHZgnIh4b/JuddjkFdvk9O6QUXAUrP7yOC9NFVaRgle9iw==
X-Received: by 2002:a63:1c53:: with SMTP id c19mr18842685pgm.332.1625546556250; 
 Mon, 05 Jul 2021 21:42:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j15sm1113764pjn.28.2021.07.05.21.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 21:42:36 -0700 (PDT)
Subject: Re: [PATCH v3] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210706035015.122899-1-kito.cheng@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00873491-d7f4-1d46-8a9f-b05f11c1a0c2@linaro.org>
Date: Mon, 5 Jul 2021 21:42:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706035015.122899-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 06 Jul 2021 04:42:40 -0000

On 7/5/21 8:50 PM, Kito Cheng wrote:
> Set I, M, A, F, D and C bit for hwcap if misa is set.
> 
> V3 Changes:
> - Simplify logic of getting hwcap.
> 
> V2 Changes:
> - Only set imafdc bits, sync with upstream linux kernel.
> 
> Signed-off-by: Kito Cheng<kito.cheng@sifive.com>
> ---
>   linux-user/elfload.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

