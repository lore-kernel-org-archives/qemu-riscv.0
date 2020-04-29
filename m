Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTraD-0008OG-IP
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 14:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra7-0008B4-92
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra4-0003Ri-Kc
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:14 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra4-0003PZ-0V; Wed, 29 Apr 2020 14:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588185432; x=1619721432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XLpDvnqj9bkxM9N2CIUAMQTvObl1PtMILsBu24h494E=;
 b=je0Xkv9ViJ/uVmeZlI3wtclSsHDidhQnSOyxoM7SFOkMZMmqsxdpFq1/
 ZvadbW+9pNZfXktLRgdcW9zfWTo/udDY1NHkikhk1At50uVEsSlQBZLsE
 Ni1iD7QBzHvJhWOUiRsaBsqSpvJq8LC1jMXJeV0z8HrFXxdPWiiKhLpw1
 hTJ4GGBKgBwNPqPhIR6aM+wYcoYL6cgeEAtjpjI6DgUH5vVoks94MBVtC
 HbP+ybhtWqhmtrLRp9L6qayZgjxfpAwAUCxJR1DBz+u15zXAmHALLn4PH
 eoH7Y2P+O1idWoXikSDlNGl7rFvSsvZxKSuUU16yy2giyuUKIckLRkt/2 w==;
IronPort-SDR: 8ae9a7ukD/32AfHjJHy8JPinavPAZbi2IHaNK2UfJhQOWYQxMiwijlgleEZBRFiqWqt0ZvzUp6
 X6w0NiTldYqNiGZPBtKWHmOTdCebNt1ZDSEqRA3zUNVzhp6k5bRMwaexBjDfjF+q87xvmBIIH9
 fNZmOtr/Yi+9rraYN8jA/aQOZFF5n4PkIhaaVloMQS51RsvF+sMufUZ3KC7OcLxcI1tHf9FNFE
 Kx7iM2LPGGwtbozmCD+ZZK94rXsb0mqp5yacnHfjfsAxkpGBCWWllDTU2mgtHlwJedMDbUBt65
 MiQ=
X-IronPort-AV: E=Sophos;i="5.73,332,1583164800"; d="scan'208";a="137935137"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 02:37:05 +0800
IronPort-SDR: PNxSYnsoDEkEDFpxnLHip78/qRSSJJTHgfjco9gMG8ybw7Dhgp2oSmHCkX8RIs+QNfbUurzaOW
 cYv1Daw2S/baYaBzWjMXkyxtkUyKn3suY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 11:27:09 -0700
IronPort-SDR: qvNtRoU4NEt4HH3UQ+Y4pS6N1/+TYSKNXajx5zJt6+slGiJJm2P7kSrWF606wuPdEI0TJ+5SCI
 0lJf6+1O5YOg==
WDCIronportException: Internal
Received: from cnf007834.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.55.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 11:37:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL 04/14] riscv: Don't use stage-2 PTE lookup protection flags
Date: Wed, 29 Apr 2020 11:28:46 -0700
Message-Id: <20200429182856.2588202-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429182856.2588202-1-alistair.francis@wdc.com>
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 14:37:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Wed, 29 Apr 2020 18:37:18 -0000

When doing the fist of a two stage lookup (Hypervisor extensions) don't
set the current protection flags from the second stage lookup of the
base address PTE.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Anup Patel <anup@brainfault.org>
Message-id: 931db85d6890ed4bc2b527fd1011197cd28299aa.1585262586.git.alistair.francis@wdc.com
Message-Id: <931db85d6890ed4bc2b527fd1011197cd28299aa.1585262586.git.alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d3ba9efb02..f36d184b7b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -452,10 +452,11 @@ restart:
         hwaddr pte_addr;
 
         if (two_stage && first_stage) {
+            int vbase_prot;
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, prot, base, access_type,
+            get_physical_address(env, &vbase, &vbase_prot, base, access_type,
                                  mmu_idx, false, true);
 
             pte_addr = vbase + idx * ptesize;
-- 
2.26.2


