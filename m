Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytgq-0002yz-1w
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgo-0002y1-9M
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:26 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgm-0003qJ-FQ
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:25 -0400
Received: by mail-pf1-x441.google.com with SMTP id u185so4749471pfu.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0T7C8gSWgr1wtDkt6o+vQNAP8br3EtqgTWVItkOaUQ=;
 b=HTw2x7jz4ZGphx+bpb0N7WfxMnLjPBZNWbfbid/EOQZa/dTLkLo6SjNnAB8TUR/G0f
 yY7uAPtMGnuNiN2LQQBxX2fiZSAMUbEYvJXfgAhdJPGMkz/sLzbupuXfS/VRPH34/q+L
 uM0JFmZl5RiLPu1pqa2gazy5HKyAaVgDircLERJ5i98umAwWm800g2/beQFqL5N83snj
 7Q47zjCMaz+3LsAB9zhMPS4cW03zP8QqyB4fYOJLDKnWIrcppS/SbvGB68L3psS5yKe+
 5vtNpiuNYk7KlWYEfH0hBt7C+OKy+xsw7opC3pDQRCDoNrpnXv84OuNaPbCM0ESYw9Z4
 bzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0T7C8gSWgr1wtDkt6o+vQNAP8br3EtqgTWVItkOaUQ=;
 b=BvRDMk5UHt9dS2dlvx2k0OY9GfBK8Ed/o2hJVYW/KmIo0AfOJCHjUoBMbLlma/RO9n
 TWw385HIMU8MMh20O8Gu0Gtm9kogIvT7eDJjSQ7+S1S8nud0o0t/FiJpkoEeHOv6ZC5y
 kP0p7VCxEqPzitV5jz1l/RZoTK1u8IXKeeok1L/2+S0tNmeEt+s8lU7jtMCSXpXeL1YZ
 IjWTLu3rD+ZfnowjtRwkeB2rfNCETgH0gxwl4yPhjM+iC/oKBc0H2IFzwsRXebKFZGTK
 9mWbSaVJt8+xOKxK41HdgaeyFmzPMtzhwWDf0VYbxI4DThng96Xk85GrxAIQL3Yq+hmZ
 wj6Q==
X-Gm-Message-State: AOAM531YAl7Swom1Pul8YedK34fV0oKu6Mpq3EWCF8EwpO+35ZXrUdKV
 HhK303h+LmFBr24RoEAjhTzdbA==
X-Google-Smtp-Source: ABdhPJwvx0Wuy6U3ztF2SJjlde2nytuNtHVZaRW94EqxPYFRtr/nQqUyVWGib8FeHvbWmjY6m2CWrQ==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr7748098pgq.36.1595581702067;
 Fri, 24 Jul 2020 02:08:22 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:21 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 0/4] Fix some PMP implementations
Date: Fri, 24 Jul 2020 17:08:13 +0800
Message-Id: <cover.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Fri, 24 Jul 2020 09:08:26 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP issues such as wrong physical address
translation and ignoring PMP checking.

Chagned in v4:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP checking was ignored.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for wrong pphysical address translation.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (4):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address
  target/riscv: Change the TLB page size depends on PMP entries.

 target/riscv/cpu_helper.c | 13 +++++++--
 target/riscv/csr.c        |  2 +-
 target/riscv/pmp.c        | 60 +++++++++++++++++++++++++++++++++++++++
 target/riscv/pmp.h        |  2 ++
 4 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.27.0


