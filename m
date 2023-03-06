Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZ6I0-0004bm-NH
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 03:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pZ6Hu-0004bO-8r
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 03:33:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pZ6Hl-0003ht-3W
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 03:33:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so4666995wmq.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 00:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678091611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibF4ybF4Ws8o4T9oAIQ18WOYdCEg4Mfe/uDfEQIPEes=;
 b=euAixTX8dR788iaS+DRb7O2ZJVJFVj7SjpBLqScqcxAgZmdxXJRkOPD5+v2B0jj73J
 W3WEOGbe5y2i6m15dba7W6uG2tkQwdDxvpkLm7FoRs5aJTOWGFU8hdw3/43d12slYKfY
 8h1TNBo92MIQjKvGxVjvV/hOoNfCbHslzWqRrrb2SQKLLTBlJUvG02K2jgoog6/aPtYV
 JSir5OmXCTQq5NWQlatCl7r476Wt/yiqXAoF2qi1rq7YgjhZxaycXeVK2+DdVu1FulJS
 k5BjZcbWtR3oNEkQBww9Al6dUBEgJiqIe5sz3vnLmRp2SXltPng0XPwxCN41qx8VcdpX
 uWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678091611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibF4ybF4Ws8o4T9oAIQ18WOYdCEg4Mfe/uDfEQIPEes=;
 b=m8bYPJM/OipPaFhtEJXum2O0sCWYCVG/TDSWGBlYZgFotYQcHFdsGqT5FI9ORMDXDg
 aV3a1UW5pR5VwP0kFHX9sdiwpp2+gOxhEUA7o1vXDVjl4ixKPbfYnWBlxt30YcPu9/QU
 gPa+8IhIhY9eQhiuMPG3jN9RFxECEVn8zwL4STKGKeX8CC0flG7DNRJ81iDysraRa20s
 PyO3hI2t+S4ZB/JRCJg17icVQb1hQpwW9IHMMP2QADM1jf3bFEMhfontPpHqVvfbBeOA
 TJeN+WXSb1ZQV69INOoUCaEwUdJJDV6LBQ9Y/MkV5ZXt4dP8pjB+t6MChsziOkXtM3fU
 oeJw==
X-Gm-Message-State: AO0yUKUh7jDemWnlGmTNcEe6BIxRqRVdplcWCZ/nHPhCET0XN8KiqG92
 EXa6daZz/ICLNB7YHQ/i5dWQtS1XL1mDqRftVYMPHw==
X-Google-Smtp-Source: AK7set/1OWB18GVh5BErNM9qT+SHtKXtoSTHQf2af7R9Nbyn99UUJMdIs+aijevLfnXACJbCpJgXp8sOWJxrdFafV+0=
X-Received: by 2002:a05:600c:a695:b0:3df:97cf:4593 with SMTP id
 ip21-20020a05600ca69500b003df97cf4593mr2052544wmb.6.1678091610761; Mon, 06
 Mar 2023 00:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20230303131252.892893-1-alexghiti@rivosinc.com>
 <mhng-4e784c07-e2bb-40f9-a42c-d4b3c331ddba@palmer-ri-x1c9a>
In-Reply-To: <mhng-4e784c07-e2bb-40f9-a42c-d4b3c331ddba@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 6 Mar 2023 09:33:20 +0100
Message-ID: <CAHVXubiCH=X-gi37DFpOFWsNn=-vPnKe4SV2Gnt6P-r1SFLKPQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] riscv: Allow user to set the satp mode
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: dbarboza@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 bin.meng@windriver.com, ajones@ventanamicro.com, frank.chang@sifive.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 08:33:45 -0000

Hi Palmer,

On Mon, Mar 6, 2023 at 12:34=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Fri, 03 Mar 2023 05:12:47 PST (-0800), alexghiti@rivosinc.com wrote:
> > This introduces new properties to allow the user to set the satp mode,
> > see patch 3 for full syntax. In addition, it prevents cpus to boot in a
> > satp mode they do not support (see patch 4).
> >
> > base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
> > https://gitlab.com/bonzini/qemu into staging")
>
> I have that, but I still got some merge conflicts.  I've put that here
> <https://github.com/palmer-dabbelt/qemu/tree/set-satp> for now, pending
> Daniel's response below.

