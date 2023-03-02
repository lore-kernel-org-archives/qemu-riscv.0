Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXq5g-0007Hm-89
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 16:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXq5e-0007HM-L7
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 16:03:50 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXq5c-0000yj-Re
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 16:03:50 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-172afa7bee2so829093fac.6
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677791027;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LhY7iIsXBFXTWM3mpXVeILEc+8ewThHWArOrk4CifO8=;
 b=CDBXsB5bKOPLoIfpBGjpucB0AlMKOO6IDttc0bLH1ABbknqRsskuIWcIZ+ttjSsVZq
 p4H34qS2lQk/pcuY2oJxnDVDfRuiEN5vqeTwQilCEHMqECMRuXcGpaveeM1ZWs7zOzEE
 kuRPZCgLFlmyu5twHR5M772GTC5HaKUCPth2N4OloBcNaYjNgzoukcR2JwGGOFWnUarN
 8ro3Pp2P9Y5FP/aw9YZp//8cpqYL/BSMIbCs6GOL7ziU84fKxs6xZDJIp7qG4rL5Yvj2
 Wl+K0hzUHNUKLtOCuoSAhhy0y/lrXfYJnJUP5wRRFYRka8jmxxZYLoO+ubyiFDSgYTKr
 qJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677791027;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LhY7iIsXBFXTWM3mpXVeILEc+8ewThHWArOrk4CifO8=;
 b=ypWq95Gxhlp5qijDiqUPtrKCRoWw036w9Yfyrfo6XFbZPqQyylpofiv9/RmWQkskwe
 XeJ9xp/fpIkvQ4M2CwOp0CJkbmikOTKXhGtddUGYGpQHiKtMQDLnnrUGo1PP0uy27V2p
 PKHjliIPE+1X9nwOF27QSsYGRVpuTQ7B4jkDAJDYl652b1IRiwDIvvv5vpouw4WgOIJB
 kjK1MqikNtXycfKgNxwbnDS/6x+b09MA9Ri7PcIPDy45To8FCZHKyEfxpuJIq7PZHJ2j
 WpIpLkbWBN5GpuuMfT/MvCXuCTP6fJ6KJ5gq+IQOJe63Os7IODhA+BXiEDjrIubdNLFO
 +iNA==
X-Gm-Message-State: AO0yUKXZ63+moSwRAsPNGGYzFYZxyt/IRzJnXCq5MsokqDuIe3qqWvg9
 Uil29RZL6jj3+vRVGmOHVUPkUw==
X-Google-Smtp-Source: AK7set9+xGeDxjW/wdEihUnTH4+wpLjuHn2ZHqTQz0vQ3yY6oK/ZCBjKl0OrsuO4UN3MzX/SmLX7fg==
X-Received: by 2002:a05:6871:58b:b0:172:4d68:d0c8 with SMTP id
 u11-20020a056871058b00b001724d68d0c8mr6358670oan.4.1677791027228; 
 Thu, 02 Mar 2023 13:03:47 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a056871039500b001727d62899bsm305868oaf.26.2023.03.02.13.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:03:46 -0800 (PST)
Message-ID: <66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com>
Date: Thu, 2 Mar 2023 18:03:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 0/5] riscv: Allow user to set the satp mode
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
 <7591407b-e8d0-aa05-86a3-8ca7988a6e69@ventanamicro.com>
In-Reply-To: <7591407b-e8d0-aa05-86a3-8ca7988a6e69@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Thu, 02 Mar 2023 21:03:50 -0000



On 3/2/23 14:42, Daniel Henrique Barboza wrote:
> Hi Palmer,
> 
> I think this series can be picked. All patches are fully acked. There is a nit
> in patch 3 that I believe you can choose to fix in-tree if you want to.

Update: patch 1 is not applicable anymore due to changes in current master. All
other patches have conflicts as well.

I guess it's easier to Alexandre to rebase and re-send it when possible. Frank's
comment in patch 3 can also be handled during the process.


Thanks,


Daniel



> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
> On 2/3/23 02:58, Alexandre Ghiti wrote:
>> This introduces new properties to allow the user to set the satp mode,
>> see patch 3 for full syntax. In addition, it prevents cpus to boot in a
>> satp mode they do not support (see patch 4).
>>
>> base-commit: commit 75cc28648574 ("configure: remove
>> backwards-compatibility code"
>>
>> v10:
>> - Fix user mode build by surrounding satp handling with #ifndef
>>    CONFIG_USER_ONLY, Frank
>> - Fix AB/RB from Frank and Alistair
>>
>> v9:
>> - Move valid_vm[i] up, Andrew
>> - Fixed expansion of the bitmap map, Bin
>> - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
>> - Remove outer parenthesis and alignment, Bin
>> - Fix qemu32 build failure, Bin
>> - Fixed a few typos, Bin
>> - Add RB from Andrew and Bin
>>
>> v8:
>> - Remove useless !map check, Andrew
>> - Add RB from Andrew
>>
>> v7:
>> - Expand map to contain all valid modes, Andrew
>> - Fix commit log for patch 3, Andrew
>> - Remove is_32_bit argument from set_satp_mode_default, Andrew
>> - Move and fixed comment, Andrew
>> - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
>>    too early, Alex
>> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
>> - Use satp_mode directly instead of a string in
>>    set_satp_mode_max_supported, Andrew
>> - Swap the patch introducing supported bitmap and the patch that sets
>>    sv57 in the dt, Andrew
>> - Add various RB from Andrew and Alistair, thanks
>>
>> v6:
>> - Remove the valid_vm check in validate_vm and add it to the finalize function
>>    so that map already contains the constraint, Alex
>> - Add forgotten mbare to satp_mode_from_str, Alex
>> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
>> - Only add satp mode properties corresponding to the cpu, and then remove the
>>    check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>>    Andrew/Alistair/Alex
>> - Move mmu-type setting to its own patch, Andrew
>> - patch 5 is new and is a fix, Alex
>>
>> v5:
>> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>>    suggested by Andrew
>> - Split the v4 patch into 2 patches as suggested by Andrew
>> - Lot of other minor corrections, from Andrew
>> - Set the satp mode N by disabling the satp mode N + 1
>> - Add a helper to set satp mode from a string, as suggested by Frank
>>
>> v4:
>> - Use custom boolean properties instead of OnOffAuto properties, based
>>    on ARMVQMap, as suggested by Andrew
>>
>> v3:
>> - Free sv_name as pointed by Bin
>> - Replace satp-mode with boolean properties as suggested by Andrew
>> - Removed RB from Atish as the patch considerably changed
>>
>> v2:
>> - Use error_setg + return as suggested by Alistair
>> - Add RB from Atish
>> - Fixed checkpatch issues missed in v1
>> - Replaced Ludovic email address with the rivos one
>>
>> Alexandre Ghiti (5):
>>    riscv: Pass Object to register_cpu_props instead of DeviceState
>>    riscv: Change type of valid_vm_1_10_[32|64] to bool
>>    riscv: Allow user to set the satp mode
>>    riscv: Introduce satp mode hw capabilities
>>    riscv: Correctly set the device-tree entry 'mmu-type'
>>
>>   hw/riscv/virt.c    |  19 ++--
>>   target/riscv/cpu.c | 271 +++++++++++++++++++++++++++++++++++++++++++--
>>   target/riscv/cpu.h |  25 +++++
>>   target/riscv/csr.c |  29 +++--
>>   4 files changed, 313 insertions(+), 31 deletions(-)
>>

