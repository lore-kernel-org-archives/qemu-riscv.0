Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF597E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV6s-0003ri-38; Wed, 08 Jan 2025 07:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0u-00020l-1b
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:24 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0h-0002SG-3g
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso4989485e9.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338685; x=1736943485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOL1w6DXYhRHKCvs8ew1RtJiJh2Nk45cuCcCN9iEMs4=;
 b=cojh8EYWvYwldfOYHrFd1MpOdhQum4LsLpyU4k3KyR15pcgufLyMnpeYYvJ26pwF52
 l8hzpM8ACJmXmc0uAPO0Rfwy7AxtCCT07o2kVqTGf/bDt19VO5dnV1GoE+cruFLubMaF
 m1WGI0TFyK6x5veQT4vElFwbtB+a8mP6ikCGi4Jtt0T6Wo8IrkrjZ4r2QaecepmQ4vmv
 I5uRu2eBuLZBfhSBuQ/8txFxzcCNbhskv5PDCmJpomXJ2bVcTr6+RYRCf7Z2P5B/IGac
 Jg1beRvRyx4f2gGj1mYOyWyhrj3HcGKbvth3CNkJ6p5PIH0LDjTbi8/1Esq1dZhOmI6r
 DB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338685; x=1736943485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOL1w6DXYhRHKCvs8ew1RtJiJh2Nk45cuCcCN9iEMs4=;
 b=EYDlFWOhD0n9KNVakatuPyXfFwi4+fzqgdmnmDJKk1XJXMHm3PxBT1J+Ohkv/uN/pC
 E7Z9bgXKYnxWjC5fORsyGQmu6ioqscM9bPjcv7ueqVEGPIuCa94xPAeId/5L27G56CwX
 SBKUBnln5jE3PKn3k06cNvKH/DXAzXvlx96oACLbiISW070Y/Yl0hll1p/TLtDmiuyBw
 ozGpzZigq3NPPXxm23U1cRgaPdCZyfQVQSc+vM0bjlIH5z48hse6OJkpjyyOjbstGNdj
 silfaIXaQz67H+TxdwCRINpeYUFX40N8RTAMKG8a9wECvmvnYGHN76HkMoEgvMI5qtY1
 PunQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXW98yE5g9O+RJ+wh1UWmFl0HW677mTs4cWwjvlEbnzWnj2BLR485XghyRGtNcVQdrB4yERp1s30ac@nongnu.org
X-Gm-Message-State: AOJu0YzzLixhBgcqYev3XTGo1HgCDVRzAwGWHksT6Je3PT4iMaVc9A0i
 dGlrlNx82qUOXD3jK7eI/S1aCohYE9Hjbk7jnR2zRIgym1Vu1u7ymNvytDwIjaU=
X-Gm-Gg: ASbGncsI4Ulit9uUKSypo8jkaR2Bz1pvU8NT0ehPoUCAAHhZp3rEGV9WINqtFNuku0Q
 R5+BDcc1L7GJuB2IwY8GmobvrpwQsTw4XRw5r/n6D8gXOME9VjrvT15z6xarxGiny8GuA/Xcb1C
 nBETPiGEqd8YnT6+nJRi6gziCB/5ArnbzYywrzj70yAdY+y9/YWVgAIFRXtBgS8Y/n9KMp1VpuX
 q2V2IaCO+J5JMsAO+iw5WNIWnluSRDrngTJ2Isk7oKOAMEEQ8oXkWI=
X-Google-Smtp-Source: AGHT+IEZ3BVXJWYZEWA9wGATEo+F/iqXbvp4GLVQdNs9HUMSA1Twx1Wyojh9T4yEtxjJCTF7eUN2kw==
X-Received: by 2002:a05:600c:1caa:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-436e1dd3e30mr23490675e9.6.1736338685542; 
 Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd15766fsm25041785e9.2.2025.01.08.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:18:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3A54A5FDC6;
 Wed,  8 Jan 2025 12:10:57 +0000 (GMT)
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
Subject: [PATCH v4 27/32] tests/vm: fix build_path based path
Date: Wed,  8 Jan 2025 12:10:49 +0000
Message-Id: <20250108121054.1126164-28-alex.bennee@linaro.org>
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

We no longer need to go into the per-arch build directories to find
the build directories binary. Lets call it directly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/vm/basevm.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4a1af04b9a..6f3f2e76df 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -520,8 +520,7 @@ def get_qemu_path(arch, build_path=None):
     if "QEMU" in os.environ:
         qemu_path = os.environ["QEMU"]
     elif build_path:
-        qemu_path = os.path.join(build_path, arch + "-softmmu")
-        qemu_path = os.path.join(qemu_path, "qemu-system-" + arch)
+        qemu_path = os.path.join(build_path, "qemu-system-" + arch)
     else:
         # Default is to use system path for qemu.
         qemu_path = "qemu-system-" + arch
-- 
2.39.5


