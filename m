Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1GAc-00073f-DZ
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 17:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1GAa-00072k-Gq
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:32:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1GAX-0004WT-Hf
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:32:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id f9so5773805pju.4
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 14:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rTEQ9qi39BiNJZVkVAHaaevAUcf8e6x1Fahkn45LvrM=;
 b=kOIVMBxWpgJkZ0vXLNsIvhHDOCyBnoucxOnocBKSpd6354+yTBUtzELm3IBo0FG27p
 QlE1iVUSzIZN+wVP9DTLjD3QmOL4Ss7pTn7vh+e9DRoGPnUPuEAE805BvEWuBq/kluhB
 yEWzbKZ081jZLWAqSjEt7jtL8LFPs9coZtEXdcAheyDNhfhkzp3t/P49ESjWeO/rZsn4
 fMMerArX+4dMd6DYekmMkXkPzPnb2VhQKCFWMz+pm6fPPF/ByCYx8EE/fsVrywcC+98O
 stLCsoW7ymURoJ0CEvJdHKBrWK3Hmdq03zSEz6TV5c3wImojG7rPXj63MP+3vpeLQKiX
 vD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rTEQ9qi39BiNJZVkVAHaaevAUcf8e6x1Fahkn45LvrM=;
 b=QlIB0hVHm5yZ3NQQxRZHlXsR12/s7jxbn8IkcqF1WjNM1hMG1geNSjyDpMfuKMoEhE
 8mVdJ58i/N9nNxqS0jHJgo/BDKNhMr8X8Zafxg6PlX90zrG++woNksjoXBZW1TDHVChd
 2lKqZsF2bk6MI62THxpA8zxJ8lJ3FVtObl8ok6AOc+XW1A09fWkVbGwD9spM70B3f1Le
 BoEtkwNQ3IZXbrhDpN/VjWprHuK3WSRnZXa6o12ZQSpWVCeWKglFknFH5sPhY2BMQfqP
 LX7FSGOkk1KekDUn3Mw2Uy7zAKSNvmxioymzt218qz78DWdC7hapJYkn3/vJQUTlkRDf
 oKkA==
X-Gm-Message-State: AOAM5337oxH8YzdwUWKJbltSTDyfF24Kbkj5VkKrZs4aD3C/jl9VGnHa
 1AfXp8UeXZrTlceUJVAUPfIOgQ==
X-Google-Smtp-Source: ABdhPJyFUD8J/JgIwGJ1OChvKv35vI0iZ8/x17I3rbrJaM1JknTxvXN1nP7eYanABGmCaEO2noGjww==
X-Received: by 2002:a17:902:b20a:: with SMTP id
 t10mr978543plr.185.1596144772053; 
 Thu, 30 Jul 2020 14:32:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x66sm7601370pgb.12.2020.07.30.14.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 14:32:51 -0700 (PDT)
Subject: Re: [RFC v2 53/76] target/riscv: use softfloat lib float16 comparison
 functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-54-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6169b129-2868-3ee9-b70d-7a1725ef75ab@linaro.org>
Date: Thu, 30 Jul 2020 14:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-54-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 21:32:56 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 19 -------------------
>  1 file changed, 19 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

