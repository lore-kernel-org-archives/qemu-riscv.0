Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25067CE7A95
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:00:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3U-0000lh-QW; Mon, 25 Sep 2023 10:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn38-0008Qi-JM
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2t-0002Gf-Ir
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3231df68584so2784992f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653926; x=1696258726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tkbJLFSKCFqBt7eF2KdGUHAT+NPxj+IrJR+AQ70tYE=;
 b=S1oTraTyXSDNJt8va7JiZ6sOR37srQAbPvV7RH/oBoSrz/mlAau/4hFzrBKv5gjKnF
 Yftwm+OKM+cfDzcE3u6mHflf66eKJ1e6Rp2qy3pkyLsTmnTo9p8QduVsHPX1ILy4ozbe
 Gs1L+IswMu3FGLxNGJtiKXo7qwHLCKqWuz6tJQYzX1tgzaCndFVMxinIVv238K+UWbMA
 gOk+xy4wt4FnHmRPMEcK8KXGhGpeKiRogkmy5ARR5HvcpNq0q51Mh5ZEepCfqsjCQy4f
 zWEk4zJdxOZn6kSm2/DhBYdRevFTySTlysOleVnnAdPKFl7tzTH9J8aErSN1uBw+Gjgk
 SxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653926; x=1696258726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tkbJLFSKCFqBt7eF2KdGUHAT+NPxj+IrJR+AQ70tYE=;
 b=DldjLZZXP2ACdLVT7IosaJoA5MwmlshrZV0M/RGKoUelcpnSwazu4Fg5ekf26X7+GK
 Nkanxx+m8sC8vwYzha+FtY//xO5ivaw+OHooArIxG82WvJ8ejJRtmcBZK0YwMvDOEbMR
 vLy1Rq4lQOvVT7FrCHvHR7FCUkhDm8O78JqCl3lKNfxlYwIaWFb5l+uLh/j0V2LKWaQr
 Dg4BzuAXye+C/yP/TxRlFkxHEMH9WLjB5OyW40Ia4a/B1qeGAN6TpES/0CLsz/5BHT8o
 BzpcGrKgK271yz9upgYyvnzqrYLqiofmDUjAMaLmpv3JgisyYdjFgXMN6MBv7U209CM5
 0a2g==
X-Gm-Message-State: AOJu0YxHsl416I0F4uaJp0aUWC1eReWdaG/u+ZFf4O5aQqmIS6I09jl8
 bhKN2JHBKFzxKqJL/6YK97MkoA==
X-Google-Smtp-Source: AGHT+IEB+LSxWDhlAJuQfpBjvRRZYzv9cggedEwwiXoMeChPwXIEcnFq/h7DgJb5MibSj4QONhtY1w==
X-Received: by 2002:adf:f9cd:0:b0:319:7656:3863 with SMTP id
 w13-20020adff9cd000000b0031976563863mr6110386wrr.47.1695653925827; 
 Mon, 25 Sep 2023 07:58:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfde0f000000b0031c6cc74882sm12131874wrm.107.2023.09.25.07.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:45 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D54A1FFCF;
 Mon, 25 Sep 2023 15:48:58 +0100 (BST)
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
Subject: [PATCH 26/31] contrib/plugins: fix coverity warning in hotblocks
Date: Mon, 25 Sep 2023 15:48:49 +0100
Message-Id: <20230925144854.1872513-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


