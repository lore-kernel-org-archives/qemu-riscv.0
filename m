Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1sYM-0001je-Ee
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 11:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sYK-0001fe-M4
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:36:32 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sYI-0001zZ-3L
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:36:32 -0400
Received: by mail-pg1-x536.google.com with SMTP id h4so10324000pgp.5
 for <qemu-riscv@nongnu.org>; Fri, 09 Jul 2021 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSFITZFjRwcnEjdPmjwkwvA2nORbym8nsvSG/06C/Lc=;
 b=EPJ6SV4Fq8i7nZoOqa44fVwuYrPi2dEMyz5rDGTIWhj4vNyUZ+u/fSG/Ze2nev9Nar
 Tp4a9kYgu05XzzqLULAMB1EzkfJS6dlyKobydUcPVDm39acQN6E7mWtcP5tK+eYX8nQX
 op6zKJOhihP/X/NXiKp9kGQiO//mriEhC/xD2y0SwmSqKvnjaljoxYIYmVAaKIzYa5ZI
 wgLrZQE1NNhYq44sYZH5S1iewogjXhiEWGZsXLuXcjL4JiLVINdbntWODAGgBtsQbdpi
 ox0FkTJhLJ5B4PISLn49MRB81lT9jE8Ynku9vxaO+S00XNhUrkyAM7u890Eipa79WPm2
 G+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSFITZFjRwcnEjdPmjwkwvA2nORbym8nsvSG/06C/Lc=;
 b=jQfmorESkEBCJSmHbZEoW4DtkvYuO9QZVsXnCWzNURK6TTcx6KLno1f6bz4LxaLR7i
 Ef3XEGTgy5uGTuUqM6sapk10vzyFtteP26dw2MhkKxc/MM3F12zwMp7rE+v5QL+ettqr
 cYWJ+dTRXBeuiavFoMNcVo2JGU+remY+W3NarqWc4OyZTAT7udgGHIvNF5SeU3qLxPBK
 vj/RgCiZKJUPjU7y09hTxQr5KVTQcHzr6cGFyQdSg56Mp3597AfHhl+AqimJtLfQckdP
 rkhZpS1nGke3Ww7KM/VEOv17P+k7skVL/WIrOCny9I3WNUPq7BgwbiOsgGsjZ4GAe1B/
 BZkQ==
X-Gm-Message-State: AOAM5301gkAD8xr2wUtuMeIpbnLSy1w7SWXHhj1Lr498iGreol5HrMFk
 hviRVxkwzZqEGb2XyqYtHcyseA==
X-Google-Smtp-Source: ABdhPJzcobLm+m3Js6mAWH9FR4SrHx8zoCwsZLlpEeWQ2cADMLH85Ev1FlLvOW6eA4nOU0IErqp84g==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr38908258pgh.255.1625844988672; 
 Fri, 09 Jul 2021 08:36:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t6sm13043993pjo.4.2021.07.09.08.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:36:28 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaa5d8dd-d161-684e-4204-e5bb60a2627b@linaro.org>
Date: Fri, 9 Jul 2021 08:36:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 15:36:32 -0000

On 7/8/21 8:30 PM, Alistair Francis wrote:
> +typedef struct sifive_clint_callback {
> +    SiFiveCLINTState *s;
> +    int num;
> +} sifive_clint_callback;

Perhaps better to put "num", perhaps with a more descriptive name (hartid?), into 
SiFiveCLINTState itself?

It would avoid some amount of double-indirection, and some awkward memory allocation in 
sifive_clint_create.


>           } else if ((addr & 0x3) == 0) {
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> +            if (value) {
> +                qemu_irq_raise(clint->soft_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(clint->soft_irqs[hartid]);
> +            }

You should use qemu_irq_set here.


r~

