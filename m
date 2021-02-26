Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTfu-0006h7-1U
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfr-0006es-I5
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:15 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfm-0000l9-DU
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:14 -0500
Received: by mail-pg1-x536.google.com with SMTP id t11so5393228pgu.8
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v1ggcaqo1bFSuMB/XGGtqzKmLGCk3xetAn+DZVRrMAA=;
 b=GGDqZSy6x0OjRIUJtO07ZL/DOnQvzmMvGqIYbccvfu3q56LsmRFh8EndUCslg+lqC0
 Ymy2q1l+whJyYdyDux2IIBveO058b4F4u3JsYTSpLWPcvOQi+PBsCF/7MV/NgAt3e/d1
 Yl0wk2ktyoWCOdoC2WmcYsyO3DusNfDkWeWWzaT35njl8juZnh6kYaWOnDWuieODM5bi
 zGoVGiVHCEpraTtkrIJ1V984GB4EShcVOZiqsWxUYNUUNu+BPn9WnXoX1i9oYexqnsSH
 L0DvTDPY9YTrKmKoU9ePcr2TnqBph/YcS+QG2ZdEIr3jhYbxQON2E5xcx5eYaWMLjWUp
 H6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v1ggcaqo1bFSuMB/XGGtqzKmLGCk3xetAn+DZVRrMAA=;
 b=J1k7a/XRATqFspxDJYULaddvieo/ulFvujd7F4xJTVqkVYKvy5HYztyvul5hxlGc1S
 P6RSkiKeRk18wl6LHCD0Z8WOGWrvRFjco/PB+Goy8bMMLbhLkzaz0K9jJvr4uncSGt3J
 ux98CErP3C6IjKkGe2eH57tYtbUbxL/Ql7opsGTCko9+xwyhMrsCMworVp3EN+PLqvqa
 ZeAr2PLIl1v/bbaksgvzwQIsaGo3FsjmFQ90hU1xKcNnf2Z1so/jbSGnxnnG492igUcH
 /ATu5VuXLjyMvOIKO5wz9ulHLoX6c4MeLYo1JXgyPrDSGfBnn+2BZMDAEryma0SdMlUl
 kgcw==
X-Gm-Message-State: AOAM533YuM16aHjumBItzfZWtPTzpmDeySRSGcGTPHMMNDhFAoTwkZJY
 S4khcxWix6xqhW9gp/qwNclHPA==
X-Google-Smtp-Source: ABdhPJxxkzXAEFGNwP0thE0x3pCPngKynqTRF6+GaW6EMrsVV9PYO/JM+z1ue6NxFnkaCBWtlUQORA==
X-Received: by 2002:a62:170a:0:b029:1ed:cc98:35aa with SMTP id
 10-20020a62170a0000b02901edcc9835aamr905082pfx.77.1614309608377; 
 Thu, 25 Feb 2021 19:20:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 09/75] target/riscv: rvv-1.0: add vlenb register
Date: Fri, 26 Feb 2021 11:17:53 +0800
Message-Id: <20210226031902.23656-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 26 Feb 2021 03:20:16 -0000

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 03a26fa680c..1df818ec6a6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f70b67cce3c..92cf2eedd40 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -264,6 +264,12 @@ static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env_archcpu(env)->cfg.vlen >> 3;
+    return 0;
+}
+
 static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vl;
@@ -1412,6 +1418,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-- 
2.17.1


