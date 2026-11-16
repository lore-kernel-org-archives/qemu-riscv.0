Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00795606A882
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=XSg114yH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xSx7E-0005MM-Gf; Mon, 16 Nov 2026 08:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1xSx72-0005Lc-CS
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 08:51:15 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1xSx6z-0003Yc-88
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 08:51:10 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E3CE3F87F
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1794837066;
 bh=yWtFMXRf9r9YfNQyQZE+okN7WXJu09dlYFKysXjpS08=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=XSg114yHcOdXeJ47Lz2e8/x6KuhJRut0eCHMwyRgMLnIkYEF4vOxQEurVlfPq4N8C
 OlwPnAzz19SqPgkNPodXeGjHDeXlt/L+VvFZBGR+O7t3fae1e7W/Xqoeo7K+qRZfQ+
 XzupkdctZwv+WWn+b+IkBHrZz7NoU4orYRJ5MbzqDbhrVqwFtVDltPPUt9XRZSTVP5
 57chh77QDh2CzXBajwHz+3lCbKS95l2+WRyKn4+BAW6bzWDbqIcRPbsPlR2eCyU9Qr
 9uMDEGiA+Bw6Z8YLcbNX1p0guHwKI3342vQI4hnMbf1PVIPLvXrg9dQiPhzd8/ggxQ
 ahtrBkekR54nD2UCe8U7uNi45MemH3G+ZR09CSwTLLQSOpV+yGSD/UpopNXTz85689
 7Mik/wjCXwC9MbIxesFVhqigSUy5Y0ZfFlhgdSbZW1ECfA0WKXaoTQcgbMaxcpFM5S
 JkuHdsX5GyGllSl0+++uKbVAKmY2agp+QA/VJiEZCoH5Bp+bP6TSJIe0JioQY4TVcr
 mlTXQW88jKlSkd1dpPp6REm5a3vXau2zSmuMPhM7ZGCa6r2v+YCl4xrctI2aH7bifR
 7DY6R/5Hq9qBef7eto1ypvvlPNtl6psGWqFRNtK4qLbvV9aJFGRkYaQwr/8TZS0Qu1
 4HSAKGYYTPsD+3M0Yg2wx73k=
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4bb64c99bb8so15350465e9.1
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 05:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794837066; x=1795441866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yWtFMXRf9r9YfNQyQZE+okN7WXJu09dlYFKysXjpS08=;
 b=kwdSi+fSpVrYTDDqXydpG/q7BDeIe8dt6BXQbqt1EzR4aAbiXawUWo9rcCC3EENTFp
 NZwFJWqX0dSFI61TeV5Sovnid9WTUaUbH1uASKExIWnsCcy8+1Gj0+/dwuvEtGHWiYQu
 yvqYQVw90wzE5zXtHPB575m5j43jrH2XM5yzNAPkdjWxThpv2HG3Hxdqtn3/byJ4q49J
 FmgfceRLa49vftUM6ZLF3ym5odKXyXUl5UiHsEnBXvIyvRmbTUTmIJmnMKrS2xJH8g5o
 zAAT0wYAmJbNLoH/CKRTYzUcyJUwu9eA0VtFc9YBvyneZ1IE5VQE+Nk0eNa+cJ/HnbaX
 G0/A==
X-Forwarded-Encrypted: i=1;
 AL+hErH7J0kh8sYtRNcxssELryPGJhLYa2PiPXZSpeyJYCZvuPe57w5vT+yQDGW0AJWD6JfJNHu8NVzBzDlk@nongnu.org
X-Gm-Message-State: APuU4Z+PP7aNeklSb4vQIeJiKZvuRc8e/ON3Z5PdZkfCUt5t9Ysa8KN8
 9B12tg2gj+X0RaFTTRdDgfZ/ZOmNA195TtW+sYKVu5L8uHzY4GVpfOuGa1t+gJ2rUS+PBvLqB5j
 RxmGKBuPk4VJRj8VLorEYSKbaPBp5d7TZlOyvASBOgp+mGiJKpWDHrbc3WEbbokxaQq0IWXel
X-Gm-Gg: AYBFou3glwRzlEp2MQchbeWnFdgV0WI1eGC2mV6m/NFqjCH74NVmk+SA6X27q+PQZPd
 fLBv4VLU5A2M3DjHfeqObbpAtWaM7DGGQvrsp/qaIz+Eg5aHttO2XNQISg5iIKcSKV7swQSXIWd
 WjVsGYF9zad+T7TIVuekfe9ItZGpNb/ew12pE6tP7xEr0gNxQ+TBdVu5o3bmbK3vFdIEyQXGcU6
 OGMklOx5UyycWk9ik7JUBtq6IGI5JmUGaWOqYqAmdp/Yo+0wr0pJks+5C5j7rAAumtX6gAm2pwi
 SS5jtxcy59tmRK276GAr2MdGillmKMImXv0mpSgIH7bbNmGC10rhtc5QEqw6zqbxV7cafifbBcE
 pG/MJ08F/0QsVn9f9MyQPL3gzJGw8AsjpbcdoLBL+FTDLKwnIpvuycfpw5rE6GVfukdYBlQV5Wf
 zD7cQY19/drzgIaH1CBD7PCKO4zBSX
X-Received: by 2002:a05:600c:1d0e:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4bb55a7f5f3mr228300095e9.32.1794837065966; 
 Mon, 16 Nov 2026 05:51:05 -0800 (PST)
X-Received: by 2002:a05:600c:1d0e:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4bb55a7f5f3mr228299575e9.32.1794837065591; 
 Mon, 16 Nov 2026 05:51:05 -0800 (PST)
Received: from workstation5 ([2a02:908:1242:30e0:beae:76e1:12ab:7bc6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ae5299sm308657555e9.11.2026.11.16.05.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 05:51:05 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Qingwei Hu <qingwei.hu@bytedance.com>, Stefan Butz <mail@butz.st>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] target/riscv/kvm: aia mode is an uint32_t
Date: Mon, 16 Nov 2026 14:51:02 +0100
Message-ID: <20261116135102.32508-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In Linux' struct kvm_aia the field mode is defined as u32.
Calling kvm_device_access() only copies these 32bits to the first four
bytes indicated by the address passed.

Trying to read the mode into uint64_t default_aia_mode will only initialize
the leading four bytes and leave the rest of the variable as a random value
from the stack.

* Change the definition of aia_mode and default_aia_mode to match the
  variable type in the kernel.
* Adjust the signature of kvm_aia_mode_str().

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 target/riscv/kvm/kvm-cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5beb602338..b92f961979 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1884,9 +1884,9 @@ void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
     }
 }
 
-static int aia_mode;
+static uint32_t aia_mode;
 
-static const char *kvm_aia_mode_str(uint64_t mode)
+static const char *kvm_aia_mode_str(uint32_t mode)
 {
     switch (mode) {
     case KVM_DEV_RISCV_AIA_MODE_EMUL:
@@ -1937,7 +1937,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
 {
     int ret, i;
     int aia_fd = -1;
-    uint64_t default_aia_mode;
+    uint32_t default_aia_mode;
     uint64_t socket_count = riscv_socket_count(machine);
     uint64_t max_hart_per_socket = 0;
     uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
-- 
2.55.0


