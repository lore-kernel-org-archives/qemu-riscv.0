Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liarl-0007QX-L3
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liari-0007DZ-CS; Mon, 17 May 2021 06:52:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarg-0006tZ-RA; Mon, 17 May 2021 06:52:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so1912452wmg.3; 
 Mon, 17 May 2021 03:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73qeszPShsMKmwQ6XsHjcTezehy+lvr/7Xa8ct6h49I=;
 b=KZdPVqTiITvdCNz5rGciJOBS/6F3QG7VJJfwgQItf76O4Kp4R0JPne0N/R+5FiLOsP
 o14Qz+IyZL40FAq0FLIoCjMmXMBuppqqG1Trct8uIJ7vusSKmuTKnuogCq20V+U9EIIZ
 68s2gh56Hum75RkTg74qB2DaE7mhvMRv3xzrt1vAYX8xGZiMl5Cf1ieolSqXMl6mLTq4
 oV3hvD+VZet7J277cUTnQ8Myj0OWbdc+7xzDorEyXjH1F12h9cscocFlYoa4bT5PEcJx
 EQPzIWqWa4fW2cRwvD1U/wKHmuXSs6oJvGKI7L5jzJ0ae0OXhB4u5Nb4WobZobYxWyky
 aTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=73qeszPShsMKmwQ6XsHjcTezehy+lvr/7Xa8ct6h49I=;
 b=gl12lcHdMgCgADFEmDpaGExAEKPT/tbwhISM1TiyGs/m4h7HLlgx992yQwSOds0hKF
 2Z1fKjlJOFBkegeq0xb/CTPLI1LAfxzHTirncNcNZKE9EqzlpqmXqQmimnpLEvG9TGiF
 u9pDEJ0SBzgmUhsptszSRZV/anz0u58ABHoTljme9xsNBV0NEv9UUe4mQp3s90HMO6K8
 Ih+Mgi5m0+TXHlY7oH5d8t9LDPvUygjtBhDxr5yg/GKc6Axq/DIIuHDuJj8hgJE/q+h8
 GJWCXdSTZyZa8zX7J5A8WxOc2pse+Lq2LDiE2DeH/Yp6MPD7xqwPQHgLG/60qmgQVrNs
 nBbQ==
X-Gm-Message-State: AOAM5327+IXUlQg7H8uwCyCY5gdn7wI0WW+EPnJGkey09mZK8ZxNzw0o
 3VVze/gaaBKAwNOloKqi+4GaiQj5YGqPtA==
X-Google-Smtp-Source: ABdhPJx74qhFgmRDEijCQeQSdLdNbgNDud+KrdpZkAtqowjjW4GBXwrKfr/LUEYasa7AC8Q+p40MGw==
X-Received: by 2002:a1c:a9ca:: with SMTP id
 s193mr33217198wme.132.1621248765787; 
 Mon, 17 May 2021 03:52:45 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c14sm16873962wrt.77.2021.05.17.03.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 13/23] cpu: Move AVR target vmsd field from CPUClass to
 DeviceClass
Date: Mon, 17 May 2021 12:51:30 +0200
Message-Id: <20210517105140.1062037-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 May 2021 10:52:51 -0000

See rationale in previous commit. Targets should use the vmsd field
of DeviceClass, not CPUClass. As migration is not important on the
AVR target, break the migration compatibility and set the DeviceClass
vmsd field. To feel safer, increment the vmstate version.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v7: Increment vmstate version (Richard)
---
 target/avr/cpu.c     | 2 +-
 target/avr/machine.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 37a8ebcc86f..3353bcb9fc7 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vms_avr_cpu;
+    dc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/avr/machine.c b/target/avr/machine.c
index de264f57c33..16f7a3e031d 100644
--- a/target/avr/machine.c
+++ b/target/avr/machine.c
@@ -98,8 +98,8 @@ static const VMStateInfo vms_eind = {
 
 const VMStateDescription vms_avr_cpu = {
     .name = "cpu",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.pc_w, AVRCPU),
         VMSTATE_UINT32(env.sp, AVRCPU),
-- 
2.26.3


