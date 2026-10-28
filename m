Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69596606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 04:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=bNbQFXsa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLvKa-0007Zp-Tk; Wed, 28 Oct 2026 00:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvK8-0007Uv-FZ
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvK6-0001d8-R8
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3ab3f899c8aso79650a91.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 21:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793161897; x=1793766697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zH8vMqAvZUEAa9yaCM6E6bJja+XyeFPE1lcf/3AJwnw=;
 b=bNbQFXsa3fM/pZLlv61OpCDsvoCfiAKR8f+H+ua4/t74Iyu3W1MIMrz5WkrsbR4gKn
 yjJN0cgJZoZgY4NOwt1z0qVL+rH/oD/KWE8eg9E4Ae6Sp0OC8dL1W+GGQrMLfY4HiUsm
 g2pExeTf5ywHY7VW4fXyM6rxOykGEWfh1cCG8N8hOKsc2AjjHsj5NoIt4JtXv9ZtgT1R
 9OfS1jRbDfWf3x3RCICQmFZr08JxGpSkW4DflGK0gtkyqEWmz1onw8Gkfq9GdsPY0pl+
 YjZwW3lLwNp4X8o5Q3mXEC0zqfmfoL2Ud/O2n+LAaQSH15VFPkjoYFd1aRNlmUpzvU74
 sdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161897; x=1793766697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zH8vMqAvZUEAa9yaCM6E6bJja+XyeFPE1lcf/3AJwnw=;
 b=CVULcFymjsW8/dOcmG84NaqDebbJt0wSSiUo2wV02KRd4x3OGvfxCyOPteJbEkM0qw
 qQmElM+BbsEHiyUHEl1ka2hdiSTw8wVCoHpmWVjm2j2E6xHGt6Uez36jWIX29+2yIC4s
 99sKDmAo9Fw5+fYRrE/6+6Kj6MfL3+StSAyQ6QAhLDRqVzlAhON4OqTodVesPFb9flaa
 lWi3zOGv38LIfs0Js0G+vcQFFkchMF3zhquClruYVzf6gswD5jWdUYEdSgZprAFTxAZ2
 0kBy2TZ6pQYqjK4el7g0XcVWidtj06NfC7Lmcsi+ZGY6aSddjOBQSMPlnNh2Xy5p8Q49
 wW+g==
X-Forwarded-Encrypted: i=1;
 AKwUvByCuHVqUskULAmMV2nv4VwqbhziDAOJ3+MzUTUgdO1YYKEFdmshuvYlw5R3nYtfHxf/QnvKWgWxV64p@nongnu.org
X-Gm-Message-State: AFq9FYJuNAS2n/FW4mc2N7JBb+4rm5b0ioS4eYIcR84zO7cud06TI/uc
 pZligcuzIK1JqJX47iMxUDqg8uMj73WgYViFO5htn2MQUW93G8KZunOKE8pXM44jj9g=
X-Gm-Gg: AYBFou2amEu37mHOrbmH6WmBjBNlYrlX+4KM/d9bepbzns1D0IjX+sSoaTes62Ufo1U
 zakX8WPNrb6uk1j7hPeYTcdvNl7evr9vU5TN2ksLO4ygdeCiC32KFycju7bxEQBo9bSNrMx1/0e
 uhSIXcAj0ficrzCH+Um8S2Bme82A3yE96ILUkNzHDkCIsjQGg6iqIkAfYf54mR3eOZOU268pWQm
 65kRKH8Kd6cqyoryDFVpxNw0famwAkR7iGC3XPzhq+NM86b13oq3Q9ayqw5uDePadW5Hwyxz5Yl
 +eAhvjcephwNB44aC+eQmbDy7b4Oxf7L0iJ8m2wMw/EwnCRRQgneLC2I+3cHDEXtiMeQ1PhMS5D
 u9XHBVFxc1b5W4FBPS3ZMUW0jVfRETTKQBibre1N+Xr/wnulYXLe49oePZc3sQEtcgjSMwfBbPu
 FKNxoBD4uJq7xLAghrsRZ0pjoLE94h3UoqR1GSDzePtqArnCPHBrXlZEv3nfXcP44WjXaZfbCP8
 mUswd+i9HzXOMkLU4RdDJMOAqFRCxgcvta/P92O4uPsMcv0qHEIgr54Va7HVIOhzggNR5ygDhXI
 ousvW0j+nddTjswaxA6AcZW8iv3Z73nP/7lRhF6omItTcp09zfRb6J4D3I2vXbAKjL4TKb9OvV2
 mtw==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:9e5e:d1a5 with SMTP id
 98e67ed59e1d1-3ae5821a23amr1527344a91.6.1793161897538; 
 Tue, 27 Oct 2026 21:31:37 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a5d45a8sm1024470a91.17.2026.10.27.21.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:31:37 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 04/10] hw/riscv/atlantis: Create CPU cluster for Atlantis
 cpus
