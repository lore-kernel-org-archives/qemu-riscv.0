Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlv-0004cl-I5
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkf-00021s-Bc
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vke-0004O4-5s
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:37 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkd-0004Nm-WB
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:36 -0500
Received: by mail-pl1-x631.google.com with SMTP id t14so504148plr.8
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Tr17usVQSO7by1Colq4RjWz3ztnvP9K6FlBtEfIKK0k=;
 b=q8UER3hqYHBX0mglrgEAtg6e9MqXG5OKb45xseEZiXOeYxdMprvLV3++34mVm5Q7P6
 1QfbGtHrDNtUDlP+nwMWFiBoR5xlyWg2CCFvIr6kgrm6ZGKjx0MypilVqW0pOHe/UiI3
 MfXXwJLuAi8YB0fLVni/0EwWoEYix+o4KFrwpslWDYOGxmky87+65v6RchClrtxTN2bv
 xnbSnkqzYyChvHHP5mQrwoedSA+eaz1crfP4Pwy6sfqLMy/xvFlaIRuuAztGCfg/Z4+Q
 4jJ5OFhx9nH0KbAk59V7F7Cnv53Mtz0wOOQJhNCKQJ+MK1yq/j1wn6bMcyyPzdAnW56Z
 9k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Tr17usVQSO7by1Colq4RjWz3ztnvP9K6FlBtEfIKK0k=;
 b=lhJirQ6usRTJ9qO3fTDQ7SoBhpknvRtZoTpbQsQihjXDO77ZilO6WAAQpApxg/HDf+
 feo6rZiiNJ7nnxbQ1KP2I2it+D5USXXO+vFs09lrdoXrjO6f8b/nJ92ipWjGYru02n6S
 owyBnKBc74PwAsp71WGE2AwsVH0WuvqpkBecbkx5aYfLDSp8ze3ZRFYJ6/LGOgt6VR1b
 maiNzJXpL88FZfcxUD1rH4Rx31hJ37/Fn9B9KsksSxl9fV+JhjPMZ9KvHvSv/bBcFqxi
 ZPAvdVwgjqHbMqpyT7VZDO3F1i8O46nGu7RqZOMqD/doZ9bzAtm9GYPeH9nwk4OkrsNt
 Yawg==
X-Gm-Message-State: ANhLgQ1jYCk0nQSGS8JASJ+dKJVf+Tfx+eEn7yBTHXDgZL/GoIzMSyXU
 3kTEvkXXRFWeX7Re9rDIyJIXao/lUdKlmg==
X-Google-Smtp-Source: ADFU+vtL84bneNPUB27mETr4VOj6US5HTpXs5Ck1a0WdPyAN93YyReqsKs05gimKM0qBB3ZCAfumxw==
X-Received: by 2002:a17:90a:7d07:: with SMTP id
 g7mr1170535pjl.17.1583196574518; 
 Mon, 02 Mar 2020 16:49:34 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 12sm335795pjm.33.2020.03.02.16.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:34 -0800 (PST)
Subject: [PULL 22/38] target/riscv: Add Hypervisor trap return support
Date: Mon,  2 Mar 2020 16:48:32 -0800
Message-Id: <20200303004848.136788-23-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::631
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:38 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/op_helper.c | 62 +++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 10 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 455eb28907..804936e9d5 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -73,6 +73,8 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
 {
+    target_ulong prev_priv, prev_virt, mstatus;
+
     if (!(env->priv >= PRV_S)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
@@ -87,16 +89,46 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-    target_ulong mstatus = env->mstatus;
-    target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
-    mstatus = set_field(mstatus,
-        env->priv_ver >= PRIV_VERSION_1_10_0 ?
-        MSTATUS_SIE : MSTATUS_UIE << prev_priv,
-        get_field(mstatus, MSTATUS_SPIE));
-    mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
-    mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
+    mstatus = env->mstatus;
+
+    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
+        /* We support Hypervisor extensions and virtulisation is disabled */
+        target_ulong hstatus = env->hstatus;
+
+        prev_priv = get_field(mstatus, MSTATUS_SPP);
+        prev_virt = get_field(hstatus, HSTATUS_SPV);
+
+        hstatus = set_field(hstatus, HSTATUS_SPV,
+                                 get_field(hstatus, HSTATUS_SP2V));
+        mstatus = set_field(mstatus, MSTATUS_SPP,
+                            get_field(hstatus, HSTATUS_SP2P));
+        hstatus = set_field(hstatus, HSTATUS_SP2V, 0);
+        hstatus = set_field(hstatus, HSTATUS_SP2P, 0);
+        mstatus = set_field(mstatus, SSTATUS_SIE,
+                            get_field(mstatus, SSTATUS_SPIE));
+        mstatus = set_field(mstatus, SSTATUS_SPIE, 1);
+
+        env->mstatus = mstatus;
+        env->hstatus = hstatus;
+
+        if (prev_virt) {
+            riscv_cpu_swap_hypervisor_regs(env);
+        }
+
+        riscv_cpu_set_virt_enabled(env, prev_virt);
+    } else {
+        prev_priv = get_field(mstatus, MSTATUS_SPP);
+
+        mstatus = set_field(mstatus,
+            env->priv_ver >= PRIV_VERSION_1_10_0 ?
+            MSTATUS_SIE : MSTATUS_UIE << prev_priv,
+            get_field(mstatus, MSTATUS_SPIE));
+        mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
+        mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
+        env->mstatus = mstatus;
+    }
+
     riscv_cpu_set_mode(env, prev_priv);
-    env->mstatus = mstatus;
 
     return retpc;
 }
@@ -114,14 +146,24 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 
     target_ulong mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
+    target_ulong prev_virt = get_field(mstatus, MSTATUS_MPV);
     mstatus = set_field(mstatus,
         env->priv_ver >= PRIV_VERSION_1_10_0 ?
         MSTATUS_MIE : MSTATUS_UIE << prev_priv,
         get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
-    riscv_cpu_set_mode(env, prev_priv);
+    mstatus = set_field(mstatus, MSTATUS_MPV, 0);
     env->mstatus = mstatus;
+    riscv_cpu_set_mode(env, prev_priv);
+
+    if (riscv_has_ext(env, RVH)) {
+        if (prev_virt) {
+            riscv_cpu_swap_hypervisor_regs(env);
+        }
+
+        riscv_cpu_set_virt_enabled(env, prev_virt);
+    }
 
     return retpc;
 }
-- 
2.25.0.265.gbab2e86ba0-goog


