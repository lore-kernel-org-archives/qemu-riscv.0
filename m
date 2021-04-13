Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSYK-0007qZ-KL
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYG-0007ld-Mc; Tue, 13 Apr 2021 19:34:36 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYD-0004MW-BA; Tue, 13 Apr 2021 19:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356873; x=1649892873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIWpVKitxhWhhhwH+X/wZy5fnfmgSYQiKdEBZGqaiNA=;
 b=KaD5rYM6LBfEbQJEwccg1ASchqKTbGyApv+kE3eGTptrcbNH1934zWfe
 iQop0HF1KPZgxhjmGMUrrk68x9WQZrAGs1Ra1NQV3Fg676J10phiog+gb
 pIVwy9lpXp6GgBMdBt7n0/GOkEp/Jx+noQZqO7GhLdD8rIU4VwBRoqyIC
 zZLt+QH1fvysTBO48wOzYt5GRxv1KGt+a7qVrH5qMdwQw7qHIyjjr2UHp
 wxZt4w2O7AzznSpiOBN/hQ28HazyEXbOvOm1TbQEQNvVT+6tzL3klK50q
 Ol3KiLCupvrDBQMptRAx6LDxdNrZfkV8Z7iNR//iDyI5wJg5qVfII5Hd6 Q==;
IronPort-SDR: vHMYXcrQL/vlmaBXWaDtYJE2aYSXQlSZ50JrpnVlb8ROVEImCrHV9JOYH5iR+5sQyj+5ACYnSK
 pad7XFk9eTO7WFyqTsdQtA7ocd/NIZ4cswmKDjG3qdP6P1/yk4/IX1YivhG8QJr8eFO6I71MPD
 LV6muTw8xdKO/cSPFE/0Xf0aRNrksBoEzR8wQ80lWFaI4CZIErc2MlP/CyEsnWBGxt+WnVh7jE
 ycpXkPv+yV1sZCF5sEskbjHiRMOlv59gy7mNHYNIeBwqdRjSbywYw61OtuV5aU9y07KFQXkW/f
 2T4=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164258304"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:34:20 +0800
IronPort-SDR: fAyUWhuF3h9d02N3Bug3tTWJCfXdvefcG6+gIEVROPloEgu3NBYwwqWUWmgl44Q/d6YFdrKF0W
 bxopSLBaj2vvAjEyxZFG+9XBker/tGRFqzZtSLKfko8UKJfNqvRHmJfY6vwk1C+60jM+jIdrVC
 P1HXPSyhzpxXzGix1WbUTDqj9JWbC6lz5BExMhLoAeq/QTHgW2+gwdvYX5kcMEkw4b2AYfktg2
 nSeMp+wsEbGXDQ8XkKon7FrYO/e5oDViGD+bGPASV8e8UF5dhN2kDPw7aSpWIQHPRfSLCTrqQa
 78zKuf4pljbiND1WYiClPCSF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:15:17 -0700
IronPort-SDR: 6J6CL5pPI8iooStPrM61ULIuQca0NOWNeisOAD6oAoQEWYsUL2PkAqOjNIcuuem+hAiZfE5K3x
 N8BZV8lLs4ska6b0m7eK6Fct3qPCS9i5T0Kbc5pM9HOOptYRIzO7N28iDXDtAxfNRKFafGpLhO
 eeJ4m6f8jrxS1ImYnxcW9SusadBy8yLNTImlPGNUGuBG0Rrwc7c96HBzxWoTCCqt34LRkojAsv
 AKGJXRo5reBH4VHV50ezdeMBJTIFcUoUAeS4oMzSWg6prHOU+AK7Vg/pkexRjsNcsx+K8bM5y9
 7K0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:34:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 6/9] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Wed, 14 Apr 2021 09:34:09 +1000
Message-Id: <712a346091f1559c50c7f9b334a8dec728cfa2bd.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 23:34:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6a816ce9c2..9f6fbe3dc5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -416,12 +416,6 @@
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
 
-#if defined(TARGET_RISCV32)
-#define HSTATUS_WPRI HSTATUS32_WPRI
-#elif defined(TARGET_RISCV64)
-#define HSTATUS_WPRI HSTATUS64_WPRI
-#endif
-
 #define HCOUNTEREN_CY        (1 << 0)
 #define HCOUNTEREN_TM        (1 << 1)
 #define HCOUNTEREN_IR        (1 << 2)
-- 
2.31.1


