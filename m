Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNp5f-0004rS-BQ
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 00:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp5d-0004rC-Rt
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 00:58:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp5b-00022k-NU
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 00:58:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id bt17so640987wrb.8
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 21:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y7EslLR/1lA/JW9/x0h4+FJwmBcHRtH49Otf9ZdLq70=;
 b=L3V5SOG4G05KtsokDfLCVe0BPsaxGZF1FsSaUd4l+GfXvPnzA1e35SiM4NNxFEbJCm
 1Oa8NaBSQk4X6y84kdgCmuXIDYhU15ke7Q6fXTecmiG7oBKZLe0dxnpRFwaQ9WgiOp27
 bgODimFTY6j/Ly0d/iM5ZZf9pbsHTToVwVNkHNFaAIi67nUYxkv0cUqFYKdNn56iHpCS
 bwAqyJP0eAPPKG9QaO3b+ersqnLbH3LRhGOi4PodKlSzOQ6vom1f7R7fAqzM2m5YgtRW
 o37BacjteM9q/o8yiLPHI9IybNE2w/dIECK7eMracXkwCfYPb59QQH/s0XxCmv3IRZl+
 cB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y7EslLR/1lA/JW9/x0h4+FJwmBcHRtH49Otf9ZdLq70=;
 b=xGzbBJL+XVJf/+aMA8o+3yTyTMSvVn/+TZ36vocHPthWJr7DbBkTAJ2JL78utHEwkk
 M4/K1Ou57pFosDMzy13jbyuXt2pFNjxanPVorHapF4cZtwtEwD1BaiqSb/orAuvS42fx
 TPxkf9EMtuxy8d4rVGhKsUsam0CRipEGE0S93p4DOe7OyXEE7UbZt1b3WQ3fNtSEsH9f
 1wbtdi18kiTvlaPBdcZAt/4HM2EzM4gqLDnXQTZsL5VdtSBBJBC60bXiXURvmgaoflI0
 pvA56wNMLtbIMhnmPOXYg7QP1EmrtD/RGxtAPtIclnMaTZiqoLrCnz+wI28sB96ZQdR2
 Ko8g==
X-Gm-Message-State: AO0yUKU8W+Ix4jVHuRUaa4m/N6MLwvu22wdgTdLkvXDw7+QbCgGLNlky
 4fS5ERitvly4kgx+hQEZBQkvvg==
X-Google-Smtp-Source: AK7set+3Egn72WYHf2NldWib2jjJIz+s19XGdgHye71OSZFo3aW6swbS/rv2yDqhoXB7qfu3ygOIlw==
X-Received: by 2002:a05:6000:384:b0:2be:4c32:a7df with SMTP id
 u4-20020a056000038400b002be4c32a7dfmr9099275wrf.63.1675403901975; 
 Thu, 02 Feb 2023 21:58:21 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 bj24-20020a0560001e1800b002bded7da2b8sm1105953wrb.102.2023.02.02.21.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 21:58:21 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v10 0/5] riscv: Allow user to set the satp mode
Date: Fri,  3 Feb 2023 06:58:07 +0100
Message-Id: <20230203055812.257458-1-alexghiti@rivosinc.com>
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
X-List-Received-Date: Fri, 03 Feb 2023 05:58:26 -0000

This introduces new properties to allow the user to set the satp mode,
see patch 3 for full syntax. In addition, it prevents cpus to boot in a
satp mode they do not support (see patch 4).

base-commit: commit 75cc28648574 ("configure: remove
backwards-compatibility code"

v10:
- Fix user mode build by surrounding satp handling with #ifndef
  CONFIG_USER_ONLY, Frank
- Fix AB/RB from Frank and Alistair

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
 target/riscv/cpu.c | 271 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  25 +++++
 target/riscv/csr.c |  29 +++--
 4 files changed, 313 insertions(+), 31 deletions(-)

-- 
2.37.2


