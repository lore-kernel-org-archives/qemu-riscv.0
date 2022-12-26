Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p9o1l-00068z-Rl
	for mharc-qemu-riscv@gnu.org; Mon, 26 Dec 2022 09:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9o1d-00067Y-AK
 for qemu-riscv@nongnu.org; Mon, 26 Dec 2022 09:00:22 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9o1a-0006yk-HK
 for qemu-riscv@nongnu.org; Mon, 26 Dec 2022 09:00:20 -0500
Received: by mail-oi1-x232.google.com with SMTP id i127so10300040oif.8
 for <qemu-riscv@nongnu.org>; Mon, 26 Dec 2022 06:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKJbpux01bj7h8k71+TvXgNEab6ukobm0uEqQypXz5I=;
 b=nQ3Mc3pOYDSZ7yC91TQvfiX+rtpd+wE7bxpUyCQ9EZCz7Irr6qqXQkMRn6fSuXrN97
 Hzxdqz89IzIqz4n3EsUuqsm/Mx6PzgYXYNsP0QXcUhnOwXIa7MFCwnMuq932JzXf0pyj
 tAgYh/4eqHJW9L8JzONWuGoMdgmCRWezRgFOsPDqsq3XaQkH0rCxxpo+mSgBevpcwlHg
 3Btpn/kwwRDoKju96CGdz6Ah3ezrdQZZ+u1v4Df0kXDF9RJqj/CxQGtBgPEGpIuarO7T
 5T9luC3Usv8JgEGhY/1GnEI2aVrxcYifmEwAXafhkl60F3EYFndrPe8X1Kzijtxhfhzh
 nu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKJbpux01bj7h8k71+TvXgNEab6ukobm0uEqQypXz5I=;
 b=hS4r97tWr1jmmtgM1Tw9w2Aj9xjdXUQfWqUiAx+e7aGvqx7+rwOM5inNmEIsBRKrlS
 3gcDrgkWb4nSrFFTCbF+rGuUqkq0FR9O99596moA5yL/0ARM6k7t8eMMMJ3FbJwR7ywD
 SSnLNFn7guxI+MBJjCEUpghTLLg3tT6oszhifNt5c2in1YqAnTG/Ntrm8V3e9EZBndPw
 Fyq0hefyubbff1FG4jV0ZP0pmkvSl6w9UiFTZX+N3e0fqz7+kPk33PG2j6KT8RebkxH0
 Wvy+vho6MllQ9qTilpPEP+8GOTg2pXBLCTfAgglObhYMdKdlbjYjGdf+Wtno7qokBXud
 iojQ==
X-Gm-Message-State: AFqh2kr1UjmuEPdhusGccQIiHzaJO/5YK64SoI7j3ZUamzqMHPcKDjLz
 BEgHzrIIYxmQV0kgKkk0D+PeJg==
X-Google-Smtp-Source: AMrXdXsAfagoeW8fsNHWTuwZ3azidJJhcTjZmbWP1lCCLul75X3y01DgCy4ghJwGuKwnhBquH3v1zQ==
X-Received: by 2002:a05:6808:22a2:b0:35e:915c:f0b4 with SMTP id
 bo34-20020a05680822a200b0035e915cf0b4mr8764363oib.16.1672063212430; 
 Mon, 26 Dec 2022 06:00:12 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 i127-20020acaea85000000b0035a9003b8edsm4804216oih.40.2022.12.26.06.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 06:00:11 -0800 (PST)
Message-ID: <a019d385-d378-bcdb-afcd-3f06ae66096f@ventanamicro.com>
Date: Mon, 26 Dec 2022 11:00:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
 <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
 <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
 <CAEUhbmVEtPaHrOt2RWEad6-SA4Qwtd+Xe4Lir78t86N5GR2Q=Q@mail.gmail.com>
 <CAEUhbmUJ8ViH-mVYZX6BkkWrgTMjH2meYg0=S8O=86N0YK-q-w@mail.gmail.com>
 <CAEUhbmWRpX1iAuGO95ixQg3AS+Q0aw-+hAPbYsJaqcVtOmNj6Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmWRpX1iAuGO95ixQg3AS+Q0aw-+hAPbYsJaqcVtOmNj6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Mon, 26 Dec 2022 14:00:27 -0000



