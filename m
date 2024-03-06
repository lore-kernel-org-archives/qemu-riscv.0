Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43714C5475B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 17:20:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhuvu-0007je-QY; Wed, 06 Mar 2024 12:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuvj-0007iQ-NG
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:19:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rhuvc-0000Z2-SB
 for qemu-riscv@nongnu.org; Wed, 06 Mar 2024 12:19:42 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dd2dca2007so16684815ad.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Mar 2024 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709745577; x=1710350377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wLXOia9WWzJH14OQRTLdgyENAN2T6Zy7YhqGv1dojD8=;
 b=meBHOYZKIO1W0Mz4gJoEh2giNbzW8J1DmwcAsKY3TfBhDasJngXvlDEb13xqCT4FuC
 ylBAKmObPpUtHLv0ExWzKSgemckS8c4CvLocYbEGuv3ICWSxR8nu9WtGWifMvMJclZWY
 4WO8/7DEbEkzn0Fws3DCaYoJKLlU6yW2Lx0W+WhZ/iPDm6qgqpcZ/z565stWcU/pLbZv
 mubYggqk8VEyKuzCpsQETPh4s3nektYsi8DZlWBr4mV+DtY4aMQI/p4O7J1j9R0M66DD
 m1ADAiwuyYUjQkpZGQDOAJobMSPIIJ+e23Lt5m7zNpWRRIf03DtKveL9YZR2NbMaNfOk
 fA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709745577; x=1710350377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLXOia9WWzJH14OQRTLdgyENAN2T6Zy7YhqGv1dojD8=;
 b=wePYxuYsP96sndkm6jxntB1o2m8Ocsk7iD4+CHSu8FloNUUb9MbW42OGNMUOjsLE1+
 WsuSbUouVDq48EbbMBK9QqQhOBGl7jceG/seWv9EhWYYYKsMRSZhlYZFcJcAHYeQKzDV
 Vk/Lk7Z9MFH1JtlPIyBhn95bn3yUHODDIOW+2sIAZzfKzMtSLYszs+OmAw7/yizPDv04
 wDGTklmEBghie5Sqd0zum/LH1/zuFa3r+tsP/n/sxCGlehJhJNNVJWdFV/+h1KxpPKRM
 g6XygKqROZBHyuoCLAPLfduC6s6Nq3NO9ndaRHuWVqzySMQQmG0CjrI3463xGoEjpzA+
 pLCg==
X-Gm-Message-State: AOJu0YxDhIHxJEYn0xqKfiunZFdpvIhdVfQ2fnr/V0lau/K+wH8oXKZZ
 dNvpTB/gtmocVJa8JmBZj1rJjnP36V4ID3Buc4YoUcxNCl31LdDJkaDbqEBr0FY=
X-Google-Smtp-Source: AGHT+IElfrT3spqns261wfqI0ps0asdYqfqhpfbeT67u7dHbhhkJ7Mb6FF0Wio9LGqhq9g48KpR4LQ==
X-Received: by 2002:a17:902:a389:b0:1db:cfa0:4045 with SMTP id
 x9-20020a170902a38900b001dbcfa04045mr5384194pla.60.1709745577382; 
 Wed, 06 Mar 2024 09:19:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902c71100b001dbb6fef41fsm12869712plp.257.2024.03.06.09.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 09:19:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 0/9] riscv: set vstart_eq_zero on mark_vs_dirty
Date: Wed,  6 Mar 2024 14:19:23 -0300
Message-ID: <20240306171932.549549-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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

This version is rebased on top of alistair/riscv-to-apply.next, fixing
onflicts with the Ztso changes in ldst_us_trans().

No other changes made. All patches acked.

v6 link: https://lore.kernel.org/qemu-riscv/20240221213140.365232-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (8):
  trans_rvv.c.inc: mark_vs_dirty() before loads and stores
  trans_rvv.c.inc: remove 'is_store' bool from load/store fns
  target/riscv: remove 'over' brconds from vector trans
  target/riscv/translate.c: remove 'cpu_vstart' global
  target/riscv: remove 'cpu_vl' global
  target/riscv/vector_helper.c: set vstart = 0 in GEN_VEXT_VSLIDEUP_VX()
  trans_rvv.c.inc: remove redundant mark_vs_dirty() calls
  target/riscv/vector_helper.c: optimize loops in ldst helpers

Ivan Klokov (1):
  target/riscv: Clear vstart_qe_zero flag

 target/riscv/insn_trans/trans_rvbf16.c.inc |  18 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 283 ++++++---------------
 target/riscv/insn_trans/trans_rvvk.c.inc   |  30 +--
 target/riscv/translate.c                   |  11 +-
 target/riscv/vector_helper.c               |   7 +-
 5 files changed, 99 insertions(+), 250 deletions(-)

-- 
2.43.2


