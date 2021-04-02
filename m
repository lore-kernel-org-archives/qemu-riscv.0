Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSNN8-0001Fh-FE
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 13:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNN7-0001FU-O0
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:14:13 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNN5-0003P2-O0
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:14:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gb6so2996933pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Apr 2021 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPfCR5fDxe/i8JuWACBXzfatERL6QbW081elbanOeG0=;
 b=GhBvM94SqkwCv8Ud2iL2cjxaNjWYumKzqiNSmqXXdKrDJgtuo29iZPP6XtvqmX6tDV
 11kyUus1zGS31xSEblOfYDue6yh/8nVmvI6usEfwUaw0BTCyV6oqZ6IV3ixPB8M/cBs8
 AU/5HDjJhFrfvvA1BH4vjAh9NXuW/s+XFdevaPdUnYTjdogpmGGgo08sh1NO7q2MKImL
 k0YYN+5D3kSekvARyTBgX6jho3R86oQjn828gUCLjEpvlC6hruB0M32UB3OVKFIk/JMa
 PgfqRzLDOEIjREwieZIy7pdqgsjISPu0mcqJpuVp2mxxEqnq97YC62mTwa4nCg6TAfMn
 OluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPfCR5fDxe/i8JuWACBXzfatERL6QbW081elbanOeG0=;
 b=gXpLsjOqY1AlR5utBqSa3aMIs2vwGXu0CT/uJz5vAzO8VNQACewDHESZO3K6LzKgAQ
 LIbyyg0U9PylofhC8OZz6bf5LBpxvs9Cfr1Pm/4mTqmpKwSTGYhCYS/1Yv4dN1elHe0J
 0IVYRu3627gcI/XtUKs/JDU8cCwBWRkJ/llrRhcbYiqEZUh4XF97wEwj34fzTQj8mx0i
 z+1RpD6wAITnMKqid8MxdX702ThQy/ECdhONE8ro840qYJYlUnqxRsBs4eWRIA8gRude
 ReQDhFSXL4Gc1JeH5cGLgZevX1b5Rjo3fvNl3HhLp3Las6R+oQTotSmqxF5jy23e+IB/
 XaRQ==
X-Gm-Message-State: AOAM532l+xMui5gAbufYotWVucPp1Ck0T6K47uUVnD6lneKyEaf0XQpG
 Kr1Cr1CALvY5ASBffqdP/AAu4A==
X-Google-Smtp-Source: ABdhPJwBxXRhj5uQBF2nlf6ZW2AU3qdpuAvl4Wxlj+LXDW3vMAymmZ4QPW115faMOD6oi6ebD4tQ1w==
X-Received: by 2002:a17:902:bf46:b029:e7:36be:9ce8 with SMTP id
 u6-20020a170902bf46b02900e736be9ce8mr13883584pls.34.1617383650178; 
 Fri, 02 Apr 2021 10:14:10 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id w79sm8677705pfc.87.2021.04.02.10.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:14:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/riscv: Use the RISCVException enum for CSR
 predicates
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <105c80a7-01b6-33e3-9ee7-927528e7fb55@linaro.org>
Date: Fri, 2 Apr 2021 10:14:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <187261fa671c3a77cf5aa482adb2a558c02a7cad.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 17:14:13 -0000

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h |  3 +-
>   target/riscv/csr.c | 80 +++++++++++++++++++++++++---------------------
>   2 files changed, 46 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

