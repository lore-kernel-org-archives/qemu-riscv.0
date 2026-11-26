Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B7606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxBEUzqU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWaav-0008ET-Nn; Thu, 26 Nov 2026 09:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaaB-0007d0-DE
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:19 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa5-0001fe-De
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 09:36:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4a9be758734so4503302f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703771; x=1796308571; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Q28Zkm6Imddycp744yCwHnsZdff3NyNMmmodEEbvWlc=;
 b=TxBEUzqU6taeWui+96v2XiN4v0pLabN+pI3IaHNJx60v4u3K96bAqaAVvDWi4eK/kp
 7l12TM4PbNmQk5GOj1w0axqnvU0i7j9yUQ4plTG2khI0I3dnoRToY0b9riVvHNc/QmA6
 CcLbqyD0y5V/n1UU9Lf6zhpFlmv2ev4m47iq7RPQKO4mt947ntPxVuvxP/ytR3AK4Vv9
 BSdeS+1yRJLClo9TXa8xgiCcaCbVRzeXorWng/9xO1g6/9Jhc9KNQjh8QGQPBtJFfcLP
 Zp/HLxdvxM+X+Umk0SLMIrF0jARW/b/Z0f2/16o+l6OC2vInWLxQHEDQtsj5R+ZynwKI
 +94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703771; x=1796308571;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Q28Zkm6Imddycp744yCwHnsZdff3NyNMmmodEEbvWlc=;
 b=nCu/ohwJxyU+wCDP+F2gAX26SJOMYM/pfwAaDjMyIlEQ7+tXqFcB2d25zCbygY3ZDM
 ZBtFsREu0mp5m1pNmvDbTH49+chct/6yX6SgOFPg0Til6E+o1zHFzuBLw6GwGbOWXFvI
 0CYz0uB4E1gg9QNMvCAMrqi64J+A1yL5AIZE7ampNDbL62Of6c14qwwayhSX9YLXnLer
 VDpy9Z3Cs2kIga5qhfawsGQFFlIdjZfdrdBerniuTBOrW5JuP6wwOTcl5GjbUP7IJRK7
 iDjtS62DdMhc9ZNcKj6tH1eLLpNrsSqaS7es5n/FiEO40iBiM6cLQP/sR2mOWjNXQtN6
 1lgQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG/zM8JNLUpK+2xuDfADFhLcvipvu51mVKWdz7ZjL44s0vLf6Kc8CTxGImHk/XxwAeWRnqxT93Niz6D@nongnu.org
X-Gm-Message-State: APuU4Z/AgPg65ODOOMF2vbB91d3IqnLdWV3QZVZpnuS5DcSWKQrxKXxP
 G024hR7ic7LRKvG23XNd9s2aVI3fr/SgxXovRCo1o38ufjJ1XmxMpBN04UhRTqE9kXE=
X-Gm-Gg: AZFdTZcNY4CXH6xQsmjzWwix8rdJsKyiIGwzA08rYHeAADMbyvyAs9ZLoySMdlBccDw
 51D/ZDnH6e9PRmPlQDpzRcs0cRNP/LhUn53i9hKHXfX+/x5W2i31A4L7fHubgJ8uGifMIbbguAz
 c9RlTQRcB54oNENJn4XZ7+DSgbsgM0YOv8cxXzpYZ2ztmh49v3AOUryGBh0lZ4mIxIUDTE7IfdF
 rUX3ChA+KQ708o9Us4T0zpHTP3UjqfW36Qs6Qjoqk8pUQDune1hc0Z6ffyc4tHvLX8gyXE5KjOL
 qcWGFIU4D/QWuqHUvI6YPOZs4eygYnu2FMJl9zez5tfxeg+oRLz7baOYj3aynCitq/IdtLkClo4
 XdD7MK4P/Eu/z+qaEu9qwyBgzl/SZ6r+U+Fbd0TTeBJu4gaHOFr8pk48khOlYUGr+w+ryr1ADVt
 wS7Dd6+XZRLdS7EnEbXH/1VJOxM9iFgfxxsPWccyq0Z/vX0cHtHVN2FjVuuMa3gsX7nFVnm8jGW
 FeMr32kdLFqpSR6VA3Jz8iSPKa4xbhQm2CaI7Vua6p/rXzc0SWk+iZLiAhsNESmqI2FsCjBEGDR
 h7rv+lPLg3ytQoG0wToF9j2bXOyQ
