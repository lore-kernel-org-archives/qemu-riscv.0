Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJvXY-0000KV-K9
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 07:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJvXW-0000KD-Vj
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 07:03:07 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJvXU-00012x-Uj
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 07:03:06 -0500
Received: by mail-oi1-x243.google.com with SMTP id r9so10099090oig.12
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 04:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lRsg1eHSy6dXcK398HZhrx7k4aUwyZw1FnC/dc/O1jg=;
 b=aKzrHYalwWa1VbDiCChcbh261PQV1drdWnJkKh4SnAhJZ0eeQRUAUro1nWdQpCCs7E
 ccwJXtCeMT94KpwjW4w8DZYz0Yvl7dyQR+klqgqynsoMTQhFHmb6OB6NXnrnKV5nkEwY
 Iw2+xQlWY4CsUfKv/0X0pVWOO2V4CszjjzWNsRC+j8QQriuYAic+OLSB9pii+83O87No
 h9h2QZ+Xlr8XCz+LRu8yWObOjxCvGVzehxNQ7LPHUKKsFL70+GUExyKOPBULDvluDk10
 RCvIcjNwWIUmf8yQMF0A0e2+l9iupj+O1wdZ7mwASP+s96wHEuck/iYXJk6l3NCWod04
 n55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRsg1eHSy6dXcK398HZhrx7k4aUwyZw1FnC/dc/O1jg=;
 b=0FeCX1VC4HDyM5cxNO7XG8IchWy1awXwokLvQ98Gsm0RaQ9XE1SMzEtYzN+F2CGPcY
 rr61DzDoxO2yxJcqD3HDPSDYmOMGzgMWuXAYxjppy5FevUskaX3XwceNiTjPNplt4y8c
 yjAPPA2bwXXMMY08R2hvHg9oT/fAykIASMSHqMFVi21QCXwgq2t8qoXBFEnsJyeLqJ1n
 L2Ubm0nOd6jGP5W4V57OJX/fDvI862smw3XdPfDUdoPteS63OIplgwRifE6Lm8qxMH7M
 4eg+sX5wM4WpQl6b26M6xd9g7TpFUMYAJBd7uMgTa/key8RfQp6wAXGloMD44c37OHLx
 qIlA==
X-Gm-Message-State: AFqh2kp+lb1XXgaWRDgd8fGsY6nsVVy2YCMRQiWwBOZdtrD8KKprrh6G
 tF+CEk70pAmKEH4wESZ80Eb8qg==
X-Google-Smtp-Source: AMrXdXs1X7TEP3kOBrJnSohAwRGgt0phthWfbeevxj0yg0NY+51BY+HQHf1xcTMY2gxuaOktdPwC1g==
X-Received: by 2002:aca:5a86:0:b0:364:e913:3a9 with SMTP id
 o128-20020aca5a86000000b00364e91303a9mr9945010oib.49.1674475383364; 
 Mon, 23 Jan 2023 04:03:03 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 s38-20020a05680820a600b0036eafb8eee9sm5326331oiw.22.2023.01.23.04.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 04:03:02 -0800 (PST)
Message-ID: <9ab1e3af-db52-4d55-03e7-263a2f7ae965@ventanamicro.com>
Date: Mon, 23 Jan 2023 09:02:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com, bmeng.cn@gmail.com
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Mon, 23 Jan 2023 12:03:07 -0000



On 1/23/23 00:57, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> If the CSRs and CSR instructions are disabled because the Zicsr
> extension isn't enabled then we want to make sure we don't run any CSR
> instructions in the boot ROM.
> 
> This patches removes the CSR instructions from the reset-vec if the
> extension isn't enabled. We replace the instruction with a NOP instead.
> 
> Note that we don't do this for the SiFive U machine, as we are modelling
> the hardware in that case.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/boot.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..cb27798a25 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>           reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>       }
>   
> +    if (!harts->harts[0].cfg.ext_icsr) {
> +        /*
> +         * The Zicsr extension has been disabled, so let's ensure we don't
> +         * run the CSR instruction. Let's fill the address with a non
> +         * compressed nop.
> +         */
> +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> +    }
> +
>       /* copy in the reset vector in little_endian byte order */
>       for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>           reset_vec[i] = cpu_to_le32(reset_vec[i]);

