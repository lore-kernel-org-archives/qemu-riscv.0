Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3DCE7A94
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmti-0001HF-QN; Mon, 25 Sep 2023 10:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtc-00014k-TK
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:13 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtQ-0008Fn-Qv
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405361bb9f7so64766355e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653338; x=1696258138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iR1iGRTKQhM4i1nnnC3x69E8sH/nb//WSFW8YZTcQR4=;
 b=gTfmiDciHGcnHOh675FpFqs/r5NIxBNOqK82gDzZ5UuhEENXMMqJniNZwLO8fCI3yh
 8597T5mxVWpeQRWw7uLleJNXCBPh2/gDC14B/BOexxxMnzbbj+7eOTiU072hFpRDw8F+
 RVhPdE5wfZT/zamQZW+FIqukOgny3i5B5MN3Fae3q4YG4rVngkqsdleH0dKzVyli83/W
 YEAwU8latFZa+R/FuMirndy+xK8EDN8qM/20n0qS2DrE+go/ocdVpcQbaquL9CI1MQzn
 a3BTux1Y7afAPq+dw/P3F2Rh/kYHzwFhdHA9pgHcgwDYE0jlz7y9x3XB7r2EOCykf7q+
 suYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653338; x=1696258138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iR1iGRTKQhM4i1nnnC3x69E8sH/nb//WSFW8YZTcQR4=;
 b=Pbx6tLS8DhD41dBly5xYOBjwav4B2yKmqIjMCCy0f+J04e82oAEj7/rtMkFR9oWZX/
 kofR+AkS6/UnzeRRFpCVCfMi+uQ0qOOLkhmw5H2R4lUABhz4CJcfofLsZm/fPZ1WZJbc
 NyGuVKGhKHAa3uEC/XgmTslX8+gBXkm+wIaNjGGBd3ohdLbX60UFf0/HK82bQs1d6Bpm
 QbF1F9cMsQErVRTpKuA0qxoImsqyp00eN77yKG8pTQdipVxXgEbcKAsG58Vsr/MeZ/kt
 Ql/F+iW3QF4mxw0ZDm3vOR0H6BFu/T4lDNWXl2rAZ2zZy9dcYsINDSlc9rdtsJOMz6ql
 +woA==
X-Gm-Message-State: AOJu0Yy1/cFI/CHLhOu/NU429d/XeMbcl4HJ9WvzgXZ8L99ToJ5Fc+Oj
 2S7gkRAXC/j14zVu0DQaPtgWtA==
X-Google-Smtp-Source: AGHT+IHugUQ5tOq6CRzPkYCzsBd9E4Yy/hi2wf4KRfr4/Tz70/a43yWShtUDMYE1btwRst1FJhQGdw==
X-Received: by 2002:adf:eb84:0:b0:31f:bab8:a31a with SMTP id
 t4-20020adfeb84000000b0031fbab8a31amr5254791wrn.39.1695653337710; 
 Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bw10-20020a0560001f8a00b0032326908972sm3557423wrb.17.2023.09.25.07.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3B991FFC2;
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
Subject: [PATCH 08/31] configure: ensure dependency for cross-compile setup
Date: Mon, 25 Sep 2023 15:48:31 +0100
Message-Id: <20230925144854.1872513-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

If we update configure we should make sure we regenerate all the
compiler details. We should also ensure those details are upto date
before building the TCG tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index e83872571d..a95e0f5767 100755
--- a/configure
+++ b/configure
@@ -1788,6 +1788,8 @@ for target in $target_list; do
           echo "HOST_GDB_SUPPORTS_ARCH=y" >> "$config_target_mak"
       fi
 
+      echo "$config_target_mak: configure" >> Makefile.prereqs
+      echo "build-tcg-tests-$target: $config_target_mak" >> Makefile.prereqs
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
-- 
2.39.2