Date: Wed, 28 Oct 2026 14:30:53 +1000
Message-ID: <20261028043059.600498-5-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028043059.600498-1-portias@oss.tenstorrent.com>
References: <20261028043059.600498-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for adding the RCPU, put the Ascalon harts in a
CPUCluster. This will allow gdb to properly handle CPUs of different
types.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/tt_atlantis.c         | 13 ++++++++++++-
 include/hw/riscv/tt_atlantis.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d89fdfcc86..4eccfa443e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -149,6 +149,7 @@ config TENSTORRENT
     select DESIGNWARE_I2C
     select DS1338
     select TMP105
+    select CPU_CLUSTER
 
 config XIANGSHAN_KUNMINGHU
     bool
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 9b37e845da..587c6ea733 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -50,6 +50,8 @@ QEMU_BUILD_BUG_ON(TT_IMSIC_STRIDE != (0x1000 << TT_IMSIC_GUEST_BITS));
 #define TT_ACLINT_MTIMECMP      0x8000
 #define TT_ACLINT_TIMEBASE_FREQ 1000000000
 
+#define ASCALON_CLUSTER_ID     0
+
 static const MemMapEntry tt_atlantis_memmap[] = {
     /* Keep sorted with :'<,'>!sort -g -k 4 */
     [TT_ATL_DDR_LO] =           { 0x00000000,    0x80000000 },
@@ -551,7 +553,10 @@ static void tt_ascalon_cluster_init(Object *obj)
 {
     TTAscalonClusterState *ac = TT_ASCALON_CLUSTER(obj);
 
-    object_initialize_child(obj, "cpus", &ac->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "tt-ascalon.cluster", &ac->cluster,
+                            TYPE_CPU_CLUSTER);
+    object_initialize_child(OBJECT(&ac->cluster), "cpus", &ac->cpus,
+                            TYPE_RISCV_HART_ARRAY);
 }
 
 static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
@@ -589,6 +594,12 @@ static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&ac->cpus), errp)) {
         return;
     }
+
+    qdev_prop_set_uint32(DEVICE(&ac->cluster), "cluster-id", ASCALON_CLUSTER_ID);
+    /* cluster must be realized after the hart array */
+    if (!qdev_realize(DEVICE(&ac->cluster), NULL, errp)) {
+        return;
+    }
 }
 
 static const Property tt_ascalon_cluster_props[] = {
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 52b44504ae..e5fce1f675 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -15,6 +15,7 @@
 #include "hw/intc/riscv_imsic.h"
 #include "hw/misc/tt_atlantis_prcm.h"
 #include "hw/char/dw8250.h"
+#include "hw/cpu/cluster.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -40,6 +41,7 @@ struct TTAscalonClusterState {
     MemoryRegion memory;
 
     RISCVHartArrayState cpus;
+    CPUClusterState cluster;
     MemoryRegion bootrom;
 
     uint32_t num_harts;
-- 
2.43.0


