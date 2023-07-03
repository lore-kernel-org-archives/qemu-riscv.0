Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B3BEB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 22:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGS9G-0008TY-NE; Mon, 03 Jul 2023 18:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qGS9F-0008T7-Vd
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 18:35:57 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qGS9E-00043I-9z
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 18:35:57 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39e86b3da52so3142152b6e.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688423755; x=1691015755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CMsuXGK8sere5b+TkB5xqAmEaD2T/hwmsz+mMno/k0I=;
 b=GMxk4UnspfqFWX2hkmdLht0jT8O3tKA6NAsFDCrtQn6IQImKF5bkSJwd4KPhAdqWto
 5a2/YVa82RrTXCtXT35Z6zxkqiNuAAYTmnTy2KmEeluOgciw/W0zZKxgdWw56YpeG897
 AlRFKx3slAHo5aZJ6wJ6XftPmwBy1JDPXmA++r0+iydJkU4dFMg54as2i1EN8nqBHjfs
 ZBY2TDcfBUcO2JLf/0v8MmrTE2U6ji14Y/jciWVWS7j6PXqn/lviTfkDDZyMPIaWl9Ou
 nnR/wIoe2wCy8hTIYUuAi492VLGGq8e2SgXQpY2gsKjBtM1MUQCJfC56jJB5lIcVeD4d
 T/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688423755; x=1691015755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMsuXGK8sere5b+TkB5xqAmEaD2T/hwmsz+mMno/k0I=;
 b=ibsXSkZhkEHRmLZRDzz1yoVIsxsW3oaVcO11oEAsYMt/2xYcXMiY6OpCidoHx+NiSQ
 A7FM6al1yMbMbBa/CDJh7N+V1f8sF90FWeuKn58QhqOWM4LxlQtLPRwHOOZwLbUvBU1N
 DrRTV8e3oxO18SYNElrLSlmShg2VJjDjV5nfYWWPYYec+hPNu+YSH90IPTMvbvRDYX+X
 9I3pPCVnxkp+xMRg5HcZvnMkT//qmRemQNF0ZArDQMIn3P1PEPOvLwFaZ4HXFmAf3Lz/
 ySIP6OSciIUCRpk7F9+cl2cquJczTpTkb6cbtmP6j4fsXAGmV8q3AtYdzasCyfiMXE+P
 Td/g==
X-Gm-Message-State: ABy/qLYIQkLD0j+aqQpftEZYuMp95LWiWFPIoMppEp7r6vM7gSyzRYxS
 aWxAsNMK4uaB/eBZZ9qPUfTvLA==
X-Google-Smtp-Source: APBJJlFi3Nb5RnzjEkfTX06QRBxOYPXEwmjlt8vntIkyPIm6kMV1h63/EA6CtRv9JvjT+OEQJzavZw==
X-Received: by 2002:a05:6808:1a17:b0:3a3:9b4a:3959 with SMTP id
 bk23-20020a0568081a1700b003a39b4a3959mr3869214oib.17.1688423754768; 
 Mon, 03 Jul 2023 15:35:54 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 m10-20020a0568080f0a00b003a390ca26aasm2988751oiw.5.2023.07.03.15.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 15:35:54 -0700 (PDT)
Message-ID: <db92935e-fd9a-32e9-09d4-052da4e5e61a@ventanamicro.com>
Date: Mon, 3 Jul 2023 19:35:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] riscv: Generate devicetree only after machine
 initialization is complete
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair23@gmail.com>
References: <20230703034614.3909079-1-linux@roeck-us.net>
 <399a2293-85c2-c709-91ee-8eef1f59a5e4@ventanamicro.com>
 <48537c03-786a-e85b-7db3-ab69939de7ab@roeck-us.net>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <48537c03-786a-e85b-7db3-ab69939de7ab@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/3/23 18:18, Guenter Roeck wrote:
> On 7/3/23 12:25, Daniel Henrique Barboza wrote:
>> On 7/3/23 00:46, Guenter Roeck wrote:
>>> If the devicetree is created before machine initialization is complete,
>>> it misses dynamic devices. Specifically, the tpm device is not added
>>> to the devicetree file and is therefore not instantiated in Linux.
>>> Create devicetree in virt_machine_done() to solve the problem.
>>>
>>> Cc: Alistair Francis <alistair23@gmail.com>
>>> Fixes: 325b7c4e75 hw/riscv: Enable TPM backends
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>>   hw/riscv/virt.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index ed4c27487e..08876284f5 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -1248,6 +1248,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>>       uint64_t kernel_entry = 0;
>>>       BlockBackend *pflash_blk0;
>>> +    /* create devicetree if not provided */
>>> +    if (!machine->dtb) {
>>> +        create_fdt(s, memmap);
>>> +    }
>>> +
>>
>> I suggest moving the entire load/create DT code from virt_machine_init() to
>> the start of virt_machine_done():
>>
>>      /* load/create device tree */
>>      if (machine->dtb) {
>>          machine->fdt = load_device_tree(machine->dtb, &s->fdt_size);
>>          if (!machine->fdt) {
>>              error_report("load_device_tree() failed");
>>              exit(1);
>>          }
>>      } else {
>>          create_fdt(s, memmap);
>>      }
>>
>> This way we don't have to look in to 2 different functions to wonder what happens
>> in case machine->dtb is NULL.
>>
> 
> I can do that, but I don't know how to test it. Is there a working dtb/machine
> combination for riscv which would let me test loading a devicetree file ?

I recommend using your own setup with TPM (I'm assuming you're using a TPM setup),
generate a .dtb from it, and then launch it using '-dtb'.

First you need the patch applied (otherwise there won't be a TPM in the FDT).
After that, relaunch the same machine again but appending in the end of the
command line:

-machine dumpdtb=file.dtb

This will create a 'file.dtb' file in the working dir and exit. After that re-launch
the machine again but now append:

-dtb file.dtb

And you should be able to boot a 'virt' machine with TPM support.


Thanks,

Daniel



> 
> Guenter
> 

