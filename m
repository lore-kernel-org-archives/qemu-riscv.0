Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okJ2F-00053P-Ax
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 01:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ1n-0004z3-6l
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:51:14 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:9654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ1l-0002L5-IR
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665985865; x=1697521865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zFLMnHdeWGesZyvBbsBwbJgj9esHPllX/QUB1wEyYg=;
 b=rvX2FuKAMDKIYA2LTIAtxlCzjzq5afyYRzudd2023C3YRYRrSHr0wzwE
 JkB34Cy1+aVGZRZUt0O2UuRQwMaQNzXf8F+8SqZ7OkI875a5wmOncM7aR
 5diVSZz49PYK5X9e+BZsmDRYBaSi/bdKY/Y2FTv5Xa20ld7LsZmO4snGA
 Qz/Gz9NwnvVbXJFIrYBQPvHNM13ipDNYHK2Se8SwNreP7wMZCO6PM6VN9
 XZAS40KjDcfYjPq0v4t1Nv4GSeovU6/3KwNBsgXt5r9VT0yoHqycvI7uj
 ZIE48bGrsKc+zuWi0v3AkOi+nRrAGX+pyXjTGTN70Jm/GbNq3ffI2IGiq w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="326095578"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:51:00 +0800
IronPort-SDR: fyEEqtwf0K6gRa1eKvk9hdg0876Eem3Ddf6Ta/U8B7+Jq3xhtcNwmKlPAClFWcAveVctrllzi4
 9w4wX7EcsZ7V3NVKrSBXYMqAh5Sx8RBVikpKtleRZDWsU4OZB2UIBuNUifGcu3OsKNhDDwLTSE
 TelRrAI+9l5RspWJxXR9VmDw4Pf+ItNZOgWCdD0FqK4HDd4qGPtsTEOmtLA0xg4Q4b63RrGzIC
 56mnIWPszWl5myHJEYY6VY7rOwzx0PpRB+CNmCM0DtundBEne5sz3y7SPA333PSnwhrqIhQ3aP
 LNz94A89908Qm54jmLLscrt4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:10:33 -0700
IronPort-SDR: WKCXC5MbFtTdsLsewMOUUMsQKxuS21iDYJHeh5rZ6/5F8Xz/RKe1gHk7Bi8ABQ+aZXUjOkQIvI
 P0rJ15M+DkahV+egQhQZdw6uDS2O6CH1Z1iyZEQUOmmlgYGjrNqMIwXt30hMXfDIJpicryYj5L
 IAEN5X6AnJSRH/DqzHGAhNipsoHTCcBWoN5i/9PWxZw4chH4vylY6IA+yv5dfy5Q5lpSTdJr1r
 WiViWjl9K3gPxkZ69fb6m+6nBJOaseXew1TLMNva0WoSbPihe7Zc/29Zed6BMuA6Wo961Y5/Bh
 4BE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:51:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrR1b42fVz1Rwrq
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 22:50:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665985859; x=1668577860; bh=7zFLMnHdeWGesZyvBb
 sBwbJgj9esHPllX/QUB1wEyYg=; b=CRWIaK5lzHohje7wVOQEBw7qH0cWxYox7T
 APgxKmGtegRUZkkg0RaRxb3Wr9e0IFt9tW7AV5epebqjRrAolpoZia5KdLPW8dXc
 mvQjFEMdCRDys4uIbGaKdedwm9ec38dLHdegMjn1Tdq0qXU8/p4RbBR8ZBrpDeAs
 n/S2+BG+wBVBgQIrhEoBf0iNUaSb0oBNpPCYlEe4LgNSt8WE+BvcRXS/nKu//o5Y
 X1xXKgqoQuluQkf4ghyU0jeXdK3r36HDgT1E1cJLb2aXlyvQc4JTF8ZT+u+OkCwG
 vfLGSX2jvvni+ArmmouL8Kw5dmLsWWSEmo+mwjZjs64FwfnJd+IA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uU2zaRsPZrnt for <qemu-riscv@nongnu.org>;
 Sun, 16 Oct 2022 22:50:59 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.69])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrR1X6jXRz1RvLy;
 Sun, 16 Oct 2022 22:50:56 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 1/2] hw/registerfields: add `FIELDx_1CLEAR()` macro
Date: Mon, 17 Oct 2022 15:49:51 +1000
Message-Id: <20221017054950.317584-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
References: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=282226d84=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 17 Oct 2022 05:51:15 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds a helper macro that implements the register `w1c`
functionality.

Ex:
  uint32_t data =3D FIELD32_1CLEAR(val, REG, FIELD);

If ANY bits of the specified `FIELD` is set
then the respective field is cleared and returned to `data`.

If the field is cleared (0), then no change and
val is returned.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/registerfields.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 1330ca77de..0b8404c2f7 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -115,6 +115,28 @@
                   R_ ## reg ## _ ## field ## _LENGTH, _v.v);            =
  \
     _d; })
=20
+/*
+ * Clear the specified field in storage if
+ * any field bits are set, else no changes made. Implements
+ * single/multi-bit `w1c`
+ *
+ */
+#define FIELD8_1CLEAR(storage, reg, field)                              =
  \
+    (FIELD_EX8(storage, reg, field) ?                                   =
  \
+    FIELD_DP8(storage, reg, field, 0x00) : storage)
+
+#define FIELD16_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX16(storage, reg, field) ?                                  =
  \
+    FIELD_DP16(storage, reg, field, 0x00) : storage)
+
+#define FIELD32_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX32(storage, reg, field) ?                                  =
  \
+    FIELD_DP32(storage, reg, field, 0x00) : storage)
+
+#define FIELD64_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX64(storage, reg, field) ?                                  =
  \
+    FIELD_DP64(storage, reg, field, 0x00) : storage)
+
 #define FIELD_SDP8(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
         signed int v:R_ ## reg ## _ ## field ## _LENGTH;                =
  \
--=20
2.37.3


