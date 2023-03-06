Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZDdU-0003jx-Re
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 11:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZDdR-0003hi-QZ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 11:24:25 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZDdO-0002wy-G2
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 11:24:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso13655857pjr.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678119851;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=6605cSGO0aT8cSaArIWf5XMIupsaSVls55jNincpbCI=;
 b=HUf79zQQVux4Hrf/rvD7P9AeDJGPLr6XfrQPmhB9++TipQe6LCVVm6TNsCnaUnLFOD
 TSAvjgNtQaTrrkEz9r3wg45znT09naJ1px+OqaZE0BIaIgcV6L1AyrG4is2bN+esBA7M
 +1zuta+IPp/iArI6t1ZxDfgr5RnSVSmNEKIA3XX9zV5zmLhT6pJL2jUktD/Xdhk7BMZc
 bYjEO8AFqlwCvtSZtbO3O6d74Chrmua2sQn33VYPl6gIq6U3t8c5EhnddDAZH+dVmWfj
 PSeVfWa5LGG1OTfK5eJ2XOuxAwYAV0JpoKtnBngDG8g2atqpcsiM8NzW+uaDJFg4JLXp
 Qssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678119851;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6605cSGO0aT8cSaArIWf5XMIupsaSVls55jNincpbCI=;
 b=eaR1npBS00mR3+r2dTdpIblixxv/oQMuaiq2qYrbgYlyuVkQNv9ziW5Os6YUfdOY1O
 6xaCNG1S/fyKwYcIarC1GoNLxw6Dd2zUfa2s5KQ1gF0D4I5WIEZeY41uXYqijF7RiUcq
 ufDPX4gF+j9ebk9XdXQRi4h14sCfXqlTZgfPQAhSMYSVElk6BZEoWXehb5cR2mx/4TFP
 SJxSJNvGIgTmNTZg4DufSp5uJOtwBADjydZqlfejxMQlN6t7ryuO4ct42jEYbyb1Z6UL
 ToSTyI1zGqk5Zq0EUG45/fyzpGKL5bSyBoJFGc10yuLlBMbHeygh52yScjjqMc3SkctH
 34yA==
X-Gm-Message-State: AO0yUKWvb6RlcNfrHLKDJe/4EpRAHeSBOz9mqMgTkp4TDeBIRhAoGnn3
 BEOd7zKYGzyE9GTqh+Lfcz9Rfw==
X-Google-Smtp-Source: AK7set/JUnZABrLnSHTkxvicyHw8+tBi7V4PnIpcBeILxUE05Faj+afoc2l9Yn/Q9fVeYcMYIfNkyw==
X-Received: by 2002:a17:902:eac2:b0:19c:fa22:e98a with SMTP id
 p2-20020a170902eac200b0019cfa22e98amr11212992pld.8.1678119850773; 
 Mon, 06 Mar 2023 08:24:10 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 jh5-20020a170903328500b0019a983f0119sm6903133plb.307.2023.03.06.08.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:24:10 -0800 (PST)
Date: Mon, 06 Mar 2023 08:24:10 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 08:23:21 PST (-0800)
Subject: Re: [PATCH v11 0/5] riscv: Allow user to set the satp mode
In-Reply-To: <CAHVXubiCH=X-gi37DFpOFWsNn=-vPnKe4SV2Gnt6P-r1SFLKPQ@mail.gmail.com>
CC: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, ajones@ventanamicro.com, frank.chang@sifive.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-161312ff-359b-463e-bafd-e48aae6491c7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 16:24:26 -0000

On Mon, 06 Mar 2023 00:33:20 PST (-0800), alexghiti@rivosinc.com wrote:
> Hi Palmer,
>
> On Mon, Mar 6, 2023 at 12:34 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Fri, 03 Mar 2023 05:12:47 PST (-0800), alexghiti@rivosinc.com wrote:
>> > This introduces new properties to allow the user to set the satp mode,
>> > see patch 3 for full syntax. In addition, it prevents cpus to boot in a
>> > satp mode they do not support (see patch 4).
>> >
>> > base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
>> > https://gitlab.com/bonzini/qemu into staging")
>>
>> I have that, but I still got some merge conflicts.  I've put that here
>> <https://github.com/palmer-dabbelt/qemu/tree/set-satp> for now, pending
>> Daniel's response below.
>
> Weird, I have just tried again and it applied cleanly on the
> base-commit I mentioned, I tried to cherry-pick a few patches, even
> commit d4ea71170432 ("target/riscv: introduce riscv_cpu_cfg()") does
> not break the merge.

