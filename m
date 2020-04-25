Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSlc8-0007ca-2E
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 14:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlc5-0007ZG-LQ
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlc5-0007kF-9U
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:02:45 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1jSlc4-0007dH-0H; Sun, 26 Apr 2020 14:02:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DEF035C00A4;
 Sun, 26 Apr 2020 14:02:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 26 Apr 2020 14:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UcpJiObITqu7P
 ZVbSQ3CEYIay7v4P/evFaLJc4yEA9w=; b=AfXUNMOKcaiJ3Lipyuwjh3RST2kvp
 G0+YqRz6qNCFE5CCA6RmF4IntrAmLKg5fg9aFnOCWlr9YM1Ffue0oXqjAn9VcXcG
 MymbNTDWUJEPI6GI5OMXwQq93UfOYqoEIoVrZ4qjFqR/+uvdyehl7OL9grCkXigG
 JueU9zXsQUus1KvaLixd8+84ev3G2kgkESXysij4sUrv5IotXhuojRSnUpUD0J8C
 /9mvD91uSr9/MMA3BuWhL664E2w+1Fc9Z3+HwugPs+37tUmZbG7rNwNNAlEJcx1m
 0XBjNsJrw1P8/4gnQuKYa+0t60IeMiKRfu3GyCZ5QpauG0ZKRYWB2V7SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UcpJiObITqu7PZVbSQ3CEYIay7v4P/evFaLJc4yEA9w=; b=IB+LkCT8
 6HMcRRvkg7UAOnIYGZ0gGf1oqjX+/eQHWK7amiGrPX5hjc8H52XpTlULym/ctjKt
 3gk693Erqamemhppwxa1aR+7MhNLd1nbnYZrALfMGPTXgbOWYKnxfW9E3/6tJGka
 01fm2w8792lrT4FhWpJaFQdvIAg1PKX+g/ABQgW04QCU9apsqjKrlkrD4RbA2Z5U
 4OUyldpBc16qPqki2KTieJYJVjtynIslg2Mu1EeY+ffu0PntGQs4mK0SwHLnB1Rq
 a5kxGxF1TsOB3YoRFvvNUkYH4OwhnO82alFGOXVYDxN6pFHIth4A05PeQHnwcm2R
 muTAm3govfWISg==
X-ME-Sender: <xms:wcylXnSX0Dcug-48QjBewXsWPgXCP0ilXX6r5JCxRgkS9gAa7vMKLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdekne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhs
 thgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:wcylXrbUmv5PKAf4TnIbVzGR43-X01bfp2YA7_EsY4btPxWAZ5_N4g>
 <xmx:wcylXhzbJKgwlCBFHIU6oqqZOzakQr-ETTZwRCkanvJbsuTCjfaRsg>
 <xmx:wcylXp_Ay2zJfxBke3oW_vV4K_i2t3q7PdrNF-yy3LCPAVHT93oksw>
 <xmx:wcylXooGKzo5ddzUfZyU5rdQFfoURivfjoUeVWpQAGyOzk6hwzKLWA>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net
 [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 285F13065E36;
 Sun, 26 Apr 2020 14:02:41 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 1/9] riscv/boot: Add a missing header include
Date: Sat, 25 Apr 2020 04:29:01 -0700
Message-Id: <2fa9d010eba5edae22ea92fcc994b1f34d79a236.1587920572.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587920572.git.alistair.francis@wdc.com>
References: <cover.1587920572.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.111.4.29; envelope-from=alistair@alistair23.me;
 helo=out5-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 14:02:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 66.111.4.29
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
X-List-Received-Date: Sun, 26 Apr 2020 18:02:46 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index df80051fbc..1c37bfbb4f 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -21,6 +21,7 @@
 #define RISCV_BOOT_H
 
 #include "exec/cpu-defs.h"
+#include "hw/loader.h"
 
 void riscv_find_and_load_firmware(MachineState *machine,
                                   const char *default_machine_firmware,
-- 
2.26.2


