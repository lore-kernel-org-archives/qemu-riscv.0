Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaq1-0006EB-52
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiape-00069R-W6
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapc-00073z-Lo
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44143)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapc-000703-0b
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:36 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so1138108lfm.11
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=q9V5gld9xQfQQn0CcvhnGApawq1VurFWRjo628pvYuM=;
 b=cELnOO5Btc9pnLJOb/Sr2+1XECb79h92MSzXF/co2b8Ai8YtjwQhKYcd3gfUaFSz9B
 6Iwqe7gg+vP+GAg9FsBv0gky5kyjV+hHQ+zperbtd3GRk2+6AvOClNkxvUSx2+7glgc2
 pGX1s2pB0UY70vLvE1WtWaI46akebyZpeLj6VAo6sr5ysn7Ln3vCQkTZA6J/WOW+IgVL
 fg+CHNL1EB4wpu3By19a9Q0z4QNg+BhFl16c+5lLqn65lhyWP3Mi1Hw0HqF+3Vb4utMn
 cKcHGtZGzl859pFDnuDRHkWmhTW+t8n4AllJj6cXNz3uvm8EV/Epf6O8OejPT0GaAo35
 XvHQ==
X-Gm-Message-State: APjAAAVkkGfv8Q027aFCwSDHyzzt9ZvLRD/V9QVxvqifVzs6MaFk4fsW
 eSNfmIV217icyAdPu337/Rd8HQ==
X-Google-Smtp-Source: APXvYqxbN3o+wyiwNNl9d/mFLLfkZg6dSWvYvup4ysqv7Mb66kBM7j6Yo8AEBvsyXXWJaXj4cuLwmg==
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr3720318lfm.120.1562143294604; 
 Wed, 03 Jul 2019 01:41:34 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id z30sm319292lfj.63.2019.07.03.01.41.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:34 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:30 -0700
Message-Id: <20190703084048.6980-15-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.68
Subject: [Qemu-riscv] [PULL 14/32] target/riscv: Add the privledge spec
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:40 -0000

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


