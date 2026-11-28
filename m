Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A7606A31C
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=kF6az+SV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xXNy3-0002rW-2d; Sat, 28 Nov 2026 14:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarthsarda@utexas.edu>)
 id 1xXNy1-0002qi-3g
 for qemu-riscv@nongnu.org; Sat, 28 Nov 2026 14:20:13 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samarthsarda@utexas.edu>)
 id 1xXNxz-00066M-61
 for qemu-riscv@nongnu.org; Sat, 28 Nov 2026 14:20:12 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-48ed0b68895so5337458fac.1
 for <qemu-riscv@nongnu.org>; Sat, 28 Nov 2026 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas.edu; s=google; t=1795893608; x=1796498408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=a5Z6/aG4JIuCE/TBqWYQjputc4kTQODYAxHhGhnW2U0=;
 b=kF6az+SV4mTzR+Ke2ol9gFk202z2T6YfirxklwhqGTA6ZTbFKVBVd0kCuLoOHcs8tV
 cNEYrlJKzb2UWkKIaO+CH8dfz6jxX6/eQ6mRWK4LxQKAhuVPQaewENTstKHogkdjnAuC
 CpBkYq/LmY6nk6r4S1q97tHRuNLNyOl9LB9jUzV5KnHE++5dU+Komr9ciNoLBQIJcLLw
 mJ7ve+TM8wfsW3zrTMHdYmEGhKyCRBiaghz7KkKy3yWsciovZUqAc0SFGQV+cP9sVnUA
 T/1EmI5MXx9cBUUs92p0X2eUpbR1Iec9twbRTblzzoSu3ouIEFBgUsd8pfJHqd6bGHGc
 cDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795893608; x=1796498408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a5Z6/aG4JIuCE/TBqWYQjputc4kTQODYAxHhGhnW2U0=;
 b=UYLh6pfn4ESMEcXRzwTv20d3fZxizvsbvM7Ya9n2Ea8iFB7PB2Bs/phei0zxMHtAXs
 hQDl7io+vWO17sNyfc7Y4r/FgFOcc8ghMGFrVWZ1R3NCHcG5oDjwA6YRsHxAeZbMiigA
 W3ZXl75XCEL2wBA380N3CaC+cgjJ1Kn0yO0ydMBFXmIF1VH4BfDy0eXEznYUy8BNXDOg
 fAX6rqZt4VP3deeIvQ9lYRW0jRtQchD1eJBBxhMVmgAGMHMoMTshcWMUv0R1pTxDFnY6
 pz0WLHKvXp22nuMPKDiFHhEHDetRorw40F98FbKEa5TtK3vpbd/D8mb/jFmIgbVI1wL7
 ALcg==
X-Forwarded-Encrypted: i=1;
 AL+hErGkflXkdg0B/k8cdJrzgZ3ED0oQ8CmKu+ET2Z2r/amLFAj03TUsEeHaJHEpwGhQLghV9eLajAKOJyRy@nongnu.org
X-Gm-Message-State: APuU4Z9mUtW+TNrHs4Oj4OTXXM4Gtbklx/Rm1qJgbvlfKeEVhyTdla3B
 DurUg99GOV+n19/AtYuAlc5UMhuaDzWORsbFRlfIR7ezyJBmEXTx7n7W2fBEnfIbwTY=
X-Gm-Gg: AZFdTZeiRCne2nSFbd3d7mbdMDeAAgWgPYkdCTHQ4CqnA5i7y0k+AXu1l5phrv9YyFJ
 R3+2YLvYWm5GSGNGNhMUKDTyzfwkxmsSGZbPl78HTxEB1WfOqmVlGgJhWEA6JvOkOKWjWT9J/9f
 Vhhc1O8Y5/y5sO4JHlJjrKfODIvXNVNr0LdaSKFaEblq9Qn2KI9Bdx2lGH7zmUd0ywyK645AW2C
 O1wc5A3fJCzYNEDUxkNUA9Dxj5zk+IEW5Q2o9S43mmLVC2UIny3PNMhBlbWxCsJ+NhgMQu89/DU
 9omB3+TC0IXGz4D5s/TSBDbHRQGiROLuKI8ZBnaczbkeLDLm27ol+obpJS+curefXxIGfFinwXX
 HZkYhJQnNBNvFXgKcWWfeArybM2TN8k2ab6nvPOjAKj9WNNiJXsiGwYqT8O66fmMXAkAjodjyPZ
 yWbcnqcss351HDMr/5iRQ21itdZH0aPfukHr323Wvm3HM+WpProJiUjbLG8fXHqzuFIWt9b3hAa
 byIFYX+oFTo5PREKIvTzXMgKPsrVXHLOqz3UGBP5ph9+SRD3CtdwOdVUgpNK4SK+W8KIbcLeEKQ
 BMJ0EUg8OlO1fc9wdrkpI4bcS++0w0pzJssSV5hc
