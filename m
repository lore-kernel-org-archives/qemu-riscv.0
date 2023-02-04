Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pODqS-0000Ce-Ka
	for mharc-qemu-riscv@gnu.org; Sat, 04 Feb 2023 03:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pODqR-0000CF-5T; Sat, 04 Feb 2023 03:24:23 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pODqL-0007i5-NA; Sat, 04 Feb 2023 03:24:19 -0500
Received: from myt5-69594d4a41fa.qloud-c.yandex.net
 (myt5-69594d4a41fa.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3ca5:0:640:6959:4d4a])
 by forward102o.mail.yandex.net (Yandex) with ESMTP id 71A586FFAF5F;
 Sat,  4 Feb 2023 11:24:13 +0300 (MSK)
Received: by myt5-69594d4a41fa.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id BOUH7QtZ7iE1-IYjgOI5o; Sat, 04 Feb 2023 11:24:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1675499052; bh=qdK6xFmWbdmvOph4poynw5T2hJGhTnQwL019OByWaAw=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=F/lLYYJ7jpMTlfEiA3OLjZj5uIIprvl6NrWWcmK9pQEHv+nazsgwxkVwpMThe3gY9
 hEZStFOrIt0lEvCh1Mh6e/IpzJoX51gsUPH3W2aH9mPRaWMnucY89wFNaW+CHVJBad
 h0A29NaU6ux1pDIeCEnI7wx7vPcXXGR6LhAERtu4=
Authentication-Results: myt5-69594d4a41fa.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH v2] target/riscv: fix ctzw behavior
Date: Sat,  4 Feb 2023 11:23:12 +0300
Message-Id: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.140.190.182;
 envelope-from=vladimir.isaev@syntacore.com; helo=forward102o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 04 Feb 2023 08:24:23 -0000

According to spec, ctzw should work with 32-bit register, not 64.

For example, previous implementation returns 33 for (1<<33) input
when the new one returns 32.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
v2:
   - Use simpler solution suggested by Richard Henderson
---
 target/riscv/insn_trans/trans_rvb.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index e2b8329f1e5b..990bc94b9840 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -401,6 +401,7 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBB(ctx);
+    ctx->ol = MXL_RV32;
     return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
 }
 
-- 
2.39.1


