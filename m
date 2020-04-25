Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSlcM-0007tK-Vc
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 14:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcK-0007q0-1L
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1jSlcJ-000801-JY
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 14:02:59 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1jSlcA-0007lW-Gj; Sun, 26 Apr 2020 14:02:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DBD0D5C00DC;
 Sun, 26 Apr 2020 14:02:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 26 Apr 2020 14:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=hxCNR+1Xbyp5M
 xrWvY0/HskUapPmKe5I9EMTnzP3Ezw=; b=F0YGR5bfZ8ZX87/euuus0rjAJQMf+
 16oj9eOWLxblpxCU9Dy2bCz/DIu5qS/FRAf0jb+LFdevrbW/Sb1qcp7PvpL9B86u
 OiRdieuheA8JWYmg+kwM8nB7NXeU9u7renGKEerw+MwXMSi/FXzZ2fW25Em8Rk/e
 2p1qFidiIV1lVjFdN8PhtZ0RFXKH2khkvoqSB0mxkn3OW6pECctnRwx1u1Csqmhv
 U/uubbIPdaGjuk2UoQ+GGSJNnIfVaPRwbNHeNH/rrJRhhTY6B8dFaidwSIKWSzm6
 60tfMZbfisBGM4RdR1e7SKQCb8SrxSzycLMahXI7UdoPLoTzvDd0ONF5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hxCNR+1Xbyp5MxrWvY0/HskUapPmKe5I9EMTnzP3Ezw=; b=ZU9GT7Mq
 AzvYVcV/WvEdS9AJ/rkqxOCmhUNiMyX9yESrM2AKgltpB2B5BOGiF3QrzZwrIl8H
 3lf2Bm6MkCrl/IObb98d2eUqxZ1QgcVaY2LLU/JjWgp0eK67XsLQjG0upcOh+qMh
 wbnfAF5hl0HRJQ5oUsJs+BfG4DCDoHAYhjdscBahdsNpK5rGobT5Kk6fppusVYoA
 udCumS9DsJlRyElCc4NIyZ/WnIeIaeeWCIXnQIm7dBNgCfqPeewP3p7nu4RsZXxO
 6d3Q/g8Q9yeMDw4HGKnPqfQAF5QwPxmfPDltXZ2NSi+i0iFqBDJiu+EnOg54qoNj
 AvLnTRQr+M772A==
X-ME-Sender: <xms:ycylXn7uZTDU-1_8R3m7kup6z3j8VEJywGaNF_CIqp2AjIkgTJ_Xtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
 ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdekne
 cuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghlihhs
 thgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:ycylXpOsfhERaz0cx4LkyfQe0Naj_wdQEWyvLZnQuWafELuSG_J0LA>
 <xmx:ycylXhOWfuJSFxG0vrYQE_pExnyhuxcxy7BE7mXtVbSQ1ZqPdpLMZA>
 <xmx:ycylXp-X0tZUg8eo22CECyo9gRUTUsvIVoEBaemdligYYPBsim57ZQ>
 <xmx:ycylXnIfw6xSDgfK8GGszhcbkGUT_MQBPNmHWOqMLo1iZovNrVXfDA>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net
 [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 215583065E2A;
 Sun, 26 Apr 2020 14:02:49 -0400 (EDT)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 3/9] target/riscv: Add the lowRISC Ibex CPU
Date: Sat, 25 Apr 2020 04:29:09 -0700
Message-Id: <e0d162fcf56a8260de1187821f63f78524fee0b9.1587920572.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sun, 26 Apr 2020 18:03:02 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 target/riscv/cpu.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8f837edf8d..235101f685 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -160,6 +160,15 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
     set_feature(env, RISCV_FEATURE_PMP);
 }
 
+static void rv32imcu_nommu_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_resetvec(env, 0x8088);
+    set_feature(env, RISCV_FEATURE_PMP);
+}
+
 static void rv32imacu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -620,6 +629,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0e7f5b9c5..8733d7467f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -35,6 +35,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
-- 
2.26.2


