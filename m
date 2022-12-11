Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4CpH-0003Wk-E8
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpF-0003Vj-SS; Sat, 10 Dec 2022 22:16:25 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpD-0007Xa-SY; Sat, 10 Dec 2022 22:16:25 -0500
X-QQ-mid: bizesmtp68t1670728125tbcamh0n
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:44 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: lQCFO6wruL6eFbBsEGJuOwVc+fTKO5lt2iJsnc9AqFhrWujrdA83BML9Gfiqy
 npl+xFTbkX/LqeW/Z5lg67pXP1PsXPIEqTcBkov3da/e30mHAEEeNFcT3s6Wclc1UgyLLqx
 HxOMWMDqDs79H6mqiuUwB6OcZr+PBzMxPmH7lKI/QMnYlnoVnLy+z5DaNObJRfIS7dLDK+d
 NhIFYtyhQQ1+JUu22I1IApLYGnfg0tnunf+iFKfrXJK29iGoXaWZehyWmErfFAFU1p9jcOc
 mOK08KWRwePCPWCDmIa98YMaroKrMQh9QRUKzaSe+9v/YntVQKtzrjOJaUD8XLLliO3U1lq
 eSFozHlTqSq4arZo7PTaSlRcDuMaJvQK8u7hFc2
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 06/16] hw/intc: sifive_plic: Drop PLICMode_H
Date: Sun, 11 Dec 2022 11:08:19 +0800
Message-Id: <20221211030829.802437-6-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:26 -0000

H-mode has been removed since priv spec 1.10. Drop it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/intc/sifive_plic.h | 1 -
 hw/intc/sifive_plic.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
index 134cf39a96..d3f45ec248 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -33,7 +33,6 @@ DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
 typedef enum PLICMode {
     PLICMode_U,
     PLICMode_S,
-    PLICMode_H,
     PLICMode_M
 } PLICMode;
 
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 0c7696520d..936dcf74bc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -42,7 +42,6 @@ static PLICMode char_to_mode(char c)
     switch (c) {
     case 'U': return PLICMode_U;
     case 'S': return PLICMode_S;
-    case 'H': return PLICMode_H;
     case 'M': return PLICMode_M;
     default:
         error_report("plic: invalid mode '%c'", c);
-- 
2.34.1