Weird, I'm just using b4 to pick up the patches from lore so not sure 
what's up.

> Anyway, FWIW I checked the patches on the set-satp branch again, and
> your merge seems ok.

OK, I picked those onto riscv-to-apply.next and everything looks fine on 
my end.

>
>>
>> >
>> > v11:
>> > - rebase on top of master
>> > - Added RB/AB from Frank and Alistair
>> > - Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
>> > - Set satp mode max for thead c906 to sv39
>>
>> Daniel: It looks like the feedback on v10 included dropping the first
>> patch
>> <https://lore.kernel.org/qemu-devel/66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com/T/#macdb6c5232bd8c082966107d7b44aaaec9b29ad6>.
>> Sorry if I'm just misunderstanding, but it looks to me like that patch
>> is still useful and the v11 doesn't even build without it.
>
> No, the first commit is a preparatory commit for the series, it is required.

Ya, that's what I'm seeing too.  It's in the queue before the rest.

Thanks!

>
>
>>
>> >
>> > v10:
>> > - Fix user mode build by surrounding satp handling with #ifndef
>> >   CONFIG_USER_ONLY, Frank
>> > - Fix AB/RB from Frank and Alistair
>> >
>> > v9:
>> > - Move valid_vm[i] up, Andrew
>> > - Fixed expansion of the bitmap map, Bin
>> > - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
>> > - Remove outer parenthesis and alignment, Bin
>> > - Fix qemu32 build failure, Bin
>> > - Fixed a few typos, Bin
>> > - Add RB from Andrew and Bin
>> >
>> > v8:
>> > - Remove useless !map check, Andrew
>> > - Add RB from Andrew
>> >
>> > v7:
>> > - Expand map to contain all valid modes, Andrew
>> > - Fix commit log for patch 3, Andrew
>> > - Remove is_32_bit argument from set_satp_mode_default, Andrew
>> > - Move and fixed comment, Andrew
>> > - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
>> >   too early, Alex
>> > - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
>> > - Use satp_mode directly instead of a string in
>> >   set_satp_mode_max_supported, Andrew
>> > - Swap the patch introducing supported bitmap and the patch that sets
>> >   sv57 in the dt, Andrew
>> > - Add various RB from Andrew and Alistair, thanks
>> >
>> > v6:
>> > - Remove the valid_vm check in validate_vm and add it to the finalize function
>> >   so that map already contains the constraint, Alex
>> > - Add forgotten mbare to satp_mode_from_str, Alex
>> > - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
>> > - Only add satp mode properties corresponding to the cpu, and then remove the
>> >   check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>> >   Andrew/Alistair/Alex
>> > - Move mmu-type setting to its own patch, Andrew
>> > - patch 5 is new and is a fix, Alex
>> >
>> > v5:
>> > - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>> >   suggested by Andrew
>> > - Split the v4 patch into 2 patches as suggested by Andrew
>> > - Lot of other minor corrections, from Andrew
>> > - Set the satp mode N by disabling the satp mode N + 1
>> > - Add a helper to set satp mode from a string, as suggested by Frank
>> >
>> > v4:
>> > - Use custom boolean properties instead of OnOffAuto properties, based
>> >   on ARMVQMap, as suggested by Andrew
>> >
>> > v3:
>> > - Free sv_name as pointed by Bin
>> > - Replace satp-mode with boolean properties as suggested by Andrew
>> > - Removed RB from Atish as the patch considerably changed
>> >
>> > v2:
>> > - Use error_setg + return as suggested by Alistair
>> > - Add RB from Atish
>> > - Fixed checkpatch issues missed in v1
>> > - Replaced Ludovic email address with the rivos one
>> >
>> > Alexandre Ghiti (5):
>> >   riscv: Pass Object to register_cpu_props instead of DeviceState
>> >   riscv: Change type of valid_vm_1_10_[32|64] to bool
>> >   riscv: Allow user to set the satp mode
>> >   riscv: Introduce satp mode hw capabilities
>> >   riscv: Correctly set the device-tree entry 'mmu-type'
>> >
>> >  hw/riscv/virt.c    |  19 +--
>> >  target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
>> >  target/riscv/cpu.h |  25 ++++
>> >  target/riscv/csr.c |  29 +++--
>> >  4 files changed, 323 insertions(+), 38 deletions(-)

