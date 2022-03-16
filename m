Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUMwX-0005LO-K4
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 02:15:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMw8-0005Go-0F
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 02:15:10 -0400
Received: from [2607:f8b0:4864:20::1029] (port=51865
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMw6-0000Ex-FB
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 02:15:07 -0400
Received: by mail-pj1-x1029.google.com with SMTP id gb19so1353865pjb.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Mar 2022 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u37zmN9bIA9HYZbeHXFdwuv+7V+mJD1Ob+iApgtV7X4=;
 b=rGSfqmo/O0fZCl+UBTrgAbxw1yqageWTtt8MfLJRX6KKIwxOtaMCDU2pe6d5yzGifS
 ShxoL3rERgRl4RO8EjeFGABB/NsW1GXDTESh43Kgo3De6+xQKY4ElM5RW9dyHBY6uJTD
 w6ahVRnxYLsF7HjSovKvY0BrksRJLCI8ffq7s6c4H4vpb2bY5m0ZsRKR4N6J3AqXP9P+
 9kMjKKSjpnqg509g+/Hg2g6NERSwL6StkBHLkAn+D707IKPDMSC9pe9ae2FsceKsKBfI
 Kf88R/wI8mQkjlAnj4GzVMZm9hkcLDeNDrwMkfY8ECjtzk8DI1Iytq9oeKY8G8L5gsGq
 G7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u37zmN9bIA9HYZbeHXFdwuv+7V+mJD1Ob+iApgtV7X4=;
 b=wcEhW3SSl0asheAZ1LMBiZr8CzpX49qKCKGPOrTvCGrwTACljIVd2nWP1dNPJcoaQR
 ZXzaWZFrLNEeb7yjsvSti0iCgCFwULMYaO7FpGGDPf9sRHvbXJKIN1IifynCaVeJLtgV
 d0z354oX7sDYVQa4iAFUHeEE+y9eSmOosqe6i2gX//MqEkDehNdCP14Yge/eOgvrybaN
 lD21OJ0JGHKvEEjrORIPaTmfS7YXz7xg9JCWGl/HZeZq5xu+0t/WfbYhuJ3ujeWy4RzB
 DmX3UZoQOP0QaxWOc1NJl1/rnvhHMZ0edXDSj5uhA0PGf2ocnI9ZLP5kC0X8J6pkVieJ
 akgA==
X-Gm-Message-State: AOAM531xBz4qeSoKwyiAji97aUEn+5kpctqpyc1EEltWWWnonX2CxGPp
 0PMcSpkVcAdcxD+2bc88iOVkXg==
X-Google-Smtp-Source: ABdhPJy6aLOIhrWwtSYwX3v5w5/YxQI50yn67RvLS54a0MCFyv/53oU7G1vW6Ufs/x/2ka9hcYDRdQ==
X-Received: by 2002:a17:902:c443:b0:151:ca88:684 with SMTP id
 m3-20020a170902c44300b00151ca880684mr31941803plm.80.1647411302527; 
 Tue, 15 Mar 2022 23:15:02 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004f78b5a4493sm1319009pfv.105.2022.03.15.23.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 23:15:02 -0700 (PDT)
Message-ID: <0ffc0bec-fb3c-7870-be6d-55f16d44b68e@linaro.org>
Date: Tue, 15 Mar 2022 23:15:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] target/riscv: cpu: Fixup indentation
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
References: <20220316015901.3787779-1-alistair.francis@opensource.wdc.com>
 <20220316015901.3787779-2-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220316015901.3787779-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Mar 2022 06:15:16 -0000

On 3/15/22 18:59, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> Reviewed-by: Bin Meng<bmeng.cn@gmail.com>
> ---
>   target/riscv/cpu.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

