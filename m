Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbtY-0001HU-Va
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbtW-0001Dg-Lf
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:51:26 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbtU-0004sS-IG
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:51:26 -0500
Received: by mail-ot1-x334.google.com with SMTP id i6so24075349otr.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CFdJtTdIJY9D1RVwC+Zv+uF0ekcdFvsxzfdCzea0u0I=;
 b=MM8LZ5ikbYNec+0jSoAQZwGwIxQr4BX9vP3xz67FWlD82YR3cBZpouRoz14KcnWku+
 uTGkJHetwx0HA9Z0yTJK+RN9HnvsfOi6h0YPItxR29Piy3N7Zxky7vkBn/pBU2qIyJvN
 Mzmivh52dzDv40IYNyKfycQrV+52NXeIz3JLFI9xXpSHK9b8LBCZPRk1L+/777kIh70c
 vv+1IZhTFrWxUQGJYiybLJzLnI52p1SLvuagAH4r8RnzF/0o1CuMFIbTGHL7L+MIsMdB
 ss/xf7N6r8i8h80K5HkHZ5lXKOrDyANbIyjw/1gwmDX1/h6h2yCJ84nul++AD8GH2zHS
 OO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFdJtTdIJY9D1RVwC+Zv+uF0ekcdFvsxzfdCzea0u0I=;
 b=IqDxcOnwiH5Kfp/bpT5N0Nkz6cSxV3iNh4MHQTVW148CYnPhD6TsTS3RqipuT3c+dl
 wsBlMlWOX1TcZ0ZqnCVLew/38+oktYOw2273ZCDxWzwHJ62F3lfV/9UZZSZWtyqjNGWR
 NHDRf1Aje0kmt0YwDUydDlwZFM+Q3ojNbvxeOzebDBKpfwDp0kZadF1RSzgDApMBJqpF
 OBYQX+wDHC9iujinz4Lq2xSqXrLnMDTOw/p3zDIa0YD0B3TMPMBFBu0SNATdhPTD83JD
 lTYo60XsdowBLkoWOzk0tO78IzHfbU7dvoOS1+PuxVlRLSPs9l0lu4Q73J+OIk0Xu6Vf
 xmpw==
X-Gm-Message-State: AOAM533af1AhKXjWbJLlGUpuM45TLtC4epxbjEgVKPkV6i7qsfjmY/IE
 oVt3kL7Tmbv8l7j8q7Xe4a3AoA==
X-Google-Smtp-Source: ABdhPJxlPPXEEcL9sioEfnMnrUt8jLkJzEBRofxgtR0R95nn8HJsJQfQQhzJw/dY1cc20wUb8tR+rA==
X-Received: by 2002:a9d:590c:: with SMTP id t12mr26637779oth.308.1608144683349; 
 Wed, 16 Dec 2020 10:51:23 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm622227otj.67.2020.12.16.10.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:51:22 -0800 (PST)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8bf1977-18aa-d08e-a2ad-efbeef4af3dd@linaro.org>
Date: Wed, 16 Dec 2020 12:51:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:51:27 -0000

On 12/16/20 12:23 PM, Alistair Francis wrote:
> Instead of using string compares to determine if a RISC-V machine is
> using 32-bit or 64-bit CPUs we can use the initalised CPUs. This avoids
> us having to maintain a list of CPU names to compare against.
> 
> This commit also fixes the name of the function to match the
> riscv_cpu_is_32bit() function.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  8 +++++---
>  hw/riscv/boot.c         | 31 ++++++++++---------------------
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  9 +++++----
>  5 files changed, 29 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

