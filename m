Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtlE5-0004sy-05
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 01:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtlE1-0004jr-LH; Fri, 10 Jul 2020 01:05:29 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtlDz-0006KB-UM; Fri, 10 Jul 2020 01:05:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id w17so1752643ply.11;
 Thu, 09 Jul 2020 22:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+sSZG773h4PJo3uNRAiPhTPWUGznrWS+cAT1wW6ou90=;
 b=aqWFNJVhzz+gEhgsJD10o5vN1Gnk3SyK9W0RrS83H/i5RXHegQPA4eKL23pPACg5Ak
 QZzsK2WOrfKRxVK00tv03+bA5LWxxtt1g62pHPxMPbRHgMNxlsix6RFl3xe8JBVLsTzB
 7xfh5JOBKZLr/y2kkZkru02qZSsR2suz07dVQIAh2c4GuNsnG0FrQIrc9730JzWeVS0H
 xQ7Wp0sXlE3WKLTc9tUkfQmh5B/WLHQHO8s3clqdx6nU2BPV7csOTI6xN88z81OLdQKg
 Ct7jMuXQZBCbWqe0HhfXKF+CWMQgDJWgewkH+Hh/7FKxJBCO4MS9dYbsQVdWGCLIKwGP
 1yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+sSZG773h4PJo3uNRAiPhTPWUGznrWS+cAT1wW6ou90=;
 b=MdUZNA2vJ1TkZeyXx2ZlqDA/8/i+u7tgtAKAJS1O5Iknb/LRhAdRagXlWoptfAGl1K
 lCmYsHfC50aa5RJHkGR3nGwTKXgIweP0h9Ha7eoqvY1gtooQXv8axUHN9PZC2pXqe0vw
 kic60RbhxD0YhMTtGfPKRG+m8NE3jns5QT/H36lP5CTwCDZnO2r/In+K4L9Al10e27MU
 pq64Y4EoTU6tM7xPvt3/QWGvT/Q56JXDXUYtZBWIl+S8vZmIZ3zM45VWNYbBMeJ8KUE/
 reRLdFxKU4pZuzq2npGOw7tQn3TGddNlPQbaEWsdbFPYtCju4/yli756ci8v2IbBShex
 TsmQ==
X-Gm-Message-State: AOAM533PiLCLMhwUrFfOGV0N70JKg7zMzZ8urA4pp1xekpEWgaF/Hcnn
 1RAa+wjCDLYxRGiHwrGMozI=
X-Google-Smtp-Source: ABdhPJyTtyCsrgSv23llxpLlZCH2RcWKzSlBooReQ4wjyDUpYE75FwO9oUXDk8SfrruTZEjUDseKcQ==
X-Received: by 2002:a17:90a:1996:: with SMTP id
 22mr3777073pji.171.1594357526406; 
 Thu, 09 Jul 2020 22:05:26 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id g30sm4659175pfq.189.2020.07.09.22.05.25
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 09 Jul 2020 22:05:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 6/7] gitlab-ci/opensbi: Update GitLab CI to build generic
 platform
Date: Thu,  9 Jul 2020 22:04:58 -0700
Message-Id: <1594357499-29068-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
References: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 10 Jul 2020 05:05:30 -0000

From: Bin Meng <bin.meng@windriver.com>

This updates the GitLab CI opensbi job to build opensbi bios images
for the generic platform.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v3)

Changes in v3:
- Generate fw_dynamic images in the artifacts

Changes in v2:
- Include ELF images in the artifacts

 .gitlab-ci.d/opensbi.yml | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index dd051c0..fd9eed4 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -34,18 +34,14 @@ build-opensbi:
    when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
-   - pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
-   - pc-bios/opensbi-riscv32-virt-fw_jump.bin
-   - pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
-   - pc-bios/opensbi-riscv64-virt-fw_jump.bin
-   - opensbi32-virt-stdout.log
-   - opensbi32-virt-stderr.log
-   - opensbi64-virt-stdout.log
-   - opensbi64-virt-stderr.log
-   - opensbi32-sifive_u-stdout.log
-   - opensbi32-sifive_u-stderr.log
-   - opensbi64-sifive_u-stdout.log
-   - opensbi64-sifive_u-stderr.log
+   - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
+   - pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
+   - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
+   - pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
+   - opensbi32-generic-stdout.log
+   - opensbi32-generic-stderr.log
+   - opensbi64-generic-stdout.log
+   - opensbi64-generic-stderr.log
  image: $CI_REGISTRY_IMAGE:opensbi-cross-build
  variables:
    GIT_DEPTH: 3
@@ -54,10 +50,6 @@ build-opensbi:
  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
  - echo "=== Using ${JOBS} simultaneous jobs ==="
  - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi32-virt 2>&1 1>opensbi32-virt-stdout.log | tee -a opensbi32-virt-stderr.log >&2
+ - make -j${JOBS} -C roms opensbi32-generic 2>&1 1>opensbi32-generic-stdout.log | tee -a opensbi32-generic-stderr.log >&2
  - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi64-virt 2>&1 1>opensbi64-virt-stdout.log | tee -a opensbi64-virt-stderr.log >&2
- - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi32-sifive_u 2>&1 1>opensbi32-sifive_u-stdout.log | tee -a opensbi32-sifive_u-stderr.log >&2
- - make -j${JOBS} -C roms/opensbi clean
- - make -j${JOBS} -C roms opensbi64-sifive_u 2>&1 1>opensbi64-sifive_u-stdout.log | tee -a opensbi64-sifive_u-stderr.log >&2
+ - make -j${JOBS} -C roms opensbi64-generic 2>&1 1>opensbi64-generic-stdout.log | tee -a opensbi64-generic-stderr.log >&2
-- 
2.7.4


