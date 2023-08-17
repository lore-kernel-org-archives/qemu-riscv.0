Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C7C2FC04
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 05:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWVb3-0006gL-HG; Thu, 17 Aug 2023 01:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWVb1-0006cy-Hq
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 01:30:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWVay-0003oO-0k
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 01:30:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-689e8115f8dso266023b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692250254; x=1692855054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdUDfs8nzmH3mudBuoXaYzlsKQKqdd+Qx/2fnT/104s=;
 b=wCoxPlLo4fJNyJLo2YPAC93pw7yDAGHN3pA4MPGN6WYPvKD2HnfilAuE3YUgmIBIm6
 5lFr2VNyCJMV2VjfTAxQ7Du1RQOp5y/PbkiuW33/TjkO4eGZ5qsaCdOfw4sIOHslHYrs
 IWX0SB8UtnoFnDbzYKFZKtoDYF6Jfv3fjTF68ioItR6MbFGx4y3V+szdf/GmGdrBQxmW
 6CKJnk0s+dA2FGE/7YgS7IZ9dnx2GIVU5aS6YTqVFUCHv6zfyr2ccgvNbRwiGLtRH+dn
 xH2rx6R9AET1rCxyvlCipckj/EK2A8YKQD0PAI89QSRnqxrhI7lMvwkqgMpdSQIS1PqG
 4+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692250254; x=1692855054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdUDfs8nzmH3mudBuoXaYzlsKQKqdd+Qx/2fnT/104s=;
 b=j46BhLjFqVEqu2G3/kJ2slGF7/XPawn50YiRbXTuzMYX+JItad1BQPPqBvwpPzTlqH
 cix+W1GOgiLoYvvEAnbn7WHqTuofd364lnvd+qRyOeWSUh05NLSyJop/44yMCyWyhTUW
 0Sn+tOqNsZXR16vVQk6LbNojd804VeOI++4haio9WkLi521jcYRFQh2GDXOWGLZ4fcnt
 gy/zEOO7/dB2eQ4kHdIXR3PZTcTpsV4aQO2nmklTxY3+F37SaF4YNspfkPmgRHI9dBGU
 UJjvM8bz8N2FnlxnoppXHLt1CGWivmXAyRHfFER8VmjfVkLM/c1ktMNjwlgDcu2EoEbG
 tERQ==
X-Gm-Message-State: AOJu0YwJyDlQxITi1aLdVyXsCEm2XfALDt3/3/KwT+fEObWafnjmTSAQ
 92CQi/2Dd2bWO0Q8jBZPtKVx4w==
X-Google-Smtp-Source: AGHT+IH8ewMLpNbX7Glbea2MHyvU0ftrKKP3DE6+d+QyTno7miAfioylqSHTEcBwUZtErBg46+0BBA==
X-Received: by 2002:a05:6a00:3988:b0:686:24e1:d12e with SMTP id
 fi8-20020a056a00398800b0068624e1d12emr4202571pfb.30.1692250254546; 
 Wed, 16 Aug 2023 22:30:54 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j18-20020aa783d2000000b00662610cf7a8sm12339407pfn.172.2023.08.16.22.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 22:30:54 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 01/26] contrib/plugins: Use GRWLock in execlog
Date: Thu, 17 Aug 2023 14:29:48 +0900
Message-ID: <20230817053017.24207-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817053017.24207-1-akihiko.odaki@daynix.com>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

execlog had the following comment:
> As we could have multiple threads trying to do this we need to
> serialise the expansion under a lock. Threads accessing already
> created entries can continue without issue even if the ptr array
> gets reallocated during resize.

However, when the ptr array gets reallocated, the other threads may have
a stale reference to the old buffer. This results in use-after-free.

Use GRWLock to properly fix this issue.

Fixes: 3d7caf145e ("contrib/plugins: add execlog to log instruction execution and memory access")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 7129d526f8..82dc2f584e 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -19,7 +19,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 /* Store last executed instruction on each vCPU as a GString */
 static GPtrArray *last_exec;
-static GMutex expand_array_lock;
+static GRWLock expand_array_lock;
 
 static GPtrArray *imatches;
 static GArray *amatches;
@@ -28,18 +28,16 @@ static GArray *amatches;
  * Expand last_exec array.
  *
  * As we could have multiple threads trying to do this we need to
- * serialise the expansion under a lock. Threads accessing already
- * created entries can continue without issue even if the ptr array
- * gets reallocated during resize.
+ * serialise the expansion under a lock.
  */
 static void expand_last_exec(int cpu_index)
 {
-    g_mutex_lock(&expand_array_lock);
+    g_rw_lock_writer_lock(&expand_array_lock);
     while (cpu_index >= last_exec->len) {
         GString *s = g_string_new(NULL);
         g_ptr_array_add(last_exec, s);
     }
-    g_mutex_unlock(&expand_array_lock);
+    g_rw_lock_writer_unlock(&expand_array_lock);
 }
 
 /**
@@ -51,8 +49,10 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
     GString *s;
 
     /* Find vCPU in array */
+    g_rw_lock_reader_lock(&expand_array_lock);
     g_assert(cpu_index < last_exec->len);
     s = g_ptr_array_index(last_exec, cpu_index);
+    g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Indicate type of memory access */
     if (qemu_plugin_mem_is_store(info)) {
@@ -80,10 +80,14 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     GString *s;
 
     /* Find or create vCPU in array */
+    g_rw_lock_reader_lock(&expand_array_lock);
     if (cpu_index >= last_exec->len) {
+        g_rw_lock_reader_unlock(&expand_array_lock);
         expand_last_exec(cpu_index);
+        g_rw_lock_reader_lock(&expand_array_lock);
     }
     s = g_ptr_array_index(last_exec, cpu_index);
+    g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Print previous instruction in cache */
     if (s->len) {
-- 
2.41.0


