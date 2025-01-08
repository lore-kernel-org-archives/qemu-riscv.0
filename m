Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B3EE77199
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:26:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV5E-0000np-6Q; Wed, 08 Jan 2025 07:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0z-00023C-Nn
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:29 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0k-0002UM-Ck
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:23 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso168765645e9.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338688; x=1736943488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjWlxLDtIKZu+r0Qe9WGwm1PQIRFhNqusOHCdU7ZfOU=;
 b=poEYslHWA0SSTUngEFXTmEX+xoVS1FLIHIa/r5peunxq9vYFCLoJbRESghKN0xV1Ge
 OVSmSnfDHLVDjCqFNWsS2kqwOPzeBfPHUNzhad9oVhS90TKAPxZQ2ySyjt5KCjyyKBEB
 WD+iip/Awuk4FXY1pBapMNmEiabUZjnfN/K+fTFl65zYSx9CcFusEd9U7boFxdyGU3C6
 ty+x955rivoSPdQB2K/7ZYLUX3QF12IRmt5ioCTe8kj2sn4Qzu4K3Vuu5C9nlFVRCTfm
 C2v+IlZbQeUTB6rDgqCu/bSayefgAhAFNwof7H235JKjQqP0FjnrWYaHLPPdO10d4hdO
 P+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338689; x=1736943489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjWlxLDtIKZu+r0Qe9WGwm1PQIRFhNqusOHCdU7ZfOU=;
 b=th1hJ7BPBtEjpnQVtCxz0NArOrtj6tJK1ZEvoc9R0dgD9pU+2AEIh7qTPAba5O/mlu
 K3Uvfv8f69rb8E+1He5KMwJ3LuaVR1jbQUmhzQgIDCYvAdQp0DzsT+NmvAFUQNgEo/km
 K3iA9dtp2x/J6PGYHMkyR6tGtxBIq0nmEYlHjTHtKcq5Kp3sGiYuckdEu/97kfbjNX0Q
 OHmRjLU7RvqhcXtBY+3FUAGwUA2j71F+dVJm6ggj89gAWTqqF+mhcL43q0UVMu76q5eR
 wM8/ZqXbEHKHBBK+yb1cpyItmizf7GndtsFi5vU9Vt6TQ81PpJZQj42U/7qA117khsti
 ftuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0YsJww9ADJ6jzg69ixbzjdUAEQh0DY7QPTIE1l0oNbDpqnsm/umzwWZjBZkl1/Anx+xlSO6ipLRja@nongnu.org
X-Gm-Message-State: AOJu0YwilB6Y3juaEcIV3FvjWX78yslDcxSHlEarCW431ZBAsugw2MVy
 tQdS4TRGYw/mVLy8SJz0y2oSYEWpNGJEGbmu8WfMwIojW6WDg0Vs9bIOKnjZt/I=
X-Gm-Gg: ASbGncv3J3jdBWy3ZkswUvnwof8XpzW49ycsPIXuzOsSMLxHnv09l9eeD6TRygSQ0IT
 V0DdB5DYV0V+Q/Q+4ajGh+/tzgC6SPNy76KmhcdFnOzxWVfNISLjGIb94WmrvtNwfl2/Ybvkr+e
 EsDu8O7rV8ChzEjobQtUUP983E5Dmc7/N33ovVIDrtpdbMRUxHyQgStFNcEmxcRYQK+X9Sg+ldm
 BKMZpZ3N3XJPNN35B7pJSixcKKQJA2oBGqtxbXBS3mM2C7LW/CQ0no=
X-Google-Smtp-Source: AGHT+IHhfEiiFML1oAIH3q8Uyq16SEFD7wJHnYOSGFxveUil/M7UG3tl0qu/kqaT05wR0kOnSPo2gg==
X-Received: by 2002:a05:600c:348a:b0:436:488f:4d8 with SMTP id
 5b1f17b1804b1-436e2699f29mr19182615e9.11.1736338688652; 
 Wed, 08 Jan 2025 04:18:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a75a47943sm6642217f8f.87.2025.01.08.04.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6FD665FBAC;
 Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 19/32] tests/functional: add zstd support to uncompress
 utility
Date: Wed,  8 Jan 2025 12:10:41 +0000
Message-Id: <20250108121054.1126164-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Rather than using the python library (which has a different API
anyway) lets just call the binary. zstdtools is already in out
qemu.yml so all test containers should have it around. Tests should
still use @skipIfMissingCommands('zstd') to gracefully handle when
only minimal dependencies have been installed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - add chmod step to helper
  - also handle .zst extension
---
 tests/functional/qemu_test/uncompress.py | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
index 6d02ded066..911d74ec23 100644
--- a/tests/functional/qemu_test/uncompress.py
+++ b/tests/functional/qemu_test/uncompress.py
@@ -10,8 +10,10 @@
 import gzip
 import lzma
 import os
+import stat
 import shutil
 from urllib.parse import urlparse
+from subprocess import check_call, CalledProcessError
 
 from .asset import Asset
 
@@ -38,6 +40,24 @@ def lzma_uncompress(xz_path, output_path):
             os.remove(output_path)
             raise
 
+
+def zstd_uncompress(zstd_path, output_path):
+    if os.path.exists(output_path):
+        return
+
+    try:
+        check_call(['zstd', "-f", "-d", zstd_path,
+                    "-o", output_path])
+    except CalledProcessError as e:
+        os.remove(output_path)
+        raise Exception(
+            f"Unable to decompress zstd file {zstd_path} with {e}") from e
+
+    # zstd copies source archive permissions for the output
+    # file, so must make this writable for QEMU
+    os.chmod(output_path, stat.S_IRUSR | stat.S_IWUSR)
+
+
 '''
 @params compressed: filename, Asset, or file-like object to uncompress
 @params uncompressed: filename to uncompress into
@@ -59,6 +79,8 @@ def uncompress(compressed, uncompressed, format=None):
         lzma_uncompress(str(compressed), uncompressed)
     elif format == "gz":
         gzip_uncompress(str(compressed), uncompressed)
+    elif format == "zstd":
+        zstd_uncompress(str(compressed), uncompressed)
     else:
         raise Exception(f"Unknown compression format {format}")
 
@@ -79,5 +101,9 @@ def guess_uncompress_format(compressed):
         return "xz"
     elif ext == ".gz":
         return "gz"
+    elif ext == ".zstd":
+        return "zstd"
+    elif ext == ".zst":
+        return "zstd"
     else:
         raise Exception(f"Unknown compression format for {compressed}")
-- 
2.39.5


