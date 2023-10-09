Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70316CD610B
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:44:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptM5-0001Ue-P8; Mon, 09 Oct 2023 12:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptK7-0005U6-H7
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJi-0001Yx-FC
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so4333122f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869672; x=1697474472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tmt0on2gqtEUKqiKbv0NO0bzg7ahn0zMA7M5ykdCtXI=;
 b=nQ3BtYUrsDG4eC7icXQBGSgYaktbDSljfKELum9im5SPogudEDbsk9EUI0fUWhBdgN
 ym2PlVAfk1UfgaEbUsV/efmx1hZSVBt7ujF5XWrkoCVMOt92y5R8lsEF7qJaAVsu9RWT
 ah8uuu+i/ciAWRwWupvXSynC0bbkJNoFvyAJ5C629FyEwxRVYKtT6cmuOeJnyE+uw6bn
 He4IWOdXSrMNTajrb/innpLulnZbnWpgHcjTGD33Tzy7hhq3482Geapt25L12uFyx1mw
 pQaptDZAJHHdPKyecrhjnzBbs+78x5WXbu1Ffbjht9SWwLWDN084rt8RSbkJ70P6pd3m
 KFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869672; x=1697474472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tmt0on2gqtEUKqiKbv0NO0bzg7ahn0zMA7M5ykdCtXI=;
 b=Vgb4Tp87VHkKHgw6JgDU0hocxrWbXVXfT1uVjDaevSu8jpMB+tOquZ7gXASwkFbZbn
 3yDjcty33E/heWvfONv7WIFxHMunGMqRJmUQK6vy7+Uz2GyaUW6uwzknYhF1C7m8u4sH
 USbHW0GEQZzkxHCGzS8AERUjnbY8j2oJORJpDoqHYG+dGgR/c/DANti+8w8EnfTEfbVo
 GICbMFzkpajX5xicjWmf1n5IyRy7KGvUVIqoj3zzhZRfXFAveKef34BkpKM+HqM1tE+O
 dVuayUb+DhLM/6llJnQ83h03dsIKa2nhiisEIYAWUqU5vrh2OgqFSCGrX1cKh1tu0bhp
 P71w==
X-Gm-Message-State: AOJu0YxacuKkKGaA7yFJyhcjFv+wZ8TjYOJ2G3GCjtCJb25oDIfmzlnL
 hVcnEvprPUZuH0RlO96i+fBtpA==
X-Google-Smtp-Source: AGHT+IEBcJZlt7k9UJZtnfKkrhPX34EZwmKZ0uA+bAYWlstu0IVImsa4NJE0HP1p8JOe+yMPHyYISw==
X-Received: by 2002:adf:e8ca:0:b0:31f:e1b4:583d with SMTP id
 k10-20020adfe8ca000000b0031fe1b4583dmr15722756wrn.56.1696869671738; 
 Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b003296b913bbesm9541932wrd.12.2023.10.09.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF1351FFC2;
 Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/25] configure: remove gcc version suffixes
Date: Mon,  9 Oct 2023 17:40:46 +0100
Message-Id: <20231009164104.369749-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


