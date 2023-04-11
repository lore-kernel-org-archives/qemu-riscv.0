Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmNie-0004UK-W9
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 19:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmNie-0004U5-2e
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 19:48:12 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmNic-0000h3-8n
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 19:48:11 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 i15-20020a9d610f000000b006a11f365d13so3958537otj.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 16:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681256888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/5m5QNTni5SJH+I/LlHR9r7yAjGLSHKPRDMhLRsCRU=;
 b=eeTvXdxJX8cDKpQN8dEdAEniQGnJgw3Lph9TjAgB4EWHLxT224Lor38R90T0P74iPI
 saR18JvDRpomkeWLalwCJwDM0gx6dhSFo5ijXW0IVUFraeQYk/2n3y3mWSunYk4NYeNt
 ULD/jfd4w/A2tVwmpHKnonCooPK9+fwwaBZ0JFU36DlR0KaFeJg/evb4MQsE+DXnNH80
 6jVnnbvhA4yDTjgdojiY7gZevEeEeid0AqEK/J3RyPCdzDaampsgBNEkHDveTleq6ss+
 B+Zg7ImvKW8/dik2o+E54+BCJqTWMiRc2SftEnfWrGrqA9o0KhNesAy11zZalXB7CINs
 Q3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681256888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/5m5QNTni5SJH+I/LlHR9r7yAjGLSHKPRDMhLRsCRU=;
 b=RDngI/WH8kORIdqnAwTrV/DbxAtZaxV5Vsiu3Bxpcycf1Ocrr2opgZaKamv8VBn5Up
 F3dR1ETZRdhX0hf7IoJlRr97Poe7cUaKktxysuC8knVSCXvJTKbfmju4Umrd0IXRew/2
 NlYZGtHYtc3GCKZIWPy8KoV6FCfPtlrHxOyxAx+Q26cEy1Fp3Gwfo5tuKcEkgm86tX5y
 UXM2bkeXK+I14mJXgPcmoVl7geYLyGFW7zJnT4/GmZRM1lDcbBDy8XNr3DqH6IDu/eZC
 FBqUJLf6nGA7e0ZUxlScRg1J5bkmbbwYXP1Oa8ng7mGZnIk7ivDF64p4vZuMnJ287iNC
 VBCA==
X-Gm-Message-State: AAQBX9dDbwUpDoLRHmyX7K2JE4uf4vNFa0l92ssgvfDM9cA18+JUCz3D
 dt8s5Oi3SOC+CHlUqFxt+acKWg==
X-Google-Smtp-Source: AKy350ZCNRxRGHQaHlEmRv3ICAUaKCBmFJ4l4AF6Rhq83UMGMrd3gftLE1O4JKijPhmg4YuDKga6QQ==
X-Received: by 2002:a9d:6d18:0:b0:6a4:732:7bcf with SMTP id
 o24-20020a9d6d18000000b006a407327bcfmr2227525otp.16.1681256888427; 
 Tue, 11 Apr 2023 16:48:08 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a056830130c00b00690c80741e3sm2951024otq.66.2023.04.11.16.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 16:48:07 -0700 (PDT)
Message-ID: <45032919-7642-870c-33d4-f65c38101edf@ventanamicro.com>
Date: Tue, 11 Apr 2023 20:48:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] target/riscv: Separate implicitly-enabled and
 explicitly-enabled extensions
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
 <0fd5d633-8aac-4186-a7b8-0e27f416bb3f@ventanamicro.com>
 <3ab19e9b-88a3-17bd-169d-7317dfbf36e5@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <3ab19e9b-88a3-17bd-169d-7317dfbf36e5@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Tue, 11 Apr 2023 23:48:12 -0000



On 4/10/23 21:15, liweiwei wrote:
> 
> On 2023/4/10 21:48, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> On 4/10/23 00:35, Weiwei Li wrote:
>>> The patch tries to separate the multi-letter extensions that may implicitly-enabled by misa.EXT from the explicitly-enabled cases, so that the misa.EXT can truely disabled by write_misa().
>>> With this separation, the implicitly-enabled zve64d/f and zve32f extensions will no work if we clear misa.V. And clear misa.V will have no effect on the explicitly-enalbed zve64d/f and zve32f extensions.
>>
>> For this particular case of write_misa() I'm not sure if we need all that. If we want
>> to grant user choice on write_misa(), let's say that the user wants to enable/disable
>> RVV, we can enable/disable all RVV related Z-extensions by hand. It's just a matter
>> of writing enable/disable code that write_misa() would use.
>>
>> In the end, write_misa() is also an user choice. If write_misa() wants to disable RVV,
>> this means that the user wants to disable RVV, so it doesn't matter whether the user
>> enabled zve32f on the command line or not - we disable zve32f as well. Same thing for
>> RVC and its related Z-extensions.
> 
> I just find we should also separate the cases here. Zcmp/Zcmt require Zca.
> 
> If we disable Zca when misa.C is cleared, whether we need disable Zcmp/Zcmt?

IMO write_misa() shouldn't be able to disable Z-extensions that it can't turn it back
on. E.g. RVV disabling zve64d/f is ok because, if we re-enable RVV, they'll be re-enabled
back.


> 
> If yes, then we need another new parameter(to indicate they are diabled by
> 
> clearing misa.C ) to decide whether we should re-enable them when misa.C is set.
> 
> If not, we should make clearing misa.C failed in this case.

I'd rather fail the operation. write_misa() should always make reversible operations. If
a certain CSR write would put us in a state that we can't go back on, we should fail.

For now I think I'll go back to that cleanup I made, rebase it, get one of Weiwei patches
that fixes the sifive breakage I talked about in the other thread, and see if we can
get that more simple version of write_misa() merged. We can continue these discussions
on top of that code.


Thanks,


Daniel


> 
> Regards,
> 
> Weiwei Li
> 
>>
>> The reason why I didn't do this particular code for RVC and RVV is because we have
>> pending work in the ML that I would like to get it merged first. And there's a few
>> caveats we need to decide what to do, e.g. what if the user disables F but V is
>> enabled? Do we refuse write_misa()? Do we disable RVV?
>>
>>
>> All this said, patch 1 is still a good addition to make it easier to distinguish
>> the Z-extensions we're enabling due to MISA bits. I believe we should use
>> set_implicit_extensions_from_ext() in the future for all similar situations.
>>
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>
>>
>>>
>>> Weiwei Li (2):
>>>    target/riscv: Add set_implicit_extensions_from_ext() function
>>>    target/riscv: Add ext_z*_enabled for implicitly enabled extensions
>>>
>>>   target/riscv/cpu.c                      | 73 +++++++++++++++----------
>>>   target/riscv/cpu.h                      |  8 +++
>>>   target/riscv/cpu_helper.c               |  2 +-
>>>   target/riscv/csr.c                      |  2 +-
>>>   target/riscv/insn_trans/trans_rvd.c.inc |  2 +-
>>>   target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
>>>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +-
>>>   target/riscv/insn_trans/trans_rvv.c.inc | 16 +++---
>>>   target/riscv/translate.c                |  4 +-
>>>   9 files changed, 68 insertions(+), 46 deletions(-)
>>>
> 

