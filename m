Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1og5ig-0000J1-Mz
	for mharc-qemu-riscv@gnu.org; Wed, 05 Oct 2022 10:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1og5ie-0000Fy-E1
 for qemu-riscv@nongnu.org; Wed, 05 Oct 2022 10:49:57 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1og5ic-0006Rl-0Y
 for qemu-riscv@nongnu.org; Wed, 05 Oct 2022 10:49:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id b2so36013439eja.6
 for <qemu-riscv@nongnu.org>; Wed, 05 Oct 2022 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EXf432YdLxs6LN/1SdCnkgTiHy1iNPRF9DC1hWNzFo4=;
 b=cH0DxkuSEFwVdgeVS6cNGK4+cY8LokwB7PjH6wlJ/9z3a//Wii/qZ6f/HQrEm6ThnA
 ICOeVyDnaBZixD0LQ7c/U3Y7AnDqR/oLEu4i3UestXYYMMDwg3nM+VKGdWrcasix14CX
 tH/pnT3DrTooa08O4yubolwjulZ+GiL1rgFeituxQISXUTDfv3Ga69xbp3inuKQ2lTx7
 qA+LQYEcNN6G/XYmhV5VezvwWKGimOwGh8/mlDKUgB+xaSmmeFmwdX7RgkTFPsDT6X+c
 iavyUD2BH4soU7PE2NufVc2Bd0/DLq3yWxEP+K4SIvMEWGuRF2dbfuEgwYQUR1hcq6Wd
 eaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EXf432YdLxs6LN/1SdCnkgTiHy1iNPRF9DC1hWNzFo4=;
 b=NfIQIO/0gIeJLE7/tKjcMs+42rfG6Lvo8DnSwPI5FwLgpn6IBHOyxB8C3XQ05dgaj9
 1gzUwkwuLwtAzlpOXYnoSqy1Doy13aC2pnMX/mb41w50JIGS2eZn7G2oL477C77F1Sx7
 BwV2o1kfA8I5jkRJ1Tw33GL0hBC2+g3SBOqhOKrr8iEAYKvNnXbg2B5ylf02Jsn4kIVz
 ERvXA90x6hcWTM5rB4FZ+cWbnJM+xrFAA9C++x4LA9LbtjF9dscMyKpVpK22gn8ZDZER
 CdAV+TElyYX89mY/v+C1FNZYxs2OJkHYYYPPPJbLqxT+JsiDkJJjSegJKFqqkNzW/u8d
 CDLA==
X-Gm-Message-State: ACrzQf2KZEJEOZA8CRmuksYutXl39oxRbRdG6nh3DRoG0mBH4+QzTKpP
 wogDMqnO7t9LO+qKYfXxHPIWP8NAcFZjyzKG
X-Google-Smtp-Source: AMsMyM5ReyrcD9OdIVSmiJyA2qDmvp8aoZPxiDJZMJM+v2ra4+PnEz2q9a6AT6Ly9ty1VhCeHDZJ9A==
X-Received: by 2002:a17:907:608b:b0:78b:cb91:6efd with SMTP id
 ht11-20020a170907608b00b0078bcb916efdmr11795ejc.32.1664981391687; 
 Wed, 05 Oct 2022 07:49:51 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 q1-20020a17090609a100b00772b5835c12sm8829932eje.23.2022.10.05.07.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 07:49:51 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [PATCH v4] RISC-V: Add Zawrs ISA extension support
Date: Wed,  5 Oct 2022 16:49:48 +0200
Message-Id: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Wed, 05 Oct 2022 14:49:57 -0000

This patch adds support for the Zawrs ISA extension.
Given the current (incomplete) implementation of reservation sets
there seems to be no way to provide a full emulation of the WRS
instruction (wake on reservation set invalidation or timeout or
interrupt). Therefore, we just exit the TB and return to the main loop.

The specification can be found here:
  https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Note, that the Zawrs extension is frozen, but not ratified yet.

Changes since v3:
* Remove "RFC" since the extension is frozen
* Rebase on master and fix integration issues
* Fix entry ordering in extension list

Changes since v2:
* Rebase on master and resolve conflicts
* Adjustments according to a specification change
* Inline REQUIRE_ZAWRS() since it has only one user

Changes since v1:
* Adding zawrs to the ISA string that is passed to the kernel

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                          |  7 +++
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 51 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 64 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b29c88b9f0..b08ce94ba6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -76,6 +76,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
@@ -744,6 +745,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+            error_setg(errp, "Zawrs extension requires A extension");
+            return;
+        }
+
         if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
             error_setg(errp, "Zfh/Zfhmin extensions require F extension");
             return;
@@ -999,6 +1005,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
+    DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b131fa8c8e..2b87966373 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -446,6 +446,7 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zdinx;
+    bool ext_zawrs;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zfinx;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d0253b8104..b7e7613ea2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -718,6 +718,10 @@ vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
+# *** Zawrs Standard Extension ***
+wrs_nto    000000001101 00000 000 00000 1110011
+wrs_sto    000000011101 00000 000 00000 1110011
+
 # *** RV32 Zba Standard Extension ***
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
new file mode 100644
index 0000000000..f0da2fe50a
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -0,0 +1,51 @@
+/*
+ * RISC-V translation routines for the RISC-V Zawrs Extension.
+ *
+ * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_wrs(DisasContext *ctx)
+{
+    if (!ctx->cfg_ptr->ext_zawrs) {
+        return false;
+    }
+
+    /*
+     * The specification says:
+     * While stalled, an implementation is permitted to occasionally
+     * terminate the stall and complete execution for any reason.
+     *
+     * So let's just exit TB and return to the main loop.
+     */
+
+    /* Clear the load reservation  (if any).  */
+    tcg_gen_movi_tl(load_res, -1);
+
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
+
+#define GEN_TRANS_WRS(insn)						\
+static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)		\
+{									\
+	(void)a;							\
+	return trans_wrs(ctx);						\
+}
+
+GEN_TRANS_WRS(wrs_nto)
+GEN_TRANS_WRS(wrs_sto)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..e22de88e97 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1029,6 +1029,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.37.3


