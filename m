Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqqx-0003AI-U3
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqqv-00037P-64
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:39:13 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqqs-0005OC-Gs
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:39:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id h12so14217350wrv.10
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UBPBK/8WVUG281weFxX1rWV/1Fu5J7obKJ2aND06KEs=;
 b=eBsyw5GVD1D1B+FTX9KqHG0UNkBZagfyYcVNeLNuob1+jAkfgBEKC4lfBsekH6MqpZ
 JHw59HfseulJkKhMcg5OtfSgo9dILwsKSxKpEKHEbYR2fP8oybt5Sti0dVmrYio/JG6q
 MAx4rUcum80brvXGSuIwNRWxGdaabid+DxTkubKBBg8Al5tfosAoYRP4x3Cz35pfHpFz
 gsry9H2QnoP7HVp6GtSMvgh+sXkGv+PqoIPDi3ta4Mjo1OYmF4GOzmDaK2CeO6Z0Y+hj
 Ai0jOwRDMQPZWedxQlC99VwPkbK7Vk+rn86B5Ty1sHQxhBQuujtvTDsxfqGEDDE9Xfig
 yU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UBPBK/8WVUG281weFxX1rWV/1Fu5J7obKJ2aND06KEs=;
 b=uKrRzEwH0P27oOwk1cAi+NvawkF/JJo8cd0PTepAGIEva/Z6i/kT7hMva1CWbgvf4z
 IwM6kb0QTiRygj1JVA7VDdnRH6QRN9uYyJlyTaoC5y/WVhsqOLlyBtEc3KK6Lo3YZWUu
 praoLqVRMkV7uVyHEYz5R3icr7zuxxaMMqOz7jxmKHLZL+EVYbTaC7d3sCfo9W73SntJ
 TChAhOzjWiD4VM242gqJN5+ov7phwCMO2naDVx3JdV/SbBFI+n6wwxu64M6rS8YbmdVb
 pvBie9QfBz3Qxq1wDOjwt2x25eIe4U0cxhQBEU+JybyfLqUbSxGR8MljgDDwi/LOfD/J
 85nw==
X-Gm-Message-State: AO0yUKXAx5p7lBA7k4VOrPl0Oc86SNpNdG3vmPWlLu0KVYhdULDfLvNb
 WwZtlqyV6RgC9rMppOjeAnAdPg==
X-Google-Smtp-Source: AK7set9Qfdgb5BZmU3uxbPpynohorwQC3BKjVfJVmwSR6bQjfCrD4M6fFLLyFpSoE2HBGh5uxGKLnw==
X-Received: by 2002:a5d:5b19:0:b0:2bf:ee15:ba85 with SMTP id
 bx25-20020a5d5b19000000b002bfee15ba85mr6986745wrb.18.1675172348767; 
 Tue, 31 Jan 2023 05:39:08 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfe382000000b002bfae43109fsm14687660wrm.93.2023.01.31.05.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:39:08 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 0/5] riscv: Allow user to set the satp mode
Date: Tue, 31 Jan 2023 14:39:01 +0100
Message-Id: <20230131133906.1956228-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 13:39:14 -0000

This introduces new properties to allow the user to set the satp mode,
see patch 3 for full syntax. In addition, it prevents cpus to boot in a
satp mode they do not support (see patch 4).

v9:
- Move valid_vm[i] up, Andrew
- Fixed expansion of the bitmap map, Bin
- Rename set_satp_mode_default into set_satp_mode_default_map, Bin
- Remove outer parenthesis and alignment, Bin
- Fix qemu32 build failure, Bin
- Fixed a few typos, Bin
- Add RB from Andrew and Bin

v8:
- Remove useless !map check, Andrew
- Add RB from Andrew

v7:
- Expand map to contain all valid modes, Andrew
- Fix commit log for patch 3, Andrew
- Remove is_32_bit argument from set_satp_mode_default, Andrew
- Move and fixed comment, Andrew
- Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
  too early, Alex
- Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
- Use satp_mode directly instead of a string in
  set_satp_mode_max_supported, Andrew
- Swap the patch introducing supported bitmap and the patch that sets
  sv57 in the dt, Andrew
- Add various RB from Andrew and Alistair, thanks

v6:
- Remove the valid_vm check in validate_vm and add it to the finalize function
  so that map already contains the constraint, Alex
- Add forgotten mbare to satp_mode_from_str, Alex
- Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
- Only add satp mode properties corresponding to the cpu, and then remove the
  check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
  Andrew/Alistair/Alex
- Move mmu-type setting to its own patch, Andrew
- patch 5 is new and is a fix, Alex

v5:
- Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
  suggested by Andrew
- Split the v4 patch into 2 patches as suggested by Andrew
- Lot of other minor corrections, from Andrew
- Set the satp mode N by disabling the satp mode N + 1
- Add a helper to set satp mode from a string, as suggested by Frank

v4:
- Use custom boolean properties instead of OnOffAuto properties, based
  on ARMVQMap, as suggested by Andrew

v3:
- Free sv_name as pointed by Bin
- Replace satp-mode with boolean properties as suggested by Andrew
- Removed RB from Atish as the patch considerably changed

v2:
- Use error_setg + return as suggested by Alistair
- Add RB from Atish
- Fixed checkpatch issues missed in v1
- Replaced Ludovic email address with the rivos one

Alexandre Ghiti (5):
  riscv: Pass Object to register_cpu_props instead of DeviceState
  riscv: Change type of valid_vm_1_10_[32|64] to bool
  riscv: Allow user to set the satp mode
  riscv: Introduce satp mode hw capabilities
  riscv: Correctly set the device-tree entry 'mmu-type'

 hw/riscv/virt.c    |  19 ++--
 target/riscv/cpu.c | 251 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  23 +++++
 target/riscv/csr.c |  29 +++---
 4 files changed, 291 insertions(+), 31 deletions(-)

-- 
2.37.2


