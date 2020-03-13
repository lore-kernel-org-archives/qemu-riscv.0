Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBf-0000K4-NH
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBc-0000DC-2R
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBa-0003Uz-K3
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52047
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBa-0003TH-Fx
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgDberYaZDed20sm6tRRJ30h81E1DyL3M/u30/cftuw=;
 b=Pyfzp0tNPKVRFACmam/XzJVRLsNPSzeTB4ypHediykxYarDvlOCTHS5r/F4am3IHl7/oOg
 tlJly0wiPbs+XgGkOaLZW11SlgZyG3y/NjbS1gjUdKgY1a56IYDRkkG8+FJl+vq0U9p8z8
 kCKqMqevPAc87FBsb+N+kyYYt8YpcX0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-tAWbWAm2Pru9ISQC1JWPDg-1; Fri, 13 Mar 2020 14:37:28 -0400
X-MC-Unique: tAWbWAm2Pru9ISQC1JWPDg-1
Received: by mail-wr1-f70.google.com with SMTP id c16so4757076wrt.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RC71PykOebGOXBV3Avk2avLieaYMFi0EYKRjpxiFXHU=;
 b=gERTRgm7b/lgVB+chnNO4uVeSKZPKWXuhslT4jJAhfs7qoaWZfjnjP5/lm102hGaHC
 ANX4h42hmbjDJe/SJc550UswL2YSIkozrfVE6PXq+Q6F0SnBUswssEfBYZIXGmI/q6kM
 BFE3+Vx1w0EL0JOLV8Dj2V9D/8puZe02u4SmMtWBd5sgJ3b0Be94Pco6kPq77kmEHKzB
 ehgpYUZu1UArS7lNkBgCosSoiRstm9m5tF7ztNKFCnK5Mhma0m0Wen/ThLN3DOV1OKaG
 Aa87JrJH8yyG6kK8UpUcBlHd7nCoLnm7QuKIFNjdBNBFq1NPxfd0whIfailvAXCxWApX
 vb8A==
X-Gm-Message-State: ANhLgQ0hJuuxU3317W9p6pTHZsAtt+/lI7olZg5txTFqG7o0+A9eHQJg
 ANXIlmt/XF7fFdOxTQPaopu4Y0+BUuQEO86oed+DqHmrpxdbmfILzPIpCnh8N1KSgYRjIfTwxIk
 9l+RTR5hPV97N6DY=
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr18665491wrm.305.1584124646871; 
 Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vujjgTFOCuWjS1sUnHVe14BjCxdTIeVV/2vuhZ1FIR92L6DidbJ7VLByJXmZrt1QAbjPTocEA==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr18665462wrm.305.1584124646657; 
 Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w81sm17726166wmg.19.2020.03.13.11.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
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
Subject: [PATCH 06/14] util/Makefile: Reduce the user-mode object list
Date: Fri, 13 Mar 2020 19:36:44 +0100
Message-Id: <20200313183652.10258-7-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:33 -0000

These stubs are not required when configured with --disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/Makefile.objs | 59 +++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/util/Makefile.objs b/util/Makefile.objs
index 6718a38b61..24ae2e4dfa 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -1,8 +1,4 @@
 util-obj-y =3D osdep.o cutils.o unicode.o qemu-timer-common.o
-util-obj-y +=3D bufferiszero.o
-util-obj-y +=3D lockcnt.o
-util-obj-y +=3D aiocb.o async.o aio-wait.o thread-pool.o qemu-timer.o
-util-obj-y +=3D main-loop.o
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) +=3D atomic64.o
 util-obj-$(CONFIG_POSIX) +=3D aio-posix.o
 util-obj-$(CONFIG_POSIX) +=3D fdmon-poll.o
@@ -21,31 +17,20 @@ util-obj-$(CONFIG_WIN32) +=3D oslib-win32.o
 util-obj-$(CONFIG_WIN32) +=3D qemu-thread-win32.o
 util-obj-y +=3D envlist.o path.o module.o
 util-obj-y +=3D host-utils.o
