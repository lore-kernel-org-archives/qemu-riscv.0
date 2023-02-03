Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNwde-00029m-FQ
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 09:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pNwUC-0006ln-Dq; Fri, 03 Feb 2023 08:52:18 -0500
Received: from forward105j.mail.yandex.net ([2a02:6b8:0:801:2::108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1pNwUA-0001FX-2E; Fri, 03 Feb 2023 08:52:16 -0500
Received: from myt6-65ee53fe8ed8.qloud-c.yandex.net
 (myt6-65ee53fe8ed8.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1d8e:0:640:65ee:53fe])
 by forward105j.mail.yandex.net (Yandex) with ESMTP id 5AD9E4EC9665;
 Fri,  3 Feb 2023 16:52:05 +0300 (MSK)
Received: by myt6-65ee53fe8ed8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 3qYwoclYY0U1-0ivTrp5r; Fri, 03 Feb 2023 16:52:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1675432324; bh=tAuIyQmV7ZBYjPYRCFEefK0kSf5i0udrwT737+bHbO4=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=xP78BLqjnhJOEV57uL6YYJdfydm9yk4YqVi2LvkWJX5vHiDvuhuuxbgX2E+m1QJYH
 wvAtQOKPe1MgZ2YumIy8RywIQrH66NKKkXc259u3diha3qsO/yvby0UnjjWX/zTIbJ
 iYIxFc9LrtxrizUikJKg2wxkTUBesAY1qnW1piCo=
Authentication-Results: myt6-65ee53fe8ed8.qloud-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
To: qemu-riscv@nongnu.org, pbonzini@redhat.com, bin.meng@windriver.com,
 alistair.francis@wdc.com, palmer@dabbelt.com
Cc: qemu-devel@nongnu.org,
	Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH] target/riscv: fix SBI getchar handler for KVM
Date: Fri,  3 Feb 2023 16:51:55 +0300
Message-Id: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:801:2::108;
 envelope-from=vladimir.isaev@syntacore.com; helo=forward105j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Feb 2023 09:01:39 -0500
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
X-List-Received-Date: Fri, 03 Feb 2023 13:52:19 -0000

Character must be returned via ret[0] field (copied to a0 by KVM).

Return value should be set to 0 to indicate successful processing.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d69c..0f932a5b966e 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -467,10 +467,11 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
     case SBI_EXT_0_1_CONSOLE_GETCHAR:
         ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
         if (ret == sizeof(ch)) {
-            run->riscv_sbi.args[0] = ch;
+            run->riscv_sbi.ret[0] = ch;
         } else {
-            run->riscv_sbi.args[0] = -1;
+            run->riscv_sbi.ret[0] = -1;
         }
+        ret = 0;
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
-- 
2.39.1


