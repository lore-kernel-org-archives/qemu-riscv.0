Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2rHz-0004iI-UQ
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 05:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHx-0004g5-VQ; Wed, 07 Dec 2022 05:04:30 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p2rHw-0006H8-5Q; Wed, 07 Dec 2022 05:04:29 -0500
X-QQ-mid: bizesmtp63t1670407440t9vagklp
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:59 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: CR3LFp2JE4kcAOTf1tJ2e6VTgxyAlz4UmjtjZiydhyShviny5NxhwkW4l9V/q
 7uHx62iXHPFB8PG7DMSo7nz6UT2z9R6SWnX7PTx7lJ8gpLAjUTw9ocX+xWaPMcVHEWn9D/s
 +LxZ+GYHTDuh3FRqkYA2YpLAtH2IizJxsP1rAWzByy5zkp0Z8TNaHSLK+GHUFwZdmTVtIaP
 VE9hXP9UZd2WzPf/IauueqsNzLcuMfSBcaQFRht+7S+jy5vPDSReIUgcBtufFeEpAUP3pj5
 9yxXgR7cHjabkEKtC6OtwI5pRsNBNgE/UgHlYWichgjRZA0VAN6XKAFHLjT5RHiT94gm6ln
 Ieq9P8bKkkRbseqEC0osndhoj0Qzzg9SR0bAqmg
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 09/16] hw/intc: sifive_plic: Update "num-sources" property
 default value
Date: Wed,  7 Dec 2022 18:03:28 +0800
Message-Id: <20221207100335.290481-9-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 07 Dec 2022 10:04:30 -0000

At present the default value of "num-sources" property is zero,
which does not make a lot of sense, as in sifive_plic_realize()
we see s->bitfield_words is calculated by:

  s->bitfield_words = (s->num_sources + 31) >> 5;

if the we don't configure "num-sources" property its default value
zero makes s->bitfield_words zero too, which isn't true because
interrupt source 0 still occupies one word.

Let's change the default value to 1 meaning that only interrupt
source 0 is supported by default and a sanity check in realize().

While we are here, add a comment to describe the exact meaning of
this property that the number should include interrupt source 0.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- use error_setg() to propagate the error up via errp instead

 hw/intc/sifive_plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9cb4c6d6d4..1edeb1e1ed 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -363,6 +363,11 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
 
     parse_hart_config(s);
 
+    if (!s->num_sources) {
+        error_setg(errp, "plic: invalid number of interrupt sources");
+        return;
+    }
+
     s->bitfield_words = (s->num_sources + 31) >> 5;
     s->num_enables = s->bitfield_words * s->num_addrs;
     s->source_priority = g_new0(uint32_t, s->num_sources);
@@ -420,7 +425,8 @@ static const VMStateDescription vmstate_sifive_plic = {
 static Property sifive_plic_properties[] = {
     DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
     DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    /* number of interrupt sources including interrupt source 0 */
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0),
-- 
2.34.1


