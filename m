Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhQJS-0001oY-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 01:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhQJQ-0001nw-Bg; Fri, 14 May 2021 01:24:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhQJO-0007Jh-SM; Fri, 14 May 2021 01:24:36 -0400
Received: by mail-ej1-x62b.google.com with SMTP id j14so1627208ejy.1;
 Thu, 13 May 2021 22:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nDAVwUVp0bRIy+WVyNpgD+i0qNly95gbWOd3bPz4lr0=;
 b=Anr12DHRyfexRdZhh9mypuKZtIZtAWrVh3mHI1Z0E43HYUo6bhXUUaDMPNVOKjgmDW
 Osz+Vq7GX9+vjVFBQv+QcZY6hwQfWsJLzIEiCUahJodHPmk3I/WR4M9yW2WKJHv8c3D7
 Pv6qgM9tEZX/yIQWlU+e94WDHAwHknn4m5pYvbSXdHX+/3LNI2YjD8EczNGrTz1V0Oo5
 9mHXGsEgNLsH0iN2tuoqT1IDmMvswGJcNTkeHEw/DSeAt9hsRaZ/GgtgsAhvp7l3AmiN
 JnHsPL9lQorZLgQdECVqlJUxluih0COoscODrUxhmuC2hw27yqeVFxkNHJBXfl4VUxEd
 8ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nDAVwUVp0bRIy+WVyNpgD+i0qNly95gbWOd3bPz4lr0=;
 b=frjZg6eX85ahIeEoGJGdqpf5MmM4oEZvmSq6R7Sc6G4pqr0I/oQPmPjjS4jLttHf1Z
 hb2JcJDHNR+7qMKXficZyrME3tqHjs+U/tai8zLOr1gRNfLCxg80u7hBLO9KqO469EAm
 wWBhuS+vpHqOzjt7auUWFKpfd6C+MqN3R11Q2mWxiovCdF9zfl5RobF/jY57mBPKxIGC
 /2zRX6/q7mHl7ydDhXf70FYRMoca0jCxQyUOCCR3GTAFMxSbGh2sMUJjOXq9khIo8CnE
 A9wzmecJ5pPUKV5JR/RMiQ3Ft/zaxXXag2LeFD9CRN4mz72U0krEDta6KCvXNchT0MPD
 ULzg==
X-Gm-Message-State: AOAM530xdTErfKDfg3MRwKoeGRqu3oVhhufO1yHRsUre6sNFeU+J9jNu
 rWuO81R045n7UjWWsZjxRV1upGF7L/cYLg==
X-Google-Smtp-Source: ABdhPJzTc3CsQV3qJYmamQZzUgyuekCZTNkd6Fte5mFlL3vuRXRIZ8revCAZOSHE0/apL6OirkpLYQ==
X-Received: by 2002:a17:906:d7a2:: with SMTP id
 pk2mr47158586ejb.551.1620969872681; 
 Thu, 13 May 2021 22:24:32 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id hz10sm1112297ejc.40.2021.05.13.22.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 22:24:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Remove unnecessary riscv_*_names[] declaration
Date: Fri, 14 May 2021 13:24:35 +0800
Message-Id: <20210514052435.2203156-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 14 May 2021 05:24:36 -0000

riscv_excp_names[] and riscv_intr_names[] are only referenced by
target/riscv/cpu.c locally.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/cpu.h | 2 --
 target/riscv/cpu.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca..adba2ff533 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -318,8 +318,6 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
 
 extern const char * const riscv_int_regnames[];
 extern const char * const riscv_fpr_regnames[];
-extern const char * const riscv_excp_names[];
-extern const char * const riscv_intr_names[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3191fd0082..7ee31f97a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -51,7 +51,7 @@ const char * const riscv_fpr_regnames[] = {
   "f30/ft10", "f31/ft11"
 };
 
-const char * const riscv_excp_names[] = {
+static const char * const riscv_excp_names[] = {
     "misaligned_fetch",
     "fault_fetch",
     "illegal_instruction",
@@ -78,7 +78,7 @@ const char * const riscv_excp_names[] = {
     "guest_store_page_fault",
 };
 
-const char * const riscv_intr_names[] = {
+static const char * const riscv_intr_names[] = {
     "u_software",
     "s_software",
     "vs_software",
-- 
2.25.1


