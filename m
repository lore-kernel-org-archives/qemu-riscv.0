Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14C1CD610A
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:44:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptM7-0001Yd-39; Mon, 09 Oct 2023 12:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptK8-0005Zw-Nc
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:41 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJi-0001Yb-GC
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso47858425e9.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869671; x=1697474471; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG2NkApx4TVidHIbE463d0CCb2MX5UuJ0CO2x3DfXcM=;
 b=VHPcBfdx2L7ZbR58IPP7pSCrU/Nmybk9SLs6Ki0CEKuojLFfqOlYL23ZzZ7tqGQbCW
 /MAHfJugVKRxbeZzuWfGerDQtP/fZpMYvdS++h59+ZPRUcvPIBmza4MOvqRyPBBNkSCh
 UC/nPXejCTfGMetaocCKw4A1R44WBByHO+619EbgFZjtu39O8wORv1KnODf8jBXZ3P5X
 QTbVPCzmz3Pa3VNam5EVh2o6NdkKxMq07n6nL3EG4PugSXeHml9GhrnCJvEE0R1UNKPD
 hqxgrX32/MjK1oAuDZLjtpMVKQySnODoG2xnvm4t1YyZELgWdmvFeyXV1fGZu+IsFIiI
 xKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869671; x=1697474471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG2NkApx4TVidHIbE463d0CCb2MX5UuJ0CO2x3DfXcM=;
 b=UgGXRlpgIUbQmHQPxWoX5Y6xlSpvszn6PIS8gt4wngbElnI7inv03HUbwMTDz30eHr
 X4xoa4aq4XHFKSPaJLjlansbPiJ2LX4hJxg4+ppljNbzJf2dOyVWW8AKbVzYxM1Zy9FI
 3yfnI6asoZZReJPZZ0NEc+qQb47ySBdFM79PTlbvMK/NhyU3IMJszzitxrgvbN24zq0P
 InkzwOcEYScVctx+RUd4od5+qSQoNyOto9eXReALBkl+L9emt70ofyXCzvCXimBJECwR
 DfIOBW1frfFBvXj6AJyhpfTRoAOnCjdLRQN4tY1GWjl/JjwZ2y56CFK8s9KbeMm4k8Uu
 ZAvw==
X-Gm-Message-State: AOJu0Yy707lS8RYGrvWaUPe4DzrQkoYsNXdASiS3mYhP5EOTjWj3S4QS
 wDxboPs080pbgISnrKqJ4kFUGQ==
X-Google-Smtp-Source: AGHT+IGcNimySsZb4tRiTGZiBWvhHnCHB+7wD1cnjYSQnpkGj8cm3mJFteeRK3/s4GEngyCKv1VjFQ==
X-Received: by 2002:a1c:7218:0:b0:401:d803:6243 with SMTP id
 n24-20020a1c7218000000b00401d8036243mr13668682wmc.32.1696869671310; 
 Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c290200b004063d8b43e7sm13939902wmd.48.2023.10.09.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BB891FFC3;
 Mon,  9 Oct 2023 17:41:06 +0100 (BST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 09/25] gdbstub: Fix target.xml response
Date: Mon,  9 Oct 2023 17:40:48 +0100
Message-Id: <20231009164104.369749-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
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
index 8eea21450c..4f3762fccf 100644
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


