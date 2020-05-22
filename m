Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQa-0004m8-GP
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQZ-0004hQ-FB
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46351
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQX-0001zK-TH
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrUeOVZRWQD2Q/17xf0hHsrzF1l0TJ5a7ixoIuZeyV4=;
 b=cY7SJ70FLeXzlnQEoOPaXdR/LsiHyRRAgqWtIzgnw2VvEmDBSRFFVigQud7r17eXsFeSGJ
 bSK0fAb1G7ascqSDxxg7LcRFhPZLzL1tfFg/FjEu5Hyg1SaMkC3pegG6Qi1kMblXW/LyDJ
 O7/WgR80PLmrhP5PN/tStSJh0RiCORA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-_DsNbgDEM8-asqBE1beYvA-1; Fri, 22 May 2020 13:25:43 -0400
X-MC-Unique: _DsNbgDEM8-asqBE1beYvA-1
Received: by mail-wr1-f69.google.com with SMTP id e14so4622263wrv.11
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrUeOVZRWQD2Q/17xf0hHsrzF1l0TJ5a7ixoIuZeyV4=;
 b=GYmDj4V7eZ0DCWWbqLHkX194rMF2S58WG7fJNPtTyfptXaxxwV2KPZQ6DMgR3b27Qe
 sLqLU1UVbCp2z/maSPd6FazF1J+7PgwJDQKvsgXTDGUxJtmQnFxDxvncrX9fnjW+HGVM
 s2zXio/WEjpypVfm5fqZlJ779bh6aAoAkDq5a8lGYZ/f3WTp4lYAnhnd7a4lPQJaMrmW
 cnBgrQ1dodVmxbP/75txg7CEpixCGBxKabCKyIcPQiCgltWfQE659sQkqIv4YR4aLMVP
 R/QlJOJKQ980ihKFcJZMIgqu/3yUHZPZ1nh/X1sluY8vPbQaxdDAXFLsNe/Rs3PDsv/y
 bLnA==
X-Gm-Message-State: AOAM533BWioaddLKk/q4Arr1+eMTI1WYgb5Ks3glfzJfIGKngP9+sW4z
 RWIeZdtsS4QvJP2w8YHj3P8t8h64v9U3WDOwoIGZGkfoDbpl8mGnmx+GUUS4IADqxntO5W0E6i0
 xdNk2cvVym+nd0o0=
X-Received: by 2002:adf:fe90:: with SMTP id l16mr4192159wrr.222.1590168342428; 
 Fri, 22 May 2020 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSKoTffoL8ceNaMvgQw3S4HplXtrTt9YsZNuD7EBVvg3A5Ji+eqpiL49H6nlpLWQHSuvRzrA==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr4192142wrr.222.1590168342074; 
 Fri, 22 May 2020 10:25:42 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id z7sm10029724wrl.88.2020.05.22.10.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 06/13] stubs/Makefile: Reduce the user-mode object list
Date: Fri, 22 May 2020 19:25:03 +0200
Message-Id: <20200522172510.25784-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 08:01:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:25:47 -0000

These stubs are not required when configured with --disable-system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/Makefile.objs | 52 ++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 6a9e3135e8..f54125de31 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,47 +1,55 @@
-stub-obj-y += arch_type.o
-stub-obj-y += bdrv-next-monitor-owned.o
 stub-obj-y += blk-commit-all.o
-stub-obj-y += blockdev-close-all-bdrv-states.o
-stub-obj-y += clock-warp.o
 stub-obj-y += cpu-get-clock.o
 stub-obj-y += cpu-get-icount.o
 stub-obj-y += dump.o
 stub-obj-y += error-printf.o
 stub-obj-y += fdset.o
 stub-obj-y += gdbstub.o
-stub-obj-y += get-vm-name.o
-stub-obj-y += iothread.o
 stub-obj-y += iothread-lock.o
 stub-obj-y += is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
 stub-obj-$(CONFIG_LINUX_IO_URING) += io_uring.o
-stub-obj-y += machine-init-done.o
-stub-obj-y += migr-blocker.o
-stub-obj-y += change-state-handler.o
-stub-obj-y += monitor.o
 stub-obj-y += monitor-core.o
 stub-obj-y += notify-event.o
+stub-obj-y += qmp_memory_device.o
 stub-obj-y += qtest.o
+stub-obj-y += ramfb.o
 stub-obj-y += replay.o
-stub-obj-y += replay-user.o
 stub-obj-y += runstate-check.o
+stub-obj-$(CONFIG_SOFTMMU) += semihost.o
 stub-obj-y += set-fd-handler.o
+stub-obj-y += vmgenid.o
 stub-obj-y += sysbus.o
 stub-obj-y += tpm.o
 stub-obj-y += trace-control.o
-stub-obj-y += uuid.o
-stub-obj-y += vm-stop.o
 stub-obj-y += vmstate.o
 stub-obj-y += win32-kbd-hook.o
+
+#######################################################################
+# code used by both qemu system emulation and qemu-img
+
+ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
+
+stub-obj-y += arch_type.o
+stub-obj-y += bdrv-next-monitor-owned.o
+stub-obj-y += blockdev-close-all-bdrv-states.o
+stub-obj-y += change-state-handler.o
+stub-obj-y += clock-warp.o
 stub-obj-y += fd-register.o
-stub-obj-y += qmp_memory_device.o
-stub-obj-y += target-monitor-defs.o
-stub-obj-y += target-get-monitor-def.o
-stub-obj-y += vmgenid.o
-stub-obj-y += xen-common.o
-stub-obj-y += xen-hvm.o
+stub-obj-y += fw_cfg.o
+stub-obj-y += get-vm-name.o
+stub-obj-y += iothread.o
+stub-obj-y += machine-init-done.o
+stub-obj-y += migr-blocker.o
+stub-obj-y += monitor.o
 stub-obj-y += pci-host-piix.o
 stub-obj-y += ram-block.o
-stub-obj-y += ramfb.o
-stub-obj-y += fw_cfg.o
-stub-obj-$(CONFIG_SOFTMMU) += semihost.o
+stub-obj-y += replay-user.o
+stub-obj-y += target-get-monitor-def.o
+stub-obj-y += target-monitor-defs.o
+stub-obj-y += uuid.o
+stub-obj-y += vm-stop.o
+stub-obj-y += xen-common.o
+stub-obj-y += xen-hvm.o
+
+endif # CONFIG_SOFTMMU || CONFIG_TOOLS
-- 
2.21.3


