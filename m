Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D19C54E5D
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 20:44:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rj3Y2-0005el-0d; Sat, 09 Mar 2024 15:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rj3Xy-0005eB-01
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 15:43:58 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rj3Xw-0006Qt-CF
 for qemu-riscv@nongnu.org; Sat, 09 Mar 2024 15:43:57 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e62c65865cso2743563b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 09 Mar 2024 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710017034; x=1710621834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yXG2qEtw2Rl37dBuBZeUGOObNWpaVNNq+0Xav4YyjZ4=;
 b=nI+3dhNyCeAvOk6oxQvMQyu3MzwZNa0dEAyNIGsotOOLjuMdodL/eze/eTdsxjLodX
 yvko8afLnx7lPHWyXw3B1mdZjcYYpR1MgYUp7FaCsz3Oief6YjpkSpzzpmjyn+cBi7Qo
 U1zMJC7Ib77AQV7d8ySUvegjoUEkHzirZZX/EKkbZtlQCm3wTfO2WTLfnDckV7d1PtQT
 NFIUXGtUyL/qsSxzBCvxx8cWEqAIAe6H9Tyx5SJh8kO8kRvNWPBYyWj8kQG55Y98UHhP
 ctY8I3Vbh/+sS9/mKI7xOAxM3EVBo3ws0KYevCrtTVgrChGCGhI7O0l+Vx89Tvveqp2q
 nwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710017034; x=1710621834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXG2qEtw2Rl37dBuBZeUGOObNWpaVNNq+0Xav4YyjZ4=;
 b=tq7C+4aYg7I5OyMjU+6osaLWX9eX0qJSg4V5M0g/CcmnljvRAFFzyKI6qVTk20JtOG
 4HUW9TSA5JTUCIkeeSpCrk02zWQ3g7yCGrDW0TG6I+IEnxqN8idBV02yEbjfAbJQD5lo
 dao/aIiObkmQCAd2q0gwEZ4s4JBIjs4k5EVHMGi4pIZx3fOlvwllavt7MkqYPBuf4sf8
 ni8oKCCVaMGboO+eYUiNO+wGUmfLd65z+7rL+OTqrHiMXdpt2rjYS9iq/KNhC/NDGOSP
 Ipm8QfmhcMvq5RZtQ3yNtaAcvmzeEOdrDPiYlDJ8ajG5CG79Nhn88UUyeoUmjSd8Li58
 SmMQ==
X-Gm-Message-State: AOJu0YxT/Z8KTsqhkfWBJTuoTVhrm2H/ElWVt+eR6mBySFH83Dcr2TlZ
 StUZTsejC2ghcOBsfUz1VAyuVxUKE5EkBiAqNrrz2UU86p3Art9+Eel71VfOXwk=
X-Google-Smtp-Source: AGHT+IEPxVhIUPOshEZpB9bViptmw1O6Fr0/gE4/9ngfLs+QSF1AwQOslCpYdJpYzKU1zyM7CC8GTg==
X-Received: by 2002:a05:6a00:850:b0:6e4:8d81:50b with SMTP id
 q16-20020a056a00085000b006e48d81050bmr3475824pfk.31.1710017034459; 
 Sat, 09 Mar 2024 12:43:54 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 ey15-20020a056a0038cf00b006e647716b6esm1656270pfb.149.2024.03.09.12.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 12:43:53 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 00/10] riscv: set vstart_eq_zero on mark_vs_dirty
Date: Sat,  9 Mar 2024 17:43:35 -0300
Message-ID: <20240309204347.174251-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

This new version has changes suggested by Richard in patches 2 and 6.
Other patches are unchanged.

Series based on alistair/riscv-to-apply.next.

Patches missing review: 2, 3, 4, 5, 6.

Changes from v8:
- patch 2:
  - do an early exit if vstart >= vl in vext_ldst_stride(), vext_ldst_us()
    and vext_ldst_index() if vstart >= vl
- patch 6:
  - vec_set_vstart_zero() removed
  - set cpu_vstart directly using tcg_gen_movi_tl()
- v8 link: https://lore.kernel.org/qemu-riscv/20240308215402.117405-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (9):
  target/riscv/vector_helper.c: set vstart = 0 in GEN_VEXT_VSLIDEUP_VX()
  target/riscv: handle vstart >= vl in vext_set_tail_elems_1s()
  target/riscv/vector_helper.c: do vstart=0 after updating tail
  target/riscv/vector_helper.c: update tail with
    vext_set_tail_elems_1s()
  target/riscv: use vext_set_tail_elems_1s() in vcrypto insns
  trans_rvv.c.inc: set vstart = 0 in int scalar move insns
  target/riscv: remove 'over' brconds from vector trans
  trans_rvv.c.inc: remove redundant mark_vs_dirty() calls
  target/riscv/vector_helper.c: optimize loops in ldst helpers

Ivan Klokov (1):
  target/riscv: Clear vstart_qe_zero flag

 target/riscv/insn_trans/trans_rvbf16.c.inc |  18 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 198 +++++----------------
 target/riscv/insn_trans/trans_rvvk.c.inc   |  30 +---
 target/riscv/translate.c                   |   6 +
 target/riscv/vcrypto_helper.c              |  63 +++----
 target/riscv/vector_helper.c               | 192 +++++++++-----------
 target/riscv/vector_internals.c            |  29 +++
 target/riscv/vector_internals.h            |   4 +
 8 files changed, 207 insertions(+), 333 deletions(-)

-- 
2.43.2


