Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJsjk-00088r-Ue
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 04:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJsji-00088Z-Fs
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:03:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJsjg-0003PN-Ki
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 04:03:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id z5so10085884wrt.6
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rpNCYNmj/RGuzZVe6NS1zGXkrN+iPK60QEavSksXkSc=;
 b=hGkuGFd9S+Cm+JRaGP+OB1cxrqKwpQJ01adMX/gctNT1eAEYsSS/ZLaJDyLb+AWmhK
 brc/qN6Y4PWEuCNkfKAd+kUqQy7DsGHd+aQEVGHsXklIhGen58er5pAfJrBiIawgHpto
 vKxm4gwogAKOxf4nj8lZd/nGTxPmUFWvrhE02dOdNTYcdyysU18T7MtwG6EosartEcGi
 hX4THNT745qqe/jeQAsZRq5hkFv7Hbe6ADXyEBKOwm5Yf5pv3YCwd46o86jH7nVPu+pf
 gOvhONz8pImH3VYJq/EiCuMyyAprPpg58mtj1PiMjMWI3X+HXcIDt2vU7tKkRfYQqBqU
 cZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rpNCYNmj/RGuzZVe6NS1zGXkrN+iPK60QEavSksXkSc=;
 b=cnnnbZ04hTU13JFXBOAZf0wQ3WI/u06RcChiBPB78n9g2ACQYaXSPAZ6uR0ZImy7tB
 xXozFxUwfZQ3wU95q81ovDzX5Rxu3PnXxWeRGxIhL7tPd09/Vpz7lJZruAIhLWr/5upt
 KmInMZ/rn96IOtNvbXI6gKwkJdXsm9LboPhdAlD7sBA57rPSquLrHDNitNQptwKz1gn/
 oy1M3DqgZL3xg9lp1SI7yg4hUxGPyFl+d0+hbC+odEs5eoGSKiXA3uLr3eslIonBBvh/
 eqJc4klbB/21IEYxmdgGB8arGScHq7podWB8n410i1LfpiW0EhCVh+4tkv1tgGxdwbL7
 qa8w==
X-Gm-Message-State: AFqh2ko2rUnJLyMhCzgojONlIe+XmGDZg7tGm8BywrBSk5SxTeFBhdCj
 iQ4xk6PvVPwboU+p3kpFX1VAjA==
X-Google-Smtp-Source: AMrXdXsEAGaouR9Q5H+IWRBh3Eb4Z6qPhf9LpH1+Y2MAhO8/cL+5au8e88sE1ty3LjhRbpMuh8srew==
X-Received: by 2002:a5d:6b8b:0:b0:2be:1d46:e500 with SMTP id
 n11-20020a5d6b8b000000b002be1d46e500mr20034773wrx.28.1674464606473; 
 Mon, 23 Jan 2023 01:03:26 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 e17-20020adfe7d1000000b0024cb961b6aesm4313537wrn.104.2023.01.23.01.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 01:03:26 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 0/5] riscv: Allow user to set the satp mode
Date: Mon, 23 Jan 2023 10:03:19 +0100
Message-Id: <20230123090324.732681-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 09:03:30 -0000

This introduces new properties to allow the user to set the satp mode,
see patch 3 for full syntax. In addition, it prevents cpus to boot in a
satp mode they do not support (see patch 5).

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
  riscv: Correctly set the device-tree entry 'mmu-type'
  riscv: Introduce satp mode hw capabilities

 hw/riscv/virt.c    |  19 ++--
 target/riscv/cpu.c | 247 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  23 +++++
 target/riscv/csr.c |  29 +++---
 4 files changed, 287 insertions(+), 31 deletions(-)

-- 
2.37.2


