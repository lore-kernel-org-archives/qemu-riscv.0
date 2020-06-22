Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jnG1o-0006lg-3Q
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jun 2020 02:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnG1k-0006c3-Hi; Mon, 22 Jun 2020 02:33:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnG1h-0007vc-MT; Mon, 22 Jun 2020 02:33:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id x16so4555894wmj.1;
 Sun, 21 Jun 2020 23:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Bf9mVslhR8Md1AJAa172xTX30v7Z4QWEBUyTeFfWAU4=;
 b=p0o12OZ3EJiu6TbgQNLrR89eYluwfA5iYe5EVxpVWp5PoX+ENaVbloaFOH/ESk+ul5
 3s1GZDgFlPG+T9BSqFjkB1rSpEkPizbxKXOgm7xrepZcZ6MyMQCTh3ainRrVCu0Z3LrH
 uR3l1CqNXfrma7+Mu62sQ0rgLddzOEQkQeOFbBOQiXBBCxsQRzSTFzhmmTw5GXk58OFh
 9+YpBgxhkRHzM+r1FXSBdEHP2rm2A1hYp2Fcs2z8giI5/n61Pa2xF/oPXu0W+41aVNts
 AcCkVNy9tWixPgLos05n43UZDBEQaIGSk9W1PfP+NTXmow8pbrnALXULBJzaDB//B+RW
 D67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Bf9mVslhR8Md1AJAa172xTX30v7Z4QWEBUyTeFfWAU4=;
 b=XN0kNOxEGYxkZ8PRBjXJpZOAvybuWY/UCOYYkJMgRx+2xaJcb5OhgAan+CW27ev00i
 ING4ZUeOe+yM6RVIni3x2lNSpo+arRXm3Pb+w/KvpvBJPSoeBCbcXYpgRFcebrq94ou2
 TgzPcSQCi+usO/4Hr5UWgUUhJ6M1IlRfgtiKN8/ls0akyD61tiRjYv/flDbJsSPXRW9a
 LRAp6WKF2EOljldqOLH5Ust9O9W40RLuU+xIb6tBbteYvC6Tj/WZSYkacNUkVlLg2T/m
 OLNeU9ur3eOakYHZZOaZY+vcejZsM2+AiMcouH7Z3xHWLXgbmq+Vwyw8gdW4ZMqvHcpt
 SfvQ==
X-Gm-Message-State: AOAM533joqQ8KSEWDKK+lIhtxKD40JlaeQ1PvWM1bPbVW2lSo2cfXUSS
 gN/W9C1GsVnrcJzkTPhxscs=
X-Google-Smtp-Source: ABdhPJxrsHGxPd8Eu7eA08bYb8E62OX07e+JeAE7oc1K80El8Keyw9+g/JLO423rBAqcv3z+/bpFjw==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr5242721wmi.19.1592807627832; 
 Sun, 21 Jun 2020 23:33:47 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id a10sm16684240wrm.21.2020.06.21.23.33.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 21 Jun 2020 23:33:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 6/7] gitlab-ci/opensbi: Update GitLab CI to build generic
 platform
Date: Sun, 21 Jun 2020 23:33:23 -0700
Message-Id: <1592807604-20805-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
References: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 22 Jun 2020 06:33:57 -0000

From: Bin Meng <bin.meng@windriver.com>

This updates the GitLab CI opensbi job to build opensbi bios images
for the generic platform.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>

---

Changes in v2:
- Include ELF images in the artifacts

 .gitlab-ci.d/opensbi.yml | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index dd051c0..23e2fe4 100644
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
+   - pc-bios/opensbi-riscv32-generic-fw_jump.bin
+   - pc-bios/opensbi-riscv32-generic-fw_jump.elf
+   - pc-bios/opensbi-riscv64-generic-fw_jump.bin
+   - pc-bios/opensbi-riscv64-generic-fw_jump.elf
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


