Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJAK-0004Wi-O3
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJAI-0004S5-3E; Fri, 02 Apr 2021 08:44:42 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJAD-0001u3-Qy; Fri, 02 Apr 2021 08:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367479; x=1648903479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uecuS9K8C0ccA/9w1say4RsflDfzOigWK8yy3hE5m5E=;
 b=fT2aqFh0NrdXyjrzi0AsoMdkQS6Bfwtb3xvCD2jN9cc4YebMky1e6u7V
 och/MO4cs0khjQ8qc8V/eouIDFkFUXTCPp0CP7pKglJlhHf5pmUvImgdf
 PUYRjlehWJHYMU2F4NDMfUF7M8o0xofGJacnJc1puBnquz3oaYXjqJyW5
 I7S/3E3RCL0mKOa4ALpfC5aJCMNrWXdmAX2FiZRU7nHjByzteaYEQSq2n
 2i5h8JjhZNyzXOrRAvFQ0j/vg+BX7rCjZDFLfxJkT7dqLm1+JxXHoz0xB
 vtFw9bVj48W8YY7BaVFuYLt50YjhIXSYtyyDKzUjSjGoOGoNNM3yZdiDh A==;
IronPort-SDR: r6iS1o9AOzBfv47QmOPqeDXhkcPF674QasUio4bD4eW2QYWZ8Goa98UItpdY+Gc0n7XfdRxLjr
 LNyYV/BZrGVkr82beaqB/Ocm09Y0HeIDrjd+2c7VotQTteJDJi+0fd5hkl0NlhfOIh5gak2OoZ
 12EWfksXseSbmOz+H519XqYpZSIm9V0gRxQuDjhJz595gzpBfYaFzfE6e2De0UaKOfh+X9fEoC
 ttbCbvQ3pXeoJBqB0v2W4N55Q5wiNxRmm1vzzo8S2kIUNBjsWUcS2e/ufAroWUi6R9bzlpSKH2
 AyU=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="268041570"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:44:09 +0800
IronPort-SDR: ffSqjRVRRx7jw4ZIMtyg0NtpzLLVkdLRf61SdfUmlZKTEsWGtP01Pu8q7q6w94c1RQcOKXQ2QH
 VcYu51yJoN3ItbwrrYCG/PIhD2YW04TWioTLWkmqJxEkfy/+raO/hhdnI+kI3h1UhlNLh53A5u
 ByL1xJ6ki5PCytY+whLYVgb3JpGcQ4LKnbgGa+4Dqh/1Bwbey5QEx3BxTkK1WeY+47H7hjA9Ld
 gncfw62A1n17yRIbh7yPCyNtPSyouu7iIrFe7IPj1/o1jBj6ttYpXWDgnBK8Ul9iQUviprlzR1
 08n15hBpLtpDYocXTXJXKUY+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:25:48 -0700
IronPort-SDR: vUgwfsZJY8Ggz8ZIm/mo7QLdmJ6omS+JUYHkzTdWgcsAT1yqc4uMLLu5cEsvGMG4QpRpbTp165
 nhKkNpomIjEtTlSLGmOwj/hqr9yigPbtB3H7aZ5n8w3TrYaWzbrzuhBQWPO2HDhZWkPf+INcBS
 xvkI/lFLTIkhHYvARc6B55DZWvy0DeUG4FDL+hAaQjWbC39bBa1YmS6NF3eXqBAsAEPFb2FPCz
 GdnXu7lrp0gHAkC+AK625aInZqDaxeAyYQ6sEwmNyCIh1K+QS2xc6Juf6b8HeLIyQaEa7wzkew
 bgg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 05:44:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] hw/riscv: Enalbe VIRTIO_VGA for RISC-V virt machine
Date: Fri,  2 Apr 2021 08:42:12 -0400
Message-Id: <7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 12:44:42 -0000

imply VIRTIO_VGA for the virt machine, this fixes the following error
when specifying `-vga virtio` as a command line argument:

qemu-system-riscv64: Virtio VGA not available

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1de18cdcf1..9dc1e7c244 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -22,6 +22,7 @@ config OPENTITAN
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
+    imply VIRTIO_VGA
     imply TEST_DEVICES
     select GOLDFISH_RTC
     select MSI_NONBROKEN
-- 
2.31.0


