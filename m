Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHLkD-0005M1-P0
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 04:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLk8-0005K1-QG
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 04:25:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLk3-0004QL-SS
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 04:25:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id z5so25761404wrt.6
 for <qemu-riscv@nongnu.org>; Mon, 16 Jan 2023 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+EPBrH5xWH0oOLlkRWeAJXGBeq6L8Ejk8ixZ1YFNUw=;
 b=l5/BbfITpEAZWb2UhyPcbI+EF0c/MKWgk/EfCJ4MPPpTP0QbKJ/+xJqVWfyTkcWdTv
 tbzjlYn+AD9XKVGrlc0tq4cv/coCRC5Ljy9g3mgxVDMIUi7AjEN1w4URpoErj2TsIAc4
 2bcqUQPJhMUEQ8S669sluMrgwfNwo9YCcpRqsPzZ02+Yp7L9igB4gWJYAqM+1Bvi5gg7
 04CJXJT46wLV/DFTfp9oOIzCdIKpSpX77XYw1y2/IL6+buDShEqWi29Drqo/ccYeHB/m
 etK/w6Oj/vuyx+UIGS+fcZpYG6rMeLtDcZHq5XpGWO2e3AqgWoVeY9jW9QSjRR+jUU2o
 SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+EPBrH5xWH0oOLlkRWeAJXGBeq6L8Ejk8ixZ1YFNUw=;
 b=LpjOd3P+Ic3ewuISW7H/Pg9OterAbCaWQZeKkS3hoKcs+MqDsfs5nHnWZsTT8xPmuT
 N+sXYczk5qvvnTP6/aF7m3JlL6uXb/UwN+AOitVV8imL4sKGSGBQdfLOHI7fcTNM2XwH
 RokjRvMkioyrR2fb4ZIaNzn3QykEUBCnpbwgKnsulqBW8IIWcKNDrSdia64fJv+q9tgy
 decYhuziD1UEzTRHyXl/F4qfFFPqL0vvXlqW4zEgW/qN3gIPMVRWwbWdRvCNJ4SN+udD
 Q0qYWwGKp3dLy2eq4XxLoQGijoKqdpB9GOe1gllQ75tOTSgwas8oSdxiQe/N9b7NoBqd
 Rf5Q==
X-Gm-Message-State: AFqh2kq+pcB0o9ujIN3lHAiUyorBLlgqzqZ3eHz3A6old8L5cMdTIlfO
 PaM859j27dvaHzU0jsYsV1QMxA==
X-Google-Smtp-Source: AMrXdXuCD6/+h8KXmm8LzbhquqrI3A4wHP68i/q6rfEv3K5NYt6TMUP3KJsO7pVywIYc/Z9mryK0fA==
X-Received: by 2002:a5d:6c69:0:b0:2bd:f651:3a67 with SMTP id
 r9-20020a5d6c69000000b002bdf6513a67mr6987843wrz.64.1673861121480; 
 Mon, 16 Jan 2023 01:25:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b002bdfb97e029sm3637932wrq.19.2023.01.16.01.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:25:21 -0800 (PST)
Message-ID: <1ff4c868-f39f-21e0-2030-a78163143233@linaro.org>
Date: Mon, 16 Jan 2023 10:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113171805.470252-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 09:25:30 -0000

On 13/1/23 18:18, Daniel Henrique Barboza wrote:
> Recent hw/risc/boot.c changes caused a regression in an use case with
> the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> stopped working. The reason seems to be that Xvisor is using 64 bit to
> encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> sign-extending the result with '1's [1].
> 
> This can very well be an issue with Xvisor, but since it's not hard to
> amend it in our side we're going for it. Use a translate_fn() callback
> to be called by load_elf_ram_sym() and clear the higher bits of the
> result if we're running a 32 bit CPU.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02281.html
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 23 ++++++++++++++++++++++-
>   hw/riscv/microchip_pfsoc.c |  4 ++--
>   hw/riscv/opentitan.c       |  3 ++-
>   hw/riscv/sifive_e.c        |  3 ++-
>   hw/riscv/sifive_u.c        |  4 ++--
>   hw/riscv/spike.c           |  2 +-
>   hw/riscv/virt.c            |  4 ++--
>   include/hw/riscv/boot.h    |  1 +
>   8 files changed, 34 insertions(+), 10 deletions(-)

> +static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> +{
> +    RISCVHartArrayState *harts = opaque;
> +
> +    /*
> +     * For 32 bit CPUs, kernel_load_base is sign-extended (i.e.
> +     * it can be padded with '1's) if the hypervisor, for some
> +     * reason, is using 64 bit addresses with 32 bit guests.
> +     *
> +     * Clear the higher bits to avoid the padding if we're
> +     * running a 32 bit CPU.
> +     */
> +    if (riscv_is_32bit(harts)) {
> +        return addr & 0x0fffffff;

Instead of this magic mask, can we add some architectural definition
in target/riscv/cpu_bits.h and use it as:

            return extract64(addr, 0, xxx_ADDR_BITS);

to make the code self-descriptive?

Otherwise LGTM, thanks!

> +    }
> +
> +    return addr;
> +}



