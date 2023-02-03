Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNwdf-0002D6-SU
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 09:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pNwdd-00025I-An; Fri, 03 Feb 2023 09:02:01 -0500
Received: from forward102j.mail.yandex.net ([2a02:6b8:0:801:2::102])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pNwdZ-000457-SX; Fri, 03 Feb 2023 09:02:01 -0500
Received: from iva1-5283d83ef885.qloud-c.yandex.net
 (iva1-5283d83ef885.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:16a7:0:640:5283:d83e])
 by forward102j.mail.yandex.net (Yandex) with ESMTP id 4EBF84BE8CBD;
 Fri,  3 Feb 2023 17:01:12 +0300 (MSK)
Received: by iva1-5283d83ef885.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 91ZhCplZXqM1-DEOe97Z8; Fri, 03 Feb 2023 17:01:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1675432871; bh=HDfbGdBTM5i/4nShW913NUhDHP3xIIxXseefl/b2Z8A=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=DXuaQ+UQS9USPC1Lj3g0i1le+HfIhuvLdgVZnblqK8n0wkg3UwaZxZ9Py5f2r2799
 2jtPUNfP35tD8X8yxHUt09zf51bAy3gmyounjFN5q24hkT0wJIpR8Mcczj/4+BOND+
 s17IkV/PY/LNI7MVNzVHI5t5tF/PNxZhr7UlT618=
Authentication-Results: iva1-5283d83ef885.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH] target/riscv: fix ctzw behavior
Date: Fri,  3 Feb 2023 17:00:59 +0300
Message-Id: <20230203140059.13068-1-vladimir.isaev@syntacore.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::102;
 envelope-from=vladimir.isaev@syntacore.com; helo=forward102j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Feb 2023 14:02:02 -0000

According to spec, ctzw should work with 32-bit register, not 64.

For example, previous implementation returns 33 for (1<<33) input
when the new one returns 32.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index e2b8329f1e5b..42c6ded13de8 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -80,7 +80,14 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_ctzi_tl(ret, arg1, 32);
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t, arg1);
+    tcg_gen_ctzi_i32(t, t, 32);
+
+    tcg_gen_extu_i32_tl(ret, t);
+
+    tcg_temp_free_i32(t);
 }
 
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
-- 
2.39.1


