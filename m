Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh5Oj-0001r9-GK
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 04:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Og-0001nV-QS
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:10 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oe-0001KB-79
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id n18so1124043plg.5
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 01:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9iGgyehXFFotQ+yNPADTnzkBzf01bwCukSA+wfvbAA=;
 b=Orgujn9b7FkS5okNtitVASYzucDosgl3UDXDfcW2VQO4YwrEurtu1LEIBz/u4NEWgi
 sGMc3ln+vOg8HKwPJZ6Le3yjSMeetwt9rhSKIB6XwCw0Hmww1V3D5gXbARkaMsGk3HYO
 jeGbatQ0cRZ1GYyuLL06V71eK5Aao8ql4Bdzg65G6GSR2YAVcio4uZprMZys4hnZVklc
 Pa4/Ms/CQusJXWsDiSEmptSNjJHtpeZ8l9her0ztD8yepGvDofzloPsqc1kznnkzCID+
 Jvn90of33SXrcwVkxlWRINRDW19xRcYueTTjcbjbArtP4Bga2OkdiuqhvvVS4hC5TZfw
 hdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9iGgyehXFFotQ+yNPADTnzkBzf01bwCukSA+wfvbAA=;
 b=W6pjM5yEgwURP+tXY/P+loVodd3ldaSTmM7sppqMyRSXokgL05xg7LACYTWDBXOpLP
 R2KKQnJ6MZUzjIc0eyjPPh60pRpdYgCF0fpDqSGURcnMeDYRhG1IVDsi/CMdXkOkaD5j
 hS6VZRVmkplT8kMZjBY1OvDG+qmKRXefOwdl81gC96E3YHw3he063XQPpD7Wjr3oj2Uk
 ZNdBUXYKjpLW/stI6AInBFpvcA7pHWM9jmpW2CjEE+fb3264YxDRGIoET23Vj1FK6QXT
 6SmMpLLf1r7vizrx2puj+33N3l1080xIAnRDaTJxKLEia2jjbsFGb5oatLNBqXne6J0H
 qJcQ==
X-Gm-Message-State: AOAM5312iWWbokve43/HGx2vYgv0EWM9HN5Jgg6a2jnyBSZznknGOLh3
 IFCkeW/u2Wg89MBIsPksbu+EGw==
X-Google-Smtp-Source: ABdhPJzKQZsC0qYGmQUyDJQAyHzkY0N/rS0t/KPFZIaphp5PLjQ22Q3wdhmTbRe6tWwS3uyH/9iEQA==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr19748312pls.23.1650442146620; 
 Wed, 20 Apr 2022 01:09:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v4 0/4] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Wed, 20 Apr 2022 16:08:56 +0800
Message-Id: <20220420080901.14655-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 08:09:11 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers. ACLINT reset function is also added, which requires
mtime to be resetable if we need to support core power-gating feature in
the future.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v4:
  * Replace the error log mask for invalid 8-byte timecmp_hi and time_hi
    writes from LOG_UNIMP to LOG_GUEST_ERROR.

v3:
  * Forbid 8-byte write access to timecmp_hi and time_hi.
  * Add ACLINT reset function.

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
  hw/intc: riscv_aclint: Add reset function of ACLINT devices

 hw/intc/riscv_aclint.c         | 144 ++++++++++++++++++++++++++-------
 include/hw/intc/riscv_aclint.h |   1 +
 target/riscv/cpu.h             |   8 +-
 target/riscv/cpu_helper.c      |   4 +-
 4 files changed, 121 insertions(+), 36 deletions(-)

--
2.35.1


