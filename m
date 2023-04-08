Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl0C5-0003NE-IH
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0C4-0003Ma-Ct
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:28:52 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0C2-00070L-2p
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:28:52 -0400
Received: by mail-pl1-x636.google.com with SMTP id 20so2283643plk.10
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680928128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
 b=MdRZm8Ro/NBK+ZlaFLYbQrUYN2G7NnUNCrSk6j3pIm6L3C9s8B9o+imxGmSGFO1rzP
 d0pypolwEj738cVK0dj/1jXeZovZByoSbF65Z8A1frLqrKBbvElXtXUO7UfpZcDEggnu
 Zj780LkQ6RFUEe06TUknN0z7I5YfStsmtefdpa4kylquOHBOyqQeAcnC5sdxXuxfzQfn
 NJ8fbdVCvkTfNgSjuv1y5Q5e2Jee5wZZK4zRajG36MHRr/ISn6kdjjqxtj7avpV06FuJ
 iEhbplpqT2ppeP+DGNa1BTj/fCHzGdZkc24DOYiRoEG45lApg3iyZ+by2C6hsI5BaGk1
 yiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680928128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaLAuZfWT0INTWTTqSFBpSgDjWfPXH5Dgagb/vUcbfw=;
 b=1yn2zlfSgpUC0QmBVwx/AtWmfisg9Mkob+PE8vvvgo8PQTl4/iI469t6N5orji2P4a
 o3UmMaqoZL3m1npta9qwISUG0gE6CFSAQ0eVLIMa6wm7gXP1zrVOS14Egj1L0/lZ5SC7
 SMM5MWQxTgEiLv7xHVYeVbjncTmLJjg1Vl5cCF9RctOgvzY7a8zZOMUVBXFra8KZjONO
 sl0xR0hLJkVcOtqn+2Tpw87I3w3xECAAojht/afsWLYdeybhgfllLOgitg+/AvkrqoAR
 Zgn2OZztaEUBPo5F9bf5At0M6zsukWV860iyryQWIEpNx1bDYEcKZ7MbbmdRtLpMNEiU
 c4lw==
X-Gm-Message-State: AAQBX9dNbfmgt/v5/PJ5ZnXEirVJnZT77ksZelovFjtfyoezj4sIC4R4
 Luv7pullf03jaqOCD9cjTOWMNQ==
X-Google-Smtp-Source: AKy350Y373tHXEam4gJ7xdNJNam89DOSgLnH6QSib2qEnCN3lWhcYsVBGDQfhPVQZwXOZVmZepfL4g==
X-Received: by 2002:a05:6a20:6055:b0:dd:ff4f:b856 with SMTP id
 s21-20020a056a20605500b000ddff4fb856mr4347826pza.26.1680928128276; 
 Fri, 07 Apr 2023 21:28:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a654cc7000000b0050c08fcff4asm3446234pgt.8.2023.04.07.21.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:28:47 -0700 (PDT)
Message-ID: <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
Date: Fri, 7 Apr 2023 21:28:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 04:28:52 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> RFC: The migration part is likely invalid...
> 
> kvmtimer_needed() is defined in target/riscv/machine.c as
> 
>    static bool kvmtimer_needed(void *opaque)
>    {
>        return kvm_enabled();
>    }
> 
> which depends on a host feature.
> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 4 ++++
>   2 files changed, 6 insertions(+)

Yeah, the kvm parts need to be extracted to their own subsection.


r~

