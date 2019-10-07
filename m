Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHNxd-0000Ft-CZ
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 04:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dayeol@berkeley.edu>) id 1iHLZL-0004TA-TN
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 01:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dayeol@berkeley.edu>) id 1iHLZI-0001DH-6o
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 01:28:26 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:38558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dayeol@berkeley.edu>) id 1iHLZG-000189-K0
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 01:28:24 -0400
Received: by mail-qt1-x843.google.com with SMTP id j31so17532454qta.5
 for <qemu-riscv@nongnu.org>; Sun, 06 Oct 2019 22:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rr3IprOX7AO10O0bgWlRAZKUNbbkrLFaHkwJpmsGJ1g=;
 b=yUzZV1ZZonu0IV2QjRwfg62rBkuA5fykVYUIG5pgA1My17z4dvaXCC6ZEKuKX6+0SJ
 lFzKoT9PIOITxYuTSSSU6bORNIioAk8cgR2U85p6IGo3YQXAaCwCR94bD8u253XAu5Xb
 nTW7oR/rHWwwGSK1mPB8sDhjR3AH8g/eqg4QRvKnVc6Y5jvWQ23jPjqLn6akHZSFvuA2
 +UH3UTKBvOZWMC5XFrCizjJMQ2CK1kItRiMIwmDTpI4XCGNEyse58Ut6wM6AtV8XxhnP
 NuM3qYbUECEVC3TMmpeGqnYwOortKmoAXnHQyQv0ie7ju43N20Jmik9puYHTe75ehNdn
 0F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rr3IprOX7AO10O0bgWlRAZKUNbbkrLFaHkwJpmsGJ1g=;
 b=Jqw7minYuz5T8IiLpAxmSPptQ/5I34ZahB4uTP3ferNe7mDOZtkTwI9p2yiC8AMac7
 LmkV5YlBTh5bicK0zFb64oMi1SKMAxul42l7mCV8bECop9w5EhVuPxAg6/BLU2OrvWar
 N2Eo4TuyYIMbXp9PdHF/JnKu5bImHK8ywL9XN79kgqTHmEC7KItCU+z84kkOXHRgCr8k
 B7UWug2XKu4ld/DqpkLN9ReoKuxpzWh7lGxaGr2I1b6+TaR07Adjz2PDjdoQHONBeWzz
 KFjuKYgnhVYr9SN34zAmgUCUJz5kjQpOrO2CfwJvRIgMtVH8vssWmOihiKN4Wnlb6BOH
 H/9Q==
X-Gm-Message-State: APjAAAWcYQZ6B0KG9kKmUVKseFrYe2oPX53esXvWxRZ7K+UU+dodUVzt
 S1hSxNqCan0AakmtzBz/hufOYw==
X-Google-Smtp-Source: APXvYqz7oompv1PkWuor1GOd0uwy3WSIQk59nDPqLP94kJKcHzyyKBOKp6d9IAfYtcJnf61rEHh1Ng==
X-Received: by 2002:ac8:f1c:: with SMTP id e28mr27645328qtk.161.1570426101169; 
 Sun, 06 Oct 2019 22:28:21 -0700 (PDT)
Received: from ip-172-31-33-50.ec2.internal
 (ec2-34-206-44-154.compute-1.amazonaws.com. [34.206.44.154])
 by smtp.gmail.com with ESMTPSA id p7sm7188080qkc.21.2019.10.06.22.28.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 06 Oct 2019 22:28:20 -0700 (PDT)
From: Dayeol Lee <dayeol@berkeley.edu>
To: qemu-devel@nongnu.org
Cc: Dayeol Lee <dayeol@berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: PMP violation due to wrong size parameter
Date: Mon,  7 Oct 2019 05:28:13 +0000
Message-Id: <20191007052813.25814-1-dayeol@berkeley.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
X-Mailman-Approved-At: Mon, 07 Oct 2019 04:01:40 -0400
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
X-List-Received-Date: Mon, 07 Oct 2019 05:28:30 -0000

riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
using pmp_hart_has_privs().
However, the size passed from tlb_fill(), which is called by
get_page_addr_code(), is always a hard-coded value 0.
This causes a false PMP violation if the instruction presents on a
PMP boundary.

In order to fix, simply correct the size to 4 if the access_type is
MMU_INST_FETCH.

Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
---
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f32..386c80e764 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,6 +88,7 @@ enum {
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
+#define RISCV_INSN_LENGTH 4
 
 typedef struct CPURISCVState CPURISCVState;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e32b6126af..877e89dbf2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -441,6 +441,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPURISCVState *env = &cpu->env;
     hwaddr pa = 0;
     int prot;
+    int pmp_size = 0;
     bool pmp_violation = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
@@ -460,9 +461,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   "%s address=%" VADDR_PRIx " ret %d physical " TARGET_FMT_plx
                   " prot %d\n", __func__, address, ret, pa, prot);
 
+    if (access_type == MMU_INST_FETCH) {
+      pmp_size = RISCV_INSN_LENGTH;
+    } else {
+      pmp_size = size;
+    }
+
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
+        !pmp_hart_has_privs(env, pa, pmp_size, 1 << access_type, mode)) {
         ret = TRANSLATE_PMP_FAIL;
     }
     if (ret == TRANSLATE_PMP_FAIL) {
-- 
2.20.1


