Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psRKo-0004JQ-V6
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKn-0004JG-GZ
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:37 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1psRKl-0005pf-H5
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 12:52:37 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-38e692c0918so138577b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682700752; x=1685292752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oXstUCrChMK1U3IIw5RAhakVys7/ay86/Z2D+gejX0Y=;
 b=IGymusdXqabSPRIzFMGP08MXL0GHOXifPZdqICzPU/i2HwfhY5icjj9GoeK7XATJgB
 6MbCQQTolJ7kD5bGqC6SoenmNTpMYF8utb25B00Wd8Oy4Kj7ZYOgzvGhzfR5g1VF2nDZ
 i/uKi8RvD63+iiv3e7BebQ8KoQqb0jyKwTEnyVFbkAGfneTtXBAwateTiFA/AW+jpCAc
 KGk8nhkTaXtk6WgUsfc5sKHsO9oZYlNpvV+gy2cFM7N+MxpFCh0UBL+4qynHJO14FPjA
 r9rfvaCDQfM49SA+4JKHg/Syw08cuJ03z9Mi5Eyj66o3FJyk4PQs/rksDc3XEpY5N/m7
 0JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700752; x=1685292752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXstUCrChMK1U3IIw5RAhakVys7/ay86/Z2D+gejX0Y=;
 b=DtO3wWktXmGVbK/VfLm2rYEZdXj008/RLcOICnzx/Ok2BlUla15qYpULWVroDlWz9I
 0qqi4Xd4nwiUttqpjguMWWqAtCrMPk5A/zf9Wc71O3MAf3rKo3hHLUp2nBOQCOirkK2l
 3waeIBfDOkVBR5BMNDQ3X7qjXZEgaS+1x0diXYnEbdHmSQiAke59SjkvswiNkeQaNjqf
 DYmLJfWqLtH+1F2McSIynqMKD1TdNVt2/WAymHf1UgDVsOzsmvldYk02LvhH70CWPqZs
 PiSJ6zo6Lj5PjXVfLe0ZkNlTvAg1dvmrbEWa6Hv+0ffjT26O1cOPvnTFchyG8ISnHFJw
 8gpA==
X-Gm-Message-State: AC+VfDyXahBj4yNMXTXXkNAwP0SwSFpPEb3X15Do300Z2wNczux7QVhW
 LPTfaH/xqAzktyQ5zYzRRywxYg==
X-Google-Smtp-Source: ACHHUZ71mvL0ZvtKER/bscbZ+SwFDTv8Dstrx7mdohHBOc9VK7Oxk+fpJDdeHC3tbJZHIJptMFrfVg==
X-Received: by 2002:a05:6808:2017:b0:390:98eb:7602 with SMTP id
 q23-20020a056808201700b0039098eb7602mr2882508oiw.43.1682700752173; 
 Fri, 28 Apr 2023 09:52:32 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 c10-20020a4a4f0a000000b005462a25c4f9sm9665764oob.9.2023.04.28.09.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:52:31 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 0/4] Smstateen FCSR
Date: Fri, 28 Apr 2023 22:22:07 +0530
Message-Id: <20230428165212.2800669-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Fri, 28 Apr 2023 16:52:37 -0000

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v3:
- Reuse TB_FLAGS.FS (instead of TB_FLAGS.HS_FS) for smstateen as HS_FS bits been removed.
- Remove fcsr check for zfh and zfhmin

Changes in v2:
 - Improve patch 1 description
 - Reuse TB_FLAGS.HS_FS for smstateen
 - Convert smstateen_fcsr_check to function
 - Add fcsr check for zdinx

Mayuresh Chitale (4):
  target/riscv: smstateen check for fcsr
  target/riscv: Reuse tb->flags.FS
  target/riscv: check smstateen fcsr flag
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |  3 ++-
 target/riscv/cpu_helper.c                 |  9 +++++++
 target/riscv/csr.c                        | 15 +++++++++++
 target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++---
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc | 32 +++++++++++++++--------
 target/riscv/translate.c                  | 12 ++++++++-
 7 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.34.1


