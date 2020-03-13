Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBU-0008KA-7u
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBR-0008EO-EJ
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBQ-0002wz-2N
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57413
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBP-0002vL-Ty
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aoJLCXCrlxs+uxn6Eno2ayGO83+rkYY4ustjsPF1ac=;
 b=gQmNvhgcVmtGs6wG6eo9ClCMIX51bqfcY0iBYWXQfT2VubH2w+YeVr5OUCAsemzEXOJ+vh
 fHQ9Nd2ukswdgD7gqKRp0zVftDQytY5OxSZJh/dms5hXJUPzFFcid6xSsRQZuTQNuIuLOY
 jH2yUx0aGM94beWuPhNlE/TFaGSpoFs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-8FFOEvQ6M8yZWnhEnxS1ag-1; Fri, 13 Mar 2020 14:37:18 -0400
X-MC-Unique: 8FFOEvQ6M8yZWnhEnxS1ag-1
Received: by mail-wr1-f69.google.com with SMTP id 94so25783wrr.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yX3/yxF6EHlmvUP2BbzjjZIQps3yYgRSbpFFIqc8F/E=;
 b=hTUHpb1gB4pcGOo2OkGD8DW9s8WnMd94moqFdKnCbKcC8fschDpGyPmkV6w5T5xWvS
 n6DpyVMYcTMNuPKlAFvlAvsbgKh4/p03a7SHmdFGFWb456LRzE75L8MeA+3Y9JOZvh1X
 sBVVriYPw772N820WryG8bQXBfGVA0D2figFUBKlynNEw15kccxvbw1K7ye+759dQoPG
 LC7MqddexbRUNxwVWqXVrISnI0xykwX/IA6ixU7t4mUftMQSWO1dZgVEaZWd+ikgyUHJ
 ceCVYkZtZmOzsaiJ9XiyfWuNCEMu4XIodjSg6lKYRyWjVSOaf8c0ThrdV8s3jDCb7xJI
 SElQ==
X-Gm-Message-State: ANhLgQ0qS/tLiVIAsgYdjUbax/LxJDLqgafznxkJEJ0TeyrosIpz1ADF
 RRahmhSTeRyWKtluv6n7PcgvpgLDH+sC3tWxmHiWEe7D1skj+Pe6kc+aV155QJFwflLmRU8K1TL
 dACp2kmSW05IpjW4=
X-Received: by 2002:adf:f58f:: with SMTP id f15mr20039037wro.16.1584124636775; 
 Fri, 13 Mar 2020 11:37:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs+YASwG+nS4kzBdGtTjiJzofimMO54RlgalOMRsiMkPw/ith6XkJN27+mO5FmTGtPyElY/Jg==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr20038999wro.16.1584124636423; 
 Fri, 13 Mar 2020 11:37:16 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id m11sm33980849wrn.92.2020.03.13.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:15 -0700 (PDT)
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
Subject: [PATCH 04/14] tests/Makefile: Restrict some softmmu-only tests
Date: Fri, 13 Mar 2020 19:36:42 +0100
Message-Id: <20200313183652.10258-5-philmd@redhat.com>
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:23 -0000

These tests fails when configured with --disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 99db5eb3e0..bf11f765c3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -64,14 +64,14 @@ check-unit-y +=3D tests/check-qlit$(EXESUF)
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
@@ -106,7 +106,7 @@ check-unit-y +=3D tests/test-qht$(EXESUF)
 check-unit-y +=3D tests/test-qht-par$(EXESUF)
 check-unit-y +=3D tests/test-bitops$(EXESUF)
 check-unit-y +=3D tests/test-bitcnt$(EXESUF)
-check-unit-y +=3D tests/test-qdev-global-props$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-qdev-global-props$(EXESUF)
 check-unit-y +=3D tests/check-qom-interface$(EXESUF)
 check-unit-y +=3D tests/check-qom-proplist$(EXESUF)
 check-unit-y +=3D tests/test-qemu-opts$(EXESUF)
@@ -124,9 +124,9 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)=
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
@@ -137,7 +137,7 @@ check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-f=
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
@@ -145,7 +145,7 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PR=
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
2.21.1


