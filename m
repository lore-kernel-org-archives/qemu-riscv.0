Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lN2Pw-00087I-BE
	for mharc-qemu-riscv@gnu.org; Thu, 18 Mar 2021 19:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Pu-00085C-Vq; Thu, 18 Mar 2021 19:51:03 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>)
 id 1lN2Ps-0002BV-AJ; Thu, 18 Mar 2021 19:51:02 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D2315C01BB;
 Thu, 18 Mar 2021 19:50:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Mar 2021 19:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RpHArvaZL0gvP
 utuy5/hQCYXJVo7chw2rZOu8hkWLq8=; b=J1KOQXAYVXf2sFhFEYnU6dEV9bp4S
 pMfoD1QFqccv4w8DX83RUeQDYLHCOZN8NE7g/zLfJ/c+YXVSh8aLQOmCrS2z34bl
 gRyaryO3FiXlVHlZGia8q1R1ZPx2Oz3jKrbSBU88nbDml67qPlEmAHYsXSWLFDNE
 CpAVZT1ezvKIGJasOT4Udok1pp/YsqWlHrk/9PLFOVfAID8zsMN0uD7d7U7m8CHo
 8L0JnFlYTOv/6k0/tgILnXcWpjNJQMgawxeGwt4g57d1dj3VGZzK0bPcmkDrBiS1
 owmK/8uZKdu1T02kMfl4GpGqVp3XUhW/QMnrl9M0YC+cpJgXGLFj/3ojw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RpHArvaZL0gvPutuy5/hQCYXJVo7chw2rZOu8hkWLq8=; b=dZaKwSey
 gn5QLXvlzFBpSvWOBjw6lVpf5qtgLp5llntgkG1B5wh/iw/Ms8Ats2hsOQTaX+Gm
 5hmyu3tC3mD3NyMmCwYQHjaggfPetufJIcVTHjXVXvTEjvrAZq7zx2w04fDBElJa
 qCPZMChwZcBGNWQkH4D9XzlxHZ7c2xE6bkS92Rp8AaiFkGwm2ZFmwOycx6nGZ1rt
 KF4VHPhUfErRjRl2V5OyzopWjdxv1v9vru94YIc75sOyBYDjrfl3izIOEJbWP72L
 wyh8DUc8c5TiLTg155cXMkDM+LRt6/hKbRVmDqkPuVsY3IYdSuLyiYM6jAN2poFs
 gE65P1HzpymvDg==
X-ME-Sender: <xms:YudTYNhofVuwFmTsNmoD6gTf7sta5erta4tEHGQv8h9fB6RgjMMptg>
 <xme:YudTYCDQrd_eRFhfr_0yS9DVvm-n021ZwV4Q-b6rT7PnoDq9-HZUNweVtRsdgNDM2
 5MNOO5OKsyzbqmJeVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetshhhvghr
 rghhucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgrkhhkrdgvvgeqnecuggftrfgrth
 htvghrnhepudffkefffeevteeffeejgedugefhgfetieetledttdekvdegffduieefgeek
 teefnecukfhppeduudelrddukedrfedurddufeehnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomheprghshhgvsehkihhvihhkrghkkhdrvggv
X-ME-Proxy: <xmx:YudTYNG13vqg6V-K3OAnPeyc55Chg7P6oPlXRtUbR75hjbfM_bFmNw>
 <xmx:YudTYCScvAdMFMk-DHH0H_9TyUEsAmXI4b5MKN6R_AS6WkxLKAkU5g>
 <xmx:YudTYKyXCiXqTiYmxAlgtdjJAzALXzWordadpQbF6GZ4QtzU-F5-fw>
 <xmx:Y-dTYBqUbru817bZAS50YtzSsVVGNjGcNYxqaB9s6iE266HcNFJtsw>
Received: from ravenlin.tomodachi
 (119-18-31-135.77121f.mel.static.aussiebb.net [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id ABCE61080057;
 Thu, 18 Mar 2021 19:50:55 -0400 (EDT)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Asherah Connor <ashe@kivikakk.ee>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org
Subject: [PATCH v4 2/2] hw/riscv: allow ramfb on virt
Date: Fri, 19 Mar 2021 10:50:41 +1100
Message-Id: <20210318235041.17175-3-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318235041.17175-1-ashe@kivikakk.ee>
References: <20210318235041.17175-1-ashe@kivikakk.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=ashe@kivikakk.ee;
 helo=out1-smtp.messagingengine.com
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
X-List-Received-Date: Thu, 18 Mar 2021 23:51:03 -0000

Allow ramfb on virt.  This lets `-device ramfb' work.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
* Add ramfb as allowed on riscv virt machine class.

 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e96ec4cbbc..c0dc69ff33 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/display/ramfb.h"
 
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
@@ -781,6 +782,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
-- 
2.20.1


