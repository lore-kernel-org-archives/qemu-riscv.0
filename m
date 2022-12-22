Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8J6b-0002CJ-PE
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 05:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8J6X-0002BU-TP
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 05:47:14 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p8J6V-0006YH-V5
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 05:47:13 -0500
Received: by mail-oi1-x22a.google.com with SMTP id v70so1557329oie.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1VUtE5Ch2sYTKY+XgKfIMy3aL+RrI2LdPdYB5xA3taw=;
 b=Wkl1yBNSKlzwtpKr5qBT4+uU577Y+mfavX6k4/G+CtkNAtSkNXw9V/Fd9G6+GWCyUb
 4HqMV/H3bTr+6RcJ2jFo7PsPLMLarht+Ub5lu93o4ABBHv9rtGvtT93bHrJCwUV7qWav
 0v6Khr+ayp3HJ8Lh7T9vgDUjxIgABHOnXUHhPJLiVdaQkl1rR5VUSaB7Q8aG2JgMH7Ml
 3faTMMLqsQpb0dROid6wW++5S8VfUynIAqcO028JCvdep/uqbG9lrO4m0otC4U3L43n8
 ERNp6jSYL5/b72vQLWzCzQpr9BA61LuCZOAr1Ht+ZabvTpQF2WvFpeYLr/7wkGKKS2ox
 e4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1VUtE5Ch2sYTKY+XgKfIMy3aL+RrI2LdPdYB5xA3taw=;
 b=rUwo3nZgWsezfQAf/ZuWzN4mRKRXfoc+Hxsvp8GmTxhNODPqZWYF/lT+aliA72lGMU
 P969808MKtCYALSZAecM9dGBRuyhY/BryoAmEeR9pYkPWS89r3cYlk/W5yyyxa/VBbvX
 XDDE3pUpORk7/OMB/wP9jTsKDEhfqCxxS0f5tYbss+qa7kQDquUOGjeWkhveA66OUwNu
 ePUVPPrQjGg2oADLvWyHcL25nOFgfmx0+xLXm8t+J7tEypj/PdG8qhe+6PM3v0qvCoVm
 sz6aMszm05pGkKUnSnPZATbh36sTtEScZ66DWKhgh2zYar9JlYW8h7Sr27hNf4BLxm01
 Damw==
X-Gm-Message-State: AFqh2kp3IW5rzCB8k7i+B794y4GHt8wbaTNeOmN02z5IkHCtQpNzUcBT
 OaMialJYU+YautQRRqvcB+8cUA==
X-Google-Smtp-Source: AMrXdXvjoGpZGLEBXae0+CDd+Uq3cZxxfujU4MuBLyj3rvPHd5yh77pYb8WicahNZfUDC3TogZKnyg==
X-Received: by 2002:a05:6808:30a9:b0:35c:6a5c:29e6 with SMTP id
 bl41-20020a05680830a900b0035c6a5c29e6mr2663234oib.28.1671706030781; 
 Thu, 22 Dec 2022 02:47:10 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 bf17-20020a056808191100b0035173c2fddasm157040oib.51.2022.12.22.02.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:47:10 -0800 (PST)
Message-ID: <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
Date: Thu, 22 Dec 2022 07:47:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Thu, 22 Dec 2022 10:47:16 -0000



On 12/22/22 07:24, Bin Meng wrote:
> On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> This test is used to do a quick sanity check to ensure that we're able
>> to run the existing QEMU FW image.
>>
>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>> RISCV32_BIOS_BIN firmware with minimal options.
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Cc: Beraldo Leal <bleal@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 tests/avocado/riscv_opensbi.py
>>
>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>> new file mode 100644
>> index 0000000000..abc99ced30
>> --- /dev/null
>> +++ b/tests/avocado/riscv_opensbi.py
>> @@ -0,0 +1,65 @@
>> +# opensbi boot test for RISC-V machines
>> +#
>> +# Copyright (c) 2022, Ventana Micro
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class RiscvOpensbi(QemuSystemTest):
>> +    """
>> +    :avocado: tags=accel:tcg
>> +    """
>> +    timeout = 5
>> +
>> +    def test_riscv64_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:virt
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>> +
>> +    def test_riscv64_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:spike
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>> +
>> +    def test_riscv64_sifive_u(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:sifive_u
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>> +
>> +    def test_riscv32_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:virt
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> How about testing riscv32_spike too?


I didn't manage to make it work. This riscv64 spark command line boots opensbi:


$ ./qemu-system-riscv64 -nographic -display none -vga none -machine spike

OpenSBI v1.1
    ____                    _____ ____ _____
   / __ \                  / ____|  _ \_   _|
  | |  | |_ __   ___ _ __ | (___ | |_) || |
  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
  | |__| | |_) |  __/ | | |____) | |_) || |_
   \____/| .__/ \___|_| |_|_____/|____/_____|
         | |
         |_|

(...)

The same command line doesn't boot riscv32 spark:

./qemu-system-riscv32 -nographic -display none -vga none -machine spike
(--- hangs indefinitely ---)

I debugged it a bit and, as far as boot code goes, it goes all the way and loads the
opensbi 32bit binary.

After that I tried to found any command line example that boots spike with riscv32
bit and didn't find any.  So I gave up digging it further because I became unsure
about whether 32-bit spike works.

If someone can verify that yes, 32-bit spike is supposed to work, then I believe it's
worth investigating why it's not the case ATM.


Thanks,


Daniel

>
>> +
>> +    def test_riscv32_sifive_u(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:sifive_u
>> +        """
>> +        self.vm.set_console()
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Platform Name')
>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>> --
> Regards,
> Bin


