Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIJJo-0002TK-7U
	for mharc-qemu-riscv@gnu.org; Wed, 09 Oct 2019 17:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iIJJj-0002Rz-T1
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2019 17:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iIJJi-00031h-Dx
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2019 17:16:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iIJJg-0002zL-H2
 for qemu-riscv@nongnu.org; Wed, 09 Oct 2019 17:16:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so1659454pls.9
 for <qemu-riscv@nongnu.org>; Wed, 09 Oct 2019 14:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=H8fNamXSWGVsAQ92a4GC/hqc7AkmkMqrSnuj2ieP89M=;
 b=lc/DxU2iWFxYnwUGaqtHXTI78gG5eLl7FjzLJGnI/S1xuHMkj2ABabl9YHLlfgmnjh
 HCBRvmSiQUL2qFMKShdFG6hHzaD6H/G9wdIb036pJkN3d+9aug++4oyIR7tmLV8kbUoK
 SIFTzcHdgOAdXlwMw7HsAXeej+wXaNUgzPKi71uD5/KPbII94EfQMwpZxaXI/0kWgD9C
 X4g6aWIeiyfK0s4SSklFdmRKlJCJ8JrnbKudRAuXhQ2A2yvHQ+zS8SJDzQh3yYXhIpPd
 PyWB8K6OLkVQDg5vg9quTfxVcmn/+4ELhpdT/dV+uXkaeXhGgNDjwLSy20xRS+zCzfhw
 Rs6A==
X-Gm-Message-State: APjAAAXONQ07Y95R5zdCAAilkXEe4Kxuj618rjcbW7L39E3b7enFgwLp
 x8ZF5MqI6lx/wZ2Sb06CmaXj1Izvets=
X-Google-Smtp-Source: APXvYqw+f8eixv2AE2dlkWm8FE1Q5gaynqq37O0wzyb/PfVA0NR0LLyAiNqBmi2V+jNFfIFAajwUsQ==
X-Received: by 2002:a17:902:9a41:: with SMTP id
 x1mr5090007plv.331.1570655771648; 
 Wed, 09 Oct 2019 14:16:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l62sm4341432pfl.167.2019.10.09.14.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 14:16:09 -0700 (PDT)
Subject: [PATCH] RISC-V: fcvt can set fflags, so set FS accordingly
Date: Wed,  9 Oct 2019 14:15:41 -0700
Message-Id: <20191009211541.9937-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 21:16:22 -0000

A user pinged me to say "my floating point heavy code works in user mode
but not system mode", which I'm guessing is the result of a lazy FP
save/restore issue as those still crop up from time to time as long tail
bugs.  I figured it was worth giving the FP stuff a look to see if
anything jumps out, and it turns out that there is a bug: converting
float to integer can set the invalid flag, which is supposed to mark FS
as dirty, but the emulation routine doesn't do so.

This patch unconditionally marks FS as dirty for fcvt instructions that
convert into X registers (fcvt into F registers already did so).  I
haven't actually tried to manifest a bug here, but as far as I can tell
the soft float stuff does set the invalid flag.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvd.inc.c | 2 ++
 target/riscv/insn_trans/trans_rvf.inc.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 393fa0248c..8611e95486 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -371,6 +371,7 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
     return true;
 }
 
@@ -384,6 +385,7 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 172dbfa919..87a250a3f2 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -237,6 +237,7 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
     gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
 
     return true;
 }
@@ -251,6 +252,7 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
     gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
 
     return true;
 }
@@ -389,6 +391,7 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
     gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
     return true;
 }
 
@@ -402,6 +405,7 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
     gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
     return true;
 }
 
-- 
2.21.0


