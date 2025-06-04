Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA1C5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:40:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMs4R-0000Xk-Os; Wed, 04 Jun 2025 13:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs4N-0000VD-8V
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:31 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs4F-0003EU-Ts
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:28 -0400
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2352400344aso1051965ad.2
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749058702; x=1749663502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8WKM/wEK8VP1ArVwfF5/+AK+ENcWWjOZhWhh/brMvSQ=;
 b=bls7oD5Vig+Lct2O9p1493o8l0qdUA3XVQwV3EE9+sIK8QTvFNdau6V1OoNAen21Hl
 m5Fr6KAcgXXBMIy9yK629nmcWkzPRXbsj4u56mpO2O0ymw5+4oXHo8vua1E2TSxDBW/1
 IOambBDMjvNs7hfXhjyi6VVLg5g7upMudc4LQhalRVvEBBmKUhBxy+quclHUHcAX4Znx
 Fo2SkHrAnpw/tKLK4dKuSXWV8QTfmRnx1+lootsizG5Y1ot17JGv9Sz1jl3hqOR51ukb
 PupNr5DEtY8g8XF9NZSPfuHkpc8JxjhEETJ9T40pfRgMx1oC70/MxQ66kzUEknzK4cN1
 8fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058702; x=1749663502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WKM/wEK8VP1ArVwfF5/+AK+ENcWWjOZhWhh/brMvSQ=;
 b=D/IASC5EPeAQ2MDezdkj0fzquds1aWDSyctnWemBRVyD8fn5mRaP98rKFvm//8TLiu
 ZzlxFpu1u/oUhWKpFRyqqaNHm41ymbmlS2Htb7CMXmZEV6oFh1OJ5HF6s5xXCQWEmvm8
 qW9nIg9sKjxy+VeuasdTd5peXOKxuTKJPQvrNHMr1fh0CIpE7Xl6UigtH07k78KQWsxy
 hThO8++63WXQH3kaNgXWL+u9A0JL6RMePmDPRijfjzQRuYTd41bnQabK42iQtdxRR9Om
 LD5Gba9ufL8A9ztY5OQFH42CNOBGNs7hCLHZX2D4+w4WFHHKyEKn5t4Tr5Ei8nln7ORK
 dZYA==
X-Gm-Message-State: AOJu0YzcTAGfTbx5ibjdIbaa4R6kTD+0YtdKWfS7QXyX1nBceqkdlCx/
 1zvXOayL+OipMBDzKij5ucE6sMU+KanVOn+6OsdxPqzW0z36DehuGltKMGriSj3IU0k=
X-Gm-Gg: ASbGncsmMMsSckt5bHOzrH0zufK2hWZ7/LADWBDQRjnoVbF7e5JUR0IXnlRz8p4YdbB
 KwDShqvm2fjqzx/+d+QyJhPE/m/rJUurQsoqerMGIENN0asaBheWEyKRYbr+GmGv4/PAwRooh3P
 HRjvsc2+GGnvPBUCHY+9c9Q3usBRMtmHQKTmqvWFXRpZjLE5vlS4Fu7dHyQdZSSZXczCHXr5Uxe
 lpKNbAji8EG474L0NTHyMzakivyuKrQ8uCEkoDc69fy+hawfLxexVoe61saz+W/RLSL34MGtuaM
 1EYjkLHPIlP1KVF4HMudT+LlyYjzJbXAN/G2ltLlDHrs/lTCRE+JttwZl4KSI3IhmIlrDeonoo5
 aGuIpn+9300gTHGg=
X-Google-Smtp-Source: AGHT+IF5WE9LLRjdfmOzKJKNlxnO3Gf7BSD15WLT1Z2fZi/api5NbbqquRBh0crVoH4F9V+gUpDJtg==
X-Received: by 2002:a17:902:d550:b0:224:1af1:87f4 with SMTP id
 d9443c01a7336-235e14bc5d2mr59101225ad.22.1749058702338; 
 Wed, 04 Jun 2025 10:38:22 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cfcbb9sm106913215ad.208.2025.06.04.10.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:38:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 3/3] target/riscv: add profile->present flag
Date: Wed,  4 Jun 2025 14:37:59 -0300
Message-ID: <20250604173800.1147364-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
References: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x641.google.com
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

