Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZEzu-0003Lw-A7
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 12:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pZEzC-00038Z-8z
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 12:51:05 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pZEzA-00027Y-64
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 12:50:57 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 a4-20020a056830008400b0069432af1380so5769275oto.13
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 09:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678125054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6i/zPskZG+cuSOoUYGUcMnHUtm5xXEl6JW2VanJfGUk=;
 b=iY1CZAO3jAf+DxX1zSPQiqeqMAIGf0pdg50H2EJ1zOr7YxUO3OkEAuluIa89rL7JNg
 Jh4DQW8Xf5YLejlajdNDdRJ6ATSpkeBQ7W1twGaOpuyS5nk+k4ign9pylLR7O8tR9TFC
 Ra8vbfuVcJFIG7T/sLOBJV1u3Ft2sqnLKTOQMfOr841HkZKxgSydHDXxRcJlfGtdDafx
 aHP+YoD3Gt7ffz7ioNQzu3lPidjhCvSRRatSqNiKvtMFSziQ9sZnlKRfttcjKQiVYqOZ
 dnTTmuBUyn28rDdZ27C1SWP0GAVIavG8u1jX1x4M3QNL4BSUjf8g6wZyC+f9MQM83hzK
 hK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678125054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6i/zPskZG+cuSOoUYGUcMnHUtm5xXEl6JW2VanJfGUk=;
 b=zvNG5dxa2E9UXAWCdkHbkNPhD5zhdrxcAQszPteMJ/euKzOklz6ZQyTA0bh1o8rLC/
 4Xc48w3ZhHBM3a/PbZ6kWIl0I58HMziREALVAf6YZgPfehqtsdX1ID64fXD4XPhsWoa3
 RjPuGuqumlyYmFD2/tpKjXkYXrgy3so6IF4pZSIP8xcrmyvJMzwTdUS4nt6rnOkrX/U1
 +K7ERsa2erpOcWZcS4MBlFnbyGXztLXH0NnwZutLO7MiwgKsq/4b6Cak0/ll2xI5LE3e
 9qZAfoRQ0gP1sadgM5JsvNwwBj51WNt7aP3POlKW9wOpI6I3FIjVm3Wdtotdon6woEJG
 wzlg==
X-Gm-Message-State: AO0yUKXntjZO3Y18oU6a8KWlosxzhJlz2Ar2el8od/kmMIQ+yQOhUyvI
 +Wpq6khkZeHe63Apj6vmUZMEVQ==
X-Google-Smtp-Source: AK7set+3kcxv2OHka7+W6dNHbPjSULAoQGObri9Thgjrl6sR/e19UjV53BtQgkiyhxxK5aHXXOKgOg==
X-Received: by 2002:a9d:71d9:0:b0:68b:a341:b93b with SMTP id
 z25-20020a9d71d9000000b0068ba341b93bmr4732157otj.36.1678125054382; 
 Mon, 06 Mar 2023 09:50:54 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a056830101a00b00693ea7bfdc2sm4308764otp.76.2023.03.06.09.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:50:54 -0800 (PST)
Message-ID: <d19e8fb9-1ac6-b50a-92cf-117797761bd5@ventanamicro.com>
Date: Mon, 6 Mar 2023 14:50:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 0/5] riscv: Allow user to set the satp mode
To: Palmer Dabbelt <palmer@dabbelt.com>, alexghiti@rivosinc.com
Cc: Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 ajones@ventanamicro.com, frank.chang@sifive.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <mhng-4e784c07-e2bb-40f9-a42c-d4b3c331ddba@palmer-ri-x1c9a>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mhng-4e784c07-e2bb-40f9-a42c-d4b3c331ddba@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 17:51:05 -0000



On 3/5/23 20:34, Palmer Dabbelt wrote:
> On Fri, 03 Mar 2023 05:12:47 PST (-0800), alexghiti@rivosinc.com wrote:
>> This introduces new properties to allow the user to set the satp mode,
>> see patch 3 for full syntax. In addition, it prevents cpus to boot in a
>> satp mode they do not support (see patch 4).
>>
>> base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
>> https://gitlab.com/bonzini/qemu into staging")
> 
> I have that, but I still got some merge conflicts.  I've put that here <https://github.com/palmer-dabbelt/qemu/tree/set-satp> for now, pending Daniel's response below.
> 
>>
>> v11:
>> - rebase on top of master
>> - Added RB/AB from Frank and Alistair
>> - Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
>> - Set satp mode max for thead c906 to sv39
> 
> Daniel: It looks like the feedback on v10 included dropping the first patch
> <https://lore.kernel.org/qemu-devel/66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com/T/#macdb6c5232bd8c082966107d7b44aaaec9b29ad6>.
> Sorry if I'm just misunderstanding, but it looks to me like that patch is still useful and the v11 doesn't even build without it.


I believe I mentioned that patch 1 was obsolete in the context of version 10, where
I think I also mentioned that a rebase would be good.

Alexandre rebased it and, from what I can see, patch 1 looks good to go.


Thanks,

Daniel

> 
>>
>> v10:
>> - Fix user mode build by surrounding satp handling with #ifndef
>>   CONFIG_USER_ONLY, Frank
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
>>   too early, Alex
>> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
>> - Use satp_mode directly instead of a string in
>>   set_satp_mode_max_supported, Andrew
>> - Swap the patch introducing supported bitmap and the patch that sets
>>   sv57 in the dt, Andrew
>> - Add various RB from Andrew and Alistair, thanks
>>
>> v6:
>> - Remove the valid_vm check in validate_vm and add it to the finalize function
>>   so that map already contains the constraint, Alex
>> - Add forgotten mbare to satp_mode_from_str, Alex
>> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
>> - Only add satp mode properties corresponding to the cpu, and then remove the
>>   check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>>   Andrew/Alistair/Alex
>> - Move mmu-type setting to its own patch, Andrew
>> - patch 5 is new and is a fix, Alex
>>
>> v5:
>> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>>   suggested by Andrew
>> - Split the v4 patch into 2 patches as suggested by Andrew
>> - Lot of other minor corrections, from Andrew
>> - Set the satp mode N by disabling the satp mode N + 1
>> - Add a helper to set satp mode from a string, as suggested by Frank
>>
>> v4:
>> - Use custom boolean properties instead of OnOffAuto properties, based
>>   on ARMVQMap, as suggested by Andrew
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
>>   riscv: Pass Object to register_cpu_props instead of DeviceState
>>   riscv: Change type of valid_vm_1_10_[32|64] to bool
>>   riscv: Allow user to set the satp mode
>>   riscv: Introduce satp mode hw capabilities
>>   riscv: Correctly set the device-tree entry 'mmu-type'
>>
>>  hw/riscv/virt.c    |  19 +--
>>  target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
>>  target/riscv/cpu.h |  25 ++++
>>  target/riscv/csr.c |  29 +++--
>>  4 files changed, 323 insertions(+), 38 deletions(-)

