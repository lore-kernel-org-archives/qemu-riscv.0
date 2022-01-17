Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S83-0001xl-8F
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5O-0001MU-NY
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: from [2607:f8b0:4864:20::432] (port=39575
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S58-0000fh-Oi
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:14 -0500
Received: by mail-pf1-x432.google.com with SMTP id f144so9447298pfa.6
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=et/vu/jUQE/J1fBuabFyLO2+T/t14yfVAc9Ry0i324A=;
 b=mXSD7tfcj6DbAeUcRl7p0MC2Jv8gCQRdFUmwg6VgogdsWYIHm+siDHVhrbx4Mdt9Qu
 kOnfaMiEyFATkRDBlvVt28JpAUpfuSw9VhHbmU7oarGB+uj74FRP04mgjfAM/453zB/5
 BRZ12Fn/MIeYHbEwmbS0jJyC+z7Wu9M75tdimqq4/46FqFJfGmIS2JDl/vXKGAcSRreg
 bmykfJ014T4r3QbGZYhLtPU8xgbGMdeu67CQtYlvU+5FeB64MclBGZ3oI5OydZ8k00Up
 QutZy4GdAEsR4WheHu8pkdH4UoXckIEyU3EStlBnNjmioYBEUDn31iyA1PIcC3faq2kn
 1Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=et/vu/jUQE/J1fBuabFyLO2+T/t14yfVAc9Ry0i324A=;
 b=ZLQbDWp4BtOqnluRqpDu2ElCZpqfqLISONzRn3lL2P5o8F48EaJWj36r3oc9JxTXrT
 Kt4wQSBNPFhfGDYJ0MCQJCcUMx72foA7UvypacOU2UKTF+AcT91sdvXalsCvr9b/YHMh
 1v6+Sz+jdwh8K9O9V8+K8Iwml6JYyBX2Jcbir/ST/fSkgiEF4VCr/9l0lxOOdZY4dmOf
 UwtUaUqJ/BdhMf8E6rPShte1dHkXz52GW7ZTIP8jP0xY2HesxggNWfe0tv1nbmChxi0K
 OHrmSnuPn8RTjelvlxEvqjWG8QdHMFkdDmpP6Gqg7b8Wa992PD38A+XxmtIqw9EuUP29
 xjIA==
X-Gm-Message-State: AOAM530F5s50cZ33YxYoCaPcYPVehGzFT1fBbLBd8cZqCOxBqMu94JK1
 sYzubsZ0iDuoOlfck3EdxXIAOQ==
X-Google-Smtp-Source: ABdhPJy+O3r35E87/OIpDKCuMUDkNOWXGE3w0oIsM1Nnw95Ra0GdT2bn9DLLVfgK3QLLOc+ebkmKeQ==
X-Received: by 2002:a63:90c8:: with SMTP id
 a191mr19579561pge.622.1642426186939; 
 Mon, 17 Jan 2022 05:29:46 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:46 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Mon, 17 Jan 2022 18:58:11 +0530
Message-Id: <20220117132826.426418-9-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:30 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 71a2fd1da7..cee70f8608 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -254,6 +254,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 
@@ -410,6 +426,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 01a8baea06..59c8f900df 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -395,6 +395,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


