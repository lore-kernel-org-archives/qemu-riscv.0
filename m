Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmP-0005Vy-9Y
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkx-0002ic-Sy
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkt-0004VU-RS
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:54 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:56213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vks-0004Tx-UA
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:51 -0500
Received: by mail-pj1-x1042.google.com with SMTP id a18so545658pjs.5
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=K4iuwnZKk8MjfgAofzgXfmuGJvew57sqzgzfazcOgLo=;
 b=p2uFP1f/C7Br/ykLKeSK8IA4rQcKuI/tYyaAGts02769Ux9xbuXth8cdz33/+peND9
 J042EH+c3Q10H/iABTVu4W0BRVOY8IGQwqCRUV6s8bjD7oSLIBHQR1ziDCadoQwrUpo6
 wEB2X2369vyIBl051MM8dJG35MMCgbbv9Cmndnwcyiwf4Acq84Nz/MQbmgW85enkjXVR
 8GcYK9HILbxMLTmAWiWPgRz9DP30mN5oWE51O7bVFJCNu6XlMh50MffWTgb0LvE++sRE
 POYF+Ev7LwB0GH4XFGaqCWxHz5Bs5XuYq9VtAG6w/xGX4Jck0+LFb8i1NroqywAITkhP
 +sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=K4iuwnZKk8MjfgAofzgXfmuGJvew57sqzgzfazcOgLo=;
 b=KM1AoUK+ycVU1tSwyWr7YXdlfW2IfKYdwx8blRTPo+XJfLhcf10HXsHfHbJ8ZFv+mj
 XqGKYO2/LgHmYD4UoXOhmjNzyY+HPaF4s18r8usdhe0xudI9n0UZ9MdyCKnUaDsbh6+T
 EGr89wqUOIyqbVhUtIjPUUlya6x9cVW8ocaggpmkZwtE4kVQQto6WWhz+gJWU3XtY76D
 iyWYWyTCYgTBOnpmT2WIa7QHaFB+1F0X0KQxID5jJFNzWfFilkR76Uhf+Dj6fhYEE35Q
 m0s4TuIv56kBrEehHP+BNgLtGi9SzNDb2wl2uU14EVuuMC8Oq5Rx5t5ZR++pkQZd+p3P
 WU2Q==
X-Gm-Message-State: ANhLgQ0IlogpGwbF10XYNCrgpMEu8vjAkMG/+H9TC26vNXkJDXW2dMyi
 N5bMnsOPc+Wbzly4GRKK3izIjqY4jTXF6A==
X-Google-Smtp-Source: ADFU+vukNh3FxGhY8lT6adpRrBhNLhsl4gGteSU5zfzM62/YqJnsnp9l9JYWvoM5rQxXnvcYTQE96w==
X-Received: by 2002:a17:90a:f0c4:: with SMTP id
 fa4mr1186814pjb.125.1583196587713; 
 Mon, 02 Mar 2020 16:49:47 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id d1sm21802272pgj.79.2020.03.02.16.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:47 -0800 (PST)
Subject: [PULL 28/38] target/riscv: Respect MPRV and SPRV for floating point
 ops
Date: Mon,  2 Mar 2020 16:48:38 -0800
Message-Id: <20200303004848.136788-29-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:57 -0000

From: Alistair Francis <alistair.francis@wdc.com>

mark_fs_dirty() is the only place in translate.c that uses the
virt_enabled bool. Let's respect the contents of MSTATUS.MPRV and
HSTATUS.SPRV when setting the bool as this is used for performing
floating point operations when V=0.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/translate.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3ce86adb89..b51ab92068 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -751,7 +751,21 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+    if (riscv_has_ext(env, RVH)) {
+        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+        if (env->priv_ver == PRV_M &&
+            get_field(env->mstatus, MSTATUS_MPRV) &&
+            get_field(env->mstatus, MSTATUS_MPV)) {
+            ctx->virt_enabled = true;
+        } else if (env->priv == PRV_S &&
+                   !riscv_cpu_virt_enabled(env) &&
+                   get_field(env->hstatus, HSTATUS_SPRV) &&
+                   get_field(env->hstatus, HSTATUS_SPV)) {
+            ctx->virt_enabled = true;
+        }
+    } else {
+        ctx->virt_enabled = false;
+    }
 #else
     ctx->virt_enabled = false;
 #endif
-- 
2.25.0.265.gbab2e86ba0-goog


