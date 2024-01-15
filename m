Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF96C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVOr-0000WT-6u; Mon, 15 Jan 2024 17:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVOp-0000Vu-Q0
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:43 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPVOo-00062J-AC
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:25:43 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6dec4b7b680so2960788a34.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705357541; x=1705962341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUTQ4hAGbR/U7aTocUntatBO3/zQ0lq0rhjwH747sgA=;
 b=f6AahW0wUQhPT2VHMmsglHYA2w1bOVqn7Nh3iPnqYdU+tZBMHZLGjazGeygkeOLI7t
 KPr7mgDA7aHVPy/aF7hpC5y2YiI0VTycn4zLaAuwpq4DV+a927Ux3JvxBSJY1av36j9z
 aL/PI8KB0QrSAEbjVV7TRA95B7p/J7fe0aE2Il90tdHAgymE9J0OMMW/Fhc/0Tazr+3E
 4gB7hC3HjFjPc1RaG0zYnmILgFqN6U5/tS730SaDL+Eq5AJQQTy4S2el9yxYnfR5F+nr
 BBH8Z+YY2bvk/4DQlP9q/QWs1TqNmEidIIZgnOfL9Pwv+5z3DqYJNbWqWAqIqUUZO3+P
 U/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705357541; x=1705962341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUTQ4hAGbR/U7aTocUntatBO3/zQ0lq0rhjwH747sgA=;
 b=LoMuHBDbOEuN0fMvxVzgBbrOWi1cRSCh3Pp/Y6mJKvSjQIA0Zngs+7swlXyVm9MFhI
 aR55QWy0CswZXjGB7FOvmB3dwfMK5NXHsk/dl02c2PF84chMPvMeeyRUsUF9M20M33dX
 sPv3zFYgkJYEMgKFROWjy/WQUrZVpDih5MTpqVGmeeIYjVYuLTHacdj52ACOtB4vJGVi
 ipHo6PqVIO60UtlX93j+7nwVcSUe4ldLj+GKmzMxB6RNCtYp0Z5OLtX4fUUCG+MhysRj
 ni1qTtQdFdJ/0tmAD+yd0ygDGrWFQjnIl2AXuMhQKmIyoZTZWuSevxRjIjp4+p/Me4d+
 rUkw==
X-Gm-Message-State: AOJu0Yz9Moz+Z5ZOD7dPTeULX+ztYMf7c50H9f5y4ifp/wui7tXwhsNR
 KzAduZHJKZQ7wzW5qfCCFNUErlu3EkdgDg==
X-Google-Smtp-Source: AGHT+IHLSkXeGGHPTJ9mZYJAQrNvnSYEU1g5MnmGpN1tzp7afZew/vTaWaW8onLyTXZDB/TMpQoP6w==
X-Received: by 2002:a9d:7350:0:b0:6dc:379:b3f with SMTP id
 l16-20020a9d7350000000b006dc03790b3fmr7418994otk.46.1705357541202; 
 Mon, 15 Jan 2024 14:25:41 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 ks19-20020a056a004b9300b006d977f70cd5sm8125940pfb.23.2024.01.15.14.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 14:25:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/12] target/riscv/csr.c: use 'vlenb' instead of 'vlen'
Date: Mon, 15 Jan 2024 19:25:18 -0300
Message-ID: <20240115222528.257342-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115222528.257342-1-dbarboza@ventanamicro.com>
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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

As a bonus, we're being more idiomatic using cpu->cfg.vlenb when
reading CSR_VLENB.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 674ea075a4..5c8d22452b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -683,7 +683,7 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
 
 static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = riscv_cpu_cfg(env)->vlen >> 3;
+    *val = riscv_cpu_cfg(env)->vlenb;
     return RISCV_EXCP_NONE;
 }
 
@@ -738,7 +738,7 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
      * The vstart CSR is defined to have only enough writable bits
      * to hold the largest element index, i.e. lg2(VLEN) bits.
      */
-    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlen));
+    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlenb << 3));
     return RISCV_EXCP_NONE;
 }
 
-- 
2.43.0


