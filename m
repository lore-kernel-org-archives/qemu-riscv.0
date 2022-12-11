Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4Esl-0003Hs-Bd
	for mharc-qemu-riscv@gnu.org; Sun, 11 Dec 2022 00:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@embeddedinn.xyz>)
 id 1p4Esj-0003HR-J5; Sun, 11 Dec 2022 00:28:09 -0500
Received: from sender-of-o53.zoho.in ([103.117.158.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@embeddedinn.xyz>)
 id 1p4Esh-0005mm-F7; Sun, 11 Dec 2022 00:28:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1670736473; cv=none; d=zohomail.in; s=zohoarc; 
 b=biFifqbY8sn3AKxdQsMH1M/3BAniH3RkgQKnbxFRo5tr3l8b4yiRbQaXXs2hf2hRWUEEVNro5V1CojnNrlmA7Q2vsVLLlBEkO1mkDdVJKr0bpjFfYe0Qph35NCcAA/mXF/tCTDVBcQCHGilz2LCm2l8G+ya9Qr58LxLNg4VByeI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1670736473;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=c29Ocb4flOSZqaRM8sHRwFohEckeH2anVY1Hkea12zc=; 
 b=eh5/pmSVRiWEet666yiHajjZEAQbtHF3Z76y0h6Q/eNcMOxDrU3blMHiEpOoUe9P6kb+b+n1YvQPYVKV4StZ7JyWl4upqNMGSZpqG8BULEyM/IGR99C1/obXyyerivDHUQ/Pnn4qBw74cCooIvOCQC+QDLC50VSTwrGbWIA9M0M=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=embeddedinn.xyz;
 spf=pass  smtp.mailfrom=vysakhpillai@embeddedinn.xyz;
 dmarc=pass header.from=<vysakhpillai@embeddedinn.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670736473; 
 s=zmail; d=embeddedinn.xyz; i=vysakhpillai@embeddedinn.xyz;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=c29Ocb4flOSZqaRM8sHRwFohEckeH2anVY1Hkea12zc=;
 b=fsAlW3CYn1BOVQE3JKZ+XnMm9k/w5+RXm6GgBIvBz9wlfJHggVEx5IVXCbp3ACt0
 rlOPFIpBeBG4yANUT9leQaZ0xlZthJRgxA2ZU1qYdIe4mqWQQN7Yvo0RbecZy1PsOog
 Eix663cqpGUckail9HZ1MFFiquY3G7bcelH6Lt7A=
Received: from BBY-LT-C16658.mchp-main.com (135.0.187.166 [135.0.187.166]) by
 mx.zoho.in with SMTPS id 1670736471888368.7454907119803;
 Sun, 11 Dec 2022 10:57:51 +0530 (IST)
From: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
To: qemu-devel@nongnu.org
Cc: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>,
	qemu-riscv@nongnu.org
Message-ID: <20221211052745.24738-1-vysakhpillai@embeddedinn.xyz>
Subject: [PATCH] hw/riscv: Add support to change default RISCV hart memory
 region 
Date: Sat, 10 Dec 2022 21:27:45 -0800
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.53;
 envelope-from=vysakhpillai@embeddedinn.xyz; helo=sender-of-o53.zoho.in
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, FROM_SUSPICIOUS_NTLD_FP=1.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 11 Dec 2022 05:28:10 -0000

Add support to optionally specify a memory region container
to be used to override the default system memory used
by the the RISCV harts when they are realized. Additional
memory regions can be added as sub-regions of this container
to dynamically control the memory regions and mappings visible
from the hart.

Signed-off-by: Vysakh P Pillai <vysakhpillai@embeddedinn.xyz>
---
 hw/riscv/riscv_hart.c         | 5 +++++
 include/hw/riscv/riscv_hart.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..7a8dcab7e7 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -33,6 +33,8 @@ static Property riscv_harts_props[] =3D {
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
                        DEFAULT_RSTVEC),
+    DEFINE_PROP_UINT64("cpu-memory", RISCVHartArrayState,=20
+                       cpu_memory,NULL),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -49,6 +51,9 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, in=
t idx,
     qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
     s->harts[idx].env.mhartid =3D s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
+    if (s->cpu_memory) {
+        object_property_set_link(OBJECT(&s->harts[idx].parent_obj), "memor=
y",OBJECT(s->cpu_memory), &error_abort);
+    }
     return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
 }
=20
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index bbc21cdc9a..3e5dfeeaae 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -38,6 +38,7 @@ struct RISCVHartArrayState {
     uint32_t hartid_base;
     char *cpu_type;
     uint64_t resetvec;
+    uint64_t cpu_memory;
     RISCVCPU *harts;
 };
=20
--=20
2.34.1



