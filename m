Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3ABC47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL58O-0003vz-0x; Wed, 03 Jan 2024 12:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL58L-0003rT-D3
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL580-0002TR-7N
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so3024800f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303239; x=1704908039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1rMPXmtlBiD25TB/VWS9sZqi6o6l7wGlXBsxO0xhRU=;
 b=e6NGi+rj7izZQG1DHEYoDWi1w3I60i50X4l4z+HYmfnL6J9kWSH89+YYjMkhwdiaQY
 cb+AWIXk2+K60fhc7OhuXvnQD7usNwkUFEn9EIc33TGLPgQsC8GXTvztfdI6n/uS0abA
 nqLSNLRBNrBdBMBNgXlDj3ZMW0rmXBnxxYWzJvJgjuxwwq2rB+x1wJXWGmnGALcQoIKl
 brJgTiGIJqQHPdDSeQqa+5T+1KYF+PrvPn7ib59XUwu+iPqKkmEQYHkOMkRT9vNk1PYe
 4mE1Frvquap1T9z1VgkwsaBB+PD6elILUDbYStH+A6H3tn40ft/JiB4SoaW8ZuFluaLN
 n1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303239; x=1704908039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1rMPXmtlBiD25TB/VWS9sZqi6o6l7wGlXBsxO0xhRU=;
 b=mIVk6pnRxWqGjoFXMbZaBpbSYJ8PviHQ3HgeH01Wcfey/KLnxYNuTQeUNEX0H2fZFO
 gmhrED+9CLECi+GQ/DiO3yhhCL+j5ywtar8Rb3ILxVPbyQQR2GGFwElqSqYxpDnxad07
 qbe43bGjMlDLxmHyVFSQRpbW/5Z+fzjpgBIAKOQr9qJkjxvYF74/IinAvN+B/9yKvOUN
 ulZ38eHUv4Laeg6WwD+FZJAmIfcgG1gCDTtXvXlaMkKcbdSMUWF8YpNrfLPOcso8GaqD
 On6u4HP3OofCCtuj6Sl7rC8s+ob9gcLJCz0eGxC0EcZ6gN0t/XntmYDBVKbuK35kCwOJ
 XXfA==
X-Gm-Message-State: AOJu0YxqCSitAEjW+Cxoz1rBLNeYwbVEZQfZNakRd/SOk2SFfC9nc/bj
 PP5dRxgCaCtr8N5Z9W7eQXe8p8KAGRy65A==
X-Google-Smtp-Source: AGHT+IGoegAEw8eIc6J+w1ZnlPQQhLp8Eo/JAhJe/joDQxXfuS1B+vbw8iKXZSou7llER/sVL52p+Q==
X-Received: by 2002:a05:600c:4f15:b0:40d:8557:9266 with SMTP id
 l21-20020a05600c4f1500b0040d85579266mr2005442wmq.23.1704303239306; 
 Wed, 03 Jan 2024 09:33:59 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05600c474d00b0040c46719966sm2952760wmo.25.2024.01.03.09.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 56A705F940;
 Wed,  3 Jan 2024 17:33:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 11/43] qtest: bump prom-env-test timeout to 6 minutes
Date: Wed,  3 Jan 2024 17:33:17 +0000
Message-Id: <20240103173349.398526-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

The prom-env-test can take more than 5 minutes in a --enable-debug
build on a loaded system. Bumping to 6 minutes will give more headroom.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[thuth: Bump timeout to 6 minutes instead of 3]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-8-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ec93d5a384f..c7944e8dbe9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -5,6 +5,7 @@ slow_qtests = {
   'qom-test' : 900,
   'test-hmp' : 240,
   'pxe-test': 600,
+  'prom-env-test': 360,
 }
 
 qtests_generic = [
-- 
2.39.2


