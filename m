Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVJTm-0004iq-GR
	for mharc-qemu-riscv@gnu.org; Sat, 10 Apr 2021 15:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lVJTk-0004ie-6h; Sat, 10 Apr 2021 15:41:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1lVJTf-0000fE-Gv; Sat, 10 Apr 2021 15:41:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so6448859wmy.5; 
 Sat, 10 Apr 2021 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPzEuTEXwPCJ8Ue9hXYvxzIXF9aaFZNriJ3MI6Vi9bw=;
 b=vMIYCP1vykKYo8t8cvTYvG55AMGYg4jX+2CcNyysS72by2Ic2UURw2IsYQH8AgMbDG
 WsRHQuphbBszUA92kSNYJ1b9f273/dqjEYmWbhtLDfhJDAZz1GURNh8Tcku+/kp4ByOy
 rUaYpPa7rVnWFYoidfpMqudf/YEHXHfJDhigrLxKGEvTNYyRFGieV6vf7JyZ2JtFXNCW
 MUnLTvAkltlwGX+9e9MXLrk+/TqCihdmKo5Hw7QiBeBeTy1nkuga1YqpI5qdtuqDl1eI
 qW2XF5+qyEiqwpefxPFUFPywuOJdqt+u/puddl/IMF7aCn9xhwqtL9ygOyFD81EAd2o1
 /f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPzEuTEXwPCJ8Ue9hXYvxzIXF9aaFZNriJ3MI6Vi9bw=;
 b=Sfp6Eb9N0kSL3PdHX/pkpVLi6uuk4hPUsrLdQgkPXVK5Vpdoddy9vsdbokxb3BGMni
 dmpWwqSR1pYIiAU2cFcq236P543tSoABwabp4B6r0yir6f3DrpBdf5o0+0b4PT/GXwai
 GQXi0GOpDI8vfGziLnRcwKzPqOKfL9DxS3f9AfCDf9uKA8LRl3DmF9GQXR+VwjpoIA5Z
 NpMH5BnZjMc2Q03PYdHWLQ436GIoDO5ylGIDPbOx+/cYCjvX65ZfZqpwy3E6B6m4ao65
 8TUIceY/steI1treRe7OprXdl8ed5ho80DkzGmsE+iSZ6O2oPOkQ/uOwhXyd3YwSrdpK
 jEUQ==
X-Gm-Message-State: AOAM532Sw1vB3K545A1bJfEXGqDonqxcqH2zYeJVxOsSMDydN69Pc9GB
 IdCbRTnYVAmZWCDZngDSs6Q6bCSPhXbgh7bd
X-Google-Smtp-Source: ABdhPJyOG+VnuB8lNCAOFMMgO4IV7uEI4DuEf8LlVVyHP/6EM23JV0SXq9fzj3WfJSFz0r3uupqL3A==
X-Received: by 2002:a1c:f004:: with SMTP id a4mr19128408wmb.169.1618083664585; 
 Sat, 10 Apr 2021 12:41:04 -0700 (PDT)
Received: from localhost.localdomain (a89-152-76-22.cpe.netcabo.pt.
 [89.152.76.22])
 by smtp.gmail.com with ESMTPSA id o15sm10229299wra.93.2021.04.10.12.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 12:41:04 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: fix wfi exception behavior
Date: Sat, 10 Apr 2021 20:40:47 +0100
Message-Id: <20210410194047.559189-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=josemartins90@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 10 Apr 2021 19:41:13 -0000

The wfi exception trigger behavior was not taking into account the fact
that user mode is not allowed to execute wfi instructions or the effect
of the hstatus.vtw bit. It was also always generating virtual instruction
exceptions when this should only happen when the wfi instruction is
executed when the virtualization mode is enabled:

- when a wfi instruction is executed, an illegal exception should be triggered
if either the current mode is user or the mode is supervisor and mstatus.tw is
set.

- a virtual instruction exception should be raised when a wfi is executed from
virtual-user or virtual-supervisor and hstatus.vtw is set.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
 target/riscv/cpu_bits.h  | 1 +
 target/riscv/op_helper.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..ed8b97c788 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -436,6 +436,7 @@
 #define HSTATUS_HU           0x00000200
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
+#define HSTATUS_VTW          0x00200000
 #define HSTATUS_VTSR         0x00400000
 #if defined(TARGET_RISCV64)
 #define HSTATUS_VSXL        0x300000000
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d55def76cf..354e39ec26 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -174,9 +174,11 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if ((env->priv == PRV_S &&
-        get_field(env->mstatus, MSTATUS_TW)) ||
-        riscv_cpu_virt_enabled(env)) {
+    if ((!riscv_cpu_virt_enabled(env) && env->priv == PRV_U) ||
+        (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TW))) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else if (riscv_cpu_virt_enabled(env) && (env->priv == PRV_U ||
+            (env->priv == PRV_S && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         cs->halted = 1;
-- 
2.25.1


