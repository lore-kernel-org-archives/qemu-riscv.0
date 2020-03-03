Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmL-0005S7-Uw
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkk-0002Gy-VC
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkj-0004Qh-Uh
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:42 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkj-0004QU-Ps
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:41 -0500
Received: by mail-pj1-x102c.google.com with SMTP id lt1so557044pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=HbGfUPv0cd7o7bP476lAqHrxUZfWuNH/ffddHd7fEos=;
 b=DOHQl+JOUZUliOK+7WLqmFiyd3DpxYgoGCw0tqjRJV3G83Xhl2Cgv/Dks6rQlMnRki
 teZIaoP1vr8yHes8Tc74kWdw3CryhJplC5zREOA/f7bFWn8Gh/m4kVnn9hEyI7ADzPti
 Eh7l7Pf5+0dEovihMu5Nc2K+DIivoSPq3oWAf9JVUZzeZzF5V6UMu8v0ZITbjgd9bnVz
 h04Dw485DjfpRAmGaslfz9V3ICklk68MtR2ITaEhbDD+L5S2mLzjV+/AsGHu2LRS9Jnx
 HfIbk3A4QFB7tGiFX8R5dfnXDzfaIOZ9BKerOi2Mi5b22achDJqF0xIPfIFSjomy0DYu
 AEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=HbGfUPv0cd7o7bP476lAqHrxUZfWuNH/ffddHd7fEos=;
 b=mf3DGQKnLkQfpFG5zdZe6E0WH5A0SIVc6/7P2u+Q4DxzM+31g1wSxiF3U/lR3iUGmq
 xUlK1cGRB+mlSc8/uAn/32cCEj2MHjJY7u4PldC4vfPCEDnvxQEl3/HLWOLYUMgf7lr9
 hhBm4mzmf0eQQqUOIgztEYYKhLII9s2PwDkVT9+b/lQOiWONvI9lii9BMaGeQ1XGSAeS
 fLbJTxAggqsWkoMzbGwNkOWJXtRAvMeAU2/SdB3hmfnumUF1qAcoPzD5F/MMI4DZxL2G
 YtCh82Ba1m6Zf4EBuPrGkCfce98dBFoGp9oVk/QH/ArcZJzjqBVwNv54TChX/hYrge75
 740A==
X-Gm-Message-State: ANhLgQ3O5YcV8PBoitIaoO481foHje4bfrKSH1FgNjQlIER2CrHY/heY
 Q2VQ4XP30NZDfY343X5R3uYStOBrEfhCdg==
X-Google-Smtp-Source: ADFU+vt8FQmcxf5ZJYv2NcYU5ZuBI+/79Ajeg7uSmXRJhFLosymtvVcYfVLC5w/42sFDSSJU6MIgNA==
X-Received: by 2002:a17:90a:9409:: with SMTP id
 r9mr1221904pjo.39.1583196580433; 
 Mon, 02 Mar 2020 16:49:40 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id d6sm97750pjv.38.2020.03.02.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:39 -0800 (PST)
Subject: [PULL 24/38] target/riscv: Remove the hret instruction
Date: Mon,  2 Mar 2020 16:48:34 -0800
Message-Id: <20200303004848.136788-25-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102c
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:44 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The hret instruction does not exist in the new spec versions, so remove
it from QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/insn32.decode                     | 1 -
 target/riscv/insn_trans/trans_privileged.inc.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cfd9ca6d2b..b883672e63 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -75,7 +75,6 @@ ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
 uret        0000000    00010 00000 000 00000 1110011
 sret        0001000    00010 00000 000 00000 1110011
-hret        0010000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
 hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index b9b5a89b52..76c2fad71c 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -58,11 +58,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 #endif
 }
 
-static bool trans_hret(DisasContext *ctx, arg_hret *a)
-{
-    return false;
-}
-
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-- 
2.25.0.265.gbab2e86ba0-goog


