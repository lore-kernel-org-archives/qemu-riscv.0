Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE46C47077
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL588-0003ZO-8j; Wed, 03 Jan 2024 12:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL580-0003V4-Ea
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57p-0002O2-Rb
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d5ac76667so55663335e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303231; x=1704908031; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOpjk5Xc89URXPry+uTcPrYjjlL9ZRbEnDqtNUUFVo4=;
 b=j7R+G2pJWTMP9nz9N56OlOSgXJYdnt1QbdmbCheotup826UTwL7TO3/sUqhmPQ6eNG
 fSrZ2lIHg08wRb+613ubQ47Pu4cy743voWDbKgzXahU4ZSqIeQmMMCZcXoycVf7L8O4g
 ikIFEzJ5PXzlMSqj24sWKAtO/bX3DmaCKwajVfp5DmdBg7hNmaVzBBoRg+mdMOYH/t5l
 7dwz4ECfIlCDFJ0qZP0+ydHpaRQYtqWgjEjWWjVeGy5DmEiJIJp7xJjbVK96yZxFK550
 f6aWCJy3NJHYphH7mlDBE/wFKyfb7j/MLfW9B5ufYOliv91lTXo/gwP+Mclm+lPbKOry
 bNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303231; x=1704908031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOpjk5Xc89URXPry+uTcPrYjjlL9ZRbEnDqtNUUFVo4=;
 b=RhML9A7VI8Dfw7rHYCzd2CuttvbP/FXulHB83IvDjbB67DuAru77AlalOmCrIXZ3Be
 Q5CDjFCgwHLSABJcY9ecOS/zMLWZo2dVbNWO1lU4V7J6yUTgm807H2Z7O3e0dJq+TeLu
 nzrkMa3HoFEVF7Z1BLilo6QYYJfwhG0zQmaR7u7eCIQ21g6vT1m04FKUQSp4dnpFp3jp
 vvN+j6CM2tWNYDDWUV0YwK6ZVXIwZHx/12wfAD3dp1LkI2v9JniGoNBo+d09bUyzpMeW
 N33Eg+bkSYcko3J9og9UpwBRkxgG9Vc2l7v32iZkYrbz9mHVZ0o1wrF1I4EBZkuBzzxJ
 F89A==
X-Gm-Message-State: AOJu0YxOb1N5/+QrtCbovat2G9h/dwTuK90gvv9px2aRKwHonaHWs85b
 sX5+2lS2RvssFATs1O0YH4/pTIotxGlwYQ==
X-Google-Smtp-Source: AGHT+IEhbukIbMJxe0XeRt2lHobV2JbuWL9JZcjldNC8OY0732Jbqq6ubAvn3PMQTDTFrXUf5ogLhA==
X-Received: by 2002:a05:600c:a003:b0:404:4b6f:d70d with SMTP id
 jg3-20020a05600ca00300b004044b6fd70dmr11754074wmb.17.1704303231383; 
 Wed, 03 Jan 2024 09:33:51 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 fl27-20020a05600c0b9b00b0040d2dfb10e0sm2979265wmb.11.2024.01.03.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AB9515F933;
 Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 04/43] chardev: use bool for fe_is_open
Date: Wed,  3 Jan 2024 17:33:10 +0000
Message-Id: <20240103173349.398526-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The function qemu_chr_fe_init already treats be->fe_open as a bool and
if it acts like a bool it should be one. While we are at it make the
variable name more descriptive and add kdoc decorations.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231211145959.93759-1-alex.bennee@linaro.org>

---
v2
  - rename to fe_is_open at f4bug's request
---
 include/chardev/char-fe.h | 19 ++++++++++++-------
 chardev/char-fe.c         | 16 ++++++++--------
 chardev/char.c            |  2 +-
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 0ff6f875116..ecef1828355 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -7,8 +7,12 @@
 typedef void IOEventHandler(void *opaque, QEMUChrEvent event);
 typedef int BackendChangeHandler(void *opaque);
 
-/* This is the backend as seen by frontend, the actual backend is
- * Chardev */
+/**
+ * struct CharBackend - back end as seen by front end
+ * @fe_is_open: the front end is ready for IO
+ *
+ * The actual backend is Chardev
+ */
 struct CharBackend {
     Chardev *chr;
     IOEventHandler *chr_event;
@@ -17,7 +21,7 @@ struct CharBackend {
     BackendChangeHandler *chr_be_change;
     void *opaque;
     int tag;
-    int fe_open;
+    bool fe_is_open;
 };
 
 /**
@@ -156,12 +160,13 @@ void qemu_chr_fe_set_echo(CharBackend *be, bool echo);
 
 /**
  * qemu_chr_fe_set_open:
+ * @be: a CharBackend
+ * @is_open: the front end open status
  *
- * Set character frontend open status.  This is an indication that the
- * front end is ready (or not) to begin doing I/O.
- * Without associated Chardev, do nothing.
+ * This is an indication that the front end is ready (or not) to begin
+ * doing I/O. Without associated Chardev, do nothing.
  */
-void qemu_chr_fe_set_open(CharBackend *be, int fe_open);
+void qemu_chr_fe_set_open(CharBackend *be, bool is_open);
 
 /**
  * qemu_chr_fe_printf:
diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 7789f7be9c8..20222a4cad5 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -211,7 +211,7 @@ bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp)
         }
     }
 
-    b->fe_open = false;
+    b->fe_is_open = false;
     b->tag = tag;
     b->chr = s;
     return true;
@@ -257,7 +257,7 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
                                    bool sync_state)
 {
     Chardev *s;
-    int fe_open;
+    bool fe_open;
 
     s = b->chr;
     if (!s) {
@@ -265,10 +265,10 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
     }
 
     if (!opaque && !fd_can_read && !fd_read && !fd_event) {
-        fe_open = 0;
+        fe_open = false;
         remove_fd_in_watch(s);
     } else {
-        fe_open = 1;
+        fe_open = true;
     }
     b->chr_can_read = fd_can_read;
     b->chr_read = fd_read;
@@ -336,7 +336,7 @@ void qemu_chr_fe_set_echo(CharBackend *be, bool echo)
     }
 }
 
-void qemu_chr_fe_set_open(CharBackend *be, int fe_open)
+void qemu_chr_fe_set_open(CharBackend *be, bool is_open)
 {
     Chardev *chr = be->chr;
 
@@ -344,12 +344,12 @@ void qemu_chr_fe_set_open(CharBackend *be, int fe_open)
         return;
     }
 
-    if (be->fe_open == fe_open) {
+    if (be->fe_is_open == is_open) {
         return;
     }
-    be->fe_open = fe_open;
+    be->fe_is_open = is_open;
     if (CHARDEV_GET_CLASS(chr)->chr_set_fe_open) {
-        CHARDEV_GET_CLASS(chr)->chr_set_fe_open(chr, fe_open);
+        CHARDEV_GET_CLASS(chr)->chr_set_fe_open(chr, is_open);
     }
 }
 
diff --git a/chardev/char.c b/chardev/char.c
index 996a024c7a2..0653b112e92 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -750,7 +750,7 @@ static int qmp_query_chardev_foreach(Object *obj, void *data)
 
     value->label = g_strdup(chr->label);
     value->filename = g_strdup(chr->filename);
-    value->frontend_open = chr->be && chr->be->fe_open;
+    value->frontend_open = chr->be && chr->be->fe_is_open;
 
     QAPI_LIST_PREPEND(*list, value);
 
-- 
2.39.2


