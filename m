Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2gR-0003uK-1y
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gO-0003lJ-TK
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:40 -0500
Received: from [2a00:1450:4864:20::434] (port=46900
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gM-0003mi-Ru
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id q19so313951wrc.13
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GfG2907wKZVOQoSZVbPuNn1dBd1Je7BuFOErMfGRWeo=;
 b=6uruJJgsbO241iLTVFZY4LXYAKgxYlBJcilPPf3s8j1jOiIEFto6jjEIFez1du5hWZ
 XK2NN38ernn6RG0byy64046nB//qy3BOfekqFATpo/xYIUfWqhHAznccejdOzxTbFJrA
 0WvOXcvq0P5rU4J/IyGtE7c74mloVrqWVJV1BX16zgy4+8uJhsArIUUkkK67en8zx+JL
 o4FNKG84JJntYd1Qr4F9KNPyZCryb1PQF8TwsoIbVtrTuCSKFvKuGOLKttpjN1ddTbmQ
 TuKyiNfwDlsmiFmoI6dAGY723WercVSxki1mm9BV7nlY86lcGg31GE/5HK6FKzs0z98J
 Lq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfG2907wKZVOQoSZVbPuNn1dBd1Je7BuFOErMfGRWeo=;
 b=DONIqQo/HgHAJEtaEN4m35znD0eGV0KxUTPyjLEJDC/WAH6vcpKRpYH6NXy26UTPEm
 3uTIayHhWQPJcUIJlQVMp9gDj2OFuUIFjujIVQGA2cUYVf2XPt2fxMVjRV/kDLdLoau5
 390XEzVyoNTPHXmFWoyRzyqxEGusA6lPcj/Clag/HoVPCcudArg7leQKDBdQVNgbDIfA
 8OxC4ntUHuymsKGSRhxrtqwfnlc6+VrlOIXkSvXKtvL2I+LRom9pgFJ5zl0hvFHJNiTu
 7gFMQZidm1KFNFd+1nW+nJwsJDHZBkvGBgfgkGWMYfRYkCOydNGXvOwm9/QVwcjbm5pw
 9NNQ==
X-Gm-Message-State: AOAM531IcK5J3b3TgLpIReBJlTR77+HdmhokDanaYQLcQhWI4tMGCEm4
 5JRfZHNNfp1IS4fKIHslqukRDw==
X-Google-Smtp-Source: ABdhPJy+/mMyU9f9VonX2rQPQvaC8xPjtXZUmF9WWzgcPQsU5zFsT2B9D78v0d4cv/Ee8180NYxlhg==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr28366wrd.134.1643996857485;
 Fri, 04 Feb 2022 09:47:37 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:36 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Fri,  4 Feb 2022 23:16:41 +0530
Message-Id: <20220204174700.534953-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 17:47:41 -0000

From: Anup Patel <anup.patel@wdc.com>

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3f9e2400bb..bf14d27bd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -135,11 +135,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -508,18 +503,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f030cb58b2..283a3cda4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,6 +379,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
-- 
2.25.1