-util-obj-y +=3D bitmap.o bitops.o hbitmap.o
+util-obj-y +=3D bitmap.o bitops.o
 util-obj-y +=3D fifo8.o
-util-obj-y +=3D nvdimm-utils.o
 util-obj-y +=3D cacheinfo.o
 util-obj-y +=3D error.o qemu-error.o
 util-obj-y +=3D qemu-print.o
 util-obj-y +=3D id.o
-util-obj-y +=3D iov.o qemu-config.o qemu-sockets.o uri.o notify.o
+util-obj-y +=3D qemu-config.o notify.o
 util-obj-y +=3D qemu-option.o qemu-progress.o
 util-obj-y +=3D keyval.o
-util-obj-y +=3D hexdump.o
 util-obj-y +=3D crc32c.o
 util-obj-y +=3D uuid.o
-util-obj-y +=3D throttle.o
 util-obj-y +=3D getauxval.o
-util-obj-y +=3D readline.o
 util-obj-y +=3D rcu.o
 util-obj-$(CONFIG_MEMBARRIER) +=3D sys_membarrier.o
-util-obj-y +=3D qemu-coroutine.o qemu-coroutine-lock.o qemu-coroutine-io.o
-util-obj-y +=3D qemu-coroutine-sleep.o
-util-obj-y +=3D qemu-co-shared-resource.o
-util-obj-y +=3D coroutine-$(CONFIG_COROUTINE_BACKEND).o
-util-obj-y +=3D buffer.o
-util-obj-y +=3D timed-average.o
-util-obj-y +=3D base64.o
 util-obj-y +=3D log.o
 util-obj-y +=3D pagesize.o
 util-obj-y +=3D qdist.o
@@ -54,12 +39,44 @@ util-obj-y +=3D qsp.o
 util-obj-y +=3D range.o
 util-obj-y +=3D stats64.o
 util-obj-y +=3D systemd.o
-util-obj-y +=3D iova-tree.o
-util-obj-$(CONFIG_INOTIFY1) +=3D filemonitor-inotify.o
-util-obj-$(call lnot,$(CONFIG_INOTIFY1)) +=3D filemonitor-stub.o
-util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
 util-obj-$(CONFIG_POSIX) +=3D drm.o
 util-obj-y +=3D guest-random.o
 util-obj-$(CONFIG_GIO) +=3D dbus.o
 dbus.o-cflags =3D $(GIO_CFLAGS)
 dbus.o-libs =3D $(GIO_LIBS)
+
+#######################################################################
+# code used by both qemu system emulation and qemu-img
+
+ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
+
+util-obj-y +=3D aio-wait.o
+util-obj-y +=3D aiocb.o
+util-obj-y +=3D async.o
+util-obj-y +=3D base64.o
+util-obj-y +=3D buffer.o
+util-obj-y +=3D bufferiszero.o
+util-obj-y +=3D coroutine-$(CONFIG_COROUTINE_BACKEND).o
+util-obj-y +=3D hexdump.o
+util-obj-y +=3D lockcnt.o
+util-obj-y +=3D iov.o
+util-obj-y +=3D iova-tree.o
+util-obj-y +=3D hbitmap.o
+util-obj-y +=3D main-loop.o
+util-obj-y +=3D nvdimm-utils.o
+util-obj-y +=3D qemu-coroutine.o qemu-coroutine-lock.o qemu-coroutine-io.o
+util-obj-y +=3D qemu-coroutine-sleep.o
+util-obj-y +=3D qemu-co-shared-resource.o
+util-obj-y +=3D qemu-sockets.o
+util-obj-y +=3D qemu-timer.o
+util-obj-y +=3D thread-pool.o
+util-obj-y +=3D throttle.o
+util-obj-y +=3D timed-average.o
+util-obj-y +=3D uri.o
+
+util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
+util-obj-$(CONFIG_INOTIFY1) +=3D filemonitor-inotify.o
+util-obj-$(call lnot,$(CONFIG_INOTIFY1)) +=3D filemonitor-stub.o
+util-obj-$(CONFIG_BLOCK) +=3D readline.o
+
+endif # CONFIG_SOFTMMU || CONFIG_TOOLS
--=20
2.21.1


