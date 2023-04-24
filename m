Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqsB5-0007ME-M4
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAo-0006qr-05
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:52 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAm-0001MX-8D
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a6715ee82fso47338645ad.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327266; x=1684919266;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zCTpZ9cYwennHW314QharwHociieKqS09SCoYz2Uc9c=;
 b=PKuQmahPDHia3TjZrCVAWuNT1ruY1srIGXlysgjFADbLQTbqOTzxr7gXRZY7dC+VM0
 c+vi4s0nf1voHMy8JH6d6vYQz3ynjxZKUdrBXBRpZg5wL89afiS9Sxi2d2Pd/xcg2W33
 xafyt+HnZqHQ7gSLRoEPbnov1OSH9/ZawWGg1H25hjyUK/m8WSqbuu3qSehZz3vL+55N
 VodhHUFTUwbcYbNedvODjy7m+40Als1d1nEWeELdLwvXtituhVp7gqIiFuXRVvdrpHK/
 kSAFFFiKUtEI8aVKTOz7otkrwMjRQIF3LXU7kmLVK+5rpUkqKwkEINKLFT5GUgl9ALAT
 d6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327266; x=1684919266;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCTpZ9cYwennHW314QharwHociieKqS09SCoYz2Uc9c=;
 b=e919CauDA0RoYeqYaB6W0SUkmqqKHPRCeb8z59lTIEjQTbS4zQSQb6pNqRak7K9cCC
 6iz4tkkc/E5rV+oe2AhF8os8tyWwN+cyx68q5DJJ0wSYXbNK/6+E4vk6lGVkZiHBI1qm
 edfVvvNXFfa6hqxr4Lhe9T+sn4YXVkDAkG6pgveOXOcAuxC7aYZM2My6BooLg5M1d3Ji
 h+7uIVXFXrVym2IctHwz8yzcvJStxTQVpK2+qOaohtBgHsIkm9VaKplNLPPWWRl/65Ad
 b2ZWvSzLzaxQ2ow1r5yCEImp54KzBl3AOaaolxQbbs1KpWwvno2XiYxjwReP45lyLFVT
 CqnA==
X-Gm-Message-State: AAQBX9fUkXstjQfZilICvQkWHqz4XgAoRYo1DzNC0huWp/XcPZwgxhwm
 pda78KzYnOCbhpUu3ov1LE3nZQ==
X-Google-Smtp-Source: AKy350blO8lqsu+SA6uqnm+u1bPUNrWuOOKNE2c9gsgbqxocJntSV9P99fbdIJLwihPGn6GRnWPCag==
X-Received: by 2002:a17:902:dad1:b0:1a6:d15f:3ce1 with SMTP id
 q17-20020a170902dad100b001a6d15f3ce1mr16907842plx.34.1682327265978; 
 Mon, 24 Apr 2023 02:07:45 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:45 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 4/6] target/riscv: Create an KVM AIA irqchip
Date: Mon, 24 Apr 2023 09:07:06 +0000
Message-Id: <20230424090716.15674-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 09:07:55 -0000

implement a function to create an KVM AIA chip

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm.c       | 83 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h |  3 ++
 2 files changed, 86 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 6aad25bbc3..1c21f5a180 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -34,6 +34,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "hw/intc/riscv_imsic.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_riscv.h"
@@ -547,3 +548,85 @@ bool kvm_arch_cpu_check_are_resettable(void)
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
+
+void kvm_riscv_aia_create(DeviceState *aplic_s, bool msimode, int socket,
+                          uint64_t aia_irq_num, uint64_t hart_count,
+                          uint64_t aplic_base, uint64_t imsic_base)
+{
+    int ret;
+    int aia_fd = -1;
+    uint64_t aia_mode;
+    uint64_t aia_nr_ids;
+    uint64_t aia_hart_bits = find_last_bit(&hart_count, BITS_PER_LONG) + 1;
+
+    if (!msimode) {
+        error_report("Currently KVM AIA only supports aplic_imsic mode");
+        exit(1);
+    }
+
+    aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
+
+    if (aia_fd < 0) {
+        error_report("Unable to create in-kernel irqchip");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_MODE,
+                            &aia_mode, false, NULL);
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
+                            &aia_nr_ids, false, NULL);
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_SRCS,
+                            &aia_irq_num, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: fail to set number input irq lines");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_HART_BITS,
+                            &aia_hart_bits, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: fail to set number of harts");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
+                            KVM_DEV_RISCV_AIA_ADDR_APLIC,
+                            &aplic_base, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: fail to set the base address of APLIC");
+        exit(1);
+    }
+
+    for (int i = 0; i < hart_count; i++) {
+        uint64_t imsic_addr = imsic_base + i * IMSIC_HART_SIZE(0);
+        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
+                                KVM_DEV_RISCV_AIA_ADDR_IMSIC(i),
+                                &imsic_addr, true, NULL);
+        if (ret < 0) {
+            error_report("KVM AIA: fail to set the base address of IMSICs");
+            exit(1);
+        }
+    }
+
+    if (kvm_has_gsi_routing()) {
+        for (uint64_t idx = 0; idx < aia_irq_num + 1; ++idx) {
+            kvm_irqchip_add_irq_route(kvm_state, idx, socket, idx);
+        }
+        kvm_gsi_routing_allowed = true;
+        kvm_irqchip_commit_routes(kvm_state);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CTRL,
+                            KVM_DEV_RISCV_AIA_CTRL_INIT,
+                            NULL, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: initialized fail");
+        exit(1);
+    }
+}
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index 606968a4b7..6067adff51 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -21,6 +21,9 @@
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
+void kvm_riscv_aia_create(DeviceState *aplic_s, bool msimode, int socket,
+                          uint64_t aia_irq_num, uint64_t hart_count,
+                          uint64_t aplic_base, uint64_t imsic_base);
 
 #define KVM_DEV_RISCV_AIA_GRP_CONFIG            0
 #define KVM_DEV_RISCV_AIA_CONFIG_MODE           0
-- 
2.17.1


