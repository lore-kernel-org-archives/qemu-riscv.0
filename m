Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1sdJ-0007Jc-Nf
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 11:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sdI-0007GD-Nu
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:41:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sdF-00049x-01
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:41:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id f17so9049295pfj.8
 for <qemu-riscv@nongnu.org>; Fri, 09 Jul 2021 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4v8uuXx7owcu1oFKQhHcumDEPDjJvDExy16MWPDG2Sk=;
 b=KgQyZ3RjMXpOmS1OUa8mB0H70XrvXR1Tulu810aPaST/Ci5eB3GY8n+fjS2Vx/d1mC
 Qq45GFiO0RhKoGfdEsPVrHO2xIsA22qvFFO8UycAW2M/11/6nEBQkkTMh0NDnedGOmGn
 xGl7LFuuAeeS1APKyqVDD/v5bF1Y7GFIACBIOD5M3a2MX6kA0aaCDQOdFvx7HrxD1qZX
 HiSWiFfFPgYA06XIF2nEcGkv9r/72EYEOEpWjI2vcKGMp59d3I3gwpJTAgyPKFU/S9rP
 QXV9eWcvrT3g4sUEj9nYRvpRe3A/ucBi6FSvIQgMU3Bfqp2vObSXv6pPGY8x0CpWxf+c
 2DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4v8uuXx7owcu1oFKQhHcumDEPDjJvDExy16MWPDG2Sk=;
 b=GRwyzq6a2JvfeVBSV9+pw9msDIgIA7xY+HsB1UiSurzqT3Jucx8aeOtpYSV+aVHnqO
 +xpgLX9DMdeivIZGC5pUYwuOvgwrVcjh5fH+h/1tsc93YoocL2gS9tH6bbld5XPWfVX9
 DQM/xhMrutYqwzDn3wZP3Jco5zMAhp9Q3OJAAAlIotq8st9vwnxqiClPJ8pLSjlgkox+
 Fzk5xobIY+UikgXYTU6TFmkXHD+BEsr1NpZ+2dLhsa1aNACT8XmvKQ02zmmnFdRfFPsJ
 Y8eZpYm1n5+7qTyBXtGHQe5F0QA+zL2nM36MOTH1z48EZSKEJ/1KIfwCKQD4Oexd3q1e
 xn0w==
X-Gm-Message-State: AOAM5321n+AW3/ndS2ekzuHV7MUpBx1HYZ3VEm8h8pZNahbcMNjLMm11
 vWaqRobpX2SgwHtgUCorsb/2PQ==
X-Google-Smtp-Source: ABdhPJxpSicTWjdfqZtJH9cFdypRRdACTFRXX8NlgTaXMfG0q4kiVt+3F6CGgrXbrEjR3R1axQC6+g==
X-Received: by 2002:a63:d852:: with SMTP id k18mr39501602pgj.290.1625845295584; 
 Fri, 09 Jul 2021 08:41:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 31sm7703132pgu.17.2021.07.09.08.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:41:35 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] hw/intc: sifive_plic: Convert the PLIC to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8dd50fa9-2728-c60b-d29e-dd5d0fe7ddee@linaro.org>
Date: Fri, 9 Jul 2021 08:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5f2909ca7fd9637ad90da0be9661f1e718e3dc5.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 15:41:41 -0000

On 7/8/21 8:31 PM, Alistair Francis wrote:
>           switch (mode) {
>           case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->m_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->m_external_irqs[hartid]);
> +            }
>               break;
>           case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            if (level) {
> +                qemu_irq_raise(plic->s_external_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(plic->s_external_irqs[hartid]);
> +            }
>               break;

qemu_irq_set.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

