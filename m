Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZMrz-0004Cn-9U
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jun 2019 17:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47685)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMru-00042S-RL
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:57:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMrt-0001jN-GM
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 17:57:50 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=0547f94d1=alistair.francis@wdc.com>)
 id 1hZMrp-0001Ty-ES; Fri, 07 Jun 2019 17:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1559944666; x=1591480666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ao9gCKvSoFwU8QM28M/2smcm/7HnPQ04kDU0bSYTT4c=;
 b=Y3U9ukP2mCWUjZiHZPafZugfGp63ExirFKwN7XryEiHjQLuOh/snYfAK
 LFwtnOrxDUft4Y8oDQzp3GpfuKfPug6TMNtEsj2HVfrkr+fqsDzySLY1i
 PNMu+/x3i/lweqd0HspKmrs+6Z3ytMAclAcO8toe7/UnffUJMveYoUdIL
 15Fuz9kJDbD+VxXXyPfjtgmxO9u5jWRps/lb+UYbYRjkxcvLL96LWV5Kp
 oEHhGT3ZWamMsjVbwZBIToj0X9hzeqzMyrWmQn8mpM/Hrsp/z5juYpMq0
 N2DKqYaPGSGJQcb2CU0ktZt2JIhueu8ihhGo3cWNs4imLR9cmGEjfFzGE A==;
X-IronPort-AV: E=Sophos;i="5.63,564,1557158400"; d="scan'208";a="115014074"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2019 05:57:35 +0800
IronPort-SDR: wNDbZ17nImoEN6JiXEAFRCEp1mLryFaW5Rcvu1F0u7RraM/g5mUXx1VbT5kEDtYbClukBsZlYM
 HI7HuAlMGfgFIkiZtBpAAN/x6Roon3EeX8TSZ2XwVe8YrfUTEdU5ylTOFLw6q8TpWphzwQiypp
 +FziAFTDc7Gg/1oALn5KCsl9IlhSaMiFf2YWgOqQUo0kX2P5pG+dmPHg/eibPzFmXnWG8SZH+B
 G0qZ130mwgYJHXyQhIq3CuEf8QaC3KDOdpnm6FjioIvsgrJNihDg8dD7/mtdeeWIPfIl+9EW3A
 f5Smuwir3JnXVvEh50NXasoO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 07 Jun 2019 14:34:50 -0700
IronPort-SDR: L3+iLm/r5o0XqAWrLkYvg+PLgrcIsCDSYTOmu69AZ03dbRbjwBk4M3Xmg2nKTatU0owbcR4C7p
 Lr8loeVLldljElXEpLz9Az/6GJJ7C2hcHXszxF7WKkIvuI4qCiVoTHQbKn8lacSI+drKMW+PKV
 rg6i6KitewcptUgHu4tCvhRw9TFJ35IfWodcAvK45VMeJVTpTL/Ie+txDaMOOwURu2XA2kUSpb
 JutCMIKlXAl+fnFlJj1K4Bu6jvGp65rb4JqaubjIzvlyMWOZL7VV3KSW2XOIn10JzDo6E6l1v+
 ezA=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2019 14:57:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri,  7 Jun 2019 14:55:24 -0700
Message-Id: <76631304f89487485c4b745f601796f1e1f70e41.1559944445.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559944445.git.alistair.francis@wdc.com>
References: <cover.1559944445.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 02/27] target/riscv: Add the Hypervisor
 extension
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
X-List-Received-Date: Fri, 07 Jun 2019 21:57:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8937bda918..3337d1aef3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
+#define RVH RV('H')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
-- 
2.21.0


