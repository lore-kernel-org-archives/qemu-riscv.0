Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irc02-00068w-0c
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 01:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzz-00064T-6o
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irbzy-0003Yx-7b
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:51 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irbzy-0003YX-2T
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 01:17:50 -0500
Received: by mail-pg1-x544.google.com with SMTP id b9so7681228pgk.12
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 22:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XvfKywIyN+RwyR3E6jjNNc/Bw1GozEvyfw9ydD7+K7k=;
 b=Iy6XAh2zvz8Q8EdA/L9Hi5CTh987KwkItfDHuwsZqZ19as5S4d8fjPGb2lGF6GCYWO
 Pzqv56mDo9fH9KROvn9I8qh+Q1R5dwMZYng5SI4VO7fB/ak33JrxdlJmNwAF+VgXwhNt
 GJOpzWo1TGles3KpXQMK/Pua/468yORq9ye9SFet7/q6Ft9lRnnpaX6k5N0l865DzY+8
 OXZeObAmpHHwB6XdyXVsqGEqpSgvv1ajAVsZpNk6ri+pnctJFMjn7Ktto8Ku4UsP+YF0
 qs87b1lhRsi3cRSMSsk9pIwxsdwll+0gW7Q1b9pzKT+QoNJUVd+x/soGEraI5zVqoyx4
 c/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XvfKywIyN+RwyR3E6jjNNc/Bw1GozEvyfw9ydD7+K7k=;
 b=IwuRlPFNdGrGCNeEjRz6lY73ClM0ph9lHfCltBvhSraZU7K6KiC6nQeyqTQs7xKh65
 obl0IPzktHOPW0Sg6PoBGTorZYJeIO93s62RqUsjDP8VFO2t5QtqCg/CvsL3w/GC4IGx
 bsBWMtxBSdklstQFpMlUqSWQo3TUns/6ZQzim5aF811Gbi5jf8cyCLx759rB9tSlKVFd
 epJtcyCV+Vdy7cFEL+Wh855tlIYvRQELjalpXGuHskokXm+rIV4SLmJDcysDyUDfEh1W
 bdZhQzP7Si4GqZHTfaFunTGwLaHdUBgntP/LOIMtYbFltwc27FyI/9/dIGyJdmjpt/Fr
 X45A==
X-Gm-Message-State: APjAAAXo/K7XvYGJ1alOxARRzWBNZkWfmJ+UDibShTZORH5dxU4Nud5J
 +4sQfWtRIqWIPHIER+ZFZh+dOBQ7EHdIfA==
X-Google-Smtp-Source: APXvYqxOkmWgD0XBT8SxjkB/S8mPFZyWbuBg5P/Hvb1crQ0RTw5MItzyQhPIR+xALPsRwfbTP5dFeQ==
X-Received: by 2002:a63:9d8f:: with SMTP id i137mr31033690pgd.33.1579069068917; 
 Tue, 14 Jan 2020 22:17:48 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id w123sm20633601pfb.167.2020.01.14.22.17.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 22:17:48 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 ShihPo Hung <shihpo.hung@sifive.com>
Subject: [PATCH v3 3/3] target/riscv: update mstatus.SD when FS is set dirty
Date: Tue, 14 Jan 2020 22:17:33 -0800
Message-Id: <1579069053-22190-3-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Wed, 15 Jan 2020 06:17:52 -0000

remove the check becuase SD bit should summarize FS and XS fields
unconditionally.

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c       | 3 +--
 target/riscv/translate.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index da02f9f..0e34c29 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -341,8 +341,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    dirty = (riscv_cpu_fp_enabled(env) &&
-             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
+    dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
     env->mstatus = mstatus;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ab6a891..8e40ed3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -394,7 +394,7 @@ static void mark_fs_dirty(DisasContext *ctx)
 
     tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_temp_free(tmp);
 }
-- 
2.7.4


