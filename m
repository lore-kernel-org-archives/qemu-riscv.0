Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2b-0004Vp-GE
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2Y-0004Q7-Mi
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:54 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37712
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2W-0003zQ-2s
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCu1YrhTJjejQcgij5XVIZ/Ye4jrjBse1uys9dbFqrw=;
 b=TROrAPSSqnxqgm62WAjnEeGVvYyqDpWoI9YVLFWxGM4tSwXRMne5qihsh20YKmQaCTWNxj
 LJql4T6INQ34buZ4eUDFpcWY56GLn5MAZapALYirzxG9cBRh5NbsycWiGM9jV0ptZaHyLQ
 gca8Rgu5qYitL1JHcWC2AGtoZy9Sln4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-fN-HI5LiNwiSF71d12IJ8g-1; Mon, 04 May 2020 11:29:49 -0400
X-MC-Unique: fN-HI5LiNwiSF71d12IJ8g-1
Received: by mail-wr1-f71.google.com with SMTP id g10so2198795wrr.10
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBm6iXG2AmJPKzos6aygZtDKqUrNpWwCtujkhJgXs28=;
 b=K66p/7g/mi0G6bC7pzuK5FdChy/F6RP+j2yqNcwcL7PZis7qZegK6li0CwgLcMTO90
 GbsLEg6SN/cig3iDO49rIFAxUVs+4LUmp6fjRsTLTuEeKpJg9USTR+HOTBZkrIfbVfQy
 8niavoLA47DcN4KcDl40ukQO87DVLLru2hKy+ZdV21SltpboPyg3lecSj7szplPKD2Qc
 D7gCU5aYFX23IiVRMqNS9PXs+4P9BgXxR7xwJfbZAufs3aibXOk1u3KxuV0Ra5DMWOrK
 LOnqjLwtI6q8IVRys+NeBcHKgETFXxXKv/QqL0GtKOaXlyXV3bqxl/4AHExOWqlNmx4+
 9tAQ==
X-Gm-Message-State: AGi0PuaBmKVZG6gSdgk8qmeFoJlyScMRNGYMjbAGs/Pl8/DN6s3qH+7Z
 Xqmp5VTd4wpwJfFGktiJZE1L7pHe9FSceEKV1vC2/KeAa7/zcPMGkmNHsf0GMYlsak0f34m5LIk
 4Qy0ADzIOla9KpE8=
X-Received: by 2002:a5d:5001:: with SMTP id e1mr20669571wrt.27.1588606188744; 
 Mon, 04 May 2020 08:29:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfuQElc8hGPHg+b08JMKnR88tgmqAWx+uPvu7PDRmObrxUxBkEVQeIVFyMr15iUz8iYcnvNA==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr20669530wrt.27.1588606188487; 
 Mon, 04 May 2020 08:29:48 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a9sm13420623wmm.38.2020.05.04.08.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:47 -0700 (PDT)
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
Subject: [PATCH v3 05/12] util/Makefile: Reduce the user-mode object list
Date: Mon,  4 May 2020 17:29:15 +0200
Message-Id: <20200504152922.21365-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 08:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 May 2020 15:29:55 -0000

These objects are not required when configured with --disable-system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/Makefile.objs | 59 +++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/util/Makefile.objs b/util/Makefile.objs
index fe339c2636..cc5e37177a 100644
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
@@ -54,13 +39,45 @@ util-obj-y +=3D qsp.o
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
 util-obj-$(CONFIG_USER_ONLY) +=3D selfmap.o
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
2.21.3


