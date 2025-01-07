Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D66DE77197
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 17:01:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCua-00037J-Qq; Tue, 07 Jan 2025 11:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCu5-0002DA-OS
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:58:07 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCtx-0006v8-Ku
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:58:04 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso114344575e9.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736269076; x=1736873876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmaBQafc1hcOcHjmvqmTitVigBgQH5FjwDw2a2hIcHI=;
 b=IhT5l9186tYJYy5kkb0qVdJ1CwyZPpehWg4/3DmiDywqqsz6p2H35p1zsWfHRsKjkD
 9dkQlAsAktw9FNEP/zoP04JBo178r12txvO9xxZ8t6q3oWOZbneX+LIsYURkKjUyJAVG
 vFK53ZMnfYElT5zkXB4/t2kSGhu/eEkJ6KMXyvYrOUo2mEXlVy67ji5H0tmgRgovhNlT
 QbiR+vhj3wOPpJ8cbon42pYlMPrycv+fiwpRLm1VeJDDBinMuMyJ7EASFewMMbGEqqL0
 5ZPRja2pZFEPnxIjSiHgwbTJluBPn9CMEZ52fOB3JP6W/RTGxDYGCIJ0nbv3//+g240j
 KDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736269076; x=1736873876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmaBQafc1hcOcHjmvqmTitVigBgQH5FjwDw2a2hIcHI=;
 b=oj5IrvkUOkzPfXlr2vQPRcYhjYdtXV/aPoxlwSeOF3Mfw0+9k3fqWl5rg0W0yPq9G2
 C1/JSbbFx0d/7nUArvNYkKVFIf9VjlwH6ReR6KBt0y5o2dBedhRMU68LQuaIvgcQmjRl
 sg1sNHniSUjzikgroP+6IF5M68J+FzpAM1OPxNkmGMK9oR1O3lq9jyCnQuLdqeQtjuuu
 e5uCKQwouxSO9WVsnrDonGnE5MYBkaKKDt+uiikywKn6eCC0KRbxMsJA8VrHSEHqYmcM
 GS4T1K43rpu8FC0IFeGo6ia3lkzmPORtcxb7Hh+tZwMn+TxwuxGZQGkYM7MfWs9zDZTr
 NZpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH6dllBm7SErRFOo+Zz7FQi1+m6B2s8KEmfAo963uEI5aw/KdBqvWT2MOrHmAs/MdgOPNDp0WaqSIJ@nongnu.org
X-Gm-Message-State: AOJu0YwrOUhSNizwV5sPBq6psY639rDfhOc4UBzZbduqhOvwnUkBNvuT
 8YldPDKoIntefcg1SZrAbpvUPSsgR7Gut5r2kUsL0WdjH7RLZAu3uy+R87p/b5U=
X-Gm-Gg: ASbGncu5gdLEdsusUIgHZ15MzwHxLvhXqSMzeXrhvoLezrGhGax/WUjMXQIHuGN9nC9
 /2NrlhDTkoXdNDKgU10+5ikY6NbWgQrWP2F7pO9d0pxrey2PVlGAY5Ln3ad82JfldhUZNHbumn9
 4Wye+rnqDlX3LJGl3yYSzW4HG0T+xSQTAlFQAHzVR0+iGDT0984tDcU+oocsy9haTX6eWFc8O88
 XT0SJYsNP10IGUwKTSop3MF7n/jkGocaSZQPnbLzdFGqQFlbOpLVoY=
X-Google-Smtp-Source: AGHT+IHIiQA0UrClHndchLe3wsTOvHly+pLlflFj495fnUqG7Hr9zCIqcXDumFHeW5YQLfbH4ERt/Q==
X-Received: by 2002:a5d:47a9:0:b0:385:d7f9:f166 with SMTP id
 ffacd0b85a97d-38a221fa11cmr45355632f8f.17.1736269075813; 
 Tue, 07 Jan 2025 08:57:55 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6ca5sm52045565f8f.86.2025.01.07.08.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:57:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BC88B5FD35;
 Tue,  7 Jan 2025 16:52:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 19/29] tests/functional: add zstd support to uncompress
 utility
Date: Tue,  7 Jan 2025 16:51:57 +0000
Message-Id: <20250107165208.743958-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
 tests/functional/qemu_test/uncompress.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
index 6d02ded066..404eee1f83 100644
--- a/tests/functional/qemu_test/uncompress.py
+++ b/tests/functional/qemu_test/uncompress.py
@@ -12,6 +12,7 @@
 import os
 import shutil
 from urllib.parse import urlparse
+from subprocess import check_call, CalledProcessError
 
 from .asset import Asset
 
@@ -38,6 +39,18 @@ def lzma_uncompress(xz_path, output_path):
             os.remove(output_path)
             raise
 
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
 '''
 @params compressed: filename, Asset, or file-like object to uncompress
 @params uncompressed: filename to uncompress into
@@ -59,6 +72,8 @@ def uncompress(compressed, uncompressed, format=None):
         lzma_uncompress(str(compressed), uncompressed)
     elif format == "gz":
         gzip_uncompress(str(compressed), uncompressed)
+    elif format == "zstd":
+        zstd_uncompress(str(compressed), uncompressed)
     else:
         raise Exception(f"Unknown compression format {format}")
 
@@ -79,5 +94,7 @@ def guess_uncompress_format(compressed):
         return "xz"
     elif ext == ".gz":
         return "gz"
+    elif ext == ".zstd":
+        return "zstd"
     else:
         raise Exception(f"Unknown compression format for {compressed}")
-- 
2.39.5


