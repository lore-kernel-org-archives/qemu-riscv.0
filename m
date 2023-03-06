Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZGBT-00034c-I5
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 14:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZGBP-00031U-PC
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 14:07:39 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZGBL-0006SX-Q6
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 14:07:38 -0500
Received: by mail-pl1-x634.google.com with SMTP id u5so11532468plq.7
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678129654;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QT38CqtabU4havVK6D0DM8wv1EKLmP1Vzx6p8sxQeqM=;
 b=oUR3PnO/y5sI6CzUg0jC/oowEuApEq+rJW4UJPVec378UJW9im5bIt7YSypyxgycw6
 YulQGM0ZPQv1aSzzJXImzQPK0bbw4o9fxVKq0If6M3Pq31n+XoSmNT4ymHx/vMOpmsrA
 fhYJ5MnaHNBLjlaZGoDxwo9qtJAG3NQsQjfnZoejZzWHNOmDOs2PhmBT97sYuOGBpz4z
 aNKbSYxxZyiuBIq5VOqI7mVWznbAM4r4G1rxyGl2YbIPlTY9f7s0D4wx/L31bODmsTon
 MPY1jp8lloE1Ij7jWRIwz975OjJtu6nmBql1XEo0v/Rnxg0F0T7uV+j0OvtlLoWq7eq2
 GV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678129654;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QT38CqtabU4havVK6D0DM8wv1EKLmP1Vzx6p8sxQeqM=;
 b=uASG/s0SdYI4n9wl30WCgnyXrKce9vM4faGeYW8Wus47foq1nD2CCfAJONh+wqkyya
 TY8yUFiWQZi9Ij/GtUs+PSFn60jGmrtvmbpF8ShrQXXuR8s767U0/gjsg9ICBJhurCGC
 0hDOqEqlnwbjRYEVpsjF1Q9w0TIWyHUIcXMPq3B2IPUCclDBeEb5GQLUw+5u7b+/KCsN
 E8XgyksF36xCVbrvbpYh++Thf90xc/e1VRIx9GFKdEONE4hldAaOSDvGlfPrwMxTK1co
 LYiU8YXiPtOne61h3cPpKS+nBVJVSaMkQe9PCUEEZ+rv90BXcAVP5/COMRKs2MQT9aCQ
 /WRA==
X-Gm-Message-State: AO0yUKW8vwl8nzJMssX3ccuOeYP59domub7M82NPiC7mLV/SfWgO9uhH
 KisFcQ2KpNgsXGvNGbmKfP9Qhg==
X-Google-Smtp-Source: AK7set+mVV1cRC8fK8a+/AdXaNci3zEiPCLPfeU3flcYP90qVBAx98m4FpvjhpdSZH06/zELOAB8OA==
X-Received: by 2002:a05:6a20:8b23:b0:cc:5be9:fe63 with SMTP id
 l35-20020a056a208b2300b000cc5be9fe63mr10260868pzh.8.1678129653833; 
 Mon, 06 Mar 2023 11:07:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 v9-20020aa78089000000b005e4d8c6168csm6561293pff.210.2023.03.06.11.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:07:33 -0800 (PST)
Date: Mon, 06 Mar 2023 11:07:33 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 11:06:42 PST (-0800)
Subject: Re: [PATCH v11 0/5] riscv: Allow user to set the satp mode
In-Reply-To: <d19e8fb9-1ac6-b50a-92cf-117797761bd5@ventanamicro.com>
CC: alexghiti@rivosinc.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, ajones@ventanamicro.com, frank.chang@sifive.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-1ec21440-93be-4428-8a61-0047104e50a6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 19:07:40 -0000

