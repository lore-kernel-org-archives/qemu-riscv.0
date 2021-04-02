Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ2b-0005uI-KR
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2Z-0005sO-Am; Fri, 02 Apr 2021 16:05:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ2W-0003dA-Um; Fri, 02 Apr 2021 16:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393908; x=1648929908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhT0DK0GNcAbbPFdD4caMB0KYD7yQ2fmMS8Nuohy/es=;
 b=UvGZxHvc8iCla8Zl/ng1xZnbQfuu+ZJgqMEny8hbOS8GD7MaZPQAH+6Y
 i5+ApyjFiXUPhs23DlkkrH4c+VmWnS8w5Kp+I6uFZH9r2+KGkWdftb/Le
 /64JG8L9uJOKXAD08GB1UyBOgENsjE4vWRkDR26wO7kYkVsItDhQOuIM2
 pA6pAGXnV3kgFtvsVYj0wSCJgG35hljLFi3+XHPHE5rWOaMTcEd/VEm8E
 7pgrzTd19/0Oxy16Ukr0QDCeW7+e2g/HjoNTzVr1r8uimJR9yi9aFGRF9
 o+0jUZ91T5PPNwybZiWHUXIU/ml0S3HKGQPA0nnVA4DAvg+/+uO3pjCeq g==;
IronPort-SDR: x6w6V3h2b5g366K0/b0YvBOHPBy1pox69qVR8LCgQzOpRh0v6Cn18lJkAnDJPD0EaaWdy6WDSA
 7DF5awm8sG0dZWukFU633PHyV+O3TSRCtxjzya2Y1HLDUdg56DubRhRcaBDjRHXd9SclIUB03h
 Ylx70NewH/hjbls6Dq6kmu/0noVTFh4dWJVtP3mNOVnOYOFdxEMOjAnrQ7v6ADk1R8xFOWlhCC
 tXiXOWs0wPn4T2PCYCsgU+oDZRpRv9OutCPK1VOi1yu9BHgh1Eh/ZbsB2shUtrPcU5dvvCN9Iw
 XHs=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163541904"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:52 +0800
IronPort-SDR: EBbV8LUALEbMNLx2w5pfFCBhCsmbA5rwYA2hJUndTR/4/hxxSxDTxyp2C0JYT5O6MC/ny+9bGI
 OmiB9muzQW8rjZUZVMR8J9XqAkBD3KIFxAu6BfseVFjKiImIthhuamgRGkAhyq0zw6EwqUugF8
 ZF4V6lWaV8liC/8Znq0nUyrIZzYyvLwERPhYOpbw77fTBYBTSrZs5YxYd+t6o9ktdxBi72eRW/
 HYzJmcECTfyO63EgDPrS0gEzTuWJZmb1OdZ+PDKCkC1ST9ISwS+AyO71qdPC7C7ucy9IidC2ui
 gJvzplf9J+chccCT9y52jFwh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:46:25 -0700
IronPort-SDR: wS9V65jRbcXfl1kNmR/bqoeQr3BVa+xVfhioR6CCU+P/i6XcvEAGHVaceVDM52yE72tbFbJGKX
 NZmYjEXcgcddf+EJWRklEe94BC6lBGUrboG4okha8d2SHzkbHo2wsH4EBMPdi4WCd+vIEy6WHP
 VoIyFrBZQPqiWtOJuIijdbuC77bLb+88EG3WkcEdOMIIMk4F3UPVHM9SnqHm0DjkggKgUm00Uf
 fqMM2hzCEAEU8pKcSvG+nxHpgCl4pZrK5O95S05nFjCjPeptIDXsJXJ7SveiuExPS7mVhRFVPn
 UUs=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 13:04:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 6/8] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Fri,  2 Apr 2021 16:02:49 -0400
Message-Id: <f9d643f4f0bf3b84aca49fb0373bb050f7d401a4.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
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
X-List-Received-Date: Fri, 02 Apr 2021 20:05:11 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
2.31.0


