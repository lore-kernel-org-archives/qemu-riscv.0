Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33E4C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 21:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGQw0-00028y-Bg; Mon, 03 Jul 2023 17:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGQvy-00028l-Kp; Mon, 03 Jul 2023 17:18:10 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1qGQvw-0003jq-NT; Mon, 03 Jul 2023 17:18:10 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bd77424c886so5629727276.0; 
 Mon, 03 Jul 2023 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688419087; x=1691011087;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OiGVhNACu6wLZYWtciXM0K64IhZldeEah0ukz/zlWKY=;
 b=BQP0WK0C4FAChbSfa+oNzrGSfz9IMedw2CuNM4m3xLPrthfM6oxTT4mOAdSW8vCrKd
 sC5CFqpBI8WAd7JpojxdkUYF5+vDWCNTYrTRMgx3Wrmdy7/I7+6fbnuqWILoca/uOFvQ
 YWWleDf2as0eUL1ND98+pylGvFKixV6olPmYcnrdyWj2PUopCE71QhxMYnjfzpcRnZNX
 nkZ1LN/nQ8VpB7rULshwqjARLxEum8KLjTc80pM+kMFFInASkSS9T8bOQ6MMHkTIJGl8
 nmh70bvtc3KH0fSQtR/1iD6Eez09uf6QWmMvdjn0xttq9yi2++DixVOejDnJq8Wl89n6
 kQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688419087; x=1691011087;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OiGVhNACu6wLZYWtciXM0K64IhZldeEah0ukz/zlWKY=;
 b=lbWACYsjYIxIzxjztcHkyXOptc6NcIYiRRNXE3WUWK9eIl7AbM+m14tQg+SXKZhUxC
 nDEz5PGy5m6GfsWd/ydQWhgXHnzXGrau0sWsPlXgmFkdmb/mTu6e5h1E3Qu7q66BCmsL
 3yUPWlwOBkR2PhKm+YakrWit9ok0ymOJVj9EdpJX0ghwgpse/KP8TpxoSCmBWNfn5AR5
 66OmYrxEq+uc6EVx509c4sQSnZAhrb2H/NjVRMa94TKAZYY1lq0Dyu6o8LWCaXyo7ygV
 mRsSHINeFyu4a6XGy8C3nOsd/v9eQKSiaRnNb4C1dKcFUygHTqeg2RrPca9hh9bywtUz
 1QuQ==
X-Gm-Message-State: ABy/qLaDzhU215O9BqKJzmMPMQRGI4pZrh5NDiVnK+sUST0Ghe+L21Nt
 9n0hg5+FuFGzsdmiEQtreZA=
X-Google-Smtp-Source: APBJJlHIlae/v/FOIEg4E7kYTflliq5Fdd+xadzvXDC1ebubgBgCgV7SJtow+S0DVlhp+J0kWMmCrw==
X-Received: by 2002:a25:ab4c:0:b0:c24:4536:1723 with SMTP id
 u70-20020a25ab4c000000b00c2445361723mr12682238ybi.26.1688419087233; 
 Mon, 03 Jul 2023 14:18:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f32-20020a25b0a0000000b00bc501a1b062sm4629732ybj.42.2023.07.03.14.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 14:18:06 -0700 (PDT)
Message-ID: <48537c03-786a-e85b-7db3-ab69939de7ab@roeck-us.net>
Date: Mon, 3 Jul 2023 14:18:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair23@gmail.com>
References: <20230703034614.3909079-1-linux@roeck-us.net>
 <399a2293-85c2-c709-91ee-8eef1f59a5e4@ventanamicro.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] riscv: Generate devicetree only after machine
 initialization is complete
In-Reply-To: <399a2293-85c2-c709-91ee-8eef1f59a5e4@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=groeck7@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/3/23 12:25, Daniel Henrique Barboza wrote:
> On 7/3/23 00:46, Guenter Roeck wrote:
>> If the devicetree is created before machine initialization is complete,
>> it misses dynamic devices. Specifically, the tpm device is not added
>> to the devicetree file and is therefore not instantiated in Linux.
>> Create devicetree in virt_machine_done() to solve the problem.
>>
>> Cc: Alistair Francis <alistair23@gmail.com>
>> Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/riscv/virt.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index ed4c27487e..08876284f5 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1248,6 +1248,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>       uint64_t kernel_entry = 0;
>>       BlockBackend *pflash_blk0;
>> +    /* create devicetree if not provided */
>> +    if (!machine->dtb) {
>> +        create_fdt(s, memmap);
>> +    }
>> +
> 
> I suggest moving the entire load/create DT code from virt_machine_init() to
> the start of virt_machine_done():
> 
>      /* load/create device tree */
>      if (machine->dtb) {
>          machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
>          if (!machine->fdt) {
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
>      } else {
>          create_fdt(s, memmap);
>      }
> 
> This way we don't have to look in to 2 different functions to wonder what happens
> in case machine->dtb is NULL.
> 

I can do that, but I don't know how to test it. Is there a working dtb/machine
combination for riscv which would let me test loading a devicetree file ?

Guenter


