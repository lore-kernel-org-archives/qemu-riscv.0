Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAXUw-0002VU-MN
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 09:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pAQeL-0000ra-J3; Wed, 28 Dec 2022 02:14:53 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pAQeK-0004pE-4v; Wed, 28 Dec 2022 02:14:53 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id BB13D11EF1B;
 Wed, 28 Dec 2022 07:14:40 +0000 (UTC)
From: ~elta <elta@git.sr.ht>
Date: Thu, 15 Dec 2022 16:27:14 +0800
Subject: [PATCH qemu] target/riscv/cpu.c: Fix elen check
Message-ID: <167221168069.10371.13797275537678987977-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~elta <503386372@qq.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Dongxue Zhang <elta.era@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 39
X-Spam_score: 3.9
X-Spam_bar: +++
X-Spam_report: (3.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, FREEMAIL_REPLYTO_END_DIGIT=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Dec 2022 09:33:37 -0500
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
X-List-Received-Date: Wed, 28 Dec 2022 07:14:54 -0000

From: Dongxue Zhang <elta.era@gmail.com>

Should be cpu->cfg.elen in range [8, 64].

Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fe176e483..5dc51f7912 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -872,7 +872,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **e=
rrp)
                         "Vector extension ELEN must be power of 2");
                 return;
             }
-            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
+            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
                 error_setg(errp,
                         "Vector extension implementation only supports ELEN "
                         "in the range [8, 64]");
--=20
2.34.5

