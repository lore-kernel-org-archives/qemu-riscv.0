Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE1CC4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 19:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rahPp-0001cs-OV; Thu, 15 Feb 2024 14:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahPg-0001bx-O7
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:28:52 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rahPR-0004gW-Fm
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 14:28:50 -0500
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1d780a392fdso11093045ad.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 11:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708025308; x=1708630108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oa8+9JzyW2AXOuQAQT/XowweMVndm3ihCRFuRjvbNSU=;
 b=R20kshwuCgnkTEMT0DKg34Eu3zXJAuMKWJc2JmEerE92tg34I46WAYmk5H6CRw5YMk
 xm7dNHyp1ZX2k6A0V1Kan9R+Lb0lR9fzbiVnHFYtOWYcG2uuVhsVWnwEnsOGQL17ujA3
 wUmwDzRLstId/V6IAjbgNsmzDnABNW6ox+qZxjD6bL59736F3yoKuFoEouoZZJxiocSd
 brObl/dYaeWGTaKCisZIse6HpWWdQx/KM8xBQ0ctDGwSD8QuQK0eyk71huCuKfePCZBy
 uUFFjY8g2iuYXy20ISl5SlzQC03P6KZtK+sXEhdoIuXCllqhJTdOxj/DC0NvZ5+t9hIX
 r2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708025308; x=1708630108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oa8+9JzyW2AXOuQAQT/XowweMVndm3ihCRFuRjvbNSU=;
 b=T1/sovlLjZWkFV+n+wqUidFm+3FSqH4+/qE4zn9FYi1pwcPy88nW23l3LoKc+LGe1c
 pn/wUV6tF65mHXj6hWmeTeWJJZb6NEs+10JkRSYZVKdkSt0oj+pbvQ28wfYpNf9WuFR0
 CBZ71VWcO0SVQpXikqDZAnJBbk0n6nwfvmeRXTvQwc/I6MveuZUz5R1VbCT+sPnynaaS
 ajL6IX8TnB/w9o8PmO/8Q04spkTaU4OnwVwsTkB4P2j5g7aqAIBGdAOoHz3LumgXWy18
 sFW0QR9Zh/m5cAD83JZY/8ixhVA1uQpKr0Atow8rt/uBIlpvZigcT9T9jOCOARNOFJuM
 p+mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRJWOOelQTo9m9tj1DdVb5BxqxybwGS/rNP1vUxS3Ibrdy5V6GZ5UUdwzqaaGEHCjn5kMGmx/f4U6KnuVcpIQ0dPNeeSg=
X-Gm-Message-State: AOJu0YxoTx/TSs6DZnaVBCGfxOqpiOx6e4+PcKkm9TeiiTm9QTa+HwyA
 cOO78HIvWaFcFURaAkUBu5TtnPtjr82H013OCS2SbGAKkVccJxjZgnr98idRnyxmnp8kira9CJW
 0Df6x+Gc6
X-Google-Smtp-Source: AGHT+IH+ef7TpzK13R9moXThf+5dAP11DtUE2qop2zpVzcqepZa7/ef7qHMVckUfXYNDXteKzLruaQ==
X-Received: by 2002:a17:902:e810:b0:1db:4c96:b578 with SMTP id
 u16-20020a170902e81000b001db4c96b578mr3433658plg.59.1708025308092; 
 Thu, 15 Feb 2024 11:28:28 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170902a60800b001db5ee73fe9sm1618653plq.114.2024.02.15.11.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 11:28:27 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
	Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 0/6] Improve the performance of RISC-V vector unit-stride
 ld/st instructions
Date: Fri, 16 Feb 2024 03:28:11 +0800
Message-Id: <20240215192823.729209-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi all,

When glibc with RVV support [1], the memcpy benchmark will run 2x to 60x
slower than the scalar equivalent on QEMU and it hurts developer
productivity.

From the performance analysis result, we can observe that the glibc
memcpy spends most of the time in the vector unit-stride load/store
helper functions.

Samples: 465K of event 'cycles:u', Event count (approx.): 1707645730664
  Children      Self  Command       Shared Object            Symbol
+   28.46%    27.85%  qemu-riscv64  qemu-riscv64             [.] vext_ldst_us
+   26.92%     0.00%  qemu-riscv64  [unknown]                [.] 0x00000000000000ff
+   14.41%    14.41%  qemu-riscv64  qemu-riscv64             [.] qemu_plugin_vcpu_mem_cb
+   13.85%    13.85%  qemu-riscv64  qemu-riscv64             [.] lde_b
+   13.64%    13.64%  qemu-riscv64  qemu-riscv64             [.] cpu_stb_mmu
+    9.25%     9.19%  qemu-riscv64  qemu-riscv64             [.] cpu_ldb_mmu
+    7.81%     7.81%  qemu-riscv64  qemu-riscv64             [.] cpu_mmu_lookup
+    7.70%     7.70%  qemu-riscv64  qemu-riscv64             [.] ste_b
+    5.53%     0.00%  qemu-riscv64  qemu-riscv64             [.] adjust_addr (inlined)   


So this patchset tries to improve the performance of the RVV version of
glibc memcpy on QEMU by improving the corresponding helper function
quality.

The overall performance improvement can achieve following numbers
(depending on the size).
Average: 2.86X / Smallest: 1.15X / Largest: 4.49X

PS: This RFC patchset only focuses on the vle8.v & vse8.v instructions,
the next version or next serious will complete other vector ld/st part.

Regards,
Max.

[1] https://inbox.sourceware.org/libc-alpha/20230504074851.38763-1-hau.hsu@sifive.com

Max Chou (6):
  target/riscv: Seperate vector segment ld/st instructions
  accel/tcg: Avoid uncessary call overhead from qemu_plugin_vcpu_mem_cb
  target/riscv: Inline vext_ldst_us and coressponding function for
    performance
  accel/tcg: Inline cpu_mmu_lookup function
  accel/tcg: Inline do_ld1_mmu function
  accel/tcg: Inline do_st1_mmu function

 accel/tcg/ldst_common.c.inc             |  40 ++++++--
 accel/tcg/user-exec.c                   |  17 ++--
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |  11 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  61 +++++++++++
 target/riscv/vector_helper.c            | 130 +++++++++++++++++++-----
 6 files changed, 221 insertions(+), 42 deletions(-)

-- 
2.34.1


