Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2X-0004Oz-Hl
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2U-0004MK-GN
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50508
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2S-0003wu-9h
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzjFGYeyA7fxzZ4S4JE9jIEkOlhfa7FY1QFxpsymjr4=;
 b=BpCD4vGE1WjJkFDoxtVwR3DRxdvvY8e7dcOaeJ6PWg7En7CNJTtPHQNTPXEXWEIfyHTmC5
 VCsD04hZ9j/Z+49/91bBTnIN3LudSNqPnqm2MLRs/qW5ynb4MF119JQ4en6q3BWn1TpjpN
 a3W5i36lIX5gNK+4px8SHzTkw1BKOJk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-9JDAsVcQO42QFoIkOT2kvw-1; Mon, 04 May 2020 11:29:45 -0400
X-MC-Unique: 9JDAsVcQO42QFoIkOT2kvw-1
Received: by mail-wm1-f72.google.com with SMTP id f128so5100538wmf.8
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0X34V8aQzrq0BZhG8xlo5+YxEM577LoFjmU1+MQKArY=;
 b=rUb/bO2NdBIVyqjFfH5D3rf6JI4aZLzRNo+e0CGzXay8FpXCb5NMXKHjb3l9ShN8x5
 6ovTw///XXkElgdo72l94x6sprhl57Ts5L4881sNVO+RCE2Z/mcO71fKuq2vojRKslA/
 QLrtVIlBf32Hjgsz0rjsppEVluYST42t0ApiHlU18aAkbE+RRPORGRpLZ2ZZ7qcFN2qe
 R8FNuWBmSWBdCZeuQ53EJHczaJJEfb8gwZ4r/cYDm+j+I3/DSGrZRvrJvjpOydB/Roca
 CW5dY/XAwXGJ0pVpdmXfP7GrYUgDgTOFpaC8+ek1PVZEDrKwrjSIcGAb4Lp2Usv2x+Us
 JBVA==
X-Gm-Message-State: AGi0PuamCdQZpvVAfBcv56CM95Jb63/GwU9YBjnoGAp8QK6RQcSS2c4Y
 VG3vqKfCs5zP1QJVpE6fWw4kfcUY8lLfkiL0QmpPOs933r+iIBqyMrwYAhnYTJJitWnPnYpM/Ss
 kFgChDM6pFmcx8qE=
X-Received: by 2002:a7b:c399:: with SMTP id s25mr14764970wmj.169.1588606183792; 
 Mon, 04 May 2020 08:29:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGGPTLOI5sYRFL6UjLMC4TFiL55xbulI+3ij3bDz37Ak+WiYxOPdolRH22bbnRhiWIcHk1vQ==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr14764934wmj.169.1588606183540; 
 Mon, 04 May 2020 08:29:43 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id p190sm14382931wmp.38.2020.05.04.08.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:42 -0700 (PDT)
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
Subject: [PATCH v3 04/12] tests/Makefile: Restrict some softmmu-only tests
Date: Mon,  4 May 2020 17:29:14 +0200
Message-Id: <20200504152922.21365-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 04 May 2020 15:29:50 -0000

In the next commit we are going to remove some objects from the
util-obj-y variable (objects which are not used by user-mode,
when configured with --disable-system).
Then some system-mode tests are going to fail, due to the missing
objects:

  $ make check-unit -k
    LINK    tests/test-iov
  /usr/bin/ld: tests/test-iov.o: in function `iov_from_buf':
  include/qemu/iov.h:49: undefined reference to `iov_from_buf_full'
  make: *** [rules.mak:124: tests/test-iov] Error 1
    LINK    tests/test-timed-average
  /usr/bin/ld: tests/test-timed-average.o: in function `account':
  tests/test-timed-average.c:27: undefined reference to `timed_average_acco=
unt'
  make: *** [rules.mak:124: tests/test-timed-average] Error 1
    LINK    tests/test-util-filemonitor
  /usr/bin/ld: tests/test-util-filemonitor.o: in function `qemu_file_monito=
r_test_event_loop':
  tests/test-util-filemonitor.c:83: undefined reference to `main_loop_wait'
  make: *** [rules.mak:124: tests/test-util-filemonitor] Error 1
    LINK    tests/test-util-sockets
  /usr/bin/ld: tests/test-util-sockets.o: in function `test_socket_fd_pass_=
name_good':
  tests/test-util-sockets.c:91: undefined reference to `socket_connect'
  make: *** [rules.mak:124: tests/test-util-sockets] Error 1
    LINK    tests/test-base64
  /usr/bin/ld: tests/test-base64.o: in function `test_base64_good':
  tests/test-base64.c:35: undefined reference to `qbase64_decode'
  collect2: error: ld returned 1 exit status
  make: *** [rules.mak:124: tests/test-base64] Error 1
    LINK    tests/test-bufferiszero
  /usr/bin/ld: tests/test-bufferiszero.o: in function `test_1':
  tests/test-bufferiszero.c:31: undefined reference to `buffer_is_zero'
  make: *** [rules.mak:124: tests/test-bufferiszero] Error 1
  make: Target 'check-unit' not remade because of errors.

