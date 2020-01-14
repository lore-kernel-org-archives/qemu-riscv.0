Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irJDu-0006Xq-Qi
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jan 2020 05:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDs-0006Uj-7k
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:14:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shihpo.hung@sifive.com>) id 1irJDr-0003ji-9K
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:14:56 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38753)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <shihpo.hung@sifive.com>)
 id 1irJDr-0003jG-4O
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2020 05:14:55 -0500
Received: by mail-pg1-x52a.google.com with SMTP id a33so6176551pgm.5
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2020 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oSnMNRdByfNLX4llxI4HRMZBCtaBWjFtoTF0fHO6R4M=;
 b=IZFq9X7OD5bpxjOV7Nqp5qqmnYJPHfUj02WeqbBF6LibhcvwkDWWlMOGHnvN4K+Yj2
 tI6wqWoT5dCf8ekcDChZFs0dF3ef3C0/rkZxnfXcdaRYhTyzYkcQvLR32saT9T50ovSZ
 3aPJiM90DANL++9QWrvVGQP8tzLl3eQ7pPCavM8YqcirYBDi+TC+/clnQUhLli8nLErZ
 j+Z7/KzS1owo91U2H0SPhCk8PtSAtriP0LdESIERFPv2zisML1jDVsdIWuuWxOtd2pmJ
 W+QKjquvzzb0YtafDpSlgza2yt0zlSzADCyCTMOIWwXelVBewDIlQvNtzAriTrUAELPs
 MYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oSnMNRdByfNLX4llxI4HRMZBCtaBWjFtoTF0fHO6R4M=;
 b=VkpoSRoxvB4axiIj1j+3ZwirXorQDVquRMSVJcw/0AEwPzbcLCRe9xYgqJWKlGaaky
 /hD4KnGscPFHlg1sWKFiEnqWKzhIDCuFUva4tS3rLSm6esnAQdKstdQ/szk3bo2J7erN
 0ERbJYB+eIZ6HOz8DILoSv6Is6EqSpsjQCrwQxKngQorSynczSib4JcUvihIWAJdaACN
 3Rf8Hd3m1BesdA8m9piXVYsde1qd0SWus+lsymbO+qJHHdyP61MRBwq4tioijx+MXdQg
 S6xUMuOTHO7hY+/c/BamqXcaPGdEIousXBWt6UgUVGqj8tb7w6YfcL2OQkTggDeaD4IS
 6CuA==
X-Gm-Message-State: APjAAAXlS6UA4c97b3cAz/gnAtzUD4BAxzLG71nQW5AKR3kgb+4O2TWw
 oF2iS0njIl+jjXLnmlgheoEU2R6itCsvtA==
X-Google-Smtp-Source: APXvYqw8BP5ZBzLouB/pbeoYuQsaYAeoGGY5WQle6UYjKIryEVF9IG6exO4sZiSiuGbVGHNKHBXNiQ==
X-Received: by 2002:a63:d358:: with SMTP id u24mr26298356pgi.218.1578996893802; 
 Tue, 14 Jan 2020 02:14:53 -0800 (PST)
Received: from gamma04.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id k23sm16158583pgg.7.2020.01.14.02.14.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 14 Jan 2020 02:14:53 -0800 (PST)
From: shihpo.hung@sifive.com
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 ShihPo Hung <shihpo.hung@sifive.com>
Subject: [PATCH v2 2/3] target/riscv: fsd/fsw doesn't dirty FP state
Date: Tue, 14 Jan 2020 02:13:59 -0800
Message-Id: <1578996840-14863-2-git-send-email-shihpo.hung@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
References: <1578996840-14863-1-git-send-email-shihpo.hung@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52a
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
X-List-Received-Date: Tue, 14 Jan 2020 10:14:57 -0000

Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
---
 target/riscv/insn_trans/trans_rvd.inc.c | 1 -
 target/riscv/insn_trans/trans_rvf.inc.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 393fa02..ea1044f 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -43,7 +43,6 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
-    mark_fs_dirty(ctx);
     tcg_temp_free(t0);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 172dbfa..e23cd63 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -52,7 +52,6 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
     tcg_temp_free(t0);
-    mark_fs_dirty(ctx);
     return true;
 }
 
-- 
2.7.4


