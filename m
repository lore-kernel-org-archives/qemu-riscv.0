Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFUDu-0005vJ-Vp
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDq-0005t7-Cp; Thu, 25 Feb 2021 22:55:22 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lFUDo-0001ME-Rh; Thu, 25 Feb 2021 22:55:22 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 8612F5C00D3;
 Thu, 25 Feb 2021 22:55:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Feb 2021 22:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kynR1KaxSdL4O
 3pE8DSX9s2z2JfYuiF0JlHhgBFbn2I=; b=ZLJ1fEb5XO+9dL+k81jVV8nUxMBsK
 dUwPt6R67Os0UY2JYn3uaBegzm3Ij01Q25ZRLpvILMe6j6H6dB7kMsQ09kokSZ7Z
 FDtPoydGbaOi3lTJocwkSmbt0KSoYexfhb0j/w9nDa0gfQb7YPBudECk1Fw5HIZi
 jxfJnGxEDfm9MqSCX28+SFx4ae2ozgc3e5Y06uQp42D6AxEdcXNlCjYQhYUyOrlH
 toygi2AJXMsZlBe+jlymjkGyucSXxX39/1KY0Ei49KlUy5jbZFdk3caqSG15gWF/
 tLG+7zWoJQEC5I3a/HgnyC+dgysgOuizePqUyoHllXEnSlk7yMK2ps6dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=kynR1KaxSdL4O3pE8DSX9s2z2JfYuiF0JlHhgBFbn2I=; b=DQF95pLt
 Xaull7SNf/ntbcysUsE1S74jwcQL1gpZGdKE6M96+IdG6s+y9h3NcL4fYWt5XgRw
 XlrB7u+W6y5MpBMjgcyr4PKTfiFkYva7SiybyF2UfYKT/MpCE9ugVKwNK5AeG6PD
 2rtFsWioEn9BCZsoCxDh361xmD58TV5w/HjucwqIzQpG5BZubyoY3N3HqoRNqsmj
 I9iaFeZRMfblbMDKbyuly7WYO69yZIMFQ/mk6SAQkVB3a8vEa0RLZ7yh0uYwJj1O
 VwKPP+xR62USi+S2+d6ypVe2Y5K0aqnH1kM/Tj0zaTDrJySp6TWMdp+OZxwGgHhF
 ls4F7hja4lzeOg==
X-ME-Sender: <xms:J3E4YNi0fLpdNmathyQ1AsM8Y4Zn0RB-58DtesPUwxI1JkQ3AKGE1Q>
 <xme:J3E4YF3kZ8DMSDhUXZ6moyx9mJk7bRBTILAQ8ejCusM6LmH3Nd41tM_MNxJHyX_wu
 GL7DW7PgWSgBJ9vcUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehshhgvrhgr
 hhcuvehonhhnohhruceorghshhgvsehkihhvihhkrghkkhdrvggvqeenucggtffrrghtth
 gvrhhnpeduffekffefveetfeefjeegudeghffgteeiteeltddtkedvgeffudeifeegkeet
 feenucfkphepudduledrudekrdefuddrudefheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrshhhvgeskhhivhhikhgrkhhkrdgvvg
X-ME-Proxy: <xmx:J3E4YGIpccHMZ8mbkg2AuDfaARd0BbC2KWQoFfSRjNs1_mgaRc-BXA>
 <xmx:J3E4YFwGj57omc7P03tkqay8qKjZF5Tk_n0R3uzO5aaGdFJRcAPzxQ>
 <xmx:J3E4YEVY1TXBWojNtMKK_QUVdpvBmRHwi7ZOqurexWvUI9x_2K8VhQ>
 <xmx:J3E4YErsi61Gs04etv-MYQQp59j2oUs_AnwSHy2tG9VKn_nzWSqmvA>
Received: from localhost.localdomain
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58834108005F;
 Thu, 25 Feb 2021 22:55:17 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v2 2/2] hw/riscv: allow ramfb on virt
Date: Fri, 26 Feb 2021 14:54:47 +1100
Message-Id: <20210226035447.1252-3-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210226035447.1252-1-ashe@kivikakk.ee>
References: <20210226035447.1252-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=ashe@kivikakk.ee;
 helo=out5-smtp.messagingengine.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:55:24 -0000

Allow ramfb on virt.  This lets `-device ramfb' work.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
---

Changes in v2:
* Add DMA interface support.
* Add ramfb as allowed on riscv virt machine class.

 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a10f218c43..dbd40c41da 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
 
 static const struct MemmapEntry {
     hwaddr base;
@@ -740,6 +741,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-- 
2.24.3 (Apple Git-128)


