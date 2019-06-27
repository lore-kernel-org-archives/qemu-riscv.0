Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHd-0003F1-Gu
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHE-0002SG-Ey
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWH8-0008D0-RO
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:32 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:38598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWGz-00077I-52
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:19 -0400
Received: by mail-pg1-f169.google.com with SMTP id z75so1179449pgz.5
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=/3ducq0eP8I5aPrZO6qPfK+y5RApmcrkJq95TSYVf1E=;
 b=VePxZe44HrISefaTbiiE0zOz+acPnimS26FM82Du3e/HOAa315ExK6zzsBww1Cp/Gu
 kUrvplgqnkOVDnYc2R5eOEzBRrfn1k1+nWTdrNSDk25wJbhpRVHEgh+vi67zr9xTHusa
 J9VbvgCLJ1AjGcsr+PAwqi7xD1yXrtiEfop4A6QOxkbZA2AKItFMg0FF42ozlLro7one
 5jumhUNZNo74ErBkLu+LaRC31CcQp/Q8a/TQHROhMUKbe8Om3pO/S97HSOmfz0fv6lvD
 6metheLlUZIAYarSeQE9srlcq42tk/gJookwGaLMiA0jSTY1BiieTjObYLIxOjgmOAOf
 8jTA==
X-Gm-Message-State: APjAAAVNWJfjfie+pJDLwHkT9jL8u07B2iJ8ovfcBz4Bmq27WJ0R/luZ
 /cGFBcMOys6Zia8fQeubxr7XLorobN0I+g==
X-Google-Smtp-Source: APXvYqyzSWpZmeQqjyNaf9sQtW2gOTiGjQXZ6JD0rDImUIMDHjKTqErZQM9YX2QK3e+aokXG04oBsA==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr6742351pjr.94.1561649056598; 
 Thu, 27 Jun 2019 08:24:16 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id e188sm4126519pfh.99.2019.06.27.08.24.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:15 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:59 -0700
Message-Id: <20190627152011.18686-23-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.169
Subject: [Qemu-riscv] [PULL 22/34] RISC-V: Add support for the Zicsr
 extension
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:37 -0000

The various CSR instructions have been split out of the base ISA as part
of the ratification process.  This patch adds a Zicsr argument, which
disables all the CSR instructions.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 target/riscv/csr.c | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bbad39a337b3..915b9e77df33 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -442,6 +442,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ba551cd3082c..0adb307f3298 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,7 @@ typedef struct RISCVCPU {
         bool ext_u;
         bool ext_counters;
         bool ext_ifencei;
+        bool ext_icsr;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index de67741f3648..e0d45867607a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -793,6 +793,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 {
     int ret;
     target_ulong old_value;
+    RISCVCPU *cpu = env_archcpu(env);
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
@@ -803,6 +804,11 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     }
 #endif
 
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr) {
+        return -1;
+    }
+
     /* check predicate */
     if (!csr_ops[csrno].predicate || csr_ops[csrno].predicate(env, csrno) < 0) {
         return -1;
-- 
2.21.0


