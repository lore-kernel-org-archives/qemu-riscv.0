Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGK4h-0003bB-Q8
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4f-0003Vt-EM; Sun, 28 Feb 2021 06:17:21 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lGK4a-0000ZD-4h; Sun, 28 Feb 2021 06:17:21 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 69BC45C0048;
 Sun, 28 Feb 2021 06:17:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 28 Feb 2021 06:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vgaqb+DYeGGMH
 RBgK96eRzJA9+5hGlbzZeIyl8s+Dho=; b=MnzulEBxDSJQZXcvxyq6hLXJ71nxx
 uPWFfgrzOBto828uzJQNAi/Z31TSSioTWvy3xRJjAd++ler3SZfFDr+3LM/RlzXT
 KQuLX3WW15PZmqlTUIHyfkdWV2wOG8CVXnqoaEX339MzJwxcze0Qq89dd8J3+A3E
 ENH6NUPEqzg70Av8CRZy6LPX3x2mBH/IzMsQpNez5Cgy9r/QDQGeVpcxXHqaln8D
 VewTxi2ojIvmpzwFshPxCLU95Afnifv9mpuAfKjgedPt9wPLO3zzu1WYPC0DRjbE
 YQhlF6u765dgQK1flhsOUT5DfEO++DZgt6tgT0r+2MAw5cGDdbpkZUo6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vgaqb+DYeGGMHRBgK96eRzJA9+5hGlbzZeIyl8s+Dho=; b=I88oPINH
 9D1RcANL9SYdYmPhc30Roz0tDcTvTfafhfL+kEjc2raNQ72EpC3YszLdLkLixFXH
 6gQI8R6qXJbctD13zBtBAlwwESsjGWRjAzttxQoZFClVDnrdKbZV+t88hoWXXX+s
 Q96WpyI+U/pmZYVS+7JEMp3t56xTk3nAgoB8eF7oFZr0I5huXEHjucXl/Rss1UzT
 YirLzKsCEEP73zvPI1P1euowl2RY265c43OhV6Ud8hP9zQQRiEnfvOaIDwIAm9z6
 yur//WC4ArlbWk6x+Bdkr6Ork7GRWJLdbHZloo/9fUYVyYrhTx398Dz1G9nNyy6d
 H/vl4W50aHLMuA==
X-ME-Sender: <xms:u3s7YN_mIIOWFiXgBrV5AYRR8AHL_yHpT8DyoMkeFntceyduIXAS6Q>
 <xme:u3s7YBvD-ONB_2LTZcNCMA4i-Ae29XN3nDH0ds1Lf0KWe483LdYM46FtX64RU297v
 MQUYc368VrSGERj4oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleeigddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehshhgvrhgr
 hhcuvehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtth
 gvrhhnpeduffekffefveetfeefjeegudeghffgteeiteeltddtkedvgeffudeifeegkeet
 feenucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:u3s7YLCsec4HkqF09HxCiiWtPbwW6Iy_LohsVFfDha9dlyQIa2hp5g>
 <xmx:u3s7YBcTGFJE84138O8h2y-wwM19DNXBnmOWkebmhu8xRBv3b7M7YQ>
 <xmx:u3s7YCOP3lxt6ZK0b_vVn-IaneXemtKOKPbK3VisZtie2YP8CreNTw>
 <xmx:u3s7YJ3IvXThFL32i8w5CmV6enHeIkKuEMHXlbXIepU7reiqrdkN3Q>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC9471080054;
 Sun, 28 Feb 2021 06:17:12 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v3 2/2] hw/riscv: allow ramfb on virt
Date: Sun, 28 Feb 2021 22:16:57 +1100
Message-Id: <20210228111657.23240-3-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210228111657.23240-1-ashe@kivikakk.ee>
References: <20210228111657.23240-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=ashe@kivikakk.ee;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 28 Feb 2021 11:17:21 -0000

Allow ramfb on virt.  This lets `-device ramfb' work.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v2)

Changes in v2:
* Add ramfb as allowed on riscv virt machine class.

 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 82eff42c37..700b481fa2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
 
 static const struct MemmapEntry {
     hwaddr base;
@@ -743,6 +744,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-- 
2.20.1


