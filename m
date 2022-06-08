Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nymcw-0007ii-MJ
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 23:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymcu-0007gu-Be
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 23:45:00 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1nymcs-00060m-Jm
 for qemu-riscv@nongnu.org; Tue, 07 Jun 2022 23:45:00 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u18so16541317plb.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Jun 2022 20:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=UT4LMP4I1zhgcEIg4bdaQZSn8vjSpcWhVX2N0nvmdzS2Hl7FHwyDGHSXjU/SvKTiVG
 JXlNaM1r+r2TLGRD+xmUAKQV5RPPhXbceaTTJbCd5CYOkeCjDUt94WfkjSwBe1UoMtlR
 ZNOCdpQ1wk0tr6gmWSdtfBtTluRwMuovNOvWMYi1rCn6jz3DDcKzFrdJpnXFSge4huNP
 4pECV2lHywBdvE7g4CmxwBB477+PREPianSItTrO9Yxp1kn2e5veqXwpNUAX+EzPe33s
 M9zA2am4/9Ah1FeBk6o0c2QauA+OSkCH5fghLPOfmfZNTs4KT0t/Q+1VteeH6mYxA9W+
 1dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/8m5suBi1R3jzjTjFMrS41uQao5H4WQ1lczme8ti8U=;
 b=kmyJ7k6LzTGwwJElN538/42/YKzOzCb+Oeii4IgynyrcuNhXDyGBExy9gKxY/9oKGb
 nc1wX/jInIR+OSl2EfmYlFkTZ3Dz1zgjpbjTw5i/5bUiuXj70SXQv+luzdBJwFVM4Kl2
 D564L9i9H/S24xm9mmOPt4j7RRQCZ5/AYPLs05ivqLSlCjZmVCzlJD/NcgXON66W8Blf
 QW0nf772+7Jc0ZKGmqFypZ6Pk0xBDW8kSmdXGYNKx/kAFdlX/D6PrV6lw4+orh2KT9QO
 ATsZy8Id1KNg+8RDzIXPm5tTMg18U6MPfDerzm2eRPPr63kU5adFRZqZxC0Ljy3TS3Ee
 5Ksw==
X-Gm-Message-State: AOAM5319kzAQ9SfvVWbEE5Fe4dX5cSmX0J4W90WNAbG61eWwdWpyR6j8
 tqgCv1FNCLRhe6XhkclCPb9ZCA==
X-Google-Smtp-Source: ABdhPJzO0zbUiARHT0DGTmFVAXkzWEgvwy/kRsiK0+Pmtd6eWfw/zlsnziwbAznZqerVJ81EOL2ClQ==
X-Received: by 2002:a17:90a:468d:b0:1df:39da:322b with SMTP id
 z13-20020a17090a468d00b001df39da322bmr35338551pjf.137.1654659896870; 
 Tue, 07 Jun 2022 20:44:56 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a056a00216200b0051bd9981cacsm10258214pff.123.2022.06.07.20.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 20:44:56 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v3 0/1] target/riscv: Add Zihintpause support
Date: Tue,  7 Jun 2022 20:44:52 -0700
Message-Id: <20220608034454.1528469-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=daolu@rivosinc.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Wed, 08 Jun 2022 03:45:00 -0000

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause for TCG to mainly to break reservation and exit the TB.

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

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1


