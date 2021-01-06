Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kx67m-0003dL-IK
	for mharc-qemu-riscv@gnu.org; Wed, 06 Jan 2021 05:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kx67l-0003d9-Q6; Wed, 06 Jan 2021 05:33:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sylvain.pelissier@gmail.com>)
 id 1kx67k-0000pl-Ci; Wed, 06 Jan 2021 05:33:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id a12so1932938wrv.8;
 Wed, 06 Jan 2021 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k51LhNFXyxV5fvt0WLbLQtRP1S+fztR2Ub3gw0739jI=;
 b=bTYtj7MkjN3b5xPRPOiWwS1Kli22Dxv/HcGm+79ojvdjNHZgNBh2N9ugrhT9MajHE3
 8/pdRMlqe/qzZXRE/JF+/Zv4Y1sB1LxQ75t7t+syHr82yvJD/Ls7mDCMsJSond2U1Zk1
 0RtvDIZOypyllPuWagvMh7jEpX0wqcpWB5TGBXbFFMmIVZSsmeSUS9NNTVORlL+Xwti4
 8mpRf8nS6d23gAjnyhLiJmcrW55T+4J4mysBl97l8qkz326SbbNFaDOuyYn7ElQkq3LM
 PW7DDtAyBsQG8M1Al+qhv4Da/08VqeGvY3IAya1vv/Hm0AzIGHS3wDUcYtS6L9q6xbEC
 ZxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k51LhNFXyxV5fvt0WLbLQtRP1S+fztR2Ub3gw0739jI=;
 b=MEyKbroCmVTSJtA4H3kZwTkitpJrUiFFjI5IYw9MuzK6nhBQDORJwaURhe9mA3gfGe
 iamAkaQ4Hn+trruHe5FssP1WdVTp9AELrskMiR0jXWjn2J2INGKdl/Dq8KrQUvFTlp6J
 8q2lELAaR2NryGDAsSE2wpgvrUlZ3zjXuh8OLpE+tRqcpHXXbnDniWsyFx3nwrVyMjK0
 EK6gxpzzoKPBGYw0zu3cZU9Utpuy3YCPPr6SXnBsgjmnSXtUzJLJIkmXOV2/ds7iRUGw
 A8QCUfRAB5la4Wl0U3XNqfah/yH2BgjWzKOmQSwtMLRU0D3FeY4MuXaTmk9aWEW+vgPM
 R6oA==
X-Gm-Message-State: AOAM5301TiNvfIxu9x4TKhxHnMyIFA4VVGPDVlKeEWL2SUEKx4qDKOeI
 HgAnq+1aIEXZlbJu2kYSa6I=
X-Google-Smtp-Source: ABdhPJwgqGsbLCt89kZbJRdM56wDK9w2zLRHduap3GYhwGV7FiZqPQAurtJiwIYU5RRng65WyeZtcA==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr3549000wrw.399.1609929182244; 
 Wed, 06 Jan 2021 02:33:02 -0800 (PST)
Received: from sylvain-Latitude-E7240.noobland.lan ([195.94.110.52])
 by smtp.gmail.com with ESMTPSA id k10sm2434852wrq.38.2021.01.06.02.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 02:33:01 -0800 (PST)
From: Sylvain Pelissier <sylvain.pelissier@gmail.com>
To: 
Cc: Sylvain Pelissier <sylvain.pelissier@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3] gdb: riscv: Add target description
Date: Wed,  6 Jan 2021 11:32:54 +0100
Message-Id: <20210106103254.35615-1-sylvain.pelissier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=sylvain.pelissier@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Jan 2021 10:33:06 -0000

Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..ed4971978b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (riscv_cpu_is_32bit(env)) {
+        return g_strdup("riscv:rv32");
+    } else {
+        return g_strdup("riscv:rv64");
+    }
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
+    cc->gdb_arch_name = riscv_gdb_arch_name;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-- 
2.25.1


