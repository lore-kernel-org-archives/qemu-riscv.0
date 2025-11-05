Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18229CCFA0D
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 13:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGdnq-0004x3-Kt; Wed, 05 Nov 2025 08:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vGdno-0004wn-Sw
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 08:43:56 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vGdnn-0002vL-3q
 for qemu-riscv@nongnu.org; Wed, 05 Nov 2025 08:43:56 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-ba4874edb5dso897900a12.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Nov 2025 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1762350233; x=1762955033; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D26vXv+8Ed1orfqhFfArUAxk2oGjpGYqrtarHGtxK4I=;
 b=hQzfOsRa1w0uKpk+nrcPIdYsJp8PVf+bc0KXwihoch9HQo/J8AWTiu5Op+T3BhAwyZ
 03uhi01R6B22SjW8pnrpJRNmna6M1CmkfL4F8SI/pfz5v+mAqmuR1/Cv6DLteQ6PhEsf
 at5NNEJcHpmcAOBOhK2wx7n5tHpGuHUEji9AA7Gi4Ql05r4hxJgqeqLRBla0REql5a8C
 pR9mm6zNXWZIFsKc6sASsAWsNGy45tO4pgm8F6otRwcnTqqipXK2snRtb2Hp5TAAPjLl
 JijpEtQuNdWYPJMloFvnn/NuoA8nBoosDJ5fRJ7pt+wXA5Pcr6elaIa8hHMdSh8kI7UB
 qKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762350233; x=1762955033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D26vXv+8Ed1orfqhFfArUAxk2oGjpGYqrtarHGtxK4I=;
 b=slp8FnQYSPE2/rc9AobDUAmY+kSp75hyeiLSkzLfSZ1HjL0RaxojWR/Ru3koarqp6J
 tDBTcy9bZvOCcohb7IUjqBQ0YGe74HwTHpNiyHR+qmVUvxS1tMNYRmXTGICGSh95/6R7
 OWIuJRw/An8/qfkM3jSGzPLpGxRy+Kj7PCu7Ucf2dn75JeOH8+i6ftXZZCpbyFO+yVKG
 dG5ho/wAAm+bldFQx3kum9kvG+vcMPn+9+Ql0AsqiOzzLG87gBGi2UbzXNW3kQuNcnbt
 tskYcEmrsJ1OB7tAr3LuC1dYc++OyRoZjs4dYNPFOqcesmWNji683SvAunK/0IXwwv24
 +7yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQvzW9M2W2gdP/H4duxbOmIU64P8Jv+zRncyr8xVieUopceOI1OPhYCbJftJlSNZFKeBDDOoLI0q62@nongnu.org
X-Gm-Message-State: AOJu0YwA1lV7xPVXYp56/wgp5AOsV7rpWeBESZsRMEjR6lCtwhIUWDbn
 TGuOfggmjIc6ECAnV5sWMloRRAN/tYw8udlB0G/b/CkLY8tVHYkgzVGv/B44Y3KIk+w=
X-Gm-Gg: ASbGncua+9bAA0aVF6aRyy1JZur7uCKUYGubKU0jHtT4zPO7190SY0Ztfjhb7P9OHkF
 i2ycQNc9b9YisUSDIoipYcIpCVe+l/ck6bxL3kkPIc2FtchzdMcrKxE+cLd3cOmbKqFqeSZt9JD
 8RNIOpv3HnKBGEbhV+nwLSC8KD9waN57TdyIJIAZn4YjzbY+N0zE9eAB18Hs0C9UW3QhMVEVoVz
 lRej7ia9MwHq5P66MZQDAYiSYRrOE81M02kAS6vSO/Esy/qpBIHjhMiNLnADJqXMVqqsCDrZOx+
 tthkGPtkLiD4g+LF36XxD2Aj9e+19MAXJBsK22V4MaJW5vFqJGUj0H3TmOsiCpsrVy43mu1JJH0
 mWYccLGFWyt15s8busYO44Agos64Wc/2CXCwiczZk4kflQZppUWV8BnznfhP0zdGH8kJbHY0NNX
 EKXJUW3MqoYtHbRnsInk5yM8aIxt60qOlm87gNGtckX7ZwE4cVG36Aizw=
X-Google-Smtp-Source: AGHT+IGYah24Y0s/NK6v+G6at5eKCyU5E4fM7XlHmy4bkrY2d+b1grd+elfj34qh1Sopd/vKvj5z+w==
X-Received: by 2002:a05:6a20:3d95:b0:349:c80b:d5e9 with SMTP id
 adf61e73a8af0-34f8400875fmr4208076637.23.1762350233055; 
 Wed, 05 Nov 2025 05:43:53 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1f87a6155sm5556501a12.29.2025.11.05.05.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 05:43:52 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH] target/riscv: Fix PC sync in trans_sspopchk for CFI exception
 handling
Date: Wed,  5 Nov 2025 21:43:31 +0800
Message-ID: <20251105134331.2865581-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move gen_update_pc call before conditional logic to ensure consistent
PC state regardless of execution path.

Previously, the host instructions generated to update the cpu_pc were
only executed in the failure path when shadow stack validation failed.
This created inconsistent PC synchronization.

This inconsistency caused issues in CF_PCREL mode where subsequent
instructions calculated wrong relative offsets from stale pc_save
values, and could lead to incorrect exception return addresses.

This fix ensures PC is always synchronized before any helper that
might raise an exception, maintaining consistent translator state
across all execution paths.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvzicfiss.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
index 0b6ad57965c..f76697b8a11 100644
--- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
+++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
@@ -32,6 +32,9 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
     TCGLabel *skip = gen_new_label();
     uint32_t tmp = (get_xl(ctx) == MXL_RV64) ? 8 : 4;
     TCGv data = tcg_temp_new();
+
+    gen_update_pc(ctx, 0);
+
     tcg_gen_ld_tl(addr, tcg_env, offsetof(CPURISCVState, ssp));
     decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
     tcg_gen_qemu_ld_tl(data, addr, SS_MMU_INDEX(ctx),
@@ -40,7 +43,6 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
     tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
     tcg_gen_st_tl(tcg_constant_tl(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
                   tcg_env, offsetof(CPURISCVState, sw_check_code));
-    gen_update_pc(ctx, 0);
     gen_helper_raise_exception(tcg_env,
                   tcg_constant_i32(RISCV_EXCP_SW_CHECK));
     gen_set_label(skip);
-- 
2.43.0


