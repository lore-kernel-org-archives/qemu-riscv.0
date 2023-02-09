Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0SB-0007c2-39
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ru-0007Ws-QF
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:26 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Rs-0000jE-NA
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id u75so925635pgc.10
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=7BQbWEn1wCe3gUdWK6JN37gipvc3+DmocKKeWMl154ufeIcidO5gV5yiVej/OU1+14
 hamdOlJnPXcac5tDsPzwNfPFpeuiQgu2icxyqpegPXRMHm0+xSGbIqKy4UWS9eP89VLN
 beiMB9e5AfJ6MPuRs5WVTz8cBNcNbS4KcNjb+J/+TkIr/Cqa8mS9fJBZPtvy02P3Az/a
 dCFcYhdkFWfY6xf1tV00IHL9Bj61aKjHPiXVTrgRSVEPR8LKE8vHiZO/vSAzQKww2P0b
 ZSM1J8U/h2yxGXYdMfgzroLZrUC46m7lLbF33bnkT9AzCcg8OMuVy+OUrcWhL0Y3SF1B
 YMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=KDbuW9TwtMBXTnVLynSeK7MZNe8jjJTs/qHpxZi8DBhA5DtNu/9Z3BljkyIza2mssI
 lS3nOd3IQ12HkeuIJi2umpkgiQf/K8jcqvDp4pocM8X8BGEsGwTyAxcW3iU9qo8VkwHJ
 pA1hmcg56YTQs/c96flmmGrmszR3e67bF3P2u9vdNohOf8ILYUwNFtl0Kd18vx2tk9Cw
 5bqo05+3UhWoFzpwFwmyzYFE6YsshAOV2f6szRtqUSJ/9nzpsKDf5cMF+FuMc/Yu7Sb4
 MASN4dJxkWF7ji7+qR9VANxkI1m71DQcSTATU6e068oKyREjxE8RyIibSl/XsBM4+27H
 lZ9g==
X-Gm-Message-State: AO0yUKWEB+VzorP4ticroCXnN4IdTFjgrocDF4wvSM+frplJCyUNBvPb
 pkLpec4MOtNprP8tqjPwCgEMFw==
X-Google-Smtp-Source: AK7set87I0ZuFubonTAGYosOcrg57ytRhJJ5Hma2/SaQmlrZhT/5tH998GfrR8DmwLGgoagdeOShjw==
X-Received: by 2002:a62:2707:0:b0:5a8:4bf2:1d51 with SMTP id
 n7-20020a622707000000b005a84bf21d51mr3011034pfn.15.1675924223337; 
 Wed, 08 Feb 2023 22:30:23 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:22 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Date: Wed,  8 Feb 2023 22:29:39 -0800
Message-Id: <20230209062947.3585481-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 06:30:30 -0000

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


