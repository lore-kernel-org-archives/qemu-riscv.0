Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBb-0000BW-Hk
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBY-0008Vu-P8
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBX-0003KM-HZ
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25612
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBX-0003Iv-Dz
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNscj4znfEFoxUyR2eitCsjwBW0o2g2YBibwWrrvxzw=;
 b=hqlpBaFXcpg6E/M6Uan4x/LT0YxnfTd38XK+WcA2gOJ9X+eAj8+RfTcDDuMDbA+Lpp63xe
 gdQXSZgeWnMGLTrm2a/veyuzFfdFR3WR4myDJOvM4um5d+BieLFcN4uM/A9W6HQgEKLNY0
 W1aNreFE6PppfcNQ/6Z6g0Fo/fZuitY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-gvNhZlf5PkW8zYh6WIIZbg-1; Fri, 13 Mar 2020 14:37:23 -0400
X-MC-Unique: gvNhZlf5PkW8zYh6WIIZbg-1
Received: by mail-wr1-f71.google.com with SMTP id h14so4016376wrv.12
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UFdvn7QNDrVxUqibYwnc6bH6F2vFCMCHuZOu+Zd/Cpc=;
 b=cyWMaSnNdb5miA93QJg1/L9TVVB5ZMAjUTdD3Rg0KRxvqLLLt7z7uKkINxRE9FflBf
 4//gKVEoTll6ozQm1tKh31rK9V0hwfPxxnLIZOfgrZh+VftuZZ8pViwFoE0I3CT6bBVr
 pnVupHzpdapsb/JI7GrKfV5PDykUnyQSutV1bfhGmHe96U/gSOHjnWSyiWfq2QSylgBb
 Iyu6ntrtp8781dPe0YuwYok5J64YTCqEP+TDLdBCg5LGemVdGcDKLcZscJDwfCw3L0XF
 0gp9+8x4/P+eWmbSUS6QGQUtXB1kWLy+ldd/8KBh0/yBcxpkFhgPs5po/AU5R9St+WvW
 r7fQ==
X-Gm-Message-State: ANhLgQ13xBCR8UxthNt+25JJcRTHUsb/b4mt9tV0OfduEkxBSwO1hQHj
 Z2UnuJG1ugHw2Y9vLPCjExm6fBw+nH7+K6OX9cv2yBfAAWiVEWi4FT/ObnlZSP8D5qlzPpQCn9l
 Cb7u8HQYv6kOaJO0=
X-Received: by 2002:adf:ef92:: with SMTP id d18mr18557110wro.193.1584124641898; 
 Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtYmL5ub8rSmVi8dir3DAkQWGyPCni3RmNUQh9poMuQNlUlVUmlvaOCY/piDuFUDxUIHX22Mg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr18557095wro.193.1584124641662; 
 Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id n2sm12942644wrr.62.2020.03.13.11.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 05/14] stubs/Makefile: Reduce the user-mode object list
Date: Fri, 13 Mar 2020 19:36:43 +0100
Message-Id: <20200313183652.10258-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:30 -0000

These stubs are not required when configured with --disable-system.

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
2.21.1


