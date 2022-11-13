Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouIhE-0002o2-Qo
	for mharc-qemu-riscv@gnu.org; Sun, 13 Nov 2022 14:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIhC-0002nj-Uc
 for qemu-riscv@nongnu.org; Sun, 13 Nov 2022 14:31:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIh9-0008PU-0p
 for qemu-riscv@nongnu.org; Sun, 13 Nov 2022 14:31:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id a14so13843340wru.5
 for <qemu-riscv@nongnu.org>; Sun, 13 Nov 2022 11:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbY/ZDZqE+HSQGe042aS8XyJBh9UIKPNM+RvT/9PEmc=;
 b=pRAYxzSRLXH0AvUVx1BPmd8S/Th9lBYrbXG+yzXZ2o78EODxvTPU8fC1EJOPt9fopZ
 0DrOKYkYT2oA/OnME1cVe7OxiHTG072/Atn6bKGllDv3tcflLg6NqEakqjlUWLFIYaF/
 X8YRbigqlbsvxUHT77Zmd4zu1jwVMAPmhQZRVhC4QkqkAUsRq8xCBbVWE7RI4CT58g4E
 /OccQkn9hB6gOJ71Xooga92MhIrr6XqmznKgjX348sbbxWcrjHHmRVUz5Kmsgo7tOreF
 dRxfsZTgBSGgPHRNciQL1AAgGkVCLcYnqU3V7x5zgv7Wf10ODOZ/EOOCuF/Bpb7J/UxN
 2hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbY/ZDZqE+HSQGe042aS8XyJBh9UIKPNM+RvT/9PEmc=;
 b=CqhBhQpQje2ZiDB3XJV/BKYyNoanznBh0LUAtPmbiJ4yXY9G98LeeGKxHA5olpWy9W
 N+t0mlZcPeff/Yd2Kw7XAuIgUEEWD0jqlp3S6JAXHEGn2FFi1ksDpjt+fBGqr9iUz2xC
 5J5JSssN85eM5iie3MPu8G69UZpDyPBkE5Oy20EKyjCLkiN4oL1fqvrB7ZPKsEHNSDDo
 OWCaABTBHxdKId59eILwjFLaf2uvDvGuEZDdj8zKMqryC46zWpiML49IYVCvMVdcX0Y9
 UMBH4KGTCxCy/lljJLjgqVMsxHW77pIOQa6mgGca+vEavbJTTtMc9s5zwkgW0SwmiCmT
 q2EQ==
X-Gm-Message-State: ANoB5plUWAwzzAMYjgNbkTHIqHK0eWjNczpjGVyWBm/MqZzYmWB+ooUl
 rKBGtSNwVXYfDF+X8B3FXAZwWQ==
X-Google-Smtp-Source: AA0mqf5tbuvudDUcBuJZr7cu10/Hv30N42AqqX+WBmWPrar6zpL7b00mQObO8/OwepmfWh1N2fb04Q==
X-Received: by 2002:a05:6000:1208:b0:238:fb27:fb53 with SMTP id
 e8-20020a056000120800b00238fb27fb53mr5452384wrx.203.1668367860885; 
 Sun, 13 Nov 2022 11:31:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adff5d0000000b002383edcde09sm7542103wrp.59.2022.11.13.11.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:30:50 -0800 (PST)
Message-ID: <ded28709-24c7-0e41-f507-277fccfbfecf@linaro.org>
Date: Sun, 13 Nov 2022 20:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] hw/{misc, riscv}: pfsoc: add system controller as
 unimplemented
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20221112133414.262448-1-conor@kernel.org>
 <20221112133414.262448-4-conor@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221112133414.262448-4-conor@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 13 Nov 2022 19:31:11 -0000

Hi Conor,

On 12/11/22 14:34, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The system controller on PolarFire SoC is access via a mailbox. The
> control registers for this mailbox lie in the "IOSCB" region & the
> interrupt is cleared via write to the "SYSREG" region. It also has a
> QSPI controller, usually connected to a flash chip, that is used for
> storing FPGA bitstreams and used for In-Application Programming (IAP).
> 
> Linux has an implementation of the system controller, through which the
> hwrng is accessed, leading to load/store access faults.
> 
> Add the QSPI as unimplemented and a very basic (effectively
> unimplemented) version of the system controller's mailbox. Rather than
> purely marking the regions as unimplemented, service the mailbox
> requests by reporting failures and raising the interrupt so a guest can
> better handle the lack of support.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   hw/misc/mchp_pfsoc_ioscb.c          | 59 ++++++++++++++++++++++++++++-
>   hw/misc/mchp_pfsoc_sysreg.c         | 19 ++++++++--
>   hw/riscv/microchip_pfsoc.c          |  6 +++
>   include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
>   include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
>   include/hw/riscv/microchip_pfsoc.h  |  1 +
>   6 files changed, 83 insertions(+), 6 deletions(-)

> @@ -52,10 +54,18 @@ static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
>   static void mchp_pfsoc_sysreg_write(void *opaque, hwaddr offset,
>                                       uint64_t value, unsigned size)
>   {
> -    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> -                  "(size %d, value 0x%" PRIx64
> -                  ", offset 0x%" HWADDR_PRIx ")\n",
> -                  __func__, size, value, offset);
> +    MchpPfSoCSysregState *s = opaque;
> +    qemu_irq_lower(s->irq);

Is this always lowered IRQ line wanted? ...

> +    switch (offset) {
> +    case MESSAGE_INT:
> +        qemu_irq_lower(s->irq);

... since we do it here.

> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> +                      "(size %d, value 0x%" PRIx64
> +                      ", offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, value, offset);
> +    }
>   }


