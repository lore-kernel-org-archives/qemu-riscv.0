Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6PU-00083J-T8
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 11:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PS-00081o-Hm; Fri, 18 Feb 2022 11:47:06 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PQ-0007ZI-K2; Fri, 18 Feb 2022 11:47:06 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id DCB7B20898;
 Fri, 18 Feb 2022 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTwQXv8aSQcofSMa0IHoyzLvta1LaHX+zhc2AwBgJog=;
 b=hiRvhiL7kMyxAHhM3XaBLatXedpfNzsBk2TOIoz4M1qblIAMvO3IMYm4/MzD+rzzLYuA95
 yfULyihZ3+lk0tE1Yo7dOOTOUau8cxVs5fy3850h3pVpEno+iM2X5AmAmIm8P023bosbBk
 wXMF5Nm0DklVRNcQ4XkHgpEaWfE31+g=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the object
 is finalized
Date: Fri, 18 Feb 2022 17:46:42 +0100
Message-Id: <20220218164646.132112-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218164646.132112-1-damien.hedde@greensocs.com>
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 16:47:06 -0000

The array is dynamically allocated by realize() depending on the
number of harts.

This clean-up removes memory leaks which would happen in the
'init->finalize' life-cycle use-case (happening when user creation
is allowed).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/riscv_hart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..4aed6c2a59 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -66,6 +66,13 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void riscv_harts_finalize(Object *obj)
+{
+    RISCVHartArrayState *s = RISCV_HART_ARRAY(obj);
+
+    g_free(s->harts);
+}
+
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -79,6 +86,7 @@ static const TypeInfo riscv_harts_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(RISCVHartArrayState),
     .class_init    = riscv_harts_class_init,
+    .instance_finalize = riscv_harts_finalize,
 };
 
 static void riscv_harts_register_types(void)
-- 
2.35.1


