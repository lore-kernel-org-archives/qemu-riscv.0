Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z1-0007dV-5i
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0ym-0006h5-Aj
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yk-0007mA-58
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id i10so1957993plr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832884;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Hfiux9wjBHefjdAiFtqfeuuXfGolGwUIxeXcDisz5o=;
 b=C9CXga+yG17lo4qFtwa+yfafom+JPrJaE/5kr4LAbjz41AmhvuUeNBSe0ZfO2pn9RX
 qXVbVa0j2x31lgBVcQD5Dz1jq6ckCepmLP6rss0etNQHQCLtd7tazbSNkIPqLunO5Jot
 rF7DvrY/umjU7u2L7DyBtluW0l9JXRSW10cstRgyhrWC3rddFSY7g9xNus9M/iK8oQ7R
 FaTbSM/ZIeAH3k3El+GQU08w2qUiVaWlOkVk3V+GMzCAYVkwTmk38+bL4SIqydKQtCdB
 p/CZHp8leUYzu/ixzhpIiajiKk1pfzxG/xUNeJ+9sQeFrAdOYcoPtwqxp2NXYsIOAo5l
 g96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832884;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Hfiux9wjBHefjdAiFtqfeuuXfGolGwUIxeXcDisz5o=;
 b=WaIFtIBybDY5AnpdcaoZXpIWQvJIL5K2I3yS6hQq/e6teuf08zfbXAsDBdwtmUFsVQ
 m52z68mNhIvTGP41BR6Yhr3cl7p9euqInoAKeTzbVS9iziOPtxAbNmEC+vIHEBaK8Fk5
 5d8VW4nvvQJOffi7bya5DN0Z7WjCV5JJWMmufReNTI2EhSEtKAh4sCksh+xJ8i4Il5Rl
 wxYIdF+QcTf+TUx3CLwYUbnE1pOX7bqqLCFqBxicqc0VdXMuJgGIL4C4R/qgAMzZMGoe
 QLPjWfOCqQDSKGHHjrhRotcNIWnehJXhttJ2XgspqLhP2qzYswCyZxXMQWFFO+IHDph+
 aOQw==
X-Gm-Message-State: AO0yUKVO0NnNeG7w2lyeu8/ffirEoawuhMs93gXYFdUvJubLzVNgTABF
 jBFjQFMyoPveXsd48xgs4EpBKvfGVTRWYpYR
X-Google-Smtp-Source: AK7set8fBQjPXKzFPTdtKuiinrCLHzEPQARCg3SvizpIacPD8FkvN00vTk+KBtb1ojPWavwxP/9xQg==
X-Received: by 2002:a17:90a:190f:b0:233:ccd2:40a4 with SMTP id
 15-20020a17090a190f00b00233ccd240a4mr905500pjg.23.1677832884243; 
 Fri, 03 Mar 2023 00:41:24 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0019aa5e0aadesm976117plg.110.2023.03.03.00.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:23 -0800 (PST)
Subject: [PULL 03/59] target/riscv: allow MISA writes as experimental
Date: Fri,  3 Mar 2023 00:36:44 -0800
Message-Id: <20230303083740.12817-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Andrew Jones <ajones@ventanamicro.com>, 
 Bin Meng <bmeng@tinylab.org>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:32 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to properly write this CSR, has
always been a no-op as well because write_misa() will always exit
earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

After discussions in the mailing list, most notably in [1], we reached
the consensus that this code is not suited to be exposed to users
because it's not well tested, but at the same time removing it is a bit
extreme because we would like to fix it, and it's easier to do so with
the code available to use instead of fetching it from git log.

The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
and use a new experimental flag called x-misa-w. The default value is
false, meaning that we're keeping the existing behavior of doing nothing
if a write_misa() is attempted. As with any existing experimental flag,
x-misa-w is also a temporary flag that we need to remove once we fix
write_misa().

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-4-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 6 ++++++
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..1d637b1acd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1210,6 +1210,12 @@ static Property riscv_cpu_properties[] = {
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
     DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
+
+    /*
+     * write_misa() is marked as experimental for now so mark
+     * it with -x and default to 'false'.
+     */
+    DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7ee22cbfa1..ca828424c1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
@@ -498,6 +497,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
+    bool misa_w;
 
     bool short_isa_string;
 };
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..3cb8d2ffad 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+    if (!riscv_cpu_cfg(env)->misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
-- 
2.39.2


