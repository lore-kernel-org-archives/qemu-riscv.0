Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1273BC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:44:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGS3-00048B-EW; Thu, 21 Dec 2023 05:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRs-0003nW-DB
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRg-0003z2-E8
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3367a304091so558344f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155105; x=1703759905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOpjk5Xc89URXPry+uTcPrYjjlL9ZRbEnDqtNUUFVo4=;
 b=A4LEzXgUNxc0QnmET8+ayCxvgeineXThZC13AoB8H9nVKShcqGLp7iePsLf7dFcFjL
 /xld/7pLhg5xgJgtH/DG6xFVwaNeeGLhLDzF7FM8uTPoj+4WhZ+beZIIOHC6f2bNhfHj
 0/m1h0ZWLVB0VldPqLaniR8TYpWfYgc4Zf9qgcM3rlapwaIUCv0f1JCe1mqVLQSSCq1F
 So428RzsxVEvwv/OrrJe/t+sddgQ2G/YhGgKTSGWIfV/m+70OVLPKhCxY6NTzNmuNwCd
 0S1ydg2+rAJUQy2oOoogfsvyyu5k9P5Bv2QJQ3Qa+5NpPJKNX1coTOtj67tyS09hZzsh
 k20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155105; x=1703759905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOpjk5Xc89URXPry+uTcPrYjjlL9ZRbEnDqtNUUFVo4=;
 b=r1KIztQ0RGFMsLs/MipXUiohoZwq+zPH6uanIQr21Zn0kyyVZqJ0Bqweteb/kp07j7
 6wBQSxNC50nIxxDxYAueyf6Elurxsiu3WuCI+G2BlkzG8kAHSgH373yX9V871TCgR+YG
 +maFfdccaaegsgH4wSKW8S9LxYrE5KMZzJietEbXnH+5orQ/AQnzu1CXCqXRC1jDIh6/
 8vfRzEMAc+vQBNKAK+BYyO2Mr4RkTK65Qoe+JZoYMxA6u3Ev7rHpKKiXaOgpvA1K69/0
 P3QC6bvkfvphg8/jkUm0Pv3enVIMcYoPrg+CuiJRu6vhKJCo5eOZ67Trh2gLn6TsUFIT
 6wqg==
X-Gm-Message-State: AOJu0YxWPS5VDg86TGQqFdwumyvNP5X4T8vmbUPDAZtp8ETh2axAKGdl
 4Yl4bhYqUsjc8UGCPQP+oemsTA==
X-Google-Smtp-Source: AGHT+IHlhYr5EXfT3dRGXsMcUV7DLzRG+3DIpxleIXcM/4GnHJs35pTv7FZjfYB9dcDkybTHNdnciA==
X-Received: by 2002:a5d:6449:0:b0:332:e6ec:8306 with SMTP id
 d9-20020a5d6449000000b00332e6ec8306mr423448wrw.25.1703155105297; 
 Thu, 21 Dec 2023 02:38:25 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d560f000000b0033609584b9dsm1714193wrv.74.2023.12.21.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 557545F8C8;
 Thu, 21 Dec 2023 10:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 04/40] chardev: use bool for fe_is_open
Date: Thu, 21 Dec 2023 10:37:42 +0000
Message-Id: <20231221103818.1633766-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


