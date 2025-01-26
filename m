Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B274C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 07:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbwyQ-00058G-Ht; Sun, 26 Jan 2025 02:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyF-00052t-Lk
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:15 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1tbwyC-0004HK-Rr
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 02:22:15 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-29fe7ff65e6so1189344fac.0
 for <qemu-riscv@nongnu.org>; Sat, 25 Jan 2025 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1737876131; x=1738480931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyip6VT/5yDNDFiXFMYcFQVmq0xmW59Cv/92qKvtykg=;
 b=F63TYtGo0P0KQc9sJ9gequ2vCTx+4MJtm1nI9jbfofkJ+RGvjedTnrGm4ExWRL69k2
 8gO7JvyRE6BMMf6Z3QnQuPsHjshD8LaS/VqxP2kdvF5JAQBtqW9ptRliuP3BuFFsxcoj
 PIiMycxmpTUDfdluVqu6AJdxRjXZ4nvlq8d7QgjziAbIwJm9Bqo9iE6y/9M8QnmC/vOr
 XZ4VSkI9jHvOXXsyzMNnO0Xtgvj9dET1uCZi28s1RBLQMun20kMDYtSRooRvuaijcVCc
 tvTaiwwlORLROucwS1pRZqS1ZzoC0jAcFuPGSxzE2+O7lX3gyC17adIMU5pciQBbob/Y
 DCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737876131; x=1738480931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyip6VT/5yDNDFiXFMYcFQVmq0xmW59Cv/92qKvtykg=;
 b=QkTm+A0YEYu5P4ql5+oVP6/4tLWr7relrBUDUl1ScNcJpwXgHwN3q/iVsIm9/ayTfy
 ftYTt/6mAlgWuKNo0WKmHNqWDHR75uQh2vhDSE55QmJiz1GXB7MaZfnSoJk/x2EEp/Ut
 z40+ZVZimUzQbW3IFrvRHDrshKlwZ7TaDVrm/+aqZXBkMV96SuKQ1x283HFf5m8Ir8bd
 hX430yVqKhpFLDGimTYQfKSTjkzviOoazD0ECSrjY0F12WoaeQdqizToB3UcjQ3Xhq6t
 qib+2EGIXPs28rGadbl9IP4ysRJZC6n+T/xbl/f9NF5B2eF1LUz5PP/TyfIPD9DSrcDw
 vwrw==
X-Gm-Message-State: AOJu0YwhKBet1WDPoAfA5F3uA7BGqLZJ/WyTuXkav8HIo7R4ecT2NGXI
 o5WV0HLR3pkk8eU+Op3KzjGhU5/fs3DccVYjewTB9HDMd6NrfPfzJGu13y1Y7QCLZZQ+V8yB2eV
 nBUTDPw==
X-Gm-Gg: ASbGncuD0hfS6Ajz1DV+7ywVDYTd/OHIzApme/rl9jieyDegGNUZBLoZHA3Q8MOABKk
 qz13oM5MTgVXYwJz1C68Q19C4+yUlL0/UKv5szYA0910P6bC0RtB9Z4LH/eWKjWkBLMFk+IOboU
 oNWO4RtPUhrO5K6erwT4NO4a/z6v3fJxXi5ojNCAl1Lsrg/0f2vlbq2nMWOR2BBy7LYgj47W4vY
 1fmxYU0hgoqwAGZXjyGCe7oOWV3SIjlJta1LKkacXScRFA7Wq6alRKZEHNgUIwvL0V+iCX/36a4
 TxGj+YLfdld96DB4qj+GqFxQB+uPxdN7/0ruUs4=
X-Google-Smtp-Source: AGHT+IEIn9dU+TAcctC/re24Wl5VO747uEs5QGj7Pl5CBn4eHmWHjoJeL+FOfLMn+Iovi06xP9Fk/Q==
X-Received: by 2002:a05:6870:af46:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-2b1c09125b9mr20339679fac.7.1737876131397; 
 Sat, 25 Jan 2025 23:22:11 -0800 (PST)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b28f1d887csm1814281fac.29.2025.01.25.23.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 23:22:11 -0800 (PST)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Anton Blanchard <antonb@tenstorrent.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 02/12] target/riscv: handle vrgather mask and source overlap
Date: Sun, 26 Jan 2025 07:20:46 +0000
Message-Id: <20250126072056.4004912-3-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126072056.4004912-1-antonb@tenstorrent.com>
References: <20250126072056.4004912-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x33.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 20b1cb127b..c66cd95bdb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3453,7 +3453,9 @@ static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
            require_align(a->rs1, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2 && a->rd != a->rs1) &&
-           require_vm(a->vm, a->rd);
+           require_vm(a->vm, a->rd) &&
+           require_vm(a->vm, a->rs1) &&
+           require_vm(a->vm, a->rs2);
 }
 
 static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
@@ -3470,7 +3472,9 @@ static bool vrgatherei16_vv_check(DisasContext *s, arg_rmrr *a)
                           a->rs1, 1 << MAX(emul, 0)) &&
            !is_overlapped(a->rd, 1 << MAX(s->lmul, 0),
                           a->rs2, 1 << MAX(s->lmul, 0)) &&
-           require_vm(a->vm, a->rd);
+           require_vm(a->vm, a->rd) &&
+           require_vm(a->vm, a->rs1) &&
+           require_vm(a->vm, a->rs2);
 }
 
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
@@ -3483,7 +3487,8 @@ static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
            require_align(a->rd, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
            (a->rd != a->rs2) &&
-           require_vm(a->vm, a->rd);
+           require_vm(a->vm, a->rd) &&
+           require_vm(a->vm, a->rs2);
 }
 
 /* vrgather.vx vd, vs2, rs1, vm # vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
-- 
2.34.1


