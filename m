Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p9oJU-0006TR-3Y
	for mharc-qemu-riscv@gnu.org; Mon, 26 Dec 2022 09:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9oJS-0006T7-TB
 for qemu-riscv@nongnu.org; Mon, 26 Dec 2022 09:18:46 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9oJQ-0004V2-Qe
 for qemu-riscv@nongnu.org; Mon, 26 Dec 2022 09:18:46 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-14fb3809eaeso6781947fac.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Dec 2022 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nx1J004DBzhLjvwv5/3uMBlZBmbQMM0xqXFpepAX4iI=;
 b=mBu2gpvVSPqA5T/fgA2GmbKFkUBlKB2Hhc0CEri5vfNzKwL6UkVHNP/aKLkhoOu1mU
 wUdUuwELy0BQjQ4ZmvVK8NZlS3elUpo9D7DfYT77Eb8/OaONciEX4ndmxtplXrGx0Mej
 bvwrSPH12382eR+49mAvlep13iMokMWETM1ZbT6URMVxG/ecm9X1koMEBPDOkIqOfJ1B
 KiKbWOpb+SaE3UUYwkGiSsvUudSNG1DSkqjBAfTZLsSaGgIcA7TrT1qPebKBnYHtOshs
 V9qXUT3cnOFSlPkpsOXTFgn/VTBFxe7o8psFoMrHc2Wf/0fxkHmg7KmuSLhu4QJ4ElHh
 U2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nx1J004DBzhLjvwv5/3uMBlZBmbQMM0xqXFpepAX4iI=;
 b=KxHS39SkrWVJ4DtDSk4/5ZBzTXZpOQRATmK7ldLtf7zgw5dtDeNgCuH6y3f3rcPnh4
 uFkMRbB5+MSAyp6/ePYrapEfSQH687N8xX0DND+ySDAYOjhobrSjlVaLoa9ejjwlbAUJ
 tauQ/N7yohugPBP30JKKmCd95bXcHelI/wzn5hr1rCL3mMiiZc+c2aJuHyRPf0KxB9Mi
 Jpzn63kMuRGcWwcUaZAx54clkuHj51GGMyrweYho36DWsG9alioJ6XSCSER/Q/XlCDZZ
 7JqUmKDHhEZK1GiBOhWNbC7oH9yFZAik9+Qn1jFuEf30TziBNRabduK6Qu10a83nyn/i
 NNIQ==
X-Gm-Message-State: AFqh2kqfaCAP5N34l1nnLPg4xU+FKxLmp7iHbDC3mONRjGZS6P2RYn3q
 uuxB2bXIxBY1145BRKeXdRCIwQ==
X-Google-Smtp-Source: AMrXdXtnWokskvz0NHrtlv09P9OXe3dAITXzcpMUIPk+2wbmgtNV/Xg5AGT0F+OFI5WeBfCmyRh7bg==
X-Received: by 2002:a05:6870:6987:b0:148:2ebe:20c9 with SMTP id
 my7-20020a056870698700b001482ebe20c9mr11732276oab.35.1672064323001; 
 Mon, 26 Dec 2022 06:18:43 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a9d6d02000000b006704589eb54sm5329653otp.74.2022.12.26.06.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 06:18:42 -0800 (PST)
Message-ID: <f2e01a1c-4447-bfc6-de7e-5a2719946edf@ventanamicro.com>
Date: Mon, 26 Dec 2022 11:18:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 13/15] hw/riscv/spike.c: simplify create_fdt()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-14-dbarboza@ventanamicro.com>
 <CAEUhbmVRXYO-_0eJfFBmd+7-ofau+TjTx1+YVm70tC70dcEtMg@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmVRXYO-_0eJfFBmd+7-ofau+TjTx1+YVm70tC70dcEtMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Mon, 26 Dec 2022 14:18:47 -0000



On 12/23/22 10:06, Bin Meng wrote:
> On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> 'mem_size' and 'cmdline' aren't being used and the MachineState pointer
>> is being retrieved via a MACHINE() macro.
>>
>> Remove 'mem_size' and 'cmdline' and add MachineState as a parameter.
> Why do you add MachineState as a parameter? What's the problem of
> using the MACHINE() macro?

Yeah, I went overboard with the macro removal in this case and in patch 14.
I'll also redo patch 15 to avoid the qdev_get_machine() call but keeping the
macro.



Daniel



>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/spike.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index 2b9af5689e..181bf394a0 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -48,15 +48,14 @@ static const MemMapEntry spike_memmap[] = {
>>       [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>>   };
>>
>> -static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
>> +static void create_fdt(MachineState *mc, SpikeState *s,
>> +                       const MemMapEntry *memmap, bool is_32_bit)
>>   {
>>       void *fdt;
>>       int fdt_size;
>>       uint64_t addr, size;
>>       unsigned long clint_addr;
>>       int cpu, socket;
>> -    MachineState *mc = MACHINE(s);
>>       uint32_t *clint_cells;
>>       uint32_t cpu_phandle, intc_phandle, phandle = 1;
>>       char *name, *mem_name, *clint_name, *clust_name;
>> @@ -254,8 +253,7 @@ static void spike_board_init(MachineState *machine)
>>                                   mask_rom);
>>
>>       /* Create device tree */
>> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
>> -               riscv_is_32bit(&s->soc[0]));
>> +    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc[0]));
>>
>>       /*
>>        * Not like other RISC-V machines that use plain binary bios images,
>> --
> Regards,
> Bin


