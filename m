Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EDC0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 11:58:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOyBm-0003YJ-AS; Thu, 27 Jul 2023 06:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyB4-0003Sl-Ho
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:25:14 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qOyB2-0003uf-3f
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 06:25:02 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1bb7e083783so658460fac.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690453498; x=1691058298;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p3orrnsVpmPvdMzKCfa6SEMJluYKUnGd5kHcMJ1WXrM=;
 b=EQwROzf+msMOSLAm/5y6gX+AoHCG3hjukm31H/UEcZy+cDv/K/IxAF6tC0Jn447kNi
 WvBd1mymEdZl3hnTaEhb2l4atMqypmRR8yiHCyZjCLbPrPo9Jw0LXn52JEQrA+zguasi
 GdYHOF1G4+1YIPhdjZ7V7WVFJSv8VHyU6LANOlTiaEv6As5tRWt4yGx2mvtMBQFzBo4p
 dh97hXGkD5nonIy5JzxV6EdCFziww/Iac2BYEV2t0zD69A+zO0gqo3cSsJU4HAlCTBtu
 Q5RYXU6N5n1lm0koGTMVD4EXUcs4QEWKhgH1pJ8hw6JHNFAAJqaalklgQC4pD4dSWRLC
 xypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690453498; x=1691058298;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3orrnsVpmPvdMzKCfa6SEMJluYKUnGd5kHcMJ1WXrM=;
 b=ezlIkjI/DjDw/ym/hDJVsS1T1vomWf5WPEfhmntA8lOvrTNGZppTLb75GpNQ5a77sz
 WeYoSzYcnTO7WljZexbj1sfOqALrBt2nm5tmm6kA9bXN7xqcr7Xx6TYmkCN8Yyfntz55
 pW2DaY37/QrWL+rUKYnYEyeTd5UaAahF9yIQz+BbPjkStLT3NLQ0nfWvxKkjNWpR7S3j
 +SZ77YaWiBsUncq4jpVU47qx550g5h9ZQq8T5hPG0HRyEJhsQQL4r9Ng1KVoXtt7D1cf
 R/wnaa2j/wZoqI+Wa7T7L4Ekq4Gz+98EFhPk7M6Dk/0Suc2YnCMjnHGXOKZghV7ueIoi
 H4xQ==
X-Gm-Message-State: ABy/qLaufGIm5yf332ZDGUH23WvQ10Ve9y2QILG4BfZ8YJqCXqrWkPWR
 moItFPNLIrKQBCoXxrRAWHud1w==
X-Google-Smtp-Source: APBJJlF5PC70kkRRGOeQzn5k2u7WI5QwJ/1xIiC62ubRFNQuRYWlJ6zWKXRkGOLaLKOb+aFzSgKBXA==
X-Received: by 2002:a05:6870:a550:b0:1bb:c236:dff with SMTP id
 p16-20020a056870a55000b001bbc2360dffmr2697769oal.50.1690453497854; 
 Thu, 27 Jul 2023 03:24:57 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b001b882880550sm1230139ple.282.2023.07.27.03.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:24:57 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, atishp@atishpatra.org, vincent.chen@sifive.com,
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH v7 3/5] target/riscv: Create an KVM AIA irqchip
Date: Thu, 27 Jul 2023 10:24:35 +0000
Message-Id: <20230727102439.22554-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230727102439.22554-1-yongxuan.wang@sifive.com>
References: <20230727102439.22554-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oa1-x2c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We create a vAIA chip by using the KVM_DEV_TYPE_RISCV_AIA and then set up
the chip with the KVM_DEV_RISCV_AIA_GRP_* APIs.
We also extend KVM accelerator to specify the KVM AIA mode. The "riscv-aia"
parameter is passed along with --accel in QEMU command-line.
1) "riscv-aia=emul": IMSIC is emulated by hypervisor
2) "riscv-aia=hwaccel": use hardware guest IMSIC
3) "riscv-aia=auto": use the hardware guest IMSICs whenever available
                     otherwise we fallback to software emulation.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c       | 186 +++++++++++++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h |   4 +
 2 files changed, 190 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 005e054604..0c17e2027a 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -36,6 +36,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "hw/intc/riscv_imsic.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_riscv.h"
@@ -43,6 +44,7 @@
 #include "chardev/char-fe.h"
 #include "migration/migration.h"
 #include "sysemu/runstate.h"
+#include "hw/riscv/numa.h"
 
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -1023,6 +1025,190 @@ bool kvm_arch_cpu_check_are_resettable(void)
     return true;
 }
 
