Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzZLE-0006vz-2l
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 02:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mzZL9-0006sa-Dx; Tue, 21 Dec 2021 02:13:41 -0500
Received: from forward501o.mail.yandex.net ([37.140.190.203]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1mzZL3-00032P-Je; Tue, 21 Dec 2021 02:13:38 -0500
Received: from vla1-1036dc7f3b07.qloud-c.yandex.net
 (vla1-1036dc7f3b07.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3ea2:0:640:1036:dc7f])
 by forward501o.mail.yandex.net (Yandex) with ESMTP id A11F045C47D2;
 Tue, 21 Dec 2021 10:13:25 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net
 (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
 by vla1-1036dc7f3b07.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 p25vq7wupy-DOeStMGQ; Tue, 21 Dec 2021 10:13:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1640070805; bh=iFZjoIvyiBLmwbiVxyUQqe/MuA1I1tK7XBYwrWyKyao=;
 h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
 b=fKfvPMSGuIDT3hq5qSFnwbVPhXZAMSi+fk5kGc2tm7PPiv6uCSSOr7Mdr9LkLw7js
 Inl8DjCQOziQWP3uPpZId1jgmbFAdegzt4PaK94tLP5zDz7nkkU6Zy2IV2fW6aHLRo
 VEF8ajDnzH8hkQvsGDXv5eiCI+kQtemChgDYCUwI=
Authentication-Results: vla1-1036dc7f3b07.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id GfSzoPAyYr-DOPu7akR; Tue, 21 Dec 2021 10:13:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Nikita Shubin <n.shubin@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
Date: Tue, 21 Dec 2021 10:13:24 +0300
Message-Id: <20211221071324.6213-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <CAKmqyKOmKHjBYhBJP7EwDvKiV+H=y4jVheaJe8Wp46aBQWKgOA@mail.gmail.com>
References: <CAKmqyKOmKHjBYhBJP7EwDvKiV+H=y4jVheaJe8Wp46aBQWKgOA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.140.190.203;
 envelope-from=nikita.shubin@maquefel.me; helo=forward501o.mail.yandex.net
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
X-List-Received-Date: Tue, 21 Dec 2021 07:13:43 -0000

From: Nikita Shubin <n.shubin@yadro.com>

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured and pmp is present, othwerwise access
should succeed.

Fixes: d102f19a208 (target/riscv/pmp: Raise exception if no PMP entry is configured)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/585
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


