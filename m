Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluX-0008Ic-F0
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluT-00089E-3u; Tue, 08 Dec 2020 17:56:41 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluQ-0004FJ-Dj; Tue, 08 Dec 2020 17:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468198; x=1639004198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ/IIk5KdshSCa6Fmwp0UBqjFWeip0nA/Om1IZzFIUI=;
 b=Ao2oF3IsL7KpTSFLkIUhHXDV+kXpHrqNpUTjiZ9jnThdH/IMg8xYZXZc
 Kn8fwXkTdHFAH3Wg0pSbd7QZ8N06uQhcVNlLCOx23+b/trT3iav4d2SHp
 E/TdbayPBP5aIqRX6q/geBsTgBGdX+1pX9lPRAApYl4ScHaVoDolxSKTR
 QFzy9TEZumTx63SQjBCdqOpJZGEVlB5knZDNxUBKbW9Ac8za7I1aM5Ivq
 ymmsM5GL1eCRj48+r04cHFBem9wzyDqBILs9jTFJtsQCdOuIP7FeQcRsJ
 o67nrbYnEfoqg6AeY70XIw3AuIIiEpR6YfYzWnJBCYvcx9iBk28+JdltR A==;
IronPort-SDR: /eMRE1CqSMvPFDRTRU/Sj0J0oMxndmU8LG5YXqxEaPJ4Wv32JWqyEnrXmamvxKBdwVxg5fnI0I
 8/i5QTHMdFdeMxRrUsPd5961zHfpsUlpwkLgnExO+yhPQNFpqPIIGiO/DWRry7eraW6wGicPQn
 Q2FgXiKWco53Uh6/ypitIPN55qW+5J/313m5rtksghez5xv8wsgon7E8fZbTiIPrNKWrUjtPud
 N5LfJTxbY5oN1Fd+FrZKtG3MPBGugJAGAqKG2wVJkOAjYnvmDirnDhKHHQPth1kpJTY4HrYbPn
 ZPk=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713828"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:36 +0800
IronPort-SDR: LVMctHY0GqXs1AP3DXzpid5BDS7zkhh2XQa1khfcexefk2/jS5NAP5vm7gRx9rg3yj2dF+NMyj
 bXrVEK0ikLtw+WWUqI2lTcpbrWveNNkKg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:03 -0800
IronPort-SDR: f37FOfNOm15KjScB3a9tFMbQlj7457ZfH25tJ01egJdjQ0tz9Ul3LNsWF1irmHix8aZGqJr11J
 bqdxKbRN21Bw==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:36 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 10/15] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
Date: Tue,  8 Dec 2020 14:56:36 -0800
Message-Id: <22761a83664e100f962532cfa82b25d1a0a89ba3.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:41 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9c064f3094..6339e84819 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -384,6 +384,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 
+bool riscv_cpu_is_32bit(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b..32a6916b8a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,6 +108,15 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
+bool riscv_cpu_is_32bit(CPURISCVState *env)
+{
+    if (env->misa & RV64) {
+        return false;
+    }
+
+    return true;
+}
+
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
-- 
2.29.2


