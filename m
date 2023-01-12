Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFsyN-0007RQ-2L
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 03:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFsyK-0007Qp-Fn
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 03:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFsyI-0003vV-14
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 03:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673512201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sVfYgbCVY/WbpS8k7uGQZNd6BIUD4uBueoLXy5mqWVE=;
 b=h471Qi/HIPdSHurxdQXeqiBabI7XBvGdcF0H4iB1SPplcTrA8oMkplR95eYLKwymqP2NBi
 tHRIolnYLRyJu5CAWDCyaYcFfUHiLysimeyRTt0aPi1txgPUMuitjHUtcvVKCtTYckr8OA
 87twRhrF1Ng/g4S6hn9fbJVo8zAJ4Yw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-6R0NKPu-NdmoCq1Gd1nDjw-1; Thu, 12 Jan 2023 03:29:57 -0500
X-MC-Unique: 6R0NKPu-NdmoCq1Gd1nDjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1A3101A521;
 Thu, 12 Jan 2023 08:29:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1711759E;
 Thu, 12 Jan 2023 08:29:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH] hw/misc/sifive_u_otp: Remove the deprecated OTP config with
 '-drive if=none'
Date: Thu, 12 Jan 2023 09:29:51 +0100
Message-Id: <20230112082951.874492-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 08:30:05 -0000

'-drive if=none' is meant for configuring back-end devices only, so this
got marked as deprecated in QEMU 6.2. Users should now only use the new
way with '-drive if=pflash' instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst       | 6 ------
 docs/about/removed-features.rst | 7 +++++++
 hw/misc/sifive_u_otp.c          | 7 -------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 68d29642d7..bfe8148490 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -87,12 +87,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
 However, short-form booleans are deprecated and full explicit ``arg_name=on``
 form is preferred.
 
-``-drive if=none`` for the sifive_u OTP device (since 6.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Using ``-drive if=none`` to configure the OTP device of the sifive_u
-RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
-
 ``-no-hpet`` (since 8.0)
 ''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c918cabd1a..b1cb15f3d9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -422,6 +422,13 @@ the value is hexadecimal.  That is, '0x20M' should be written either as
 ``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
 respectively. The actual backend names should be used instead.
 
+``-drive if=none`` for the sifive_u OTP device (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Using ``-drive if=none`` to configure the OTP device of the sifive_u
+RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 6d7fdb040a..8965f5c22a 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -210,13 +210,6 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!dinfo) {
-        dinfo = drive_get(IF_NONE, 0, 0);
-        if (dinfo) {
-            warn_report("using \"-drive if=none\" for the OTP is deprecated, "
-                        "use \"-drive if=pflash\" instead.");
-        }
-    }
     if (dinfo) {
         int ret;
         uint64_t perm;
-- 
2.31.1


