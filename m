Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5179CD610E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:47:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptPH-0003SY-Mz; Mon, 09 Oct 2023 12:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOi-00036g-Hl
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOX-0003VW-VD
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so44238545e9.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869972; x=1697474772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tkbJLFSKCFqBt7eF2KdGUHAT+NPxj+IrJR+AQ70tYE=;
 b=gEPQOFgw6dKwgtTEQ9yulODQCWAXuTWPL+7uRcgBQZF/79MclLHI1M0+rpZ9XROpA5
 m+hbLUrwTUILYo1/di4SSAW3V9nn5HUpX/xwcXzCpyy0/zDqmpB4njTQqCBoL/4c+2qQ
 b25gNrxbpAgH0abvd0dd4ftG148D1BOEifGlWyRrm/WaWg3XZ9kxjV41k4bklyIriT3a
 jLGXO5DvyxidagQ+8ygKVooUqLj3veElresb6WOE2JYQyaVS9yZHC1TG9FzyrccXXb5i
 L9HR9NptkjujN5DHLoo/a3NoYUINZA7P7XT6BAFJs13dRgylkpQbbcrdGraENPFeNuX2
 F0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869972; x=1697474772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tkbJLFSKCFqBt7eF2KdGUHAT+NPxj+IrJR+AQ70tYE=;
 b=hz3F3ZaJ+p+6LuCYy2KNMvq5a3Tn3oVOh1OltbMli5dC/d9Z5m28EyYkJJw8+fxyDj
 cB5fApYYDFpFVD+BdsX2KN460gd+7QN4KtQXVbm/nWe3O3yAfW/qw1JkJnih1OZQhexo
 sUcINImZ2lmNbfA3yZ49uGjnW5u4vMKijx2X8YZvUwk7f4Uq3eiIQuqlUamcff5DZ4vT
 P9EHdT9SqsyUNuca2PoD6HVvspR9lQe/tti2ucik1Cj3TcqY1WGgeRLFG3whU3J7KwL+
 OcRLO298vleyAwocYeMf4MlTRiB7klRdFHjDrK3Raeim5j7vhr8XGgMCG8AwWqj8tLt1
 MOjQ==
X-Gm-Message-State: AOJu0YwWaKqpVIrG/6VcwURQsJmq7XJX2z1K39T4JlTVVWSM6N0Kqcsb
 /Cdh5nKbebeusWJl9JTLFkyliA==
X-Google-Smtp-Source: AGHT+IHZJ3e+XH3QUR/HfE+G2KEXXVVPur/X2H6IVt+cLncEkTEfjNCKzXsdR1U3LLXERWjDzWPGug==
X-Received: by 2002:a05:600c:2054:b0:3fe:687a:abb8 with SMTP id
 p20-20020a05600c205400b003fe687aabb8mr14478186wmg.7.1696869972151; 
 Mon, 09 Oct 2023 09:46:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm14062506wms.24.2023.10.09.09.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:46:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 122C11FFD0;
 Mon,  9 Oct 2023 17:41:08 +0100 (BST)
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
Subject: [PATCH 25/25] contrib/plugins: fix coverity warning in hotblocks
Date: Mon,  9 Oct 2023 17:41:04 +0100
Message-Id: <20231009164104.369749-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Coverity complains that we have an unbalance use of mutex leading to
potential deadlocks.

Fixes: CID 1519048
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/hotblocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 6b74d25fea..4de1b13494 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -69,8 +69,8 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         }
 
         g_list_free(it);
-        g_mutex_unlock(&lock);
     }
+    g_mutex_unlock(&lock);
 
     qemu_plugin_outs(report->str);
 }
-- 
2.39.2


