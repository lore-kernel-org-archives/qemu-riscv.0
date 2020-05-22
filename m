Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQT-0004M3-8p
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQQ-0004Ff-1l
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40562
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQO-0001w6-FP
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zVv0NlCMOK9FHuZTBuePmIxIrGLXBKKurLXnwxcUO4=;
 b=CmPr2LarsK2ufLaqY+/jWzfP06i6Gwh+LHg3DsaDRboqhJRwh0uVmvILlodXKtYjHyv+f8
 y8yWm4cQ6Z3dvn6eN/Q6U8PqCosuhX8ZxhRtRHkbOpH9oErR2XRa2rfLEZqyXKfHTCZmsH
 lg87DWMxFs4HGjNXVm3xFxU0ap/f3fQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-xu---w5xMnSldSoxJccmJw-1; Fri, 22 May 2020 13:25:33 -0400
X-MC-Unique: xu---w5xMnSldSoxJccmJw-1
Received: by mail-wr1-f70.google.com with SMTP id d6so507579wrn.1
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zVv0NlCMOK9FHuZTBuePmIxIrGLXBKKurLXnwxcUO4=;
 b=aLq1kQMgzmGLkPZxAQQsGTPKeTvFXfGzIq8FNnYP4S8vvHmP6o5JagCXTo/6lmbK6J
 HOZGa9rFhb9AcO6DpQfKu6nTOEI9SXQeWAJYG6KRny6VIraBQUUeKqUmb6ix6ooGnJgk
 n0XBQ99LPcgoADL4PNH7qDOQrSt6ghs09MkqT18X6fybu9p29PlOz/dTfVj6qWiMWoQ3
 a8UZh9QLmaK4sgqTbZJyKUM/WIT+G42SZBkW87c/CkG7nXiYj/mEum3ns6zQ+T0shvOj
 Q9POhmtHmDFjWV0gBf2ElqU+FRL8AsnblqyBrGoX097tm4djbEtWy1ZsrTW6WUYDvJHA
 D66w==
X-Gm-Message-State: AOAM531KJdPi/bitHno6KO5BB/h9KRcuvyHacVnULYjMOYOK8uzoRItt
 cmKHIe+CEHLzCICbqNERlBYKQq8eVdsgI40qn4Ps7q3j1wy6jb7u422tpG9/t8wHsQW138JX0j6
 jB1ZVu1VLwHmFCiY=
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr4155945wrm.404.1590168332638; 
 Fri, 22 May 2020 10:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3LskL7pEEAgIRi14/ELBuch4/BnO95S5SPntuYMUld7V2gbjKoma2SaM7Jh4froix6nuhEw==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr4155932wrm.404.1590168332397; 
 Fri, 22 May 2020 10:25:32 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 1sm10449061wmz.13.2020.05.22.10.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:31 -0700 (PDT)
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
Subject: [PATCH v4 04/13] tests/Makefile: Restrict some softmmu-only tests
Date: Fri, 22 May 2020 19:25:01 +0200
Message-Id: <20200522172510.25784-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:11:51
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
X-List-Received-Date: Fri, 22 May 2020 17:25:39 -0000

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
  tests/test-timed-average.c:27: undefined reference to `timed_average_account'
  make: *** [rules.mak:124: tests/test-timed-average] Error 1
    LINK    tests/test-util-filemonitor
  /usr/bin/ld: tests/test-util-filemonitor.o: in function `qemu_file_monitor_test_event_loop':
  tests/test-util-filemonitor.c:83: undefined reference to `main_loop_wait'
  make: *** [rules.mak:124: tests/test-util-filemonitor] Error 1
    LINK    tests/test-util-sockets
  /usr/bin/ld: tests/test-util-sockets.o: in function `test_socket_fd_pass_name_good':
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/Makefile.include | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6bc3d1096b..0cb58aad26 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -66,14 +66,14 @@ check-unit-y += tests/check-qlit$(EXESUF)
 check-unit-y += tests/test-qobject-output-visitor$(EXESUF)
 check-unit-y += tests/test-clone-visitor$(EXESUF)
 check-unit-y += tests/test-qobject-input-visitor$(EXESUF)
-check-unit-y += tests/test-qmp-cmds$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-qmp-cmds$(EXESUF)
 check-unit-y += tests/test-string-input-visitor$(EXESUF)
 check-unit-y += tests/test-string-output-visitor$(EXESUF)
 check-unit-y += tests/test-qmp-event$(EXESUF)
 check-unit-y += tests/test-opts-visitor$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-coroutine$(EXESUF)
 check-unit-y += tests/test-visitor-serialization$(EXESUF)
-check-unit-y += tests/test-iov$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-iov$(EXESUF)
 check-unit-y += tests/test-bitmap$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-aio$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-aio-multithread$(EXESUF)
@@ -108,7 +108,7 @@ check-unit-y += tests/test-qht$(EXESUF)
 check-unit-y += tests/test-qht-par$(EXESUF)
 check-unit-y += tests/test-bitops$(EXESUF)
 check-unit-y += tests/test-bitcnt$(EXESUF)
-check-unit-y += tests/test-qdev-global-props$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-qdev-global-props$(EXESUF)
 check-unit-y += tests/check-qom-interface$(EXESUF)
 check-unit-y += tests/check-qom-proplist$(EXESUF)
 check-unit-y += tests/test-qemu-opts$(EXESUF)
@@ -126,9 +126,9 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) += tests/test-crypto-tl
 ifneq (,$(findstring qemu-ga,$(TOOLS)))
 check-unit-$(call land,$(CONFIG_LINUX),$(CONFIG_VIRTIO_SERIAL)) += tests/test-qga$(EXESUF)
 endif
-check-unit-y += tests/test-timed-average$(EXESUF)
-check-unit-$(CONFIG_INOTIFY1) += tests/test-util-filemonitor$(EXESUF)
-check-unit-y += tests/test-util-sockets$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-timed-average$(EXESUF)
+check-unit-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_INOTIFY1)) += tests/test-util-filemonitor$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-util-sockets$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-authz-simple$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-authz-list$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-authz-listfile$(EXESUF)
@@ -139,7 +139,7 @@ check-unit-$(CONFIG_BLOCK) += tests/test-io-channel-file$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) += tests/test-io-channel-tls$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-io-channel-command$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-io-channel-buffer$(EXESUF)
-check-unit-y += tests/test-base64$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-base64$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(if $(CONFIG_NETTLE),y,$(CONFIG_GCRYPT))) += tests/test-crypto-pbkdf$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-crypto-ivgen$(EXESUF)
 check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-afsplit$(EXESUF)
@@ -147,7 +147,7 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PRIVATE_XTS)) += tests/test
 check-unit-$(CONFIG_BLOCK)  += tests/test-crypto-block$(EXESUF)
 check-unit-y += tests/test-logging$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_REPLICATION)) += tests/test-replication$(EXESUF)
-check-unit-y += tests/test-bufferiszero$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-bufferiszero$(EXESUF)
 check-unit-y += tests/test-uuid$(EXESUF)
 check-unit-y += tests/ptimer-test$(EXESUF)
 check-unit-y += tests/test-qapi-util$(EXESUF)
-- 
2.21.3


