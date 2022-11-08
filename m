Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osOB1-0006RO-99
	for mharc-qemu-riscv@gnu.org; Tue, 08 Nov 2022 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOAy-0006PR-W8
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:01 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOAu-0005Yf-Sz
 for qemu-riscv@nongnu.org; Tue, 08 Nov 2022 07:58:00 -0500
Received: by mail-oi1-x22b.google.com with SMTP id r76so15361083oie.13
 for <qemu-riscv@nongnu.org>; Tue, 08 Nov 2022 04:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZJuefdkHFMfM9ZKDCdjlLp3sNHSVdT0o3wtmYfN8HM=;
 b=e5T5igTGU2gDQreoUAMqoVeK2RbDNj+dSlMTpZ3r0DBERY7BOfHpHwLiHKnAk5lzaB
 QMHYJtLHlp+JyIBPG800TNtfTVy3huZuVpHL3mOZcANyzqKyHrqJJbl8xVA8dVnFFDS4
 SE2BQFCoBNgYYtT8C/0e2OHRrnTpr0z2FRBvsW1APfmP+mXrdpS+CDWDzHldu3agebFR
 gJ271P1Q2O0ZTX/bIpHVuPCzgHdhmp3OEJ18/adPyAhWW7EJpV1PVEFId4YfYfm6vM7D
 mE4u+zCBQPRc9QDlLfpC/cT6c9Z1sY4G1rXfRxPEpYLDZ3Tk2MLZ//Y9UTy0+xmdHdKm
 FTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ZJuefdkHFMfM9ZKDCdjlLp3sNHSVdT0o3wtmYfN8HM=;
 b=j2N330ddqujSlXu8h/CNBObjeY+lFKu09NeAis6+H1MFhI23B/NPLGs5CsSwhYsfA7
 E/+PkS0yMPV8b3uG3WyQgx9isIL98vuepAP2TUvowebCE9yGzU1XP0cpced9abLSFxYT
 Y2RkkywMUxiC3qzu9GesSlnrzZZgcUIfqMcTHWCr2VMQBBMRlBYTCVmpH9bebmqHpy5f
 CG6V84q1sCVpCjwHMuuG6Zbb1PUu+XSRd86lXYRZCJsq/1DChJtJOjiMluaa2LMiLFMx
 cfpQHgB6UVRBjP7kqLuhletB4s+rqaU9qaBQ2lDuC8N3bOvev6rldwgsNOR2FJe5csO7
 IXug==
X-Gm-Message-State: ANoB5pnE7lSov4BsGHkDHmQoUwf930H9S39wwNajlxpSp4+XpTefko3H
 r3GS5pMhsQJF/hW1nmAWRMy0Rw==
X-Google-Smtp-Source: AA0mqf6Ef1jDM0P8KYvJBUiwh40PrXl6YNHhLeyPBEq9C9fLUSP8S6zHc0DqPhvzprpIBkC2PoPiWg==
X-Received: by 2002:a05:6808:1691:b0:35a:8d30:8218 with SMTP id
 bb17-20020a056808169100b0035a8d308218mr4993200oib.2.1667912275204; 
 Tue, 08 Nov 2022 04:57:55 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:57:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/5] Nested virtualization fixes for QEMU
Date: Tue,  8 Nov 2022 18:26:58 +0530
Message-Id: <20221108125703.1463577-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=apatel@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 08 Nov 2022 12:58:01 -0000

This series mainly includes fixes discovered while developing nested
virtualization running on QEMU.

These patches can also be found in the riscv_nested_fixes_v2 branch at:
https://github.com/avpatel/qemu.git

Changes since v1:
 - Added Alistair's Reviewed-by tags to appropriate patches
 - Added detailed comment block in PATCH4

Anup Patel (5):
  target/riscv: Typo fix in sstc() predicate
  target/riscv: Update VS timer whenever htimedelta changes
  target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
  target/riscv: No need to re-start QEMU timer when timecmp ==
    UINT64_MAX
  target/riscv: Ensure opcode is saved for all relevant instructions

 target/riscv/cpu_helper.c                   |  2 --
 target/riscv/csr.c                          | 18 ++++++++++-
 target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
 target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
 target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
 target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
 10 files changed, 70 insertions(+), 10 deletions(-)

-- 
2.34.1


