Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1787C5B552
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 07:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMibx-0006Jo-MW; Wed, 04 Jun 2025 03:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uMibt-0006Fd-3g
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 03:32:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uMibq-0000Zd-6N
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 03:32:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so3744457f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749022343; x=1749627143; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hX5exDHvsrNCe3lqwmwm9tSNa2K33OQw4bgyz2Rrz7k=;
 b=lYBxH7xEcXRzdTyBgrRxNJ31rHWczX5tzu0Jjiq8DmrBqiywHr3zPiGpRP9lZQdSk3
 9/iU97i8t9UZog6C+l9wq2VLxwrEza3xrG8NMDD5aAqyBQlVAzHME8rpY7zqsmKzsgc6
 ExovabrYTZcwEZ/FXkNHyMe99q1iYTLsBch3igq3hh/ZI8LKxHSWyf7uXwnlBMr5kN/g
 HtQxM4sGz2j/sjhnvFyeLiJ0UxMlGYXeR37oG+6kobY6XwCpA0CzrAsTZzckaEO/b7jH
 8fNpdeVtufsguI9v796cpmJ30NTu/bipQl70GMF0HvJAKWE4ZVik3CzobmQ39LwnIWZM
 bbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749022343; x=1749627143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hX5exDHvsrNCe3lqwmwm9tSNa2K33OQw4bgyz2Rrz7k=;
 b=rPsH8GoJO99fTBGDaMSW0+fleh/QFSvtSqiWp0W3gcx6j/BvTgU6rX6amqsIoy3gPA
 vvZOelDgSltIFzjB3vTPg9KwX5Jo396Zcp4VbnFx8mDhT4xKj6AvlRgD4G+xDfTkArRr
 AkFuq3fBlqhrzbdTqgon7K1CKMd/5zul8hHI6jyM3xkxQvZaiyk+h+Yledt4MB5gk/Bw
 xkkMhlqXudzLwaFbtXBJPEvzLZ6eTFi/fEGfDoo3fbL9x9XBqwzJMHGGRTE78Dr7oWa7
 1D4AWMwhXn2cUOZvWXP89tY6+w1LjSTnoec1hhAcrVdMYkQgNDNCfuA3MfN7Ltjh7LK2
 bIig==
X-Gm-Message-State: AOJu0YyD8ypaV3BVwg7840sTYFfzxU4jwu31Qy96KSEGlrgit4IEOtWL
 RxzYCx3vYEMuodhJcy74K5+PCSXd6KdoLveSqkfXerppiFjrX6vRfcGcwHHrVavRC0c=
X-Gm-Gg: ASbGnctjXm+WoRVFW4aA653JdeUhyh2bkEqWmgApAvCiFBcwP1MlB4H4B+wNyG5JxdK
 yGhCoAsXA3a34/BtfAk/98/XgQvWd++fX7/2gZIOxbXzEaC2XZZ0BaFbzRp2zjHJCogH1+WIf4h
 1LskWlxW+IQoCSnSKqO3SUrO6ccrRzhcl7Rc7niLhmldAlVmqCKKFkr2KwTIAIKJOAg+V5P354i
 ENKq33DihMFe1zFSg5N72d8ml4S53Sha8RljP3HvBa7hiRob+StwMChePaosN9qi2QIsa1JgzBL
 Koa6YACminrujZR51UJw6ji7ghTbaelKh7Lw2lkcFJ4s+sa/yTIUxwOEu/6tVlWdE0yQnhTMit5
 LKaoZAAMcI8YQW6pIWdfB6yivWKVNnw==
X-Google-Smtp-Source: AGHT+IHoWSKY9LviuZT2ziMJVhUoH5WqOg/p+yviLcwWiXdpI5UMLpUenRi9/8Ig/Xa4fOY6m27B9A==
X-Received: by 2002:a05:6000:2888:b0:3a4:f6cc:a8c8 with SMTP id
 ffacd0b85a97d-3a51d9827b0mr1194935f8f.51.1749022343236; 
 Wed, 04 Jun 2025 00:32:23 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f0097539sm21212778f8f.63.2025.06.04.00.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 00:32:22 -0700 (PDT)
Message-ID: <47327da2-be3c-4aaa-ab3d-36e8d0c25185@linaro.org>
Date: Wed, 4 Jun 2025 09:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm: implement SBI debug console (DBCN) calls
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240425155012.581366-1-dbarboza@ventanamicro.com>
 <eb6bd3d7-c66b-4300-9573-c29830a3aff4@linaro.org>
 <102e2e67-4c4d-4912-a892-20f5136f241a@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <102e2e67-4c4d-4912-a892-20f5136f241a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 3/6/25 20:04, Daniel Henrique Barboza wrote:
> 
> 
> On 6/3/25 10:19 AM, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> (now merged as commit a6b53378f537)
>>
>> On 25/4/24 17:50, Daniel Henrique Barboza wrote:
>>> SBI defines a Debug Console extension "DBCN" that will, in time, replace
>>> the legacy console putchar and getchar SBI extensions.
>>>
>>> The appeal of the DBCN extension is that it allows multiple bytes to be
>>> read/written in the SBI console in a single SBI call.
>>>
>>> As far as KVM goes, the DBCN calls are forwarded by an in-kernel KVM
>>> module to userspace. But this will only happens if the KVM module
>>> actually supports this SBI extension and we activate it.
>>>
>>> We'll check for DBCN support during init time, checking if get-reg-list
>>> is advertising KVM_RISCV_SBI_EXT_DBCN. In that case, we'll enable it via
>>> kvm_set_one_reg() during kvm_arch_init_vcpu().
>>>
>>> Finally, change kvm_riscv_handle_sbi() to handle the incoming calls for
>>> SBI_EXT_DBCN, reading and writing as required.
>>>
>>> A simple KVM guest with 'earlycon=sbi', running in an emulated RISC-V
>>> host, takes around 20 seconds to boot without using DBCN. With this
>>> patch we're taking around 14 seconds to boot due to the speed-up in the
>>> terminal output.  There's no change in boot time if the guest isn't
>>> using earlycon.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   target/riscv/kvm/kvm-cpu.c         | 111 +++++++++++++++++++++++++++++
>>>   target/riscv/sbi_ecall_interface.h |  17 +++++
>>>   2 files changed, 128 insertions(+)
>>
>>
>>> +static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run 
>>> *run)
>>> +{
>>> +    g_autofree uint8_t *buf = NULL;
>>> +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> +    target_ulong num_bytes;
>>> +    uint64_t addr;
>>> +    unsigned char ch;
>>> +    int ret;
>>> +
>>> +    switch (run->riscv_sbi.function_id) {
>>> +    case SBI_EXT_DBCN_CONSOLE_READ:
>>> +    case SBI_EXT_DBCN_CONSOLE_WRITE:
>>> +        num_bytes = run->riscv_sbi.args[0];
>>> +
>>> +        if (num_bytes == 0) {
>>> +            run->riscv_sbi.ret[0] = SBI_SUCCESS;
>>> +            run->riscv_sbi.ret[1] = 0;
>>> +            break;
>>> +        }
>>> +
>>> +        addr = run->riscv_sbi.args[1];
>>> +
>>> +        /*
>>> +         * Handle the case where a 32 bit CPU is running in a
>>> +         * 64 bit addressing env.
>>> +         */
>>> +        if (riscv_cpu_mxl(&cpu->env) == MXL_RV32) {
>>> +            addr |= (uint64_t)run->riscv_sbi.args[2] << 32;
>>> +        }
>>> +
>>> +        buf = g_malloc0(num_bytes);
>>> +
>>> +        if (run->riscv_sbi.function_id == SBI_EXT_DBCN_CONSOLE_READ) {
>>> +            ret = qemu_chr_fe_read_all(serial_hd(0)->be, buf, 
>>> num_bytes);
>>> +            if (ret < 0) {
>>> +                error_report("SBI_EXT_DBCN_CONSOLE_READ: error when "
>>> +                             "reading chardev");
>>> +                exit(1);
>>> +            }
>>> +
>>> +            cpu_physical_memory_write(addr, buf, ret);
>>> +        } else {
>>> +            cpu_physical_memory_read(addr, buf, num_bytes);
>>> +
>>> +            ret = qemu_chr_fe_write_all(serial_hd(0)->be, buf, 
>>> num_bytes);
>>> +            if (ret < 0) {
>>> +                error_report("SBI_EXT_DBCN_CONSOLE_WRITE: error when "
>>> +                             "writing chardev");
>>> +                exit(1);
>>> +            }
>>> +        }
>>> +
>>> +        run->riscv_sbi.ret[0] = SBI_SUCCESS;
>>> +        run->riscv_sbi.ret[1] = ret;
>>> +        break;
>>> +    case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
>>> +        ch = run->riscv_sbi.args[0];
>>> +        ret = qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
>>> +
>>> +        if (ret < 0) {
>>> +            error_report("SBI_EXT_DBCN_CONSOLE_WRITE_BYTE: error when "
>>> +                         "writing chardev");
>>> +            exit(1);
>>> +        }
>>
>> We are ignoring partial writes (non-blocking call returning 0 byte
>> written), is that expected? If so, is it OK to add a comment we can
>> safely discard not-yet-written DBCN_CONSOLE_WRITE_BYTE?
> 
> Not sure what you meant. IIUC qemu_chr_fe_write() returns the number
> of bytes consumed, 0 if no chardev is found, and -1 on error.

I'm trying to address an issue Peter reported with qemu_chr_fe_write():
https://lore.kernel.org/qemu-devel/CAFEAcA_kEndvNtw4EHySXWwQPoGs029yAzZGGBcV=zGHaj7KUQ@mail.gmail.com/

Basically upon introduction in commit cd18720a294 in 2013
("char: introduce a blocking version of qemu_chr_fe_write") the API
contract was "Returns: the number of bytes consumed" which could be 0,
so some frontends return 0 for "wrote no bytes".

Later in 2016 in commit fa394ed6257 ("char: make some qemu_chr_fe
skip if no driver") the API documentation was changed:

- * Returns: the number of bytes consumed
+ * Returns: the number of bytes consumed (0 if no assicated CharDriver)

After this commit, some frontends started to handle '<=0' as error,
while 0 is not an error.

> Are you
> saying that we should do a loop when there's no chardev found (ret = 0)
> and wait a certain time until there's one available?
> 
> 
> In fact, seeing how SBI_EXT_DBCN_CONSOLE_WRITE is written, I wonder if
> we could use qemu_chr_fe_write_all() in this case too.

This is certainly simpler.

Regards,

Phil.