Björn reported in [1] a case where a rv64 CPU is going through the
profile code path to enable satp mode. In this case,the amount of
extensions on top of the rv64 CPU made it compliant with the RVA22S64
profile during the validation of CPU 0. When the subsequent CPUs were
initialized the static profile object has the 'enable' flag set,
enabling the profile code path for those CPUs.

This happens because we are initializing and realizing each CPU before
going to the next, i.e. init and realize CPU0, then init and realize
CPU1 and so on. If we change any persistent state during the validation
of CPU N it will interfere with the init/realization of CPU N+1.

We're using the 'enabled' profile flag to do two distinct things: inform
cpu_init() that we want profile extensions to be enabled, and telling
QMP that a profile is currently enabled in the CPU. We want to be
flexible enough to recognize profile support for all CPUs that has the
extension prerequisites, but we do not want to force the profile code
path if a profile wasn't set too.

Add a new 'present' flag for profiles that will coexist with the 'enabled'
flag. Enabling a profile means "we want to switch on all its mandatory
extensions". A profile is 'present' if we asserted during validation
that the CPU has the needed prerequisites.

This means that the case reported by Björn now results in
RVA22S64.enabled=false and RVA22S64.present=true. QMP will recognize it
as a RVA22 compliant CPU and we won't force the CPU into the profile
path.

[1] https://lore.kernel.org/qemu-riscv/87y0usiz22.fsf@all.your.base.are.belong.to.us/

Reported-by: Björn Töpel <bjorn@kernel.org>
Fixes: 2af005d610 ("target/riscv/tcg: validate profiles during finalize")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
Tested-by: Björn Töpel <bjorn@rivosinc.com>
---
 target/riscv/cpu.h            | 15 +++++++++++++++
 target/riscv/riscv-qmp-cmds.c |  2 +-
 target/riscv/tcg/tcg-cpu.c    | 11 +++--------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 229ade9ed9..2a6793e022 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,7 +82,22 @@ typedef struct riscv_cpu_profile {
     struct riscv_cpu_profile *s_parent;
     const char *name;
     uint32_t misa_ext;
+    /*
+     * The profile is enabled/disabled via command line or
+     * via cpu_init(). Enabling a profile will add all its
+     * mandatory extensions in the CPU during init().
+     */
     bool enabled;
+    /*
+     * The profile is present in the CPU, i.e. the current set of
+     * CPU extensions complies with it. A profile can be enabled
+     * and not present (e.g. the user disabled a mandatory extension)
+     * and the other way around (e.g. all mandatory extensions are
+     * present in a non-profile CPU).
+     *
+     * QMP uses this flag.
+     */
+    bool present;
     bool user_set;
     int priv_spec;
     int satp_mode;
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index d0a324364d..ad8efd180d 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -121,7 +121,7 @@ static void riscv_obj_add_profiles_qdict(Object *obj, QDict *qdict_out)
 
     for (int i = 0; riscv_profiles[i] != NULL; i++) {
         profile = riscv_profiles[i];
-        value = QOBJECT(qbool_from_bool(profile->enabled));
+        value = QOBJECT(qbool_from_bool(profile->present));
 
         qdict_put_obj(qdict_out, profile->name, value);
     }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f8489d79d7..c5370a99f1 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -841,16 +841,11 @@ static void riscv_cpu_check_parent_profile(RISCVCPU *cpu,
                                            RISCVCPUProfile *profile,
                                            RISCVCPUProfile *parent)
 {
-    const char *parent_name;
-    bool parent_enabled;
-
-    if (!profile->enabled || !parent) {
+    if (!profile->present || !parent) {
         return;
     }
 
-    parent_name = parent->name;
-    parent_enabled = object_property_get_bool(OBJECT(cpu), parent_name, NULL);
-    profile->enabled = parent_enabled;
+    profile->present = parent->present;
 }
 
 static void riscv_cpu_validate_profile(RISCVCPU *cpu,
@@ -911,7 +906,7 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
         }
     }
 
-    profile->enabled = profile_impl;
+    profile->present = profile_impl;
 
     riscv_cpu_check_parent_profile(cpu, profile, profile->u_parent);
     riscv_cpu_check_parent_profile(cpu, profile, profile->s_parent);
-- 
2.49.0


