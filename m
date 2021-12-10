Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapN-0000CY-L4
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapM-00009w-J3
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:24 -0500
Received: from [2607:f8b0:4864:20::631] (port=35420
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapH-0007Bi-3b
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id b13so5764157plg.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HelIh3xc+MQ/HAO+Ptz1VZHq5TiQpzi6qXpDAxUrZnQ=;
 b=W76Rsx99korRxJOAmM/4oro4yZFi86bmldF1+y/U248Ew5UbJ/oGjozrdXokqdPuZ4
 62Sk5SPst0jtq8wI7RKgboaRitTehtSDG/Fmzfb4TTNfD3hgRMffr4JnMjcBdPwFN5w2
 RqMGBKm5XU76bhubv519H4Wpg2jIiWTbw/sVP/IFyXxG6n2KKD0duheYwfEPBxFgnd2J
 s7D+ZEcWZEPn5ZSJOj31YvipcHbq8MKHfsOujT/DENs2SouoyU13bJVaDrvih9n0L5iB
 wzrI/w9Q3IFDskFMaxHGo6TFUkA4tKcOxZapuGC0S01FRKdpYVWl10XtCKFBK1ijZknX
 t4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HelIh3xc+MQ/HAO+Ptz1VZHq5TiQpzi6qXpDAxUrZnQ=;
 b=Z9IdC6arV4nIuIEIof/4fm48DBawqzYKGr7LLkii5GK3aPAK78McJSG+rcGyW0a5oc
 czOAwQ1pRl0WLgemle/IbS5L01yAwIdAGG3nJIkTITNM0BcfwiAcQC4jBXmCiKi0+0dx
 3aQ54r81WFeSuv1eedPgb46dSj5WSoeNBEPpg0OsK2a+coa3P4Ac7pAo2wX/wNbV2Rhr
 hEUcXiL1EW/1ZZdWRPEgdXFxzCfo6Omvbj6RPOiCtsgP0tyTLKosuNYrOEphj5zvhC8b
 oxzMvsMKEsvT3VE0YjFhNSP0wzKjbvl+7/S16w6tQ82BIuGfK/R2p0OMq84FsWoffqJa
 MnjQ==
X-Gm-Message-State: AOAM533pcx3+lcHjYn4sQw6ZCjdCLDgf3Yk4kPitxjL9tBohtufhUPcW
 BqYNAAnMU+CN+FO98HhTVEWFlw==
X-Google-Smtp-Source: ABdhPJwL6e+dW9IRjcAD4t53ok+ulNFLdPQUykeVVMq3N3CdnyABb4Q+H25mUk/o7ahSub71qo0rOw==
X-Received: by 2002:a17:902:ab0c:b0:142:343d:4548 with SMTP id
 ik12-20020a170902ab0c00b00142343d4548mr72742497plb.14.1639123217755; 
 Fri, 10 Dec 2021 00:00:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 63/77] target/riscv: add "set round to odd" rounding mode
 helper function
Date: Fri, 10 Dec 2021 15:56:49 +0800
Message-Id: <20211210075704.23951-64-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:25 -0000

From: Frank Chang <frank.chang@sifive.com>

helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
should be an interface private to translation, so add a new independent
helper_set_rod_rounding_mode().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c | 5 +++++
 target/riscv/helper.h     | 1 +
 target/riscv/internals.h  | 1 +
 target/riscv/translate.c  | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index dec39d4a9e..4a5982d594 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,11 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+void helper_set_rod_rounding_mode(CPURISCVState *env)
+{
+    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
+}
+
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 53cf88cd40..606bf72d5c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -3,6 +3,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index db105d4d64..065e8162a2 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -43,6 +43,7 @@ enum {
     RISCV_FRM_RUP = 3,  /* Round Up */
     RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
     RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+    RISCV_FRM_ROD = 8,  /* Round to Odd */
 };
 
 static inline uint64_t nanbox_s(float32 f)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3688e80d03..b4df21bda3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 
 #include "instmap.h"
+#include "internals.h"
 
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
@@ -403,6 +404,12 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
     ctx->frm = rm;
+
+    if (rm == RISCV_FRM_ROD) {
+        gen_helper_set_rod_rounding_mode(cpu_env);
+        return;
+    }
+
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
-- 
2.31.1


