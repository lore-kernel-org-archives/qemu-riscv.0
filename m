Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNqLS-0005cO-IP
	for mharc-qemu-riscv@gnu.org; Sun, 21 Mar 2021 01:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLQ-0005bZ-Td; Sun, 21 Mar 2021 01:09:44 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLL-0007Ww-NK; Sun, 21 Mar 2021 01:09:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616303369; cv=none; d=zohomail.in; s=zohoarc; 
 b=CyYHMWaqf9aW1y18ov8MwlwOCBTQHgz83GMAykMY8XCaa4edzQB4dzWjd03qY5953Cp42geQSfodjRz4KdMce/HL11G7k2XTor0ilRj5aNxFd61MtqhpgC3lV5ASbLbczSL9EC+JSbzfUzUlLzP993uhs2ufAJzPZhRjAOUY8LQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616303369;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=evHDLWBYxQMqqDMawDnxpTEbO7c4T6GucCah48FP61Q=; 
 b=RcwN+wqByLG6n4KjlxCtUkcELGkJC3uv76ZoiyNCVR06PZBjOcnptXHzn2OhWYdqQuB46Km/X/5PkO5R6T1SLq11yhUG53seIU//zem4zp2pQLC3w0cB3toOVC4jX3jRqIAmGFYgbZGZ8x/jzwYZg2DS0+5OcDviaecEuDEkn84=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616303369; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=evHDLWBYxQMqqDMawDnxpTEbO7c4T6GucCah48FP61Q=;
 b=W2JcRN+dcEpO2SLbbufYgyUGdDu/KGCK1NUudHTfMimN6SsYIGCt4/TolVWYgrC5
 ilddwJPJxn+8P2tGzH5Gfb1wBw1SIP4+ZMt5X1At2nRuw8jziGT15NGEfseKV6eGhdq
 JntPz7GQMMzZtyrJHwPwzLKSXYWKTbhrQmpieJEY=
Received: from helium.Dlink (49.207.205.35 [49.207.205.35]) by mx.zoho.in
 with SMTPS id 1616303368143223.50670943450802;
 Sun, 21 Mar 2021 10:39:28 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210321050917.24621-2-vijai@behindbytes.com>
Subject: [PATCH v2 1/4] target/riscv: Add Shakti C class CPU
Date: Sun, 21 Mar 2021 10:39:14 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321050917.24621-1-vijai@behindbytes.com>
References: <20210321050917.24621-1-vijai@behindbytes.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 21 Mar 2021 05:09:45 -0000

C-Class is a member of the SHAKTI family of processors from IIT-M.

It is an extremely configurable and commercial-grade 5-stage in-order
core supporting the standard RV64GCSUN ISA extensions.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2a990f6253..140094fd52 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -707,6 +707,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
 #endif
 };
=20
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..ebbf15fb1c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex"=
)
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
--=20
2.25.1



