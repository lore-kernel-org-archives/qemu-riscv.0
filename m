Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACrf-0006xM-6v
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:27:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrY-0006pl-Uo
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:27:04 -0500
Received: from [2607:f8b0:4864:20::532] (port=33594
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrX-0000RD-B7
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:27:04 -0500
Received: by mail-pg1-x532.google.com with SMTP id 133so2979596pgb.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWnplHI5ugW0PnZustxMLlndEpSrSEAmrCMPBlh1wIs=;
 b=t/OQ+WhwQzljpqP8n4B/h4+HoY/YMAYSIHFvHGugtJHJv1FmoL3BAqtkCdZbjVHRnS
 OVdKCEbkzrYlCrXNXgHOzDhkSmGY7t/JwG/JIuaR0g7ZwnWpQJKnh7ujQOQXmm1H8Nj3
 UnPa2HoMb9T6ICBJh9lH2kzkGfDVDmB7Kfl3xSljewV8UtFcTZm32vCqaHUO9Amhgqgy
 GRtZ2xE5K/hJtK5GlDI/TquHw/fRpdyfl3TlDzEhBmH4r9A+wALRTfTfGV5UBunNqBtm
 XXOLdTbcCrEt0iSQHeZH7SogVNvc6VetMGcn20os0FcW1q1g2n2E+ljEBxwkisHrILmU
 adow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWnplHI5ugW0PnZustxMLlndEpSrSEAmrCMPBlh1wIs=;
 b=6iOrvCCNSCNzkhZkEVZvj1OQNDwkDMSsZNC7UrXqKgC8DYIAdh466YSPJOl/p91FLQ
 Zvzr8EGPPMPOkacPQLGs8/btaJjdmKtkLJg29fcB7OG7z6Nys6iUmTV77QIK2lv8y579
 mtKYDLA7aUYTBuSsOJRXKiNxArZ3k5QU6bwT9QjqucOc5/hwhRPyX8FZ2SsuoY128O5p
 bEENuYlItyPX0Yb0F8rbj9l08qXtbVvEVxwW6l04Tj+2QUT8NtIRRwk1MYawhF6dltyS
 Yz6woOGv16/HDdvA27Ugg6trHGiL5beOIX1ztUTK0Cf458kGLnDyCRkF+0eOzh+NhlaN
 bVLg==
X-Gm-Message-State: AOAM530WPfsD6extDTV5PBrrKJZlRHXf/4HhKsDyDOlfQa1y2e9dR0KK
 fl43Osqsg4mXvaNW5s1F1I1Chg==
X-Google-Smtp-Source: ABdhPJwB51V/cstvmQ3tofQNm0cOspvr41KqchgPDs6VVkTXso2/sADFxNTAHi9bCQ9pxV0w6HnHxg==
X-Received: by 2002:a63:6b85:: with SMTP id
 g127mr27472348pgc.409.1642606022129; 
 Wed, 19 Jan 2022 07:27:02 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:27:01 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Wed, 19 Jan 2022 20:55:59 +0530
Message-Id: <20220119152614.27548-9-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 15:27:09 -0000

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
index 070d741297..730697fa44 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -255,6 +255,22 @@ struct CPURISCVState {
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
 
@@ -423,6 +439,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
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
index 7e60e092c8..1c606d7cbb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -398,6 +398,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
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


