Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVDj4-0004rL-2h
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 11:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVDj0-0004o2-QA; Mon, 05 Sep 2022 11:09:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVDix-0006jT-Uq; Mon, 05 Sep 2022 11:09:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 14so72957pfu.9;
 Mon, 05 Sep 2022 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=0YNhSnzan74jkka5r5XL3euO061TUyJ1F5YOcOSilVQ=;
 b=ggRnRbBIvhgn56N6NkhALghJENkH8W8/0Q/E0fV3hZtAgGgfHI+4r+KglPCpjQBbuX
 +8UrZrn0qFGHmt0rROsItsp5HJ4gu7jZo9iuxkGMVe9QwhRl4rGRf+1gFWF7cIC6Zi4g
 TeBerd314BZkgQIzMzgEulRQg+DfMsn6PJY4GmtMjgHCSNmdvVXebsRr/FNCjUAQMzvt
 EAGb00RlXmgTgsvNSL/SXsEXQAJprUCLuPlDGeWt7fAzp1aV3q489pUvUulKTK3aR2B8
 STXxV9Pq1ydkMp8CpNeuG/ozAxwvRpQAJhzc8baRpkz5cOE1z+aqu1/NaKaH54vfvi1F
 Papw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=0YNhSnzan74jkka5r5XL3euO061TUyJ1F5YOcOSilVQ=;
 b=PJEjaxNADoAC2pqVGcuds7UgcN8/Mjiy0EFYP+CD3Iy9ksU2KvLwIaBuPQ7bweHkiI
 brvXa5tnmmbP0FVmsWOFp0R7oWVCF4oky1C6vF+DeFhaGCnwp8mZ6kpK51i/B9wyFX4d
 5Du7M46vQZTXF3ZveOYmu1ZDcTl4EgXuR1jwTWaop84hxiuy0CBIjaktm3o1HMlMmf0X
 nTzJKNeGJhbHNRRAD6kXI7jxi7jqbQiKnjiXaN1HybkOW0eeXq/xb6Lz4M49Uz9lOu5m
 GKi5O/5VqZga8Hkc7rzj3YWyxjWyeZnVTtB3Z+F+op1oaOm+Hq8FhNy7qnKAtzMKNVFl
 w3xQ==
X-Gm-Message-State: ACgBeo319ANrNioj+60flphVPuGIAakkgDtddz5IZIswXyyh3A4U9Jft
 0B25PcS/dGaLHK9tPT1MWxI=
X-Google-Smtp-Source: AA6agR4qcKxAO6pIgQ7p/vzQaoNnQLiadSqE6HmnfjOiotgQE716lKIW8ABkSf0VYoOutM56lC1QGA==
X-Received: by 2002:a63:d30b:0:b0:42b:9ca4:15f4 with SMTP id
 b11-20020a63d30b000000b0042b9ca415f4mr37216441pgg.146.1662390557734; 
 Mon, 05 Sep 2022 08:09:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa79ac9000000b0052d2cd99490sm7863689pfp.5.2022.09.05.08.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:09:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <f24336b7-b862-88d2-7064-21699924ca55@amsat.org>
Date: Mon, 5 Sep 2022 17:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
Content-Language: en-US
To: Tyler Ng <tkng@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 15:09:24 -0000

On 2/9/22 00:50, Tyler Ng wrote:
> Fixes a bug in which the index of the interrupt priority is off by 1.
> For example, using an IRQ number of 3 with a priority of 1 is supposed to set
> plic->source_priority[2] = 1, but instead it sets
> plic->source_priority[3] = 1. When an interrupt is claimed to be
> serviced, it checks the index 2 instead of 3.
> 
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> ---
>   hw/intc/sifive_plic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index af4ae3630e..e75c47300a 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
> addr, uint64_t value,
>       SiFivePLICState *plic = opaque;
> 
>       if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
> 
>           plic->source_priority[irq] = value & 7;
>           sifive_plic_update(plic);
> --
> 2.30.2
> 

What about sifive_plic_read()?

