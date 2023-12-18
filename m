Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D55C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 09:06:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF9ZW-00060s-NJ; Mon, 18 Dec 2023 04:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1rF9ZU-000609-Tx
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 04:05:56 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1rF9ZT-0005kM-Bw
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 04:05:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d307cf18fdso8620255ad.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702890354; x=1703495154; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q+t4HnaAQsrlB/u/Uz0a9xBiQBq1BSkk+9sjx6+O+XI=;
 b=BTsU0rUdPMIzHchOROI3VEN6utP1RYMBH7MsbBtc5l8zPe7LmMvKzlnZwptb4o+5nV
 gPZLX0mxVcPGX4EGiN9SOKJd7P6gNWoJ3L8mDevJxLrxbE8J2+X1zunKUmr+9GAZl2Zc
 eLKSR6vC1YaQtMGuEiO2Do6YVduHaDrLW+i5cRZ1Vx1355j3eqpBdNBUkqeT91jhhc6Z
 RamzMyFjXnM3gAmkUnp9jZIcLz5NXUBPuBG6w7/AE+of9oc/zwmFW2eitG/GAhWTKX+Z
 y+eWVOYxKzGZfnKRS8hHimzdB1q7M87BQ37zrFQcBjN8siPEW6oFoKCRN0Q8WdHB1yhS
 ckqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702890354; x=1703495154;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+t4HnaAQsrlB/u/Uz0a9xBiQBq1BSkk+9sjx6+O+XI=;
 b=a68XOn4PYpcEitRqBtsektFlqmmxFof/4ZJ57tToG1ecscrZu++k6Fe0VPxX1GM+Qy
 DD/BUwd+/dQKzwrNzAIjrukck6gmWLxe8SPNusT9vGc3GypNYCH78JRSMaWnWlmGIMwl
 GpOZep3uB+AnrDbCe6hMStX6S+miaN09I/89tc1tkCUh43/gB6ksH+038mbQsNvVRqSk
 8YYL2kPWPlMpp42EPueDo5yvGlL9YqF0XQN/NMniN71R4R92ytAjlyHt/iY2EQHFPgnY
 lhwH1yO0ENPnEIjQakWz3q71WpmxT39a3eJ846juuWjnF+OwwVb3/jfGi8CloaJIUfM4
 Mk7A==
X-Gm-Message-State: AOJu0Ywj9u8sM1qHtNuMtpxbRm/wV635To93bZsNfRRF6q8OcasHR5bO
 CEPWX0bhsnJJ/F9C/I558z6MVg==
X-Google-Smtp-Source: AGHT+IEnt68LmuUL1i7QsF7kjcUogaHk4U/F0JOPLkWX1SANZbfjc4mXVSHs/BvWBNWBiUx6NKHVOA==
X-Received: by 2002:a17:903:2442:b0:1d3:5645:fbd0 with SMTP id
 l2-20020a170903244200b001d35645fbd0mr4287944pls.134.1702890353891; 
 Mon, 18 Dec 2023 01:05:53 -0800 (PST)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902da8400b001cc3c521affsm18527946plx.300.2023.12.18.01.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 01:05:53 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/1] target/riscv/kvm.c: remove group setting of KVM AIA if
 the machine only has 1 socket
Date: Mon, 18 Dec 2023 09:05:41 +0000
Message-Id: <20231218090543.22353-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231218090543.22353-1-yongxuan.wang@sifive.com>
References: <20231218090543.22353-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x632.google.com
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

The emulated AIA within the Linux kernel restores the HART index
of the IMSICs according to the configured AIA settings. During
this process, the group setting is used only when the machine
partitions harts into groups. It's unnecessary to set the group
configuration if the machine has only one socket, as its address
space might not contain the group shift.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm/kvm-cpu.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 62a1e51f0a2e..6494597157b8 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1387,21 +1387,24 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
         exit(1);
     }
 
-    socket_bits = find_last_bit(&socket_count, BITS_PER_LONG) + 1;
-    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
-                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS,
-                            &socket_bits, true, NULL);
-    if (ret < 0) {
-        error_report("KVM AIA: failed to set group_bits");
-        exit(1);
-    }
 
-    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
-                            KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT,
-                            &group_shift, true, NULL);
-    if (ret < 0) {
-        error_report("KVM AIA: failed to set group_shift");
-        exit(1);
+    if (socket_count > 1) {
+        socket_bits = find_last_bit(&socket_count, BITS_PER_LONG) + 1;
+        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                                KVM_DEV_RISCV_AIA_CONFIG_GROUP_BITS,
+                                &socket_bits, true, NULL);
+        if (ret < 0) {
+            error_report("KVM AIA: failed to set group_bits");
+            exit(1);
+        }
+
+        ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                                KVM_DEV_RISCV_AIA_CONFIG_GROUP_SHIFT,
+                                &group_shift, true, NULL);
+        if (ret < 0) {
+            error_report("KVM AIA: failed to set group_shift");
+            exit(1);
+        }
     }
 
     guest_bits = guest_num == 0 ? 0 :
-- 
2.17.1


