Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3u-0006dP-Rr
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3m-0006Wr-T6
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3h-0002kG-P9
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:38 -0400
Received: by mail-pg1-x52f.google.com with SMTP id d10so2077280pgf.12
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QO/q5sTYgh8lDsKjmAjwxvHZnXZMZgpYcKr3/0vGBfs=;
 b=UnOWbwvLNfiZMUV3vuYVJ927bgCtshJbwf1uAQ0Ml4yT5qcqVsrfAquwtLps+p1Ckl
 MeXbhXpSIUaFeLGnfgCI9jt3kkZWJPobsD/dzFVCXzqxKyLg5BKL4bWqliTZDpYKa1Ly
 cyHQCX/gCMJt6I4axV5pjwFnS12yV0DT2gBAq7D0TLAagHlGO0w7sQgWc17YZ1/ulqSd
 oS14aG0NRILafNkt3U5KBByCXddbPhk1k97f2t5ssaQaoSBhhqTGQjsDHbzhHEVJEUBC
 /Sss+zzR8eQ5khml4f1K4dvRq5duQx9c9eMB6hS6+W3ZIxDLs9wvjBL5b8U3251iggt5
 BSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QO/q5sTYgh8lDsKjmAjwxvHZnXZMZgpYcKr3/0vGBfs=;
 b=WrT3cAEhspbHf6xBFrSeoCO7bbHoChKNJqmt7wwsL8I4H8ji1RaFhVI45r4eE/iDPB
 dPg6lNrBW68PsntqEi5kXmdaY6eqrVcEDjLvNmG/5Any9ucZoc7GqA2UHEenzEJyURnm
 FE8aDLbNGAMpxLqxOAYZ4f65AxZYprn6BoOsJnDQdja3FGXV6QZyl9hOyiDidaIwhZt8
 YHvGrDUDcUIZjHnGfY6gNVGEO1x/NoM7qJyuxpyXq0VAZ6yN7XLmyi58Fq1Ox+PY8e49
 PVPaAlXMwmOGY4uvXdNcdx2QIHfWxdhX9vitoRmG+DQgWA9dxuo+BTFvn1RlCVIxjiLP
 4ioQ==
X-Gm-Message-State: AOAM532b0/nUQagKWQFRc/X+u4oBw9hNiCEu+i9kf62JzyIVDyha7c0/
 iNvs/vyQrg/Z9IqeUwGKf8H10Q==
X-Google-Smtp-Source: ABdhPJy+sAvZo9gTE3ZjzqLpJWxM9eGluWmGOh7Q7GTlZBg0DcxNXZmQq4VPGthP/EctgaKW2XHwrw==
X-Received: by 2002:a63:1125:: with SMTP id g37mr28896475pgl.56.1620230849919; 
 Wed, 05 May 2021 09:07:29 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:29 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 17/17] target/riscv: rvb: add b-ext version cpu option
Date: Thu,  6 May 2021 00:06:18 +0800
Message-Id: <20210505160620.15723-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:07:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Default b-ext version is v0.93.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 target/riscv/cpu.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1b3c5ba1480..32469f7c891 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -127,6 +127,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
+static void set_bext_version(CPURISCVState *env, int bext_ver)
+{
+    env->bext_ver = bext_ver;
+}
+
 static void set_vext_version(CPURISCVState *env, int vext_ver)
 {
     env->vext_ver = vext_ver;
@@ -385,6 +390,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
+    int bext_version = BEXT_VERSION_0_93_0;
     int vext_version = VEXT_VERSION_0_07_1;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
@@ -409,6 +415,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     set_priv_version(env, priv_version);
+    set_bext_version(env, bext_version);
     set_vext_version(env, vext_version);
 
     if (cpu->cfg.mmu) {
@@ -488,6 +495,21 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
         if (cpu->cfg.ext_b) {
             target_misa |= RVB;
+
+            if (cpu->cfg.bext_spec) {
+                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
+                    bext_version = BEXT_VERSION_0_93_0;
+                } else {
+                    error_setg(errp,
+                           "Unsupported bitmanip spec version '%s'",
+                           cpu->cfg.bext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("bitmanip version is not specified, "
+                         "use the default value v0.93\n");
+            }
+            set_bext_version(env, bext_version);
         }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
@@ -566,6 +588,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3cea62cd4c4..b2cca778526 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -83,6 +83,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
+#define BEXT_VERSION_0_93_0 0x00009300
 #define VEXT_VERSION_0_07_1 0x00000701
 
 enum {
@@ -130,6 +131,7 @@ struct CPURISCVState {
     target_ulong guest_phys_fault_addr;
 
     target_ulong priv_ver;
+    target_ulong bext_ver;
     target_ulong vext_ver;
     target_ulong misa;
     target_ulong misa_mask;
@@ -295,6 +297,7 @@ struct RISCVCPU {
 
         char *priv_spec;
         char *user_spec;
+        char *bext_spec;
         char *vext_spec;
         uint16_t vlen;
         uint16_t elen;
-- 
2.17.1