On 12/26/22 10:56, Bin Meng wrote:
> On Sat, Dec 24, 2022 at 11:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> Hi,
>>
>> On Fri, Dec 23, 2022 at 2:25 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> Hi Anup,
>>>
>>> On Fri, Dec 23, 2022 at 12:56 AM Anup Patel <anup@brainfault.org> wrote:
>>>> On Thu, Dec 22, 2022 at 6:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>> On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 12/22/22 07:24, Bin Meng wrote:
>>>>>>> On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
>>>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>>> This test is used to do a quick sanity check to ensure that we're able
>>>>>>>> to run the existing QEMU FW image.
>>>>>>>>
>>>>>>>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>>>>>>>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>>>>>>>> RISCV32_BIOS_BIN firmware with minimal options.
>>>>>>>>
>>>>>>>> Cc: Cleber Rosa <crosa@redhat.com>
>>>>>>>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>>>>>>> Cc: Beraldo Leal <bleal@redhat.com>
>>>>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>>>>> ---
>>>>>>>>    tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>>>>>>>>    1 file changed, 65 insertions(+)
>>>>>>>>    create mode 100644 tests/avocado/riscv_opensbi.py
>>>>>>>>
>>>>>>>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000..abc99ced30
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/tests/avocado/riscv_opensbi.py
>>>>>>>> @@ -0,0 +1,65 @@
>>>>>>>> +# opensbi boot test for RISC-V machines
>>>>>>>> +#
>>>>>>>> +# Copyright (c) 2022, Ventana Micro
>>>>>>>> +#
>>>>>>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>>>>>>> +# later.  See the COPYING file in the top-level directory.
>>>>>>>> +
>>>>>>>> +from avocado_qemu import QemuSystemTest
>>>>>>>> +from avocado_qemu import wait_for_console_pattern
>>>>>>>> +
>>>>>>>> +class RiscvOpensbi(QemuSystemTest):
>>>>>>>> +    """
>>>>>>>> +    :avocado: tags=accel:tcg
>>>>>>>> +    """
>>>>>>>> +    timeout = 5
>>>>>>>> +
>>>>>>>> +    def test_riscv64_virt(self):
>>>>>>>> +        """
>>>>>>>> +        :avocado: tags=arch:riscv64
>>>>>>>> +        :avocado: tags=machine:virt
>>>>>>>> +        """
>>>>>>>> +        self.vm.set_console()
>>>>>>>> +        self.vm.launch()
>>>>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>>>>> +
>>>>>>>> +    def test_riscv64_spike(self):
>>>>>>>> +        """
>>>>>>>> +        :avocado: tags=arch:riscv64
>>>>>>>> +        :avocado: tags=machine:spike
>>>>>>>> +        """
>>>>>>>> +        self.vm.set_console()
>>>>>>>> +        self.vm.launch()
>>>>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>>>>> +
>>>>>>>> +    def test_riscv64_sifive_u(self):
>>>>>>>> +        """
>>>>>>>> +        :avocado: tags=arch:riscv64
>>>>>>>> +        :avocado: tags=machine:sifive_u
>>>>>>>> +        """
>>>>>>>> +        self.vm.set_console()
>>>>>>>> +        self.vm.launch()
>>>>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>>>>> +
>>>>>>>> +    def test_riscv32_virt(self):
>>>>>>>> +        """
>>>>>>>> +        :avocado: tags=arch:riscv32
>>>>>>>> +        :avocado: tags=machine:virt
>>>>>>>> +        """
>>>>>>>> +        self.vm.set_console()
>>>>>>>> +        self.vm.launch()
>>>>>>>> +        wait_for_console_pattern(self, 'Platform Name')
>>>>>>>> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
>>>>>>> How about testing riscv32_spike too?
>>>>>>
>>>>>> I didn't manage to make it work. This riscv64 spark command line boots opensbi:
>>>>>>
>>>>>>
>>>>>> $ ./qemu-system-riscv64 -nographic -display none -vga none -machine spike
>>>>>>
>>>>>> OpenSBI v1.1
>>>>>>      ____                    _____ ____ _____
>>>>>>     / __ \                  / ____|  _ \_   _|
>>>>>>    | |  | |_ __   ___ _ __ | (___ | |_) || |
>>>>>>    | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>>>>>    | |__| | |_) |  __/ | | |____) | |_) || |_
>>>>>>     \____/| .__/ \___|_| |_|_____/|____/_____|
>>>>>>           | |
>>>>>>           |_|
>>>>>>
>>>>>> (...)
>>>>>>
>>>>>> The same command line doesn't boot riscv32 spark:
>>>>>>
>>>>>> ./qemu-system-riscv32 -nographic -display none -vga none -machine spike
>>>>>> (--- hangs indefinitely ---)
>>>>>>
>>>>>> I debugged it a bit and, as far as boot code goes, it goes all the way and loads the
>>>>>> opensbi 32bit binary.
>>>>>>
>>>>>> After that I tried to found any command line example that boots spike with riscv32
>>>>>> bit and didn't find any.  So I gave up digging it further because I became unsure
>>>>>> about whether 32-bit spike works.
>>>>>>
>>>>>> If someone can verify that yes, 32-bit spike is supposed to work, then I believe it's
>>>>>> worth investigating why it's not the case ATM.
>>>>>>
>>>>> +Anup who might know if QEMU spike 32-bit machine works with opensbi
>>>>> 32-bit generic image.
>>>> We never got HTIF putc() working on QEMU RV32 Spike but it works
>>>> perfectly fine on QEMU RV64 Spike.
>>> Where is the problem for the 32-bit? Is it in OpenSBI or in QEMU?
>>>
>>>> See below log of QEMU RV64 Spike ...
>>>>
>>> If we cannot get Spike 32-bit to work in QEMU, should we drop the
>>> 32-bit support? @Alistair Francis
>> I got a deeper look at the 32-bit spike issue and I believe it is a
>> problem of QEMU HTIF emulation.
>>
>> I will see if I can spin a patch to fix this.
>>
> It turns out there is a bug in OpenSBI too when booting 32-bit BIN
> image on Spike.
>
> For ELF & BIN image boot on QEMU, QEMU changes are needed. I will send
> the QEMU patches soon.

I'll wait for your patches to re-send this series. If you can get spike 32-bit
to work then I'll re-send the v2 with the 32 bit spike tests enabled.


Thanks,


Daniel

>
> Regards,
> Bin


