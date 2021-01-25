Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l45ry-0000J0-SL
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 12:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45rx-0000Ip-Cf; Mon, 25 Jan 2021 12:41:41 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l45rw-0003cl-0n; Mon, 25 Jan 2021 12:41:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id n6so16439524edt.10;
 Mon, 25 Jan 2021 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QwmQx7cK4Lz7cAzOAZ0mmWHJxRMt3hJP9Rlt3kRv+44=;
 b=ssxxYNf9iYUImbukIv8hdc40nPMHSHgAqnZZELBEs6z0uLvMcOFlSvuWshHNOy5gMU
 J1tVMsaWTKiFlzI0C0xAqhtcVcC1RFBVzji9CapsRGt3gUuMtJA4Gt02vAgHLY2ZPKSJ
 q1MsJb5IOZGRuk3YDcXJ+QaaNSeXTHGRu7vI/PqyNycv40OUXMeko7nM3703Ws/8c+xX
 ENXYL9nGyfeK7LAOHy4pT4piK1s91AC+5+jsTwty2LcByEgtGUc/2DphsjMdgub5yFys
 w/Sx3tK9r0XB/WrVzE7Sos6STDXOyNuF8cwwBj8QAIgdXOdE+8VWE+Skm4uNsFOqwDZP
 CxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QwmQx7cK4Lz7cAzOAZ0mmWHJxRMt3hJP9Rlt3kRv+44=;
 b=Zx5ABwySGUmYNrkIl9eENagavl3iasolTNMHrxa9Bcy1MgxBZPdlOtlK1xP8ziAO3X
 UK8kqJ6T8jbbzn7qtQTuvoS8kwknES+JgNYIHNtFUcZHXD42eRwTUsSDcDuE3O8UJkbN
 elpe10i+gmUiI/f5cE6wUHFTOR+sT30RlrLSSq2mIgq1AX1e0GpzZlamFqpAHRlqhA3F
 /cS12FlzKNpPcSK0sIMO1lK3Ho/jEpaVWrWSY5qqtQDjW5bMrD2NuVaCzsOG+LDe6CH3
 TVHxdn1te8vQzDAbDfkQh8OzqjrzBdPI2hKEVARzH4PN3NV8Srn920dyM+uiOJHZowmj
 zJ4g==
X-Gm-Message-State: AOAM530jZAargnTq8TTBeAWkq8CMAcVw7WMIh3Vxvnn8d/NRxnHzdq8M
 mx3qdcxLl+00htE3SwJcv5g=
X-Google-Smtp-Source: ABdhPJyjNBCQGQoCMZft65zvsyUysp6pgy85u1ca+1/KO3LxwoIFQHjbMnwV3DtFafgMwULupLXs7g==
X-Received: by 2002:a05:6402:438d:: with SMTP id
 o13mr1388211edc.135.1611596497362; 
 Mon, 25 Jan 2021 09:41:37 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z13sm11052038edc.73.2021.01.25.09.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:41:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 1/4] hw/riscv: Drop 'struct MemmapEntry'
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
 <20210122122958.12311-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb6cd18b-734a-9fa4-cce7-3b56ab53fddf@amsat.org>
Date: Mon, 25 Jan 2021 18:41:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122122958.12311-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jan 2021 17:41:41 -0000

On 1/22/21 1:29 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is already a MemMapEntry type defined in hwaddr.h. Let's drop
> the RISC-V defined `struct MemmapEntry` and use the existing one.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/riscv/microchip_pfsoc.c |  9 +++------
>  hw/riscv/opentitan.c       |  9 +++------
>  hw/riscv/sifive_e.c        |  9 +++------
>  hw/riscv/sifive_u.c        | 11 ++++-------
>  hw/riscv/spike.c           |  9 +++------
>  hw/riscv/virt.c            |  9 +++------
>  6 files changed, 19 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

