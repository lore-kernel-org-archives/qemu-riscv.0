Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1g0A-0004d3-7w
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 23:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o1g08-0004cC-Mj
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 23:16:56 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o1fzx-00019n-NJ
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 23:16:56 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s135so67714pgs.10
 for <qemu-riscv@nongnu.org>; Wed, 15 Jun 2022 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ub6sE5ySs7+PGt3dshx9BniOiCj0bIf3xV2UVvCegQc=;
 b=A7rRhkPbQ3E1QIHtovePgnj7fpqg5BKStVH0ksOGU5FJG2KsBdzeTmky4gGtCJ8E50
 QDc+oXuZ7GKrIlbGUaA0bzvD1Bx6q+aRxtyCoJC1+x/hgrkrYmZdC59TntkPW9knqQO+
 deILrK1kY9hIOMWptoiWVM8Zkn/GCHvxMQbqxJg8fBzaUG5amn3+K5zdA/Dh58WgD0/Z
 ZZZGCIxdg53FT6IbBFA1YCt5VG38IX06jc6ctEzJ7ONav09JgyIKk7HnGdwpAXRrQe4Q
 JzO6bAHYXSWHyGjFQ6E+TTRCyalHVLv88wqU8i1T3ytDiA5ah1gaVslfnHch94lNe3wW
 NBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ub6sE5ySs7+PGt3dshx9BniOiCj0bIf3xV2UVvCegQc=;
 b=u0dA8GU8Ae8/qSw1iVwLPM1pE2xiZdLK0XAesCRcbzqJkNRzhYtF/RgvBx9h43Ds2t
 QX4DQdnhYtQbLNp6W/bQL0pgPpez5EouBm7AkXqCS0zBQMrjJc9iK/YKghQbVPjIsP5A
 DE/cIxu8n37h75SpBm9+ymggkZ6NfB7k769wyGjsuMhoVP+q0q9y05gH2SohmwZSJLoi
 yQkdMaGDDuDwH3Ho8pNOHnWO1//HAfJAOytAoX8TB/XrWR9KSik+21OKrFYA86rN7WZj
 qa/cSHO0J915ltCNm9A5NQvA/4+LGaNel9mn1ZADlmKoWwldGubnzzzcHoutvzLuqmK6
 juFA==
X-Gm-Message-State: AJIora+KKfBKzEKrLhy0HBnt82gaYziSZvAZl5qHTEmwSAaUi+Dq4I0u
 rR5SsARHS0FUUgv7ngZYBxWDRQ==
X-Google-Smtp-Source: AGRyM1smBo/KGGeRXHZUqCKS8JgjKFPAuPPKCbM7oe8Ccb8noZYr9Mf2ilQYEnjLD8bCB7xVBxGlig==
X-Received: by 2002:a63:5f53:0:b0:3fc:c510:c4a0 with SMTP id
 t80-20020a635f53000000b003fcc510c4a0mr2668268pgb.80.1655349403672; 
 Wed, 15 Jun 2022 20:16:43 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.82])
 by smtp.gmail.com with ESMTPSA id
 x53-20020a056a000bf500b00517c84fd24asm389019pfu.172.2022.06.15.20.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 20:16:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] AIA draft v0.3.0 support for QEMU RISC-V
Date: Thu, 16 Jun 2022 08:45:41 +0530
Message-Id: <20220616031543.953776-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 16 Jun 2022 03:16:56 -0000

The latest AIA draft v0.3.0 addresses comments from the architecture
review committee.
(Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)

There are primarily two changes:
1) Removing various [m|s|vs]seteienum, [m|s|vs]clreienum, [m|s|vs]seteipnum,
   and [m|s|vs]clrei;num CSRs because these CSRs were mostly for software
   convienence.
2) Simplifying the default priority assignment for local interrupts

These patches can also be found in riscv_aia_update_v1 branch at:
https://github.com/avpatel/qemu.git

Corresponding changes in OpenSBI and Linux were small and these can be
found at:
 riscv_aia_update_v1 branch of https://github.com/avpatel/opensbi.git
 riscv_aia_v1 branch of https://github.com/avpatel/linux.git

Anup Patel (2):
  target/riscv: Remove CSRs that set/clear an IMSIC interrupt file bits
  target/riscv: Update default priority table for local interrupts

 target/riscv/cpu_bits.h   |  26 +------
 target/riscv/cpu_helper.c | 134 +++++++++++++++++-----------------
 target/riscv/csr.c        | 150 +-------------------------------------
 3 files changed, 72 insertions(+), 238 deletions(-)

-- 
2.34.1


