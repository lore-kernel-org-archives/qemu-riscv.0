Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGHOp-0003RJ-QE
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 05:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHOn-0003R4-ND
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:35:01 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHOl-0007kh-L4
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 05:35:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so17049818wms.4
 for <qemu-riscv@nongnu.org>; Fri, 13 Jan 2023 02:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6CwFfegXrTfXQEEH8EuwJ8DMQC0mPnEtzOe+2rUKS9w=;
 b=pKNCWZeA2b5cWLEtFt9JaXoIENlNKT0Pu1A0nvKq8GaRNTAmaqMpntKhzUNKcK3LwC
 5TxlZcBwf6z5dpbtAyrW8D/zJbo8dhs1uJ0j+0GswvJ7gqEtmS7V9XIUQsZn2DIDmlAj
 AgyT4IKrz94ZSfuabW0oTy53w1iQuBGFnQjbVKnd+13pAChPmdWWJsGZKSUyTmFvzbRU
 m9/M3gdK95QCU07dVF2PCwZnXW68+AP2v1gcsaSFugwi3csQCfM3HPUBU2L6sx4NWO1K
 Z61f2nUyPtYFUp06uO298soBYzkPLG5PwQI+Bq9PpjiKSanjiGTDLojYXV5PwOLuzQyU
 W5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6CwFfegXrTfXQEEH8EuwJ8DMQC0mPnEtzOe+2rUKS9w=;
 b=rFGMjM5EEWXrbaj7mL10kVSNjh4i9nqLINDIIVFSrJL0iyKUcQdniQxY/txUOTWlmf
 uUe8GZqUN9pA8ZQ9Gx3Vd87LsaLcbVkqJtFowusKFk+8QZ0pNzNdBTbsLYqVtazdanCQ
 Gqr0SgQd5r8uU7kpca8K8QytBhaaevUnVX9SAJWs1VqPfcOnGqYCARVPZyZ15oZbUcyG
 7loWXL8825yyITvmEHuOzMDYwkSKPz0LFbMFeNDz/5kvCprKXzztK5t1kgCX1tLuPi9w
 cevJVk+adWMsIvebcipRrbB2Z+dJcjOKlbb5hwwdLB7rhgSuj56ECTiSx/JCd54UQSTh
 uppg==
X-Gm-Message-State: AFqh2kqn53/JYQIfZ4t4tWWnsBuqPigjYvqd6cT4a74QYU77w8mKQEI0
 qx4m8o1WxJxO0Wzspe2BUITHmw==
X-Google-Smtp-Source: AMrXdXuiXEWKcDMNOv3Nf4nZZeTW6fmaKfva7hLjA3JnIc8C0lFXKiyVpcdYitd1M5DQTZI5j/YhtQ==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id
 bh17-20020a05600c3d1100b003cf8b2276b3mr58438320wmb.0.1673606097936; 
 Fri, 13 Jan 2023 02:34:57 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003d9de0c39fasm30691591wmq.36.2023.01.13.02.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:34:57 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/2] riscv: Allow user to set the satp mode
Date: Fri, 13 Jan 2023 11:34:51 +0100
Message-Id: <20230113103453.42776-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 10:35:01 -0000

This introduces new properties to allow the user to set the satp mode,
see patch 1 for full syntax.

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

Alexandre Ghiti (2):
  riscv: Pass Object to register_cpu_props instead of DeviceState
  riscv: Allow user to set the satp mode

 hw/riscv/virt.c    |  19 ++--
 target/riscv/cpu.c | 236 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  19 ++++
 target/riscv/csr.c |  17 +++-
 4 files changed, 270 insertions(+), 21 deletions(-)

-- 
2.37.2


