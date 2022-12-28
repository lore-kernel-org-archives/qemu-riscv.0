Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAW5t-0004kL-Ir
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW5l-0004ed-RE
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:03:35 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAW5j-0000rZ-Dl
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:03:32 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-142b72a728fso18476688fac.9
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QYuy4k+03T/23b8gpJnvPo2Luj7mUqIFGr4sNDploDM=;
 b=IrV03P7B9rh/pU3j3in7zjnDeiJnL6XWERkXr/OHimCf71iYTl+BOdqagK1y6hEQt4
 sfzAXkwHfD6GRFPeffTMM6n/Obs8u7IrJdssynwDWl/s/b2OvKbLnwO+0cUFrKUK/9LK
 Hal5CsWZNpgoWmUsaxv6+QFYrzUcMXXnrnFB5zm/kXhXTPsMVICXbooHqtRGXGSaHHZl
 q70tPqyrwZZwMEX0dPkaA3hJJNq2anp5t+uxDaKV0a351sRPHQwIZShIgBN3QsJqoowb
 1dK8bGYgCZHJ72n0OCHC+MCGXdWPNtsE4l++OdeHPsdntKF3JGRbnq3/5a/l6O3IqfkH
 9rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYuy4k+03T/23b8gpJnvPo2Luj7mUqIFGr4sNDploDM=;
 b=6hRq4+1FAQ3gNf+6yxHSBnWdbU/VjiCgzd0ONL6o+RcHlYs5k1J2JHahe3t6DC4nN9
 P6U1aJcyON9eQD/mwHL7Gg0JCc33k/jGVwI11TyidcE5XvCmnGLGoVeprIlNtbWf+QX7
 dAktl3WNdb2R+6pEF6UVTpTdr+NhGT+/f8qy0nncJOT4hdl9AKxOlJmxxokbIbtV3Fhf
 kuVZyoVED61pv+winRdh0Shc1sU2nU/zJd6UkRTtw9TOJZhkAS73gRnNQ9ciwr+X81bE
 i6aOehbByYex5TOsG2q4OTgTcb+N+E/DEhya7jXjtWw/JHon8pAny5aYAjtjyoYu+I4u
 uSNA==
X-Gm-Message-State: AFqh2kqU/e8MoRtyEzoM7y6C+IgH0RpK4R8wfQISLWlWjSx7/uIx+i4x
 OICz45IqdM+FnztFo7vtLxEH/g==
X-Google-Smtp-Source: AMrXdXuWwpTdGBXLvGsa9kJtAYlgYgmPwdKEflkvuYpYqA6WO3LPikxwjWnbciuSift6u4R8jTsnKQ==
X-Received: by 2002:a05:6871:458c:b0:144:7a85:63ed with SMTP id
 nl12-20020a056871458c00b001447a8563edmr13019323oab.55.1672232608879; 
 Wed, 28 Dec 2022 05:03:28 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.139])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056870471000b0010c727a3c79sm7301037oaq.26.2022.12.28.05.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 05:03:28 -0800 (PST)
Message-ID: <8f84f96f-2754-db33-0b3d-a0678e3e5030@ventanamicro.com>
Date: Wed, 28 Dec 2022 10:03:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/10] tests/avocado: add RISC-V opensbi boot test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
 <20221228124242.184784-2-dbarboza@ventanamicro.com>
 <1ff3c774-edaf-74cf-df57-ebcc7d75363f@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <1ff3c774-edaf-74cf-df57-ebcc7d75363f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:03:35 -0000



On 12/28/22 09:59, Philippe Mathieu-Daudé wrote:
> On 28/12/22 13:42, Daniel Henrique Barboza wrote:
>> This test is used to do a quick sanity check to ensure that we're able
>> to run the existing QEMU FW image.
>>
>> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
>> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
>> RISCV32_BIOS_BIN firmware with minimal options.
>>
>> The riscv32 'spike' machine isn't bootable at this moment, requiring an
>> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
>> or add a 'skip' test to remind us about it. To work as a reminder that
>> we have a riscv32 'spike' test that should be enabled as soon as Opensbi
>> QEMU rom receives the fix, we're adding a 'skip' test:
>>
>> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
>>          SKIP: requires OpenSBI fix to work
>>
>> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
>> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
>>
>> Cc: Cleber Rosa <crosa@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   tests/avocado/riscv_opensbi.py | 77 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644 tests/avocado/riscv_opensbi.py
>>
>> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
>> new file mode 100644
>> index 0000000000..64fcf3c774
>> --- /dev/null
>> +++ b/tests/avocado/riscv_opensbi.py
>> @@ -0,0 +1,77 @@
>> +# opensbi boot test for RISC-V machines
>
> s/opensbi/OpenSBI/
>
>> +#
>> +# Copyright (c) 2022, Ventana Micro
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import QemuSystemTest
>> +from avocado import skip
>> +from avocado_qemu import wait_for_console_pattern
>> +
>> +class RiscvOpensbi(QemuSystemTest):
>> +    """
>> +    :avocado: tags=accel:tcg
>> +    """
>> +    timeout = 5
>
> Easier to review common code once:
>
>        def boot_opensbi(self):
>            self.vm.set_console()
>            self.vm.launch()
>            wait_for_console_pattern(self, 'Platform Name')
>            wait_for_console_pattern(self, 'Boot HART MEDELEG')

Yeah I mean, here I am, adding duplicated logic in a series that was aimed to
reduce duplicated logic :D


I'll refactor it in v3. Thanks!


Daniel

>
>> +
>> +    def test_riscv64_virt(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:virt
>> +        """
>
>            self.boot_opensbi()
>
>> +    def test_riscv64_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv64
>> +        :avocado: tags=machine:spike
>> +        """
>
>            self.boot_opensbi()
>
> [...]
>
>> +    @skip("requires OpenSBI fix to work")
>> +    def test_riscv32_spike(self):
>> +        """
>> +        :avocado: tags=arch:riscv32
>> +        :avocado: tags=machine:spike
>> +        """
>
>            self.boot_opensbi()
>
>


