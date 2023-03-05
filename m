Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYxrr-0003uI-05
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 18:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYxro-0003tl-TV
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:34:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pYxrm-0005mD-B8
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:34:12 -0500
Received: by mail-pj1-x1030.google.com with SMTP id oj5so8039977pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 15:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678059248;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=qgQp+2WkWbxTMKE6qccGR83e46wDMyzFlfCJOcXRl+4=;
 b=cXn6OkG6ixlRDEWipP4VYPCohfsXFlGIQWQGsT5SufxYyfWOVTQt/q/g8PVKXEtirP
 T4RAW0IcaPSGAVKRDK7Q2jhQMbU4q/VQWFN5wX2vOWruEelk0O0C3czgExk5dZVvXJGo
 xy+v/wD1xhdyRx8syEZmbnIqi8BSg/iE3yMKEse/jycCUIgh7881bB9KVSvJWqfBihQa
 lPsaZwZox3+rRu4EUS97+UUfPcv6KikwBxBM7bvMau1j/h8wdFXbsz+0T8AEwX4+74jG
 czjESi1mroP1RhfPN+7DogU7l9cXTo82FvITpjvfNNd7qCHJimkpH+ef4fvGlET44do+
 XOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678059248;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgQp+2WkWbxTMKE6qccGR83e46wDMyzFlfCJOcXRl+4=;
 b=eQKENBtVn9F2nx3rEgzJf/mNyzPWaeLPxPUC1B7tOlr2L22QS1IiIk9memc12OOxyn
 iPDHdgBHOGAZYfl8f3HtXlaorOD4S5mJTD0qplffWp5EQwAgi2IxFlOZA5VMG1tYrGXx
 eZFiViV6ha9RsS2rpyX+lYzR6a8YaQDsHDx/4qQmeaSvaC+2v2bBeM5TPbmHgN2PvqoX
 GDz22XhpZ+f3St921lxWMaMkS02Z1jXoU9tYhHVMGlYf3G8jeI1+IkTX02xj2pcRgemE
 96KJKrA4HSkG0hL8BfyXDXOPW3KpqBdmK7l1PgCSLdJfG74gsWIzaJXkNe5SZc/VhRlx
 wJuQ==
X-Gm-Message-State: AO0yUKUyjJpzhqYwkFW6T/AMXq3DLT9yNMV5qcXDm8aow0LbMcTO1agE
 owX4U1wwyPEeGv7LV1iphWUMIg==
X-Google-Smtp-Source: AK7set+Y1De4DuD9QTaTch8YYsBptquf9PZSGQeRm6B7Oof4K29B2gvJxa3v0Sap3tnhSVNgmKDf+A==
X-Received: by 2002:a17:902:e5ce:b0:199:25d1:e559 with SMTP id
 u14-20020a170902e5ce00b0019925d1e559mr12214598plf.0.1678059247907; 
 Sun, 05 Mar 2023 15:34:07 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 l11-20020a17090270cb00b00194caf3e975sm5157986plt.208.2023.03.05.15.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 15:34:07 -0800 (PST)
Date: Sun, 05 Mar 2023 15:34:07 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 15:32:35 PST (-0800)
Subject: Re: [PATCH v11 0/5] riscv: Allow user to set the satp mode
In-Reply-To: <20230303131252.892893-1-alexghiti@rivosinc.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 ajones@ventanamicro.com, frank.chang@sifive.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com, dbarboza@ventanamicro.com
Message-ID: <mhng-4e784c07-e2bb-40f9-a42c-d4b3c331ddba@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Sun, 05 Mar 2023 23:34:13 -0000

On Fri, 03 Mar 2023 05:12:47 PST (-0800), alexghiti@rivosinc.com wrote:
> This introduces new properties to allow the user to set the satp mode,
> see patch 3 for full syntax. In addition, it prevents cpus to boot in a
> satp mode they do not support (see patch 4).
>
> base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
> https://gitlab.com/bonzini/qemu into staging")

I have that, but I still got some merge conflicts.  I've put that here 
<https://github.com/palmer-dabbelt/qemu/tree/set-satp> for now, pending 
Daniel's response below.

>
> v11:
> - rebase on top of master
> - Added RB/AB from Frank and Alistair
> - Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
> - Set satp mode max for thead c906 to sv39

Daniel: It looks like the feedback on v10 included dropping the first 
patch
<https://lore.kernel.org/qemu-devel/66d80b94-5941-31f3-995f-e9666a91fbb7@ventanamicro.com/T/#macdb6c5232bd8c082966107d7b44aaaec9b29ad6>.
Sorry if I'm just misunderstanding, but it looks to me like that patch 
is still useful and the v11 doesn't even build without it.

>
> v10:
> - Fix user mode build by surrounding satp handling with #ifndef
>   CONFIG_USER_ONLY, Frank
> - Fix AB/RB from Frank and Alistair
>
> v9:
> - Move valid_vm[i] up, Andrew
> - Fixed expansion of the bitmap map, Bin
> - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
> - Remove outer parenthesis and alignment, Bin
> - Fix qemu32 build failure, Bin
> - Fixed a few typos, Bin
> - Add RB from Andrew and Bin
>
> v8:
> - Remove useless !map check, Andrew
> - Add RB from Andrew
>
> v7:
> - Expand map to contain all valid modes, Andrew
> - Fix commit log for patch 3, Andrew
> - Remove is_32_bit argument from set_satp_mode_default, Andrew
> - Move and fixed comment, Andrew
> - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
>   too early, Alex
> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
> - Use satp_mode directly instead of a string in
>   set_satp_mode_max_supported, Andrew
> - Swap the patch introducing supported bitmap and the patch that sets
>   sv57 in the dt, Andrew
> - Add various RB from Andrew and Alistair, thanks
>
> v6:
> - Remove the valid_vm check in validate_vm and add it to the finalize function
>   so that map already contains the constraint, Alex
> - Add forgotten mbare to satp_mode_from_str, Alex
> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
> - Only add satp mode properties corresponding to the cpu, and then remove the
>   check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>   Andrew/Alistair/Alex
> - Move mmu-type setting to its own patch, Andrew
> - patch 5 is new and is a fix, Alex
>
> v5:
> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>   suggested by Andrew
> - Split the v4 patch into 2 patches as suggested by Andrew
> - Lot of other minor corrections, from Andrew
> - Set the satp mode N by disabling the satp mode N + 1
> - Add a helper to set satp mode from a string, as suggested by Frank
>
> v4:
> - Use custom boolean properties instead of OnOffAuto properties, based
>   on ARMVQMap, as suggested by Andrew
>
> v3:
> - Free sv_name as pointed by Bin
> - Replace satp-mode with boolean properties as suggested by Andrew
> - Removed RB from Atish as the patch considerably changed
>
> v2:
> - Use error_setg + return as suggested by Alistair
> - Add RB from Atish
> - Fixed checkpatch issues missed in v1
> - Replaced Ludovic email address with the rivos one
>
> Alexandre Ghiti (5):
>   riscv: Pass Object to register_cpu_props instead of DeviceState
>   riscv: Change type of valid_vm_1_10_[32|64] to bool
>   riscv: Allow user to set the satp mode
>   riscv: Introduce satp mode hw capabilities
>   riscv: Correctly set the device-tree entry 'mmu-type'
>
>  hw/riscv/virt.c    |  19 +--
>  target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
>  target/riscv/cpu.h |  25 ++++
>  target/riscv/csr.c |  29 +++--
>  4 files changed, 323 insertions(+), 38 deletions(-)

