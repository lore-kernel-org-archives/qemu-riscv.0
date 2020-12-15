Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpHpC-0003fN-2t
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 16:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpHpA-0003aX-Hr
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 16:25:36 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpHp7-0004ZQ-Bh
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 16:25:35 -0500
Received: by mail-ot1-x344.google.com with SMTP id j20so16390317otq.5
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 13:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K7Hf7CHiG+ksmRY7TLY84Bzu+9ngTwNPS8p7emRz68Q=;
 b=yZRIZculAj2FRRGCOMXSqgI2inVgDIKrL4TDMXaJM4CnbgV1plWZBin6Oi3yWYnguj
 tn/oYQ9rKvu1ZmgYGo5A0tW1l/cl3L6PJuxnblezG80+umyClARwhMxpQu2u39BrdxRp
 cW9gpa3J55GeQFwdxCs3IqB60aZQbLFoVdj1CmenKVCd7kSdcDCGCM8DDlTnqLdHlZZJ
 doSI7y4wkl1KRE1wCvRO5oP1izJ6J9pHHd66OGiTWl2I5vvhx9XnDOQrxIapZpR/Y+G4
 ftL8jD4EVBR3aO9mSrm77G7FNM3wSgk/+kiodINjM17dUXwjkQjo4dBxSLS/cF5oZMIK
 LKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K7Hf7CHiG+ksmRY7TLY84Bzu+9ngTwNPS8p7emRz68Q=;
 b=YDZEsTiHuZxQ8AEujwosRxSDqjesJE4xdKEZEyM7Jmzb4JMDlpVT0pptc3C6max7P/
 HhYl+VNqLgvd3sVk/kyM7T48aZwCh+o9QpFRZxDZsGsD7+cAZPuENtDclkaAttwMZ9EI
 w4c4wQU9wg2iTPgkvpufYNl8rlATAwUyywkSTiUTIcARQ/7CrF5cut9omiAqBAXU2buD
 +8ootKF7rOOriaagdIQJ5TOdffrsZkraceEUN52tHMOv5nPLXanCBPs+f6nxURgn5Oug
 qkG6SgFEAOA8ycUfXxxkxcXgOtevMSrv2/FhyS5mJiohcrfOVaOiJuhnWmpKO8hGaikW
 dV/g==
X-Gm-Message-State: AOAM530fozfIeUd3dD61gQxlanYgfCsUE6SGcIJm5OGtamuCYlZhf/DD
 Es2pMSWTrtNiG4GOe0Pkl6KjcQ==
X-Google-Smtp-Source: ABdhPJzUU76RaBQ1c/UR+Z1Wn+90ylcKQgc4K4FJdElpdbzPOZoElqyJgIksxILoNCcZHsxg4FPWRA==
X-Received: by 2002:a9d:e91:: with SMTP id 17mr24276665otj.237.1608067532042; 
 Tue, 15 Dec 2020 13:25:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h93sm19681otb.29.2020.12.15.13.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 13:25:31 -0800 (PST)
Subject: Re: [PATCH v3 01/15] hw/riscv: Expand the is 32-bit check to support
 more CPUs
To: Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
 <CAEUhbmUHE3vSvsz3JCSmgApCpJfs598FJkXsZBYVuP09u8x9tA@mail.gmail.com>
 <CAKmqyKPoe-DLkLik60xW3D3DyuxPetQ=e8ecLUr5AEAV8WBENw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <759b5711-6b07-819f-4d11-0acf7b6ceed5@linaro.org>
Date: Tue, 15 Dec 2020 15:25:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPoe-DLkLik60xW3D3DyuxPetQ=e8ecLUr5AEAV8WBENw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 21:25:36 -0000

On 12/15/20 10:44 AM, Alistair Francis wrote:
> On Tue, Dec 15, 2020 at 1:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>>>
>>> Currently the riscv_is_32_bit() function only supports the generic rv32
>>> CPUs. Extend the function to support the SiFive and LowRISC CPUs as
>>> well.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  hw/riscv/boot.c | 12 +++++++++++-
>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>> index d62f3dc758..3c70ac75d7 100644
>>> --- a/hw/riscv/boot.c
>>> +++ b/hw/riscv/boot.c
>>> @@ -41,7 +41,17 @@
>>>
>>>  bool riscv_is_32_bit(MachineState *machine)
>>>  {
>>> -    if (!strncmp(machine->cpu_type, "rv32", 4)) {
>>> +    /*
>>> +     * To determine if the CPU is 32-bit we need to check a few different CPUs.
>>> +     *
>>> +     * If the CPU starts with rv32
>>> +     * If the CPU is a sifive 3 seriries CPU (E31, U34)
>>> +     * If it's the Ibex CPU
>>> +     */
>>> +    if (!strncmp(machine->cpu_type, "rv32", 4) ||
>>> +        (!strncmp(machine->cpu_type, "sifive", 6) &&
>>> +            machine->cpu_type[8] == '3') ||
>>> +        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {
>>
>> This does not look like a scalable way. With more and more CPU added
>> in the future, this may end up with a huge list of strncmps..
> 
> Any better ideas?

It doesn't appear as if you need to query this before you've instantiated the
cpu.  The first dynamic use that I see is create_fdt, which happens after that
point.

Verified like so:

$ gdb --args ./qemu-system-riscv64 -M virt
(gdb) b rv64_base_cpu_init
Breakpoint 1 at 0x548390: file ../qemu/target/riscv/cpu.c, line 156.
(gdb) b riscv_is_32_bit
Breakpoint 2 at 0x490dd0: file ../qemu/hw/riscv/boot.c, line 37.
(gdb) run
...
Thread 1 "qemu-system-ris" hit Breakpoint 1, rv64_base_cpu_init

From the machine, you can find the boot cpu, and use the riscv_cpu_is_32bit
helper on that.

Also, just noticed that the two functions spell "32bit" differently.  :-)


r~