X-Received: by 2002:a05:6808:2389:b0:4d6:9355:7547 with SMTP id
 5614622812f47-57a0c0a2226mr28497154b6e.66.1795893607603; 
 Sat, 28 Nov 2026 11:20:07 -0800 (PST)
Received: from ubuntu.. ([172.56.23.167]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-57a34252251sm21933082b6e.6.2026.11.28.11.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2026 11:20:07 -0800 (PST)
From: Samarth Sarda <samarthsarda@utexas.edu>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Samarth Sarda <samarthsarda@utexas.edu>,
 Dana Coates <elladana.coates@gmail.com>,
 Juliet Mathis <julietmathis2004@gmail.com>
Subject: [PATCH v2] target/riscv: Fix mnepc alignment for Smrnmi
Date: Sat, 28 Nov 2026 19:19:46 +0000
Message-ID: <20261128191946.5054-1-samarthsarda@utexas.edu>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=samarthsarda@utexas.edu; helo=mail-oa1-x2a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the RISC-V C extension is enabled, instructions may only need
to be 16-bit aligned. Some RISC-V implementations allow software to
dynamically enable/disable the extension through misa.C. That means
IALIGN can change while the CPU is running. When switching between
IALIGN=16 and IALIGN=32, bit 1 must be preserved when written, even
when IALIGN=32. However, bit 1 must appear as zero when read under
IALIGN=32. The same masking applies to the implicit read performed
by MNRET.

Bit 1 of mnepc is being cleared permanently when IALIGN=32.

Our fix preserves bit 1 of mnepc if IALIGN is switchable
regardless of the current IALIGN value.

Fixes: 5db557f82bff ("target/riscv: Add Smrnmi CSRs")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4825
Signed-off-by: Samarth Sarda <samarthsarda@utexas.edu>
Signed-off-by: Dana Coates <elladana.coates@gmail.com>
Signed-off-by: Juliet Mathis <julietmathis2004@gmail.com>
---
 Changes since v1: Added a Resolves tag in the commit message in 
 place of our incomplete Reported-by tag line

 target/riscv/tcg/csr.c       | 11 +++++++++--
 target/riscv/tcg/op_helper.c |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..bd395a129d 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5752,14 +5752,21 @@ static RISCVException write_mnscratch(CPURISCVState *env, int csrno,
 static RISCVException read_mnepc(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
-    *val = env->mnepc;
+    *val = env->mnepc & get_xepc_mask(env);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_mnepc(CPURISCVState *env, int csrno,
                                   target_ulong val, uintptr_t ra)
 {
-    env->mnepc = val;
+    target_ulong mask = get_xepc_mask(env);
+
+    /* Preserve bit 1 when IALIGN can change from 32 to 16. */
+    if (riscv_cpu_cfg(env)->misa_w && (env->misa_ext_mask & RVC)) {
+        mask = ~(target_ulong)1;
+    }
+
+    env->mnepc = val & mask;
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index f9c79fe6b9..001241cea1 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -543,7 +543,7 @@ void HELPER(sdext_ebreak)(CPURISCVState *env, target_ulong pc)
 
 target_ulong HELPER(mnret)(CPURISCVState *env)
 {
-    target_ulong retpc = env->mnepc;
+    target_ulong retpc = env->mnepc & get_xepc_mask(env);
     privilege_mode_t prev_priv = get_field(env->mnstatus, MNSTATUS_MNPP);
     bool prev_virt;
     uintptr_t ra = GETPC();
-- 
2.43.0



