Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3BFl-00023E-E2
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFe-0001tr-R1; Mon, 20 Jun 2022 02:51:10 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:49180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1o3BFc-0004Ni-9W; Mon, 20 Jun 2022 02:51:10 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 547DE11EFBC;
 Mon, 20 Jun 2022 06:50:43 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Subject: [PATCH qemu v6 10/10] target/riscv: rvv: Add option 'rvv_ma_all_1s'
 to enable optional mask agnostic behavior
Message-ID: <165570784143.17634.35095816584573691-10@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~eopxd <yueh.ting.chen@gmail.com>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Date: Mon, 20 Jun 2022 06:51:12 -0000
X-Original-Date: Tue, 10 May 2022 11:10:04 -0700
X-List-Received-Date: Mon, 20 Jun 2022 06:51:12 -0000

From: eopXD <eop.chen@sifive.com>

According to v-spec, mask agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of mask policies, QEMU should be able to simulate the mask
agnostic behavior as "set mask elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between mask policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This commit adds option 'rvv_ma_all_1s' is added to enable the
behavior, it is default as disabled.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..a67b1c3e84 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -955,6 +955,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, fal=
se),
=20
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
+    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.34.2

