Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrCDY-00084f-EH
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 23:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDW-0007xx-3D; Thu, 02 Jul 2020 23:18:22 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDU-0005yp-G2; Thu, 02 Jul 2020 23:18:21 -0400
Received: by mail-pj1-x1044.google.com with SMTP id gc9so6788754pjb.2;
 Thu, 02 Jul 2020 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FHxzME0xB/Yw3bpOZX+sLJnsNxFJLes+z+gFlz3zmZg=;
 b=sbk/6sAqZ/c9C82+xhYA9yrNsOgImATuICobZAya9l4yNgQwFAEFj8hC+9X3xLB0GC
 LO1sS/66AD8w+Qg/p4e0sVVr9zvWQT+9vDjctLNvX3eCVPfxp18syOvGXu3toMvZJM07
 YIB9Un5bybDO1iLPNsONudk2svAxogQZUs0IWXV0RG3xcs1W0bfqyjfq7GOh6hto/+vO
 G1C5jPkun7ZDyG/LaO2HcY6PXJVlePFPwHwimyLagCl6P+qH0xEboTzif3VFXk/k97lo
 HcciOwbhYdbJ0HD+ANaBBXOu7aYnWkhB/EueI3+8qOXRMgmmpMizjrXa4Ri6RpfS0Aws
 h2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FHxzME0xB/Yw3bpOZX+sLJnsNxFJLes+z+gFlz3zmZg=;
 b=nUVu0OD9uBhpdf0W5epmLZjoVBEBWzS1Ur2anw39tbGglNMq7r7BBVS91Q0px+ex/h
 x/PqnYyTD+rFbxmB/DPWcIa/a+S5RGE3b2ety4s88SRpq58evIr+l1Zgdypi6TK2Weub
 wwWLGmN8QKbFrr6aVMOa2qTpH4ecYPJm3StP2I8oWmofiH28WO0iHap8cKh5fmF0Y+zP
 9rgev6Q+om485kFsw6xVdcOUlqZkx6bILG7XTRKU1xHIfg6VJx59tJwYh8w4vGIFQ+rE
 B0naVkx0Q0nfF/+NdvIyltHATO40mB910paAimK3i/futhNmMW1uc6h0XRc17nFmUxkj
 aR3w==
X-Gm-Message-State: AOAM532v/Hb56A8K9ofxh/gwXtNmQ7W8O1otL3m7HkCzkOQt3p7aWaHK
 Z90Pyhv1gR1ToWUW29Tkdfs=
X-Google-Smtp-Source: ABdhPJwSiTT8BmMF191nR0DVaJ2dPd/aMTqVECqdPsdkmETKBfVJW3M+RgnH7odM0E7neVtyKIoaFg==
X-Received: by 2002:a17:90a:cc0f:: with SMTP id
 b15mr31473035pju.83.1593746298908; 
 Thu, 02 Jul 2020 20:18:18 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id c12sm10165745pfn.162.2020.07.02.20.18.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 02 Jul 2020 20:18:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 6/7] gitlab-ci/opensbi: Update GitLab CI to build generic
 platform
Date: Thu,  2 Jul 2020 20:18:06 -0700
Message-Id: <1593746287-19251-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Fri, 03 Jul 2020 03:18:22 -0000

From: Bin Meng <bin.meng@windriver.com>

This updates the GitLab CI opensbi job to build opensbi bios images
for the generic platform.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>

---

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


