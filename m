Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2d-0004ab-3y
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2c-0004XT-2p
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59128
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2b-00041M-05
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXIZVnW5g37k2jLJB8kqlNhfn4cymDqpUWMHJkAG2Eo=;
 b=ZkPItB8aiaH7SyKukL7lxsYijK45WiAvNbulryfXX3cMCxiGYHmUeDf8mYvZQOgo5sXa/p
 fp/XeqqlK3v+wrbMLYBl3zJHw/8xW2N5XOq5UPGd+MUb8mY4E7+Kcv8X1mBuidWqY/I+1W
 aWPSa0pkGNi5PldAUaOI9UKKwaz29Bo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-cyXw31n-MUalIxefy8dQew-1; Mon, 04 May 2020 11:29:54 -0400
X-MC-Unique: cyXw31n-MUalIxefy8dQew-1
Received: by mail-wm1-f70.google.com with SMTP id h184so5103369wmf.5
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WSQ18h76i7qy6sv74FkIvImN9Z625aM1DPt3KGsaqk=;
 b=nv6G0qgucl4ovJrkoqP+Mj7jcZa7ESKDhSP1TYLQkLQ2uDFq5aeqgjKr7toJhktPA3
 U3J9FiwiJ4mPVYE4eBMgts5TIqQHKjtzOdjw+tphhRiXsaEODrXHTZP7yzlQsRUUU/hM
 sIbu7Tt9yLpMJRixLaQZKzxLxiJXRBqdN/jLOWlFsVgHeY6Mjm5sDZZERMXA4TTJ93bE
 azL9jWloMKQi+rh7cJU7IH8JJjbk4BDHSyxr92W1KT0xQHyOhztjjUFVQO9HnRAxrjht
 MxZr3o6zDVV13O9IyRAL/jf0iGH+rBeRKlVE6oWtkKtfNjMltSIt0Nez0FvbrwpnLqit
 IMLQ==
X-Gm-Message-State: AGi0PuZOkY3s4q9v6jGJhuQzGhrNo2EwX3jjfpSfbYqqOcJdHoFX5l9A
 nBeg42CnQsuNkgmQniPRX7CU7rv0ArpXsqBd+oxIijaIoad4U4YCaa1kMQLmiPZFSnYQHyGwEhq
 Ldp6TJAhSTe7+nyw=
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr14936130wme.42.1588606193639; 
 Mon, 04 May 2020 08:29:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypLj5eWxZJZ2z2ZUftO3Xg+kRXa7qQn9DNorY0PvIkoZ/Tj/+ACME2VKDR/YpjrsCN5yKp3rsg==
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr14936095wme.42.1588606193366; 
 Mon, 04 May 2020 08:29:53 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id r23sm13375342wra.74.2020.05.04.08.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 06/12] stubs/Makefile: Reduce the user-mode object list
Date: Mon,  4 May 2020 17:29:16 +0200
Message-Id: <20200504152922.21365-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 15:29:58 -0000

These stubs are not required when configured with --disable-system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 stubs/Makefile.objs | 52 ++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 45be5dc0ed..5ffa085c67 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,46 +1,54 @@
-stub-obj-y +=3D arch_type.o
-stub-obj-y +=3D bdrv-next-monitor-owned.o
 stub-obj-y +=3D blk-commit-all.o
-stub-obj-y +=3D blockdev-close-all-bdrv-states.o
-stub-obj-y +=3D clock-warp.o
 stub-obj-y +=3D cpu-get-clock.o
 stub-obj-y +=3D cpu-get-icount.o
 stub-obj-y +=3D dump.o
 stub-obj-y +=3D error-printf.o
 stub-obj-y +=3D fdset.o
 stub-obj-y +=3D gdbstub.o
-stub-obj-y +=3D get-vm-name.o
-stub-obj-y +=3D iothread.o
 stub-obj-y +=3D iothread-lock.o
 stub-obj-y +=3D is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) +=3D linux-aio.o
 stub-obj-$(CONFIG_LINUX_IO_URING) +=3D io_uring.o
-stub-obj-y +=3D machine-init-done.o
-stub-obj-y +=3D migr-blocker.o
-stub-obj-y +=3D change-state-handler.o
-stub-obj-y +=3D monitor.o
 stub-obj-y +=3D monitor-core.o
 stub-obj-y +=3D notify-event.o
+stub-obj-y +=3D qmp_memory_device.o
 stub-obj-y +=3D qtest.o
+stub-obj-y +=3D ramfb.o
 stub-obj-y +=3D replay.o
-stub-obj-y +=3D replay-user.o
 stub-obj-y +=3D runstate-check.o
+stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
 stub-obj-y +=3D set-fd-handler.o
+stub-obj-y +=3D vmgenid.o
 stub-obj-y +=3D sysbus.o
 stub-obj-y +=3D tpm.o
 stub-obj-y +=3D trace-control.o
-stub-obj-y +=3D uuid.o
-stub-obj-y +=3D vm-stop.o
 stub-obj-y +=3D vmstate.o
+
+#######################################################################
+# code used by both qemu system emulation and qemu-img
+
+ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
+
+stub-obj-y +=3D arch_type.o
+stub-obj-y +=3D bdrv-next-monitor-owned.o
+stub-obj-y +=3D blockdev-close-all-bdrv-states.o
+stub-obj-y +=3D change-state-handler.o
+stub-obj-y +=3D clock-warp.o
 stub-obj-y +=3D fd-register.o
-stub-obj-y +=3D qmp_memory_device.o
-stub-obj-y +=3D target-monitor-defs.o
-stub-obj-y +=3D target-get-monitor-def.o
-stub-obj-y +=3D vmgenid.o
-stub-obj-y +=3D xen-common.o
-stub-obj-y +=3D xen-hvm.o
+stub-obj-y +=3D fw_cfg.o
+stub-obj-y +=3D get-vm-name.o
+stub-obj-y +=3D iothread.o
+stub-obj-y +=3D machine-init-done.o
+stub-obj-y +=3D migr-blocker.o
+stub-obj-y +=3D monitor.o
 stub-obj-y +=3D pci-host-piix.o
 stub-obj-y +=3D ram-block.o
-stub-obj-y +=3D ramfb.o
-stub-obj-y +=3D fw_cfg.o
-stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
+stub-obj-y +=3D replay-user.o
+stub-obj-y +=3D target-get-monitor-def.o
+stub-obj-y +=3D target-monitor-defs.o
+stub-obj-y +=3D uuid.o
+stub-obj-y +=3D vm-stop.o
+stub-obj-y +=3D xen-common.o
+stub-obj-y +=3D xen-hvm.o
+
+endif # CONFIG_SOFTMMU || CONFIG_TOOLS
--=20
2.21.3


