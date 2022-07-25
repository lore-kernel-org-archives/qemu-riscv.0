Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFp4H-0004dZ-SU
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jul 2022 23:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4G-0004d5-1P
 for qemu-riscv@nongnu.org; Sun, 24 Jul 2022 23:47:40 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oFp4E-0003yb-6a
 for qemu-riscv@nongnu.org; Sun, 24 Jul 2022 23:47:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id c6so5188245plc.5
 for <qemu-riscv@nongnu.org>; Sun, 24 Jul 2022 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DrwsoJAxCJokb6pvpy7vscLigX+OMGyUI7ACfS3fkc=;
 b=aiOBO7ZkZi4APa/LKQHZPRmmX57GDECplzSs7uw6b5J/RHoMEhfGa0sOL8HiWeEiRu
 Ndb8Eesjj/IZBayBkYK9CObFoPsiVknFxPcg3X7J/WgJvwASVIAE4nG/X7cKYdNxglMC
 QrYVIEXiwYsdpe54h1RdpklgRi6aVchlwuODNH74r0Ji31IsscUGDsGRxm9tQ3smfvAQ
 7H6cg0VyQGUfuiIETiyDscPTZIuOfDvzIYdyHkLGArM66ealnL0+ArILNyOI2RFYUIYX
 E29JN1Y3TgYZpZ0zUwhjclyyNm9GT9QDM+p7G9dso2VveHrbo1IUrj4Q+XgjbBqp6J9a
 7oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8DrwsoJAxCJokb6pvpy7vscLigX+OMGyUI7ACfS3fkc=;
 b=uopwtRrpJ7usSXh0BO/emd3ntbMPlfxoVz+c0+qgn7bURIotAV943Fw+Oh96JkJiAw
 Pon1yz1g6fN9iopxRSJk+MP27z61Qcsap7yrKzUY/bc9FxfclQmenaYNVvaRALHaeQPw
 +MJRwxeI81SDo77tR+bexF162sR0NoyNZctJaFN3K953dhZ5p2PhMVR6GKsmltNgnAzM
 /cBWURXJ7GC0G6QNV4kGE4ENjH6UL9ehUpcL5H9vDgCmOEPfkRC2fwymiYnRUJrPo0da
 XvCR8aUoUr+EHVUKvG6JfVL5K4DxJeAt78oUvwv3nkOGxO/S8INumImjBIKPuQQ1b1o+
 CcGA==
X-Gm-Message-State: AJIora9vI3hbg3ENlyGibwE0j6ACZBBxtk6Hlat8IC3GWu/6Sg/aUour
 kNs9CQc2eN6pfvqilpMF+QOsXQ==
X-Google-Smtp-Source: AGRyM1vYb/melUmAesLr2XnmKafs6eECQhtFAHW9klvtuR6bIn9847EZeUn2ONcBxZU6YgGb5GLWJw==
X-Received: by 2002:a17:902:cf0c:b0:16c:8a4e:746b with SMTP id
 i12-20020a170902cf0c00b0016c8a4e746bmr10460348plg.37.1658720856287; 
 Sun, 24 Jul 2022 20:47:36 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a17090322c500b0016a214e4afasm7763420plg.125.2022.07.24.20.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 20:47:35 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v5 0/1] target/riscv: Add Zihintpause support
Date: Sun, 24 Jul 2022 20:47:27 -0700
Message-Id: <20220725034728.2620750-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=daolu@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jul 2022 03:47:40 -0000

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause to exit the TB and return to main loop.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

--------
Changelog:

v1 -> v2
1. Pause now also exit the TB and return to main loop
2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function

v2 -> v3
No changes, v2 was lost from the list

v3 -> v4
No longer break the reservation in trans_pause

v4 -> v5
Rabase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next 

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.25.1


