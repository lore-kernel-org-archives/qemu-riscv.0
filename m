Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0Lw-0000su-C4
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lu-0000s8-2g
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:14 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ls-0007vp-5U
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:24:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id n2so687071pfo.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=ZiI62LHWMC7KlKecQDIy1C3+ekw76I6k4j1WyE6ErWJ8Fv2Pl17SA34CvnfjBOFSj+
 ZlQOKDdVgroh/eRt6cLdUoqdTvFaltt4V1FW7KtuTO+1GVhKS5JT7yOCZg0FBhYIFFt3
 xrcVOiNARQGlSMsNoW6g+YhAf+//Gex2Imns6s2tMxrUB5Pv4hnnqcnwvexfZzjKkaB0
 jYAznpXYkJFA/ydBmfRGx2IFa+TSXShJ8NJ/iWjWKKYOzG0xjQCNyBx2GzrB87WEX9pu
 dqYPhJHuSN+JDWPH3KPkG+tgPY7g1PDaMYvp6wbhfNJCvohomp39ZfrdFqEqHPeC/fb4
 BCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=ke9kSg6Nai2lg8IZ1wabBewFb9jVMomVshop+PPcyDO31j5QfhEZArEpa5TRHfrs/5
 EEco5K6S5e5O3TVSNSqnaWHGvR39VHPbVqUVwFBtkqJTcmEdyYa/YOinBiHbWVo2u0Zl
 UmJ5zikDcdwZ94BBpz+xYc7IpwZKckOExz3TGVIuca2rGIfiFjZN5dUwshMDISCstHo1
 /nlhxosLbhBwiGGeXfAwMMgUwssDYDmWC9tSHSiMQt/gWB1enlWGcVZK84Eoozo0H758
 cjxgwWSkCMnVzXbB5nLQ2aOT7J96sfu/hHRAMMiCRVcKKfunrfILD2WdDLWamuHijp87
 Dc2Q==
X-Gm-Message-State: AO0yUKXrklCKS2PbGrVleaFMhtkH6BVF4GxcbVIRsu+yyW+GjVRWqthh
 tkHItuU9F4KPEDdSSYIy/cPGWA==
X-Google-Smtp-Source: AK7set9f5ri3wD2OEEyMPyCqVcZGtrOhgEtsPIj7qAs7gAeNw5XGMcIHaPzeIxfY7NaBz7abj+jTFw==
X-Received: by 2002:a62:150a:0:b0:59c:8937:435e with SMTP id
 10-20020a62150a000000b0059c8937435emr9399084pfv.28.1675923849835; 
 Wed, 08 Feb 2023 22:24:09 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:09 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Date: Wed,  8 Feb 2023 22:23:56 -0800
Message-Id: <20230209062404.3582018-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 06:24:14 -0000

Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
extension provides hardware assistance to riscv hart to enable control
flow integrity (CFI) for software.

`zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
for "unprivileged integer maybe operations". `zimops` carve out certain
reserved opcodes encodings from integer spec to "may be operations"
encodings. `zimops` opcode encodings simply move 0 to rd.
`zisslpcfi` claims some of the `zimops` encodings and use them for shadow
stack management or indirect branch tracking. Any future extension can
also claim `zimops` encodings.

This patch also adds a dependency check for `zimops` to be enabled if
`zisslpcfi` is enabled on the hart.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 target/riscv/cpu.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..6b4e90eb91 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
+    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
@@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
+            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
+            return;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
@@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
+    /*
+     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
+     * implemented
+     */
+    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
+    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..9a923760b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -471,6 +471,8 @@ struct RISCVCPUConfig {
     uint32_t mvendorid;
     uint64_t marchid;
     uint64_t mimpid;
+    bool ext_zimops;
+    bool ext_cfi;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
-- 
2.25.1