X-Received: by 2002:a05:600c:46d0:b0:4bb:8711:fee8 with SMTP id
 5b1f17b1804b1-4bb8881894amr427166195e9.20.1795703770907; 
 Thu, 26 Nov 2026 06:36:10 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853368d3sm600746945e9.1.2026.11.26.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8CCF15F9CE;
 Thu, 26 Nov 2026 14:36:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/8] MAINTAINERS: update Daniel's entries to be consistent
Date: Thu, 26 Nov 2026 14:36:00 +0000
Message-ID: <20261126143607.2374676-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126143607.2374676-1-alex.bennee@linaro.org>
References: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When testing my get_maintainers.py I was shocked to see:

  ➜  ./scripts/get_maintainer.py --list-absent-maintainers-since "2 years ago"
  Maintainer              Last Seen   Email(s)                        Subsystems
  ------------------------------------------------------------------------------
  ...
  Daniel P. Berrange      2024-06-10  berrange@redhat.com             QOM, QDev, Seccomp, Cryptography, Buffers, I/O Channels, User authorization, Sockets, File monitor, Functional testing framework, Build system architecture, Meson, GIT submodules

Which is of course incorrect but tripped up by the fact we have been
utf-8 clean for some time. There are some entries that are correct so
fix up the rest in solidarity with my fellow utf-8 using hackers ;-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20261120182200.789086-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e001a85ee3..8c5a40a6929 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3750,7 +3750,7 @@ T: git https://github.com/kostyanf14/qemu.git qga-win32
 
 QOM
 M: Paolo Bonzini <pbonzini@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Supported
 F: docs/devel/qom.rst
 F: include/qom/
@@ -3765,7 +3765,7 @@ F: tests/qtest/qom-test.c
 
 QDev
 M: Paolo Bonzini <pbonzini@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Supported
 F: docs/qdev-device-use.txt
 F: hw/core/qdev*
@@ -3998,14 +3998,14 @@ F: tests/qtest/dbus*
 F: scripts/xml-preprocess*
 
 Seccomp
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: system/qemu-seccomp.c
 F: include/system/seccomp.h
 F: tests/unit/test-seccomp.c
 
 Cryptography
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: crypto/
 F: include/crypto/
@@ -4026,20 +4026,20 @@ F: include/qemu/coroutine*
 F: tests/unit/test-coroutine.c
 
 Buffers
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: util/buffer.c
 F: include/qemu/buffer.h
 
 I/O Channels
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: io/
 F: include/io/
 F: tests/unit/test-io-*
 
 User authorization
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: authz/
 F: qapi/authz.json
@@ -4047,14 +4047,14 @@ F: include/authz/
 F: tests/unit/test-authz-*
 
 Sockets
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: include/qemu/sockets.h
 F: util/qemu-sockets.c
 F: qapi/sockets.json
 
 File monitor
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: util/filemonitor*.c
 F: include/qemu/filemonitor.h
@@ -4192,7 +4192,7 @@ F: docs/specs/fsi.rst
 F: tests/qtest/aspeed_fsi-test.c
 
 Firmware schema specifications
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
 S: Orphan
 F: docs/interop/firmware.json
@@ -4693,7 +4693,7 @@ F: tests/vm/freebsd
 Functional testing framework
 M: Thomas Huth <th.huth+qemu@posteo.eu>
 R: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: docs/devel/testing/functional.rst
 F: scripts/clean_functional_cache.py
@@ -4725,7 +4725,7 @@ F: .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
 Documentation
 -------------
 Build system architecture
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: docs/devel/build-system.rst
 
@@ -4749,7 +4749,7 @@ Build System
 Meson
 M: Paolo Bonzini <pbonzini@redhat.com>
 R: Marc-André Lureau <marcandre.lureau@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 R: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 S: Maintained
 F: meson.build
@@ -4781,7 +4781,7 @@ F: hw/*/Kconfig*
 F: target/*/Kconfig*
 
 GIT submodules
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: scripts/git-submodule.sh
 
-- 
2.47.3


