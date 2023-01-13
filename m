Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGHcb-0000Oq-At
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 05:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHcY-0000O4-Qt
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:49:15 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGHcX-0001i8-8Z
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:49:14 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so21867106fac.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 02:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIR69OdksPcShxPKRwSewNUIoa5M9oLbEl3ywObkHpk=;
 b=FWVKdyBcygL18/IcM8KsDCJtGzywEoJmsvW6MMB114EUFYSrAlqGrwpVIuE9+eWks5
 vBsne6jdHcBa3oTU3rHjHZ4JhtriolAdBTBSxWtHi3Os03JsMjvQs8/xRY4ASol4Amst
 dWRJEj8KAGAvUeScU/1ph/EMxEcdPaDo1+RJ91c0LSvOVXpy+etHDke/NifGmsRIwT+7
 fv7RJ00Zj2wHZMWXAhINiJUNAyo/Tjip7yWgRRgWg81Oyy4waNkey2YeYYczl9WWr94G
 H0r1LaP0koPTABGWQhJZpYJmTWEmhj+uGLWUS6IZDTZ+2LRTb5irWJhRq/Z9T/oa4PEb
 /ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GIR69OdksPcShxPKRwSewNUIoa5M9oLbEl3ywObkHpk=;
 b=PiDCn78i+ZTV23Yxd+3xfdV3hDILAzCwWQjHlWiZrnL2FK2E4ZMCgP3oVJKa2tIrMy
 Wy+i3FLvCs1A/BSKWKnR6XhUv+fSWELxSnC8rZwWTYmmyf23iV/pxeq63uWWHg4RTLgx
 6smzMaNeChDYlyhMRZgTGq+9NiijnEfwen8MQWhU4yM6vlSHF4uG6rBCj759dGF1Y/Vz
 MysSQ9+9iFmtCnicFcOCVTm9YNusceSW33pX1LoAKSPCMTSuFM3w02GTGIIlZOMQeep4
 CpX0JLFEZlNqpYayDZ+VQhGZ6fXao1mPkN0GdyF2HbM421LYqqErUhTiDodYji6M5jSC
 4qhQ==
X-Gm-Message-State: AFqh2krbP/VGsXMLVP0SYgjyoCVkmeH+VtEfBg8Yru2UIMK6ZDQFalzh
 sPLNfcEYhnNF/PatiCfYS3FErQ==
X-Google-Smtp-Source: AMrXdXu8HC0GzW6FdgmyQ9TilLdQZ290QNWlGUxUP/7biuBpnm6qfzeIJnLzSh0zoWenZLK0zQ8RZw==
X-Received: by 2002:a05:6870:34d:b0:14c:67de:47c0 with SMTP id
 n13-20020a056870034d00b0014c67de47c0mr5952710oaf.55.1673606951579; 
 Fri, 13 Jan 2023 02:49:11 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a056870818c00b0013b0b19100fsm10458111oae.32.2023.01.13.02.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 02:49:10 -0800 (PST)
Message-ID: <e69efcbd-d4e7-9e72-cb38-ba872ab621ab@ventanamicro.com>
Date: Fri, 13 Jan 2023 07:49:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
 <b5cab84f-4bb9-694b-80e9-0b5aeac9de6c@linaro.org>
 <0ba72b27-0c3d-2d3d-adec-899717f40594@ventanamicro.com>
 <CAEUhbmV0KKKxOWDqNxiNz0ohR_EPPU_q+uMoukCA=UznZRFrvA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmV0KKKxOWDqNxiNz0ohR_EPPU_q+uMoukCA=UznZRFrvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 13 Jan 2023 10:49:15 -0000



On 1/13/23 07:30, Bin Meng wrote:
> On Fri, Jan 13, 2023 at 6:23 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>> On 1/13/23 04:16, Philippe Mathieu-Daudé wrote:
>>> On 12/1/23 01:34, Alistair Francis wrote:
>>>> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
>>>> <dbarboza@ventanamicro.com> wrote:
>>>>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>>>>> the same steps when '-kernel' is used:
>>>>>
>>>>> - execute load_kernel()
>>>>> - load init_rd()
>>>>> - write kernel_cmdline
>>>>>
>>>>> Let's fold everything inside riscv_load_kernel() to avoid code
>>>>> repetition. To not change the behavior of boards that aren't calling
>>>>> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
>>>>> allow these boards to opt out from initrd loading.
>>>>>
>>>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>> ---
>>>>>    hw/riscv/boot.c            | 22 +++++++++++++++++++---
>>>>>    hw/riscv/microchip_pfsoc.c | 12 ++----------
>>>>>    hw/riscv/opentitan.c       |  2 +-
>>>>>    hw/riscv/sifive_e.c        |  3 ++-
>>>>>    hw/riscv/sifive_u.c        | 12 ++----------
>>>>>    hw/riscv/spike.c           | 11 +----------
>>>>>    hw/riscv/virt.c            | 12 ++----------
>>>>>    include/hw/riscv/boot.h    |  1 +
>>>>>    8 files changed, 30 insertions(+), 45 deletions(-)
>>>>> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>>>>        if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>>>>                             NULL, &kernel_load_base, NULL, NULL, 0,
>>>>>                             EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>>>>> -        return kernel_load_base;
>>>>> +        kernel_entry = kernel_load_base;
>>>> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
>>>> we get a value of 0xffffffff80000000.
>>>>
>>>> Previously the top bits would be lost as we return a target_ulong from
>>>> this function, but with this change we pass the value
>>>> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
>>>>
>>>> This diff fixes the failure for me
>>>>
>>>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>>>> index 4888d5c1e0..f08ed44b97 100644
>>>> --- a/hw/riscv/boot.c
>>>> +++ b/hw/riscv/boot.c
>>>> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>>>> -        kernel_entry = kernel_load_base;
>>>> +        kernel_entry = (target_ulong) kernel_load_base;
>>>>           goto out;
>>>>       }
>>>>
>>>>
>>>> but I don't think that's the right fix. We should instead look at the
>>>> CPU XLEN and drop the high bits if required.
>>> Ah, that is what should be done in load_elf_ram_sym()'s missing
>>> translate_fn() handler.
>> Interesting. I'll try it again and re-send.
>>
> If that fixes the problem, it should be a separate patch.

Fair enough. I'll keep this patch as is and fix it in a separated patch.

Daniel

>
> I still don't understand why 32-bit xvisor image has a 64-bit address encoded?
>
> Regards,
> Bin


