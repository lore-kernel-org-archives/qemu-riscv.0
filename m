Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mx45f-0002OW-9Q
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 04:27:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mx45d-0002Nq-Rx; Tue, 14 Dec 2021 04:27:17 -0500
Received: from forward105o.mail.yandex.net ([37.140.190.183]:47978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mx45b-0003dj-2Q; Tue, 14 Dec 2021 04:27:16 -0500
Received: from iva7-79032ba5307a.qloud-c.yandex.net
 (iva7-79032ba5307a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:320d:0:640:7903:2ba5])
 by forward105o.mail.yandex.net (Yandex) with ESMTP id 7BA3F4C3914;
 Tue, 14 Dec 2021 12:27:01 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
 by iva7-79032ba5307a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 jvVNqH1obf-R0eCX0lL; Tue, 14 Dec 2021 12:27:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1639474021; bh=st95ymli/fBelVAP9yu08SDGy3O7W+hZ7SEWKAx/JMM=;
 h=Date:Subject:To:From:Message-Id:Cc;
 b=sb69spbPdkkcv+LvIbiyp4vr/Ge2Xc9O47wLkVbtBKfkaneyf+NATPUC9DqPHG/zB
 msjT6r+pkhloPjGn6+ib6oiymwcVMQffWsY0GwTZMuL+KXbv7AefI0EXyOV+18z2Ts
 L2KhMbenKP04C1f7yK9WrXdj8lNmwDl6suTlkrW4=
Authentication-Results: iva7-79032ba5307a.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id i0RMZllY0d-R0PquiO5; Tue, 14 Dec 2021 12:27:00 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: atishp@atishpatra.org, Nikita Shubin <n.shubin@yadro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
Date: Tue, 14 Dec 2021 12:26:59 +0300
Message-Id: <20211214092659.15709-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.140.190.183;
 envelope-from=nikita.shubin@maquefel.me; helo=forward105o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 14 Dec 2021 09:27:18 -0000

From: Nikita Shubin <n.shubin@yadro.com>

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured and pmp is present, othwerwise access
should succeed.

Fixes: d102f19a208 (target/riscv/pmp: Raise exception if no PMP entry is configured)
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 target/riscv/op_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ee7c24efe7..58d992e98a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -146,7 +146,8 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
 
-    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
 
-- 
2.31.1


