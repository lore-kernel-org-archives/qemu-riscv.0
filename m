Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxSLs-00011f-EQ
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jul 2020 05:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxRLC-0004AV-Hz
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 04:40:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxRLA-0003tK-Aj
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 04:40:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id q17so8357443pls.9
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nuG2E0B/JbUdZcHseBuYWsvXaz85mIT+3czxv26BCc=;
 b=Flshe1/+f/7M8YrKHsjomEFIq3zb7FxYHCiVc6eABBz0nzDRzVPvS38+xWfleLIw0X
 hDZNB3spMHRaKM5hKX0ZSNT7bCe9zV3AWng+t34avar3xC+gUp67d7BsfZL1WXxfwTDe
 m7sg12f2RFM8PcqVqG+v+rXVNbhUE0WNohwvz/1EMvBZFu/yutPRro6S4uYh2AiY9Khr
 17v5EHMlVCILOLA2uKsta5ImGeZeGhXtNjaS8FVwbRjYqG8nVEFieZEkD4NU4ahhAVFS
 pxRxg/z74KF0fTr4on3AcqtfWKRRaIcpeI0s6X/PrnWmcnglycB1vnKUOK+8Ccew49XW
 mVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nuG2E0B/JbUdZcHseBuYWsvXaz85mIT+3czxv26BCc=;
 b=od29V7TngQGRugiXxTxh6eH8AakqpR41+foaTS7wpVBxKBkCA5pKs9/Gv8CnL7QDnY
 8PTkYAUVp5UxQDGh0GFbpmR/TRZcfc+cKwHNQboN7WUE1zuJHXE7Bz4MsTwQWzcTRLRW
 FQ5VZI5wgL2NTIMxt+OBFqw99Hgw28kTwbKKwwaMnhLvzFFnbJImuSlWidKKf0beCAX+
 3KLQjrLoYnlGMXnCakPFpSkfIEEAcBVx7r0lF/BN0Oj3mI7uz4leOrcp0wx6ot+NEU+P
 pFMMwOFMYHJZe1XTQ1rAbaYqkPJS/jegId3cc9ThuB+nXxKZ3oKk9WRXZ9d4SwVd4b3S
 F2mA==
X-Gm-Message-State: AOAM531AoAHQN+FkfqV93rQpbONGR8OkjFbRcSDMjH5aPNOaUVvYv3id
 aoWt4wejUy+cbqyeOduyidzG0g==
X-Google-Smtp-Source: ABdhPJyVGQZwDfUrNMaGzWwmGUHdlliGoYQSkZaQZE0R4lrvp/oqIjaVeFw0NFIwcFBc/z1SDtCV3A==
X-Received: by 2002:a17:902:ee94:: with SMTP id
 a20mr14781358pld.337.1595234402342; 
 Mon, 20 Jul 2020 01:40:02 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id o4sm11388151pjo.16.2020.07.20.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:40:01 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/2] Fix some PMP implementation
Date: Mon, 20 Jul 2020 16:39:55 +0800
Message-Id: <cover.1595234208.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=zong.li@sifive.com; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Jul 2020 05:44:49 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jul 2020 08:40:06 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table.

Zong Li (2):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64

 target/riscv/csr.c | 2 +-
 target/riscv/pmp.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.27.0


