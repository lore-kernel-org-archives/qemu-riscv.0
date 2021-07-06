Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0ble-0007yZ-P1
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 23:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0blc-0007y5-DR
 for qemu-riscv@nongnu.org; Mon, 05 Jul 2021 23:29:00 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0blY-00018X-Qy
 for qemu-riscv@nongnu.org; Mon, 05 Jul 2021 23:29:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t9so20112986pgn.4
 for <qemu-riscv@nongnu.org>; Mon, 05 Jul 2021 20:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JOnt3A1/5K/T7AlNBRxMffO5L0QoPPkd9jLVQjbhmOI=;
 b=S2MGwfn9s0ZBeamY/Bw7hTqr19eZWz+1a37Ug9HOIn6rtKHcZareq9oT+uzcb83XKK
 xKuDwd4mwqWkjFVk9anGS3t8zInmIBbDfNvyEr4mMNqo3tYC3ES+0NSYNp4ZLnrj+96w
 YsOMZtjgzaJ4RMLFxMGUklUah/HmGtB1tVkLOHxcJm9sKSJehgCkOziZO1ZJcx5OdjRt
 aTJ569r1pzuoMGIEjfp91fsG3R1AQZB4SuKQ4rSS0MhJbc2/SxoCcNkZtd2Ayondjr2D
 tWyVgIxecHZT1rLEVpAROGidqopSS6fpLPGa4HtFDV+c/+zB2PLHCJb5ReAPFjW9D09h
 P4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JOnt3A1/5K/T7AlNBRxMffO5L0QoPPkd9jLVQjbhmOI=;
 b=seFPIDWlnWPB7Qkn/Gm+DnJXaaziqG8/rdxQ3/cvnQOG7N1EKZi6CqeHHSWAcHONar
 /9gP3zU0jUQaAnxjTi3UKcU48AVita8nFAlo9c1qF9OkI66DvozB89sgGAnxrihKJWwJ
 H5Fsh5ZZReFUfcGXvP2wDBIUxKOdDStDvtIbXrm3rtWGEeqb8v6w3ga2dX627+ayIoN9
 WqyedBA+njCszDGqZZjaoXpJFKYCW+PFpn2KTa2YeERMTbLtuJiDZZNUqZbwRBiJIstM
 hfTncz87XzLk10mxM08eWZcVZakWVRyfzbQXNG/TG4SKXrgfRttm6LhvFkH9q4ysIC2z
 1ZHQ==
X-Gm-Message-State: AOAM530XUczFXmN3LQvikoUBP6ItHmGeTsKHtss+kMJVTSkEiG0FCUZ5
 P4SB2J40HBTYs9xs8ju81h3qEwaxG6DzkQ==
X-Google-Smtp-Source: ABdhPJzbO/8mBAwr+liD3QqeM4N7nMPrgcNwwxj9yl6/+hbbUfRLKHK4sgXGRA/Fa+xj5GKaK76W5A==
X-Received: by 2002:a62:8e01:0:b029:31c:9fbf:f0f2 with SMTP id
 k1-20020a628e010000b029031c9fbff0f2mr11774654pfe.50.1625542134472; 
 Mon, 05 Jul 2021 20:28:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j19sm15776121pgm.44.2021.07.05.20.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 20:28:54 -0700 (PDT)
Subject: Re: [PATCH v2] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210705064326.81958-1-kito.cheng@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e31c508-6da0-9a63-aa13-31f9181237e9@linaro.org>
Date: Mon, 5 Jul 2021 20:28:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705064326.81958-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 06 Jul 2021 03:29:01 -0000

On 7/4/21 11:43 PM, Kito Cheng wrote:
> +static uint32_t get_elf_hwcap(void)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
> +    uint32_t hwcap = 0;
> +
> +#define MISA_BIT(EXT) (1 << (EXT - 'A'))
> +#define GET_EXT(EXT)				\
> +    do {					\
> +        if (cpu->env.misa & MISA_BIT(EXT)) {	\
> +            hwcap |= MISA_BIT(EXT);		\
> +        }					\
> +    } while (0)
> +
> +    GET_EXT('I');
> +    GET_EXT('M');
> +    GET_EXT('A');
> +    GET_EXT('F');
> +    GET_EXT('D');
> +    GET_EXT('C');

You're not transforming the bits; there's no reason to be so around-the-bush about this. 
Just use

     uint32_t mask = MISA_BIT('I') | ...
     return cpu->env.misa & mask;


r~