+static int aia_mode;
+
+static const char *kvm_aia_mode_str(uint64_t mode)
+{
+    switch (mode) {
+    case KVM_DEV_RISCV_AIA_MODE_EMUL:
+        return "emul";
+    case KVM_DEV_RISCV_AIA_MODE_HWACCEL:
+        return "hwaccel";
+    case KVM_DEV_RISCV_AIA_MODE_AUTO:
+    default:
+        return "auto";
+    };
+}
+
+static char *riscv_get_kvm_aia(Object *obj, Error **errp)
+{
+    return g_strdup(kvm_aia_mode_str(aia_mode));
+}
+
+static void riscv_set_kvm_aia(Object *obj, const char *val, Error **errp)
+{
+    if (!strcmp(val, "emul")) {
+        aia_mode = KVM_DEV_RISCV_AIA_MODE_EMUL;
+    } else if (!strcmp(val, "hwaccel")) {
+        aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
+    } else if (!strcmp(val, "auto")) {
+        aia_mode = KVM_DEV_RISCV_AIA_MODE_AUTO;
+    } else {
+        error_setg(errp, "Invalid KVM AIA mode");
+        error_append_hint(errp, "Valid values are emul, hwaccel, and auto.\n");
+    }
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
+    object_class_property_add_str(oc, "riscv-aia", riscv_get_kvm_aia,
+                                  riscv_set_kvm_aia);
+    object_class_property_set_description(oc, "riscv-aia",
+                                          "Set KVM AIA mode. Valid values are "
+                                          "emul, hwaccel, and auto. Default "
+                                          "is auto.");
+    object_property_set_default_str(object_class_property_find(oc, "riscv-aia"),
+                                    "auto");
+}
+
+void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
+                          uint64_t aia_irq_num, uint64_t aia_msi_num,
+                          uint64_t aplic_base, uint64_t imsic_base,
+                          uint64_t guest_num)
+{
+    int ret, i;
+    int aia_fd = -1;
+    uint64_t default_aia_mode;
+    uint64_t socket_count = riscv_socket_count(machine);
+    uint64_t max_hart_per_socket = 0;
+    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
+    uint64_t socket_bits, hart_bits, guest_bits;
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
+                            &default_aia_mode, false, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to get current KVM AIA mode");
+        exit(1);
+    }
+    qemu_log("KVM AIA: default mode is %s\n",
+             kvm_aia_mode_str(default_aia_mode));
+
+    if (default_aia_mode != aia_mode) {
+        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                                KVM_DEV_RISCV_AIA_CONFIG_MODE,
+                                &aia_mode, true, NULL);
+        if (ret < 0)
+            warn_report("KVM AIA: failed to set KVM AIA mode");
+        else
+            qemu_log("KVM AIA: set current mode to %s\n",
+                     kvm_aia_mode_str(aia_mode));
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_SRCS,
+                            &aia_irq_num, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set number of input irq lines");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
+                            &aia_msi_num, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set number of msi");
+        exit(1);
+    }
+
+    socket_bits = find_last_bit(&socket_count, BITS_PER_LONG) + 1;
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS,
+                            &socket_bits, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set group_bits");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT,
+                            &group_shift, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set group_shift");
+        exit(1);
+    }
+
+    guest_bits = guest_num == 0 ? 0 :
+                 find_last_bit(&guest_num, BITS_PER_LONG) + 1;
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_GUEST_BITS,
+                            &guest_bits, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set guest_bits");
+        exit(1);
+    }
+
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
+                            KVM_DEV_RISCV_AIA_ADDR_APLIC,
+                            &aplic_base, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set the base address of APLIC");
+        exit(1);
+    }
+
+    for (socket = 0; socket < socket_count; socket++) {
+        socket_imsic_base = imsic_base + socket * (1U << group_shift);
+        hart_count = riscv_socket_hart_count(machine, socket);
+        base_hart = riscv_socket_first_hartid(machine, socket);
+
+        if (max_hart_per_socket < hart_count) {
+            max_hart_per_socket = hart_count;
+        }
+
+        for (i = 0; i < hart_count; i++) {
+            imsic_addr = socket_imsic_base + i * IMSIC_HART_SIZE(guest_bits);
+            ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_ADDR,
+                                    KVM_DEV_RISCV_AIA_ADDR_IMSIC(i + base_hart),
+                                    &imsic_addr, true, NULL);
+            if (ret < 0) {
+                error_report("KVM AIA: failed to set the IMSIC address for hart %d", i);
+                exit(1);
+            }
+        }
+    }
+
+    hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_HART_BITS,
+                            &hart_bits, true, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to set hart_bits");
+        exit(1);
+    }
+
+    if (kvm_has_gsi_routing()) {
+        for (uint64_t idx = 0; idx < aia_irq_num + 1; ++idx) {
+            /* KVM AIA only has one APLIC instance */
+            kvm_irqchip_add_irq_route(kvm_state, idx, 0, idx);
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
+
+    kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
 }
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index e3ba935808..7d4b7c60e2 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -22,5 +22,9 @@
 void kvm_riscv_init_user_properties(Object *cpu_obj);
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
+void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
+                          uint64_t aia_irq_num, uint64_t aia_msi_num,
+                          uint64_t aplic_base, uint64_t imsic_base,
+                          uint64_t guest_num);
 
 #endif
-- 
2.17.1