On Mon, 06 Mar 2023 09:50:49 PST (-0800), dbarboza@ventanamicro.com wrote:
>
>
> On 3/5/23 20:34, Palmer Dabbelt wrote:
>> On Fri, 03 Mar 2023 05:12:47 PST (-0800), alexghiti@rivosinc.com wrote:
>>> This introduces new properties to allow the user to set the satp mode,
>>> see patch 3 for full syntax. In addition, it prevents cpus to boot in a
>>> satp mode they do not support (see patch 4).
>>>
>>> base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
>>> https://gitlab.com/bonzini/qemu into staging")
>>
>> I have that, but I still got some merge conflicts.  I've put that here <https://github.com/palmer-dabbelt/qemu/tree/set-satp> for now, pending Daniel's response below.
>>
>>>
>>> v11:
>>> - rebase on top of master
>>> - Added RB/AB from Frank and Alistair
>>> - Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
>>> - Set satp mode max for thead c906 to sv39
>>
>> Daniel: It looks like the feedback on v10 included dropping the first patch
>> <https://lore.kernel.org/qemu-devel/66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com/T/#macdb6c5232bd8c082966107d7b44aaaec9b29ad6>.
>> Sorry if I'm just misunderstanding, but it looks to me like that patch is still useful and the v11 doesn't even build without it.
>
>
> I believe I mentioned that patch 1 was obsolete in the context of version 10, where
> I think I also mentioned that a rebase would be good.
>
> Alexandre rebased it and, from what I can see, patch 1 looks good to go.

Sounds good, thanks.

>
>
> Thanks,
>
> Daniel
>
>>
>>>
>>> v10:
>>> - Fix user mode build by surrounding satp handling with #ifndef
>>>   CONFIG_USER_ONLY, Frank
>>> - Fix AB/RB from Frank and Alistair
>>>
>>> v9:
>>> - Move valid_vm[i] up, Andrew
>>> - Fixed expansion of the bitmap map, Bin
>>> - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
>>> - Remove outer parenthesis and alignment, Bin
>>> - Fix qemu32 build failure, Bin
>>> - Fixed a few typos, Bin
>>> - Add RB from Andrew and Bin
>>>
>>> v8:
>>> - Remove useless !map check, Andrew
>>> - Add RB from Andrew
>>>
>>> v7:
>>> - Expand map to contain all valid modes, Andrew
>>> - Fix commit log for patch 3, Andrew
>>> - Remove is_32_bit argument from set_satp_mode_default, Andrew
>>> - Move and fixed comment, Andrew
>>> - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
>>>   too early, Alex
>>> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
>>> - Use satp_mode directly instead of a string in
>>>   set_satp_mode_max_supported, Andrew
>>> - Swap the patch introducing supported bitmap and the patch that sets
>>>   sv57 in the dt, Andrew
>>> - Add various RB from Andrew and Alistair, thanks
>>>
>>> v6:
>>> - Remove the valid_vm check in validate_vm and add it to the finalize function
>>>   so that map already contains the constraint, Alex
>>> - Add forgotten mbare to satp_mode_from_str, Alex
>>> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
>>> - Only add satp mode properties corresponding to the cpu, and then remove the
>>>   check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>>>   Andrew/Alistair/Alex
>>> - Move mmu-type setting to its own patch, Andrew
>>> - patch 5 is new and is a fix, Alex
>>>
>>> v5:
>>> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>>>   suggested by Andrew
>>> - Split the v4 patch into 2 patches as suggested by Andrew
>>> - Lot of other minor corrections, from Andrew
>>> - Set the satp mode N by disabling the satp mode N + 1
>>> - Add a helper to set satp mode from a string, as suggested by Frank
>>>
>>> v4:
>>> - Use custom boolean properties instead of OnOffAuto properties, based
>>>   on ARMVQMap, as suggested by Andrew
>>>
>>> v3:
>>> - Free sv_name as pointed by Bin
>>> - Replace satp-mode with boolean properties as suggested by Andrew
>>> - Removed RB from Atish as the patch considerably changed
>>>
>>> v2:
>>> - Use error_setg + return as suggested by Alistair
>>> - Add RB from Atish
>>> - Fixed checkpatch issues missed in v1
>>> - Replaced Ludovic email address with the rivos one
>>>
>>> Alexandre Ghiti (5):
>>>   riscv: Pass Object to register_cpu_props instead of DeviceState
>>>   riscv: Change type of valid_vm_1_10_[32|64] to bool
>>>   riscv: Allow user to set the satp mode
>>>   riscv: Introduce satp mode hw capabilities
>>>   riscv: Correctly set the device-tree entry 'mmu-type'
>>>
>>>  hw/riscv/virt.c    |  19 +--
>>>  target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
>>>  target/riscv/cpu.h |  25 ++++
>>>  target/riscv/csr.c |  29 +++--
>>>  4 files changed, 323 insertions(+), 38 deletions(-)

