Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77778CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmtl-0001S7-KO; Mon, 25 Sep 2023 10:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmth-0001Cx-0L
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtS-0008H9-NX
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-405524e6768so42940785e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653339; x=1696258139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tmt0on2gqtEUKqiKbv0NO0bzg7ahn0zMA7M5ykdCtXI=;
 b=vY1SmGV5G79fgZkVlnyyaHJV6nVLQ4vV1Wx3B0Ud1rV87XGurr3OzpP+bEccFbNA0c
 RCKSYDU4sxKDCTenAnxuRbZvQGj8AbuRwQ1RegzOOSZ066NA7KoF1PXjFxBV/fN9sMhU
 LNIogWKuWEbEl+4jUNI6L7JznNLLQsPdnD9HLK49hATH9YRpdbz5qYKx3bTZAn9M7UM1
 3Jq/m3U1M1lz0US5DNTvGXb2KfGPmyPqL5mDn9/qZPt0ucAtRYoK4nMbJb+60N9X1q2+
 yCRJiDlr9PrUQlcnsoDvAtLRh7PVtiKqgoksT9vBGBkIA27+BCTCFzS+uF3HFR3cF2LN
 ZWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653339; x=1696258139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tmt0on2gqtEUKqiKbv0NO0bzg7ahn0zMA7M5ykdCtXI=;
 b=Mk6wBHnYAEFdoUO2tpMtUzpOFAgGjyRsaYx1TDMNN+Ajsejz5KAWErwr5CXEV2Q0hA
 q1aNypyyy/VDZRZsCJ0fyQnYQ3xWI6Kli43WbAFWbYeLBmddzHMiEEYt5ph7YsyTQuxU
 gl4+7Y0rCTZsqAwdN6gGhhAVxisl7GuK5ZslRS9hDud2rrQ7VhkUOyr6g0DPgGEyh1bp
 HAhZMXa2fkjpKuqY6OGAB98ekBZCb/NaFWFVBbe/ewRm7l4JANJIpm8ewRjLh7s65spi
 QUIXs36F0eKGKTxaBkaijFnIKAoOWPvo28VFRyL4PHTFpfUNmshApICNKmna50v9GYHi
 2OlA==
X-Gm-Message-State: AOJu0YwhNWD00ckVJ3Vg9S5F6ZSWyc3DP9QjQvS55vmhlqYAtJa/arZv
 iq0BZlbetKVApKdG5t54Etdh0Q==
X-Google-Smtp-Source: AGHT+IHCrryrBzsPj/q9XxzJDXcaN/RZ559iKlhX9u2qSpA9P1GQgog7di0ZG4gtChK2Ua0luo0V0w==
X-Received: by 2002:a05:600c:3b89:b0:405:9666:5242 with SMTP id
 n9-20020a05600c3b8900b0040596665242mr767794wms.31.1695653339270; 
 Mon, 25 Sep 2023 07:48:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c171600b00405442edc69sm8244128wmn.14.2023.09.25.07.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA6341FFBC;
 Mon, 25 Sep 2023 15:48:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 07/31] configure: remove gcc version suffixes
Date: Mon, 25 Sep 2023 15:48:30 +0100
Message-Id: <20230925144854.1872513-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

The modern packaging of cross GCC's doesn't need the explicit version
number at the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index ebad155d9e..e83872571d 100755
--- a/configure
+++ b/configure
@@ -1334,7 +1334,7 @@ probe_target_compiler() {
         # We don't have any bigendian build tools so we only use this for AArch64
         container_image=debian-arm64-cross
         container_cross_prefix=aarch64-linux-gnu-
-        container_cross_cc=${container_cross_prefix}gcc-10
+        container_cross_cc=${container_cross_prefix}gcc
         ;;
       alpha)
         container_image=debian-alpha-cross
@@ -1397,7 +1397,7 @@ probe_target_compiler() {
       ppc)
         container_image=debian-powerpc-test-cross
         container_cross_prefix=powerpc-linux-gnu-
-        container_cross_cc=${container_cross_prefix}gcc-10
+        container_cross_cc=${container_cross_prefix}gcc
         ;;
       ppc64|ppc64le)
         container_image=debian-powerpc-test-cross
-- 
2.39.2


