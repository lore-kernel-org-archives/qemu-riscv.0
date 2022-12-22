Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8Se4-0002iX-8l
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 15:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8Se2-0002iN-QL
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 15:58:26 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8Sdx-00063E-7g
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 15:58:26 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-14455716674so3866048fac.7
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 12:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=trzFDsZAW8dAPVROY6gCB4x3WuO5bdJb/rObAIwsNFw=;
 b=XeMyYFZ7J/pE4HuSNjgiAwlf6jal+u2BnLZ5UAyNgNRt6A5ZDZ8olXmO26bY74ueT1
 0gnEZN2GUNW2zeh6+ZPF+3jXzTc1bYgGzrKQyTKELH4yjhEwE/VYo48iawb2/BPcQpSA
 yZ8MByhHrlV+lbZysHYd1LPiElsXDSdNGPSA8H7zKvuQigHl5A31mnh/2o1KGDyUO7ms
 JnBWKuvBl+BtnYCGsUPDfmqLb3PS+kc/U+SFKA+UL5VazQRhOxI+aboTDjIBT4PlSVRg
 +fKHXfQkWZDCqbdll5HmVAMgjs3t0lTbjNhFNo23q0AlHcnoHVHUeDC+y9zVwHAAsz14
 c8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=trzFDsZAW8dAPVROY6gCB4x3WuO5bdJb/rObAIwsNFw=;
 b=QdTOhDPwHRQWxCw0EM7OcS6BdOH5QFm08+8JxrfkQEVZWWAKI4qBEb8SU2YISw3G9d
 /o8kTVYsjdZPuDFbY67y6U5sJlKMjLjyKAwkdcuA0VT2QvULa0yrNIX0oZznQLOSmR1A
 vJKVA9bB/3OyNI0jwR0wml5QrKxiM3xTKZyMYgOsZ6IsY32JKFSUWO2grPe3APcyYNFy
 1tdiVbPX41SkFoGPWpkZVjYX9O0/ctZ1M1rn6N4dUpudpYhymlAzC+x0Fahu5XANOtrq
 BTB4Q1D6I44ZpKhlMhEuMYXaNhFUZnJNWj9/feOG1IcuXP0uMOidrgsqp2cdCXOrpP7D
 FvfA==
X-Gm-Message-State: AFqh2koZfASJhSGq+JNXJzJYiYKb8gkZ4cskDxHpMGI0e2DMrUpNMaXb
 2VhGj/YeXx18O5OiJMh0YHVqWQ==
X-Google-Smtp-Source: AMrXdXvMz+HFSFpeWHBGFOaWE3p8Op6IsRTQpEfITmXyNoIja9XKsHPFCsocfCkxIv00Xh+jk9XtBQ==
X-Received: by 2002:a05:6870:b624:b0:144:be2f:bea1 with SMTP id
 cm36-20020a056870b62400b00144be2fbea1mr4260611oab.58.1671742699357; 
 Thu, 22 Dec 2022 12:58:19 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 y25-20020a056870b01900b00144a3c526d9sm715477oae.52.2022.12.22.12.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 12:58:18 -0800 (PST)
Message-ID: <0bcb8831-673c-50d0-c112-f495fbc2e700@ventanamicro.com>
Date: Thu, 22 Dec 2022 17:58:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
 <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
 <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Thu, 22 Dec 2022 20:58:27 -0000