Weird, I have just tried again and it applied cleanly on the
base-commit I mentioned, I tried to cherry-pick a few patches, even
commit d4ea71170432 ("target/riscv: introduce riscv_cpu_cfg()") does
not break the merge.

Anyway, FWIW I checked the patches on the set-satp branch again, and
your merge seems ok.

>
> >
> > v11:
> > - rebase on top of master
> > - Added RB/AB from Frank and Alistair
> > - Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
> > - Set satp mode max for thead c906 to sv39
>
> Daniel: It looks like the feedback on v10 included dropping the first
> patch
> <https://lore.kernel.org/qemu-devel/66d80b94-5941-31f3-995f-e9666a91fbb7@=
ventanamicro.com/T/#macdb6c5232bd8c082966107d7b44aaaec9b29ad6>.
> Sorry if I'm just misunderstanding, but it looks to me like that patch
> is still useful and the v11 doesn't even build without it.

No, the first commit is a preparatory commit for the series, it is required=
.


>
> >
> > v10:
> > - Fix user mode build by surrounding satp handling with #ifndef
> >   CONFIG_USER_ONLY, Frank
> > - Fix AB/RB from Frank and Alistair
> >
> > v9:
> > - Move valid_vm[i] up, Andrew
> > - Fixed expansion of the bitmap map, Bin
> > - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
> > - Remove outer parenthesis and alignment, Bin
> > - Fix qemu32 build failure, Bin
> > - Fixed a few typos, Bin
> > - Add RB from Andrew and Bin
> >
> > v8:
> > - Remove useless !map check, Andrew
> > - Add RB from Andrew
> >
> > v7:
> > - Expand map to contain all valid modes, Andrew
> > - Fix commit log for patch 3, Andrew
> > - Remove is_32_bit argument from set_satp_mode_default, Andrew
> > - Move and fixed comment, Andrew
> > - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
> >   too early, Alex
> > - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
> > - Use satp_mode directly instead of a string in
> >   set_satp_mode_max_supported, Andrew
> > - Swap the patch introducing supported bitmap and the patch that sets
> >   sv57 in the dt, Andrew
> > - Add various RB from Andrew and Alistair, thanks
> >
> > v6:
> > - Remove the valid_vm check in validate_vm and add it to the finalize f=
unction
> >   so that map already contains the constraint, Alex
> > - Add forgotten mbare to satp_mode_from_str, Alex
> > - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, A=
ndrew
> > - Only add satp mode properties corresponding to the cpu, and then remo=
ve the
> >   check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
> >   Andrew/Alistair/Alex
> > - Move mmu-type setting to its own patch, Andrew
> > - patch 5 is new and is a fix, Alex
> >
> > v5:
> > - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
> >   suggested by Andrew
> > - Split the v4 patch into 2 patches as suggested by Andrew
> > - Lot of other minor corrections, from Andrew
> > - Set the satp mode N by disabling the satp mode N + 1
> > - Add a helper to set satp mode from a string, as suggested by Frank
> >
> > v4:
> > - Use custom boolean properties instead of OnOffAuto properties, based
> >   on ARMVQMap, as suggested by Andrew
> >
> > v3:
> > - Free sv_name as pointed by Bin
> > - Replace satp-mode with boolean properties as suggested by Andrew
> > - Removed RB from Atish as the patch considerably changed
> >
> > v2:
> > - Use error_setg + return as suggested by Alistair
> > - Add RB from Atish
> > - Fixed checkpatch issues missed in v1
> > - Replaced Ludovic email address with the rivos one
> >
> > Alexandre Ghiti (5):
> >   riscv: Pass Object to register_cpu_props instead of DeviceState
> >   riscv: Change type of valid_vm_1_10_[32|64] to bool
> >   riscv: Allow user to set the satp mode
> >   riscv: Introduce satp mode hw capabilities
> >   riscv: Correctly set the device-tree entry 'mmu-type'
> >
> >  hw/riscv/virt.c    |  19 +--
> >  target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
> >  target/riscv/cpu.h |  25 ++++
> >  target/riscv/csr.c |  29 +++--
> >  4 files changed, 323 insertions(+), 38 deletions(-)

