Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9708DCE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:52:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkmvc-0004Xu-T2; Mon, 25 Sep 2023 10:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtt-0001pi-9E
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkmtT-0008Hc-ML
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:49:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4053cb57f02so53525055e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653340; x=1696258140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlEhphEtX0KtQL/e4ae/jun4tEwNOtAavPJ6o58muzg=;
 b=o/nUgvjAXOP8v2n0hbHEcBWRjMZI4980/xMJyrB9IzV3Mpu9/kPkYsNFQf4Z2f392l
 CN6cFmmPNhIinKQk3Yr4YOHoht0Ps6NhtxjZzXIXRsmP08/hTWudXOsYZ+VE33/Pd1aO
 rRWPI/GxAbNBTkZ03tV0cKH2Pio6ybNz8y2HIq11I0cpNRAlp4FtPgdfdjq8WqVp/fuj
 bXO5VO/0ZOZ9/eJ/ObccQK4YPHB6S9qWEna7ID+TQMubJ5eu8geo8I/Ub8tzStHuzb6p
 rdO/va++RBpbZxq5MDA4Cpwee1U/mDcgbYYQVF7ulB5NMvVa50aBp4Mwus4M1Bg4UQYg
 mV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653340; x=1696258140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlEhphEtX0KtQL/e4ae/jun4tEwNOtAavPJ6o58muzg=;
 b=hcXASEQ4J/fP+OrehK//C7QQ6XhdCmv62LYZoL3V0QglguGW1+KqZInVhLuk2Od3K2
 XmSvAsjCby1pEKEmFJz1F+3RzZS3ZP4BEW33zISPh/9avTqf9vDcnp/alwhx66DHx9j/
 qMzDpXnrhuT2W39vIz8MP0Sx/PO3xpgV2kKmvCl0fPofukPNfLVzSKrrWyO9/Aosngn/
 PehC4nIey/dgkczp/88f8YEeiRcnrP4BnqL+Giqz99SB5bo3bYFzUgftBROKQv55fkc8
 J1fIJXNd5kzU9HwNdTPGEh8BF2EHujEtDOO7n8XpWLQ9TeJFicRvTqt3RsfChfE/rSjl
 i6BA==
X-Gm-Message-State: AOJu0Ywc5IUi4RvfonSV+GyS972fPpJSWmVgMBnfB4LOz2ZZ98RP0LlZ
 NL6vf5Nggk7NeWGyGJBd+W5Q7Q==
X-Google-Smtp-Source: AGHT+IGhe1u04XO93m5rgLTFr+jl5409HMKnsiFsSpSw9wJkJLs5eAVSrkgDsaznTTLlTJAxliqaUw==
X-Received: by 2002:a05:600c:22cd:b0:401:b493:f7c1 with SMTP id
 13-20020a05600c22cd00b00401b493f7c1mr5917888wmg.35.1695653340198; 
 Mon, 25 Sep 2023 07:49:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a05600c365700b003fefe70ec9csm15207988wmq.10.2023.09.25.07.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:48:57 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 347651FFC3;
 Mon, 25 Sep 2023 15:48:56 +0100 (BST)
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
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 10/31] gdbstub: Fix target.xml response
Date: Mon, 25 Sep 2023 15:48:33 +0100
Message-Id: <20230925144854.1872513-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

It was failing to return target.xml after the first request.

Fixes: 56e534bd11 ("gdbstub: refactor get_feature_xml")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-3-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 349d348c7b..384191bcb0 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -396,8 +396,8 @@ static const char *get_feature_xml(const char *p, const char **newp,
             g_string_append(xml, "</target>");
 
             process->target_xml = g_string_free(xml, false);
-            return process->target_xml;
         }
+        return process->target_xml;
     }
     /* Is it dynamically generated by the target? */
     if (cc->gdb_get_dynamic_xml) {
-- 
2.39.2


