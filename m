Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXUFX-0005nM-Kj
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 16:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUFW-0005mx-DM
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 16:44:34 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUFU-0003FB-I8
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 16:44:34 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1722c48a773so16061584fac.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 13:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677707071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ijnpM3EaA6WKOaZJcTHOgp7iou5WQVC+jYjfm3HTJJw=;
 b=c1c7+UFBsioMWRrTKfeLLyBkkueIt7aQtQgHPRZ/vGRjC3j3J4vhyEtKZIZ/pJbKQ9
 NVd3jtUxODB4i4KJtEDhCrHgSBCQ8SeAr+6eI/zVB3F3nR6X6ug72FEuejYJU2n49p1k
 M+SC1dOEjT0TIXOp+1WdRDtfefNR0q9xgLRBOn0FgmkY7Tqu8zPULpfAqyAsrSwxv6ea
 wbNNW5IkvSLh/5X13c6uq27B1y7nOYHVmFhQ7Mr/s0B2mCooC/u7ywg6jTvgGkQUPTCN
 0r77PioOGkB8g/ftZFEUR9DW49ow9q4j/T8ckpx3Wij8eGBbF3+5l/oow+umy0FFz0Mg
 rpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ijnpM3EaA6WKOaZJcTHOgp7iou5WQVC+jYjfm3HTJJw=;
 b=Ki/CdbUw6UnUhhZg5/5jCXyv4vu539zFZpvGXOiUT4aGXCxwSFMdAgsbRBCubZm4YN
 KQ0OI4NUoYx/91UyOcSP7crXn55Av82nUwZUDKvyd8EsWgDVvFY1afU4YsNhGBH+yNkR
 EcmM9XcUFauTJCgKZWTHWqnTI9rg9n/IoUqyDV6qWRvyOcVjqe8rRvYSGCy5ElpgYufm
 MpSlZBgBvvpdM1g1PE9h59g5qNKSeFZceiPbmsTbxouzgcBFwdSMqktXkOTjOxBqFeXZ
 YZmB7PEeLUYMS38pVGs27GZEuy4FnV2ThgQu5HFqQ0x75NIMK7jEGaq9BvYwdhCLUx3x
 jx7w==
X-Gm-Message-State: AO0yUKW4XQhcEtCvCW0lXvCyi8NXjUwnRYTRnJLWTWv3LBnTkS+z1ohl
 xRRMqpULSV2V7UXP2KDzyj/L2A==
X-Google-Smtp-Source: AK7set9Nyz/+8dfxtiVTA+EOtUEpsP1oNTAZOw2CyUYbku1ZZEJcwCuVC+Gk82JcEJQNfM110y2b2Q==
X-Received: by 2002:a05:6870:468a:b0:172:4745:f909 with SMTP id
 a10-20020a056870468a00b001724745f909mr4724378oap.32.1677707070909; 
 Wed, 01 Mar 2023 13:44:30 -0800 (PST)
Received: from [192.168.68.107] ([177.189.55.88])
 by smtp.gmail.com with ESMTPSA id
 ea24-20020a056870071800b00176209a6d6asm1184382oab.10.2023.03.01.13.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 13:44:30 -0800 (PST)
Message-ID: <a6e1ed8b-f1c4-4d57-5877-d1dec159aa58@ventanamicro.com>
Date: Wed, 1 Mar 2023 18:44:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <mhng-1fd4c381-8371-4adc-b597-b4bc05f7afec@palmer-ri-x1c9a>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mhng-1fd4c381-8371-4adc-b597-b4bc05f7afec@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Wed, 01 Mar 2023 21:44:34 -0000

Hi Palmer,

On 3/1/23 18:35, Palmer Dabbelt wrote:
> On Thu, 23 Feb 2023 15:44:23 PST (-0800), dbarboza@ventanamicro.com wrote:
>> Hi,
>>
>> This new version has changes based on feedbacks of both v5 and v6.
>>
>> Patch 1 was revamped. We're modifying probe_access_flags() to accept a
>> 'size' parameter to allow for RISC-V usage with PMP. Changes in the existing
>> callers are trivial and no behavior change is done (well, at least it's not
>> intended). And we avoid adding another  probe_* API that only RISC-V
>> will care about.
>>
>> Changes from v6:
>> - patch 1:
>>   - no longer adding a new probe_access_flags_range() API
>>   - add a 'size' param to probe_access_flags()
>> - patch 2:
>>   - check for RISCV_EXCP_ILLEGAL_INST first in check_zicbo_envcfg()
>>   - add a probe for MMU_DATA_STORE after check_zicbo_envcfg()
>>   - write zeros even if the address isn't mapped to RAM
>> - patch 3:
>>   - simplify the verifications in check_zicbom_access() by using probe_write()
>> - v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05379.html
>>
>> Christoph Muellner (3):
>>   target/riscv: implement Zicboz extension
>>   target/riscv: implement Zicbom extension
>>   target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder
>>
>> Daniel Henrique Barboza (1):
>>   tcg: add 'size' param to probe_access_flags()
>>
>>  accel/stubs/tcg-stub.c                      |   2 +-
>>  accel/tcg/cputlb.c                          |  17 ++-
>>  accel/tcg/user-exec.c                       |   5 +-
>>  include/exec/exec-all.h                     |   3 +-
>>  semihosting/uaccess.c                       |   2 +-
>>  target/arm/ptw.c                            |   2 +-
>>  target/arm/sve_helper.c                     |   2 +-
>>  target/riscv/cpu.c                          |   7 ++
>>  target/riscv/cpu.h                          |   4 +
>>  target/riscv/helper.h                       |   5 +
>>  target/riscv/insn32.decode                  |  16 ++-
>>  target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++++
>>  target/riscv/op_helper.c                    | 132 ++++++++++++++++++++
>>  target/riscv/translate.c                    |   1 +
>>  target/s390x/tcg/mem_helper.c               |   6 +-
>>  15 files changed, 247 insertions(+), 14 deletions(-)
>>  create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>


Thanks! I guess you would want to pick the new version instead that is already
fully acked:

[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions


Richard already picked and sent patch 1 in his tcg patch queue here:


[PULL v2 00/62] tcg patch queue

So I guess you can either include patch 1 in your tree and exclude it when master
is updated or you can wait for patch 1 to land on master before picking the remaining
3 patches.


Thanks,


Daniel


> 
> in case Richard wants to take these along with the TCG patch, otherwise I'm happy to take these through the RISC-V tree when that lands (or do some sort of shared tag, as we're getting kind of close).

