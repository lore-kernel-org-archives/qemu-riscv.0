Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1sbQ-00046s-SN
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 11:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sbQ-00046f-2z
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:39:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sbO-0003K1-H7
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:39:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j9so3377086pfc.5
 for <qemu-riscv@nongnu.org>; Fri, 09 Jul 2021 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NFwnakV+V8OJ3JgO/gtSFRQvUYspz8I5OlFkrdejyf4=;
 b=ro45QXng6uvPBFdkzTluL2ZYnUZDc9kZbDmWtzn0Or+RPqh88wPQ04KE3BbkXlkdpO
 7EwY6JD/2HckfYOzHrrwm4IRdOJWmHoyvfXLmVHpFSexJI9db+tHHWBXRFy9UB9u5zzU
 R+esfgtwSN97mbwnTYEvbnZV5ThrkqbUiN2gRY3N+pj4if1CZ1WHrteauQGH/vZCc/N8
 S0KCVSOgRAHgrF1ajxbS4bfvF9QxKZEbH5U3TPcwxXxw4lbUJJC023T4eZXirvxQfZZm
 lDKg6c+iBh5/aBVSjuWtmIPYY7y92U2M+JgsQq0oyqiJ6gypBnp7KBXbw3QZSNRZSr90
 50pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NFwnakV+V8OJ3JgO/gtSFRQvUYspz8I5OlFkrdejyf4=;
 b=JMFwTa6pB92xXY+ia1Odt2OaNUyRfUbX7qSUgPWyB+6JcMvWGADnhKa0P/nMNdbz2Z
 txk9TNOymqXHD55TAKaHBCrGLkSnBjeufa2NOab/DpAIRAGm3bQLTweF3YW5bHabktpJ
 8tO2o4Tsf4Fdf7BLUjpyoKzr+udQjbEy9L1vAEF+6XDJsEN4zYnRRLg7wIaE39MuTZC+
 62oIaraurF/OlPxKRoLURFsc6qyfiW84ZqOQa8VpbhOTyznpJbamgn6cITgH9Wohb8vO
 LaulHE0x7W3US66FuUCfBlQtDSbB1PxazTlzYewJwaRneGyv3U6gM9WhOT+psGkWwi9z
 m2EA==
X-Gm-Message-State: AOAM532GfqP6TLolRJEOO1hKxPQD6b9m3kkTMFz/ES92afn4kcqJ3M7I
 6QQ8xOBl8m8IcPIrKgThuI2FJg==
X-Google-Smtp-Source: ABdhPJwSk0con1yOr4DsHN2/sznqu+3oJQz66X8AJaC1RrwH9jQAqxYWcVLm/WRED/22oL3diWab/w==
X-Received: by 2002:a63:1041:: with SMTP id 1mr22052422pgq.274.1625845177278; 
 Fri, 09 Jul 2021 08:39:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id ck22sm6028119pjb.26.2021.07.09.08.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:39:37 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3e762b0-54d7-6d02-9878-6588196de0c2@linaro.org>
Date: Fri, 9 Jul 2021 08:39:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 15:39:44 -0000

On 7/8/21 8:31 PM, Alistair Francis wrote:
> +        if (ibex_plic_irqs_pending(s, 0)) {
> +            qemu_irq_raise(s->external_irqs[i]);
> +        } else {
> +            qemu_irq_lower(s->external_irqs[i]);
>           }
> -
> -        level = ibex_plic_irqs_pending(s, 0);
> -
> -        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));

Use qemu_irq_set.  Whether you retain the level variable is up to you.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