On 12/22/22 13:56, Anup Patel wrote:
> On Thu, Dec 22, 2022 at 6:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>>
>>> On 12/22/22 07:24, Bin Meng wrote:
>>>> On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
>>>> <dbarboza@ventanamicro.com> wrote:
>>>>> This test is used to do a quick sanity check to ensure that we're able
>>>>> to run the existing QEMU FW image.
>>>>>
>>>>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>>>>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>>>>> RISCV32_BIOS_BIN firmware with minimal options.
>>>>>
>>>>> Cc: Cleber Rosa <crosa@redhat.com>
>>>>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>> Cc: Beraldo Leal <bleal@redhat.com>
>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>> ---
>>>>>    tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 65 insertions(+)
>>>>>    create mode 100644 tests/avocado/riscv_opensbi.py
>>>>>
>>>>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>>>>> new file mode 100644
>>>>> index 0000000000..abc99ced30
>>>>> --- /dev/null
>>>>> +++ b/tests/avocado/riscv_opensbi.py
>>>>> @@ -0,0 +1,65 @@
>>>>> +# opensbi boot test for RISC-V machines
>>>>> +#
>>>>> +# Copyright (c) 2022, Ventana Micro
>>>>> +#
>>>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>>>> +# later.  See the COPYING file in the top-level directory.
>>>>> +
>>>>> +from avocado_qemu import QemuSystemTest
>>>>> +from avocado_qemu import wait_for_console_pattern
>>>>> +
>>>>> +class RiscvOpensbi(QemuSystemTest):
>>>>> +    """
>>>>> +    :avocado: tags=accel:tcg
>>>>> +    """
>>>>> +    timeout = 5
>>>>> +
>>>>> +    def test_riscv64_virt(self):
>>>>> +        """
>>>>> +        :avocado: tags=arch:riscv64
>>>>> +        :avocado: tags=machine:virt
>>>>> +        """
>>>>> +        self.vm.set_console()
>>>>> +        self.vm.launch()
>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>> +
>>>>> +    def test_riscv64_spike(self):
>>>>> +        """
>>>>> +        :avocado: tags=arch:riscv64
>>>>> +        :avocado: tags=machine:spike
>>>>> +        """
>>>>> +        self.vm.set_console()
>>>>> +        self.vm.launch()
>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>> +
>>>>> +    def test_riscv64_sifive_u(self):
>>>>> +        """
>>>>> +        :avocado: tags=arch:riscv64
>>>>> +        :avocado: tags=machine:sifive_u
>>>>> +        """
>>>>> +        self.vm.set_console()
>>>>> +        self.vm.launch()
>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>> +
>>>>> +    def test_riscv32_virt(self):
>>>>> +        """
>>>>> +        :avocado: tags=arch:riscv32
>>>>> +        :avocado: tags=machine:virt
>>>>> +        """
>>>>> +        self.vm.set_console()
>>>>> +        self.vm.launch()
>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>> How about testing riscv32_spike too?
>>>
>>> I didn't manage to make it work. This riscv64 spark command line boots opensbi:
>>>
>>>
>>> $ ./qemu-system-riscv64 -nographic -display none -vga none -machine spike
>>>
>>> OpenSBI v1.1
>>>      ____                    _____ ____ _____
>>>     / __ \                  / ____|  _ \_   _|
>>>    | |  | |_ __   ___ _ __ | (___ | |_) || |
>>>    | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>>    | |__| | |_) |  __/ | | |____) | |_) || |_
>>>     \____/| .__/ \___|_| |_|_____/|____/_____|
>>>           | |
>>>           |_|
>>>
>>> (...)
>>>
>>> The same command line doesn't boot riscv32 spark:
>>>
>>> ./qemu-system-riscv32 -nographic -display none -vga none -machine spike
>>> (--- hangs indefinitely ---)
>>>
>>> I debugged it a bit and, as far as boot code goes, it goes all the way and loads the
>>> opensbi 32bit binary.
>>>
>>> After that I tried to found any command line example that boots spike with riscv32
>>> bit and didn't find any.  So I gave up digging it further because I became unsure
>>> about whether 32-bit spike works.
>>>
>>> If someone can verify that yes, 32-bit spike is supposed to work, then I believe it's
>>> worth investigating why it's not the case ATM.
>>>
>> +Anup who might know if QEMU spike 32-bit machine works with opensbi
>> 32-bit generic image.
> We never got HTIF putc() working on QEMU RV32 Spike but it works
> perfectly fine on QEMU RV64 Spike.

Thanks for the info Anup!

I'll add this information in the commit msg/avocado file to document why we're not
testing spike 32 bits in this test that requires console output.


Daniel

>
> See below log of QEMU RV64 Spike ...
>
> Regards,
> Anup
>
> anup@anup-ubuntu-vm:~/Work/riscv-test/opensbi$ qemu-system-riscv64 -M
> spike -m 256M -nographic -bios
> /home/anup/Work/riscv-test/opensbi/build/platform/generic/firmware/fw_payload.elf
>
> OpenSBI v1.1-124-gb848d87
>     ____                    _____ ____ _____
>    / __ \                  / ____|  _ \_   _|
>   | |  | |_ __   ___ _ __ | (___ | |_) || |
>   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>   | |__| | |_) |  __/ | | |____) | |_) || |_
>    \____/| .__/ \___|_| |_|_____/|____/_____|
>          | |
>          |_|
>
> Platform Name             : ucbbar,spike-bare,qemu
> Platform Features         : medeleg
> Platform HART Count       : 1
> Platform IPI Device       : aclint-mswi
> Platform Timer Device     : aclint-mtimer @ 10000000Hz
> Platform Console Device   : htif
> Platform HSM Device       : ---
> Platform PMU Device       : ---
> Platform Reboot Device    : htif
> Platform Shutdown Device  : htif
> Firmware Base             : 0x80000000
> Firmware Size             : 212 KB
> Runtime SBI Version       : 1.0
>
> Domain0 Name              : root
> Domain0 Boot HART         : 0
> Domain0 HARTs             : 0*
> Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
> Domain0 Region01          : 0x0000000080000000-0x000000008003ffff ()
> Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
> Domain0 Next Address      : 0x0000000080200000
> Domain0 Next Arg1         : 0x0000000082200000
> Domain0 Next Mode         : S-mode
> Domain0 SysReset          : yes
>
> Boot HART ID              : 0
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.12
> Boot HART Base ISA        : rv64imafdch
> Boot HART ISA Extensions  : none
> Boot HART PMP Count       : 16
> Boot HART PMP Granularity : 4
> Boot HART PMP Address Bits: 54
> Boot HART MHPM Count      : 16
> Boot HART MIDELEG         : 0x0000000000001666
> Boot HART MEDELEG         : 0x0000000000f0b509
>
> Test payload running