Instead, restrict these tests to system-mode, by using the
$(CONFIG_SOFTMMU) variable.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Reworded description with example (rth)
---
 tests/Makefile.include | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6bc3d1096b..0cb58aad26 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -66,14 +66,14 @@ check-unit-y +=3D tests/check-qlit$(EXESUF)
 check-unit-y +=3D tests/test-qobject-output-visitor$(EXESUF)
 check-unit-y +=3D tests/test-clone-visitor$(EXESUF)
 check-unit-y +=3D tests/test-qobject-input-visitor$(EXESUF)
-check-unit-y +=3D tests/test-qmp-cmds$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-qmp-cmds$(EXESUF)
 check-unit-y +=3D tests/test-string-input-visitor$(EXESUF)
 check-unit-y +=3D tests/test-string-output-visitor$(EXESUF)
 check-unit-y +=3D tests/test-qmp-event$(EXESUF)
 check-unit-y +=3D tests/test-opts-visitor$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-coroutine$(EXESUF)
 check-unit-y +=3D tests/test-visitor-serialization$(EXESUF)
-check-unit-y +=3D tests/test-iov$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-iov$(EXESUF)
 check-unit-y +=3D tests/test-bitmap$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-aio$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-aio-multithread$(EXESUF)
@@ -108,7 +108,7 @@ check-unit-y +=3D tests/test-qht$(EXESUF)
 check-unit-y +=3D tests/test-qht-par$(EXESUF)
 check-unit-y +=3D tests/test-bitops$(EXESUF)
 check-unit-y +=3D tests/test-bitcnt$(EXESUF)
-check-unit-y +=3D tests/test-qdev-global-props$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-qdev-global-props$(EXESUF)
 check-unit-y +=3D tests/check-qom-interface$(EXESUF)
 check-unit-y +=3D tests/check-qom-proplist$(EXESUF)
 check-unit-y +=3D tests/test-qemu-opts$(EXESUF)
@@ -126,9 +126,9 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)=
) +=3D tests/test-crypto-tl
 ifneq (,$(findstring qemu-ga,$(TOOLS)))
 check-unit-$(call land,$(CONFIG_LINUX),$(CONFIG_VIRTIO_SERIAL)) +=3D tests=
/test-qga$(EXESUF)
 endif
-check-unit-y +=3D tests/test-timed-average$(EXESUF)
-check-unit-$(CONFIG_INOTIFY1) +=3D tests/test-util-filemonitor$(EXESUF)
-check-unit-y +=3D tests/test-util-sockets$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-timed-average$(EXESUF)
+check-unit-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_INOTIFY1)) +=3D tests/te=
st-util-filemonitor$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-util-sockets$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-simple$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-list$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-listfile$(EXESUF)
@@ -139,7 +139,7 @@ check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-f=
ile$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) +=3D tests/test-i=
o-channel-tls$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-command$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-buffer$(EXESUF)
-check-unit-y +=3D tests/test-base64$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-base64$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(if $(CONFIG_NETTLE),y,$(CONFIG_GC=
RYPT))) +=3D tests/test-crypto-pbkdf$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-crypto-ivgen$(EXESUF)
 check-unit-$(CONFIG_BLOCK)  +=3D tests/test-crypto-afsplit$(EXESUF)
@@ -147,7 +147,7 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PR=
IVATE_XTS)) +=3D tests/test
 check-unit-$(CONFIG_BLOCK)  +=3D tests/test-crypto-block$(EXESUF)
 check-unit-y +=3D tests/test-logging$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_REPLICATION)) +=3D tests/t=
est-replication$(EXESUF)
-check-unit-y +=3D tests/test-bufferiszero$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-bufferiszero$(EXESUF)
 check-unit-y +=3D tests/test-uuid$(EXESUF)
 check-unit-y +=3D tests/ptimer-test$(EXESUF)
 check-unit-y +=3D tests/test-qapi-util$(EXESUF)
--=20
2.21.3


