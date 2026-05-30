Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25206CD5BD0
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 May 2026 05:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTCJA-0003HB-67; Sat, 30 May 2026 01:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTCIz-0003G3-PM
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 01:32:19 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <314abh@gmail.com>) id 1wTCIy-0007G0-7Y
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 01:32:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36d630c0e35so171172a91.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780119134; x=1780723934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8BLEpb1qVJQlLoIKuGkWEWOKI1hjsxY8cabZ5Za7MGU=;
 b=Tn9zYzl5Q+J9NWEJHosEL9QGdyLgNa/bl5cBjdYRnp+e0ltDz9grwT59390Y04v6+T
 cDRfwpSUFVVfzFYncNWXVTrfzAmv7AF4GaiN0q0adNC7JOWv9watSSMKvBssL8yJGo7f
 wmJSVhJKyrDwVgfYdMTneR/qY3w6hwH7/gL93WgvirPRXxxipwJZv45m9Oc417kKStHc
 ihu8xhwe0vDTktBdnDua+lHcysG5f4TFxWqnRbla+3kbOCxr9jWSDyNUbUrl5UzkHWQN
 d3DcB/RDhUkGu40ThrDuw43hW6nyI5/bpqFUN9nqroNBy5LP1wkUDSAPFtsuna0bG8to
 cdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780119134; x=1780723934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BLEpb1qVJQlLoIKuGkWEWOKI1hjsxY8cabZ5Za7MGU=;
 b=DrBBL5qyGitAObIhvLhwG8d7iIlVeg3lvZ40Edben24KkuU3p8gaLE7RbqwwVJhFQy
 ltK8XAG6rLU3aHwRKHRkpE6OQLfmssZpCG68qaaOs6ttb+nrEV2CeX/PBkoeE8tKkhJc
 XQCAr06bvwFH8XwktVbPTRERQBBQcApgqjUST6zj798lqzIR8L9cLIOcNJMJolTm00ea
 VQjqq0+c2FfcENRlsPw7Nfyckqwz/KSqe1fY/S69/fo6Ult+WSBXl4h8d4CFVqmIHsYw
 Tyx9qkY2b4WR9Acf4vcyw+cP/Ke2JnLwn0QiXp/jDXo3i7uz+IN+sVk7FIS4vIImke54
 hEEw==
X-Gm-Message-State: AOJu0YwWnqrlroILzCa9fsZY2UQzqTU7Vy+W6xmt43Pr3em8uw5az9NT
 2CTA07hkkU9cbbOb5RKZKzoQe0SAa//XyIxaJN95b73OOnyNUsGRnGdB
X-Gm-Gg: Acq92OG0AE3PZg8yc4fu8Lt768T3LGjO3fPGw/V/zWFH6fIHCw73kxl9feViHBsdE5p
 37CIy6D0x/RX0u9GQDmkbN/B/Vz5fp9lxgS733oGGs1rUBZ6OVdmqjIEL0TSJvf6ceedvOwDts/
 a8R6ydUL4HXwAHO7LOy2fh2eUpoNxDnFG1trgCLyuyanU8Pil4jZvlmdfXViOfZsEsRJyXq45J1
 SdildlLNPPVszWE8GUYt42+vbSbDGkWwbshXyPwb0peJKFomlTNR5hQ/afLveaLyq4qqdLxc09s
 0HnLgdWpIaeFlKWpUB/KyDD6diq1iL9tuQtof/9CMDHgQJQu121WkubsbHs9FpYJUQN0PdfDA2s
 KVU9gjV8tedemaOUqPQU3Ncg7czXHO594D/OsuNgsPuQt70VnSFMsI+CE0uSwEl8+Gf4dCIduJM
 bCYYJhaZ2IU63wuvez85FgKK1zOnYVWw==
X-Received: by 2002:a17:903:1a87:b0:2bc:90b6:3e6f with SMTP id
 d9443c01a7336-2bf36779dabmr32233225ad.4.1780119134536; 
 Fri, 29 May 2026 22:32:14 -0700 (PDT)
Received: from arch ([112.133.246.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf239e5d78sm37216385ad.12.2026.05.29.22.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 22:32:12 -0700 (PDT)
From: Abhigyan Kumar <314abh@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Abhigyan Kumar <314abh@gmail.com>
Subject: [PATCH] target/riscv: fix invalid sstc predicate in gdbstub
Date: Sat, 30 May 2026 11:02:00 +0530
Message-ID: <20260530053200.902591-1-314abh@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=314abh@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

sstc function incorrectly checks for avaibility of env->rdtime_fn.
This causes it to fail each time it's called because rdtime_fn is setup
later in the procedure (when timer devices are created). This prevents
stimecmp's addition to gdb.

This change ensures only the riscv_cpu_cfg(env) check is done. rdtime_fn
will always be NULL otherwise and fail.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3496
Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f5b0895fd..d72df945f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -590,7 +590,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
 {
     bool hmode_check = false;
 
-    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
+    if (!riscv_cpu_cfg(env)->ext_sstc) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.54.0


