Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul4-0000Bk-HI
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguka-0008JF-SH
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukV-0000FZ-U0
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:28 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukV-0000Bm-JA
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so3317141pfg.10
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=q9V5gld9xQfQQn0CcvhnGApawq1VurFWRjo628pvYuM=;
 b=a+Peze5T40bYr//+apCMvpJ/3VcP9CYL0BAMhq+cF4zkRYJfRuGtO4htoYOPkIvJds
 u4nr1eu5nphYWZscYWUmx9kq7WWDeMupZ1pUHorQbhgDusZSaYn3BrSZ+VcSukHHSC51
 p3gLr39zTLAhL1k/MfwKrLpfgZto9Yn69khq13rUF9uQSrVXbhfJVLhKNrs3xmtSs0fj
 iLssshIMWF47QBjk+BcAON8n4faRsf5fKVDwZSWopAHKscQyb5/SJ75YkVU1DismK0WV
 XXi7hX+v3JFIyjG2WG4QPUjmFbYtrV2UhiIAKuyUQjIou8ncTlTLbX8x+CA9cLy7/Bz1
 7pWA==
X-Gm-Message-State: APjAAAWWrIfAQBKqiXA+zgL5UQkgxjCoS1puWp3Oe85VIFtB4AzVYn6J
 6DGW00RJRbAJM6R81xaMCj+a5w==
X-Google-Smtp-Source: APXvYqx5kDN7G91ArNH9tP6uusSNJfjHpPZchw8hc4S0zj9v6bZ6ubJxn5iIJv7r/ALQKSPfxw7mfg==
X-Received: by 2002:a17:90a:1ac5:: with SMTP id
 p63mr14267263pjp.25.1561743199313; 
 Fri, 28 Jun 2019 10:33:19 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i36sm2355306pgl.70.2019.06.28.10.33.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:18 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:07 -0700
Message-Id: <20190628173227.31925-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 14/34] target/riscv: Add the privledge spec
 version 1.11.0
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:32 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add support for the ratified RISC-V privledge spec.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h                             | 1 +
 target/riscv/insn_trans/trans_privileged.inc.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5eb9cab2ad62..d559d28bcda8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@ enum {
 #define USER_VERSION_2_02_0 0x00020200
 #define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000
+#define PRIV_VERSION_1_11_0 0x00011100
 
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index 664d6ba3f2cc..c5e4b3e49a3e 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -90,7 +90,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
-    if (ctx->priv_ver == PRIV_VERSION_1_10_0) {
+    if (ctx->priv_ver >= PRIV_VERSION_1_10_0) {
         gen_helper_tlb_flush(cpu_env);
         return true;
     }
-- 
2.21.0


