Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C06EE7717F
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:45:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL75n-0007MH-Es; Tue, 10 Dec 2024 15:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75S-00074N-9U
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:06 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75I-00020p-OI
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:06 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-434ab114753so40269965e9.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863435; x=1734468235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEl5ZxIur5QRWg63f27lDW4UGnFwRWpUXbJtYvdKy8I=;
 b=DZo2R3AiX2zuOs7SEzcX00H/VZKr6K2Nc7IH67jPi3LJirhXadWPFqPlv7vEo86ZcZ
 Vx1GG8Ov+3UB511qXrgvE+M1Fgc2Zqkae4Zr3/ev0/28RtH3PyFoUYEz7eazMMEb36kU
 uLG4VJ8ydcJuaTYXC/ALhLHiKJ3YRChbqTORcnZVRQ4/MwKxYRszFVsffpU4qp8dtCPh
 VRKp4k5UB8dOO1xGTMoqfBGXCLG/pHYZvD2xlldyRTqEA0t2lx3y3uAMJwlLcxkhr1ss
 opppSwmboO3Wj4gbQopnNynAN+Wl/GKGXKObwTaqJugCDt8huozRxTcafUMGpQbU++Ul
 UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863435; x=1734468235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tEl5ZxIur5QRWg63f27lDW4UGnFwRWpUXbJtYvdKy8I=;
 b=KQjAq+dHZJIWzzWL2nFmZMyrjfOtA8BpJK9L75zlLsIgWFCEHFauKRKLLcQzZE8Xt1
 chOObTADZ4fhJZdnmDOovG3RRRlxFeSzps16Mjql1f9lqlUTI2aZQkfd2p/T9LacuQNL
 q9ynjjESNkBFnKLakuBAWtSWxwnLqdGDnrFwxBjDekDbINAWy6q1SKsfiMd8SzStwDtl
 DWEpaZLA0mc8JJf6/UaqA/6v4FV8ocexSUfxphkRZ7rJNtNl2SeuKwz7pSq/wrL+KjfX
 1cEiCNUKfAFec/jlrz+Cuq5opTdJw/ktHycWkpE4GnHhoIWnmaT2ZBUSlnYw9oRRBpvp
 AIaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhHEc7pGhJ/VqUYgBn92AK9d2WsNRkdH5E5fjdOUaItA6h+thw16UMuqqnMoIavQHXIsyyh1m/zJrQ@nongnu.org
X-Gm-Message-State: AOJu0YwDWg3bztGnA8Ok+FOQboCaeUM7gz4FFF+hOFywiAU0MlEYRSBQ
 8rKmpVzlP1qTIOpOVfvlyQcKgp8VWcoOQotL+BVA5qGKMoROAZjUSCJZ+relvs4=
X-Gm-Gg: ASbGnctEHF3/P62JQ8AwXJJFEROO+uHv85SgsnhhAcjwyg87qzjaEy03YG1AptT/kEr
 KzUr6HXRXTY91h1f4y2+h0OnfoYwDBzyEqgt9z0IdUhcd49cZxrwc7lQTUhRMYpXKLjDPSx00hP
 lUa4ycyr57KhNKRszVSjSSYup4/jVJUOIPJU2CE27rQ3p9ce5k4BCaQ39wanN1qx42eCtJz5Df/
 tzSUoGlB/SHx66cixyny6ruXTX27pUmLYHGv3hIfVrH3VznzwlT
X-Google-Smtp-Source: AGHT+IEBHhpLlOFQFbhq8X1TdDZ3+EwLyNxVW+ftlgnHPRmOGFVvkDULP1UX9X1fOMA85iXBf+BmUQ==
X-Received: by 2002:a5d:6487:0:b0:385:f349:ffef with SMTP id
 ffacd0b85a97d-3864ce93b84mr394132f8f.41.1733863435197; 
 Tue, 10 Dec 2024 12:43:55 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf3efasm16623919f8f.17.2024.12.10.12.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 077C05FCD8;
 Tue, 10 Dec 2024 20:43:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 07/20] tests/functional: update the mips64el tuxrun tests
Date: Tue, 10 Dec 2024 20:43:36 +0000
Message-Id: <20241210204349.723590-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-28-alex.bennee@linaro.org>
---
 tests/functional/test_mips64el_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips64el_tuxrun.py b/tests/functional/test_mips64el_tuxrun.py
index 819549a27b..0a24757c51 100755
--- a/tests/functional/test_mips64el_tuxrun.py
+++ b/tests/functional/test_mips64el_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMips64ELTest(TuxRunBaselineTest):
 
     ASSET_MIPS64EL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/vmlinux',
-        'd4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/vmlinux',
+        '0d2829a96f005229839c4cd586d4d8a136ea4b488d29821611c8e97f2266bfa9')
     ASSET_MIPS64EL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips64el/rootfs.ext4.zst',
-        'fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64el/rootfs.ext4.zst',
+        '69c8b69a4f1582ce4c6f01a994968f5d73bffb2fc99cbeeeb26c8b5a28eaeb84')
 
     def test_mips64el(self):
         self.set_machine('malta')
-- 
2.39.5


