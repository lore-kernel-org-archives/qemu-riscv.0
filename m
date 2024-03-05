Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E242C54798
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhTdg-0002Y4-CI; Tue, 05 Mar 2024 07:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTci-0001Yk-JC
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:10:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rhTcZ-0001CI-6R
 for qemu-riscv@nongnu.org; Tue, 05 Mar 2024 07:10:19 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412e8c63f23so10145255e9.0
 for <qemu-riscv@nongnu.org>; Tue, 05 Mar 2024 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709640609; x=1710245409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9H0BMxEgsfnIN4tKkXQ7XYD/lXb/KI0pXeZKCUMOmAM=;
 b=D9I5h71KchVGxSNvPNAFdg4kSMww74Nr7tIyWcbu/hxQZRTWSpaWLZlw2c5ZRowuqm
 q3SjJOeG0MhNH8zdBTtPrsWWCB5uJBPS6WHJqusVvDghR8In+GiIj8v6R7WsLuhBGOQ1
 iRqUP4gukkT7UzG2t5kydDdEudD2cSVwH0ocBbgzAVITv3ZOiAUHrz98PV5zfbm2IAwJ
 ybgOWDS3UY7AYcwXtBKedcqF/KWoAYG7UZDHjr1qv0j5gFc8JtlvUk+Eajixj4Q2pdPz
 YDGW4UyUlJVQ3WZ5xZpJ4UzJZAjjoEVqhqUvKhO+mT/i2S5TnIx8MAxDbPsO/ZHH9g6L
 HX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709640609; x=1710245409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9H0BMxEgsfnIN4tKkXQ7XYD/lXb/KI0pXeZKCUMOmAM=;
 b=aYj+jLK2H4v70RaA/qcJzBzPNHOHQBfi/c5aZ/8GZ6lauNS1Mr0NqP6QscdS8lnPXi
 pQCowgIPB7Tw7/BFutUrgvhNwybuQtMDInhmfHyX+1WvH1omefaa4rx2qRw3zmRCRO6u
 eHExvEzAScpTBBNJziS8YL/9kXDxgjhpIOUqy2Ae5+erheQpSWawHhzOsL/hstcjAbCn
 P+FCqmdyw+CFWj+ozr2ll4HdKvUHxOkx7rZLY3S5a/Z1dQ7YA1/uV/GgLArhFPAVGrMT
 0+qB6AWCtOy/rtg15n//+Hx+IaDDSHXR1kIA9xc0pSD+geW4oIsuA+PDmGDicLskfTLi
 YSWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzfj4DwQ1Baj697yD4ESyGbhZg5JCf7zvsgvpxGqCgFbBeyJ0RWkRxU30/jFxUZuG2gkSaVawDBDZWoCGXY17GN66nTWY=
X-Gm-Message-State: AOJu0YyRoJU/vyOviEe7Tz75WoV52eGIWFkYYIeLyra2KEjNpGV+3PLp
 k+i6qO3zpDg19gzZmXYM9r60zv9EIS9UabagRDHiXldo8n4PPb4PzXTvStlk5k0=
X-Google-Smtp-Source: AGHT+IGeU37dEB9VMX1i10U5L657uyrlThfe3V68/Dnvly41cIxf2sIZkoM4cHEMD1mOp4S6icF9MQ==
X-Received: by 2002:a5d:674b:0:b0:33d:82a9:206e with SMTP id
 l11-20020a5d674b000000b0033d82a9206emr8033114wrw.28.1709640608641; 
 Tue, 05 Mar 2024 04:10:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h3-20020adfa4c3000000b0033dd2a7167fsm14970270wrb.29.2024.03.05.04.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:10:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DC55A5F954;
 Tue,  5 Mar 2024 12:10:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Brad Smith <brad@comstyle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Warner Losh <imp@bsdimp.com>, qemu-riscv@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 04/29] {linux,bsd}-user: Update ts_tid after fork()
Date: Tue,  5 Mar 2024 12:09:40 +0000
Message-Id: <20240305121005.3528075-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305121005.3528075-1-alex.bennee@linaro.org>
References: <20240305121005.3528075-1-alex.bennee@linaro.org>
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently ts_tid contains the parent tid after fork(), which is not
correct. So far it has not affected anything, but the upcoming
follow-fork-mode child support relies on the correct value, so fix it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20240219141628.246823-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/main.c   | 1 +
 linux-user/main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 512d4ab69fc..e39eef3040f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -134,6 +134,7 @@ void fork_end(int child)
          * state, so we don't need to end_exclusive() here.
          */
         qemu_init_cpu_list();
+        get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
         gdbserver_fork(thread_cpu);
     } else {
         mmap_fork_end(child);
diff --git a/linux-user/main.c b/linux-user/main.c
index 551acf16619..699da773714 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,6 +161,7 @@ void fork_end(int child)
             }
         }
         qemu_init_cpu_list();
+        get_task_state(thread_cpu)->ts_tid = qemu_get_thread_id();
         gdbserver_fork(thread_cpu);
     } else {
         cpu_list_unlock();
-- 
2.39.2


