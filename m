Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHn-0003MN-0F
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32924)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHT-00036O-9P
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHQ-0008Rz-3d
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:46 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHP-0006ta-Pl
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:43 -0400
Received: by mail-pl1-f193.google.com with SMTP id w24so1493732plp.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=q9V5gld9xQfQQn0CcvhnGApawq1VurFWRjo628pvYuM=;
 b=DnfD7wHcYIzzyQB8ohfggT4MCPCusZIGQjeZF/YzcYeKl+8xxReu9uuuihQ5eCcdFZ
 Hwbzz4SP3HT2mQHeJuXj32EEKXo9D4gspGqgBAPzA101QsWu78x3MUhYvGXDeJLs3h7o
 Q2f08PZka85QZsGGqL447l+GKNJa1C6Kav1xBQGlduRNKmXQjPEF5XQZUhRIRHe2hQrm
 bAUEXM8N3rP1cYeuCwL27E5OgIeb1+1eryhh86SU1BCdsjA6pCpI5uCJh11InvhhHVpC
 KqJ+S6iUD4YJ/ubj1oEwjEQVZm90UUnSnBnZc2JC1efqjFDF+Vz7lgHEK0TJ/wdO+tdh
 0Arw==
X-Gm-Message-State: APjAAAWBeJnDxBAuY55bI/hb3ExY8SzOBaEvxthF7TMKntdKMBEUENGU
 I79f8Q39nvLh8qWE+JpbpY3OmWwTFRyDWA==
X-Google-Smtp-Source: APXvYqzrj2WCkS1uKxLrDfsuhjFMLViVUZlMLROz+rFwI8+pGj3GyLZwu8pSxJo32uH8wiSJqP7VhQ==
X-Received: by 2002:a17:902:b215:: with SMTP id
 t21mr5419646plr.123.1561649037136; 
 Thu, 27 Jun 2019 08:23:57 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y17sm2811152pfe.148.2019.06.27.08.23.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:56 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:51 -0700
Message-Id: <20190627152011.18686-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.193
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:49 -0000

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


