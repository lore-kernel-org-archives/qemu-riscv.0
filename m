Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59637C02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQNS-000457-4t; Fri, 07 Feb 2025 10:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKY-0008G9-JD
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:52 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKH-00042L-50
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:44 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7863f9be4so168293666b.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942283; x=1739547083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1O482OJIh050UUseeR+bYA6QoGKKDZRGYOAk/RFThQ=;
 b=Zp2VrnY9aJlvuuaDsu5xChFdmkAhqli7chpu33/UN+XNB85ibKm2YMIME//qQtiPoo
 fukKEJTJqDvMF4Xz46bsjdap4h8jm8I7bYrfVTB8N8W7AYPEpDd2SjyDetKgYw7nz1WP
 oIRPkfNip1nFIgsOslx6/eCW/2vj6voSRDJlPIU2oRXeL8cjwDo8plUwv0cY3IOv4q4j
 4Z6CAG+xMsgeqD3TIcG3rVn1MW1JkXZPOmGn/3afL+y8+bqgq8W/+jWzHZi9aVRxEzoZ
 X7U2ADlcs1SppXGuKi+8PTZRkb+TALAnFgZfXQKOu/VH+9TRM96ssaFhIlWufRBdKiUo
 Wi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942283; x=1739547083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1O482OJIh050UUseeR+bYA6QoGKKDZRGYOAk/RFThQ=;
 b=CNEHZjlxxwuwJFDpI8mNFe/9pwnb7MDncmzYsRoUjbF3xMAwDD/9OGgptEtO1AEbTt
 JJIZvVoNjRywnUG4v/32H8zDvWEsZeDP90pamG7vtD3dwaEizB6JtTvt9tWXUQfKlZlk
 198jVZmO+juUhCLd6zK+PpZXmNQTYYQ25XA2bxywWuQMzYYmUw33c2GtvIpk2sYxpElS
 hbJaEW2fLR5qNvZmX/OrCVblVHPxov0s7DpIoDXbJMHqNvyFQuZJx2QxQ+VN83o66j9A
 xgyEfC69cotDV1ByD/cKwRCQJPG4L2+ubqUh0C2TQjOLWl+tZOdMQXHlqkLGIhZox3ax
 kdGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVef2DbUIcM0hChHBrcvZoy9xtDk4+DgHB6E20Bvprf8K4KDq8w8CUHeoRa4e6CJbYeeZgHDHfpTVKq@nongnu.org
X-Gm-Message-State: AOJu0Yym4w60h+PRy7c0zHMAetgI1AQdxjeAh94byv/SQupTcu+Ok+uf
 YaNuMPqLOeOzsylFdllBhGnZocHHLHzN4UUUTzAMQtFp3TZGaklc3JhFBUnZaYM=
X-Gm-Gg: ASbGnctMYmKVOqwiYof9BACEPlcIH55UWptnbq3ZTMkBi+qVagj55AUihkxzZtsEHha
 PgMxGGH0WN6z2GGAMhMf7FkLqTZEbo5Mk8N5eIzKf7rOingYu4Fv08kS25Bkidfv/mVqfZJO5eP
 x147M8hEId0aaZp238ieDgoxnC/CIPuf0KFTdBeqe9+OSjpBYSxEdAC7DUratCrMgkvoBBLKBov
 GNXukolkBefXgMIouxc2NhzCBdKAajAj2h1zmeAs9jBUhqy0zl0l6YwghDd+Siuh8WDx/tr9Uq1
 zUkQD5MIsx8mI/ofeA==
X-Google-Smtp-Source: AGHT+IEXZm1I4NYSLnye7I6ENS+G0tiNEGsW9LsilLjwvaf03/wO4ZNecuR48DUOaMpc9MV5S8GWIg==
X-Received: by 2002:a17:906:4fd6:b0:aa6:79fa:b47d with SMTP id
 a640c23a62f3a-ab789a681a3mr405645966b.1.1738942282560; 
 Fri, 07 Feb 2025 07:31:22 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab77f5f5a0esm216633666b.155.2025.02.07.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A88E960C3D;
 Fri,  7 Feb 2025 15:31:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 14/17] osdep: Introduce qemu_kill_thread()
Date: Fri,  7 Feb 2025 15:31:09 +0000
Message-Id: <20250207153112.3939799-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a function for sending signals to individual threads. It does not make
sense on Windows, so do not provide an implementation, so that if someone
uses it by accident, they will get a linker error.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-6-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/osdep.h |  9 +++++++++
 util/oslib-posix.c   | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 112ebdff21..4397a90680 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -631,6 +631,15 @@ bool qemu_write_pidfile(const char *pidfile, Error **errp);
 
 int qemu_get_thread_id(void);
 
+/**
+ * qemu_kill_thread:
+ * @tid: thread id.
+ * @sig: host signal.
+ *
+ * Send @sig to one of QEMU's own threads with identifier @tid.
+ */
+int qemu_kill_thread(int tid, int sig);
+
 #ifndef CONFIG_IOVEC
 struct iovec {
     void *iov_base;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 2bb34dade3..a697c602c6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -111,6 +111,21 @@ int qemu_get_thread_id(void)
 #endif
 }
 
+int qemu_kill_thread(int tid, int sig)
+{
+#if defined(__linux__)
+    return syscall(__NR_tgkill, getpid(), tid, sig);
+#elif defined(__FreeBSD__)
+    return thr_kill2(getpid(), tid, sig);
+#elif defined(__NetBSD__)
+    return _lwp_kill(tid, sig);
+#elif defined(__OpenBSD__)
+    return thrkill(tid, sig, NULL);
+#else
+    return kill(tid, sig);
+#endif
+}
+
 int qemu_daemon(int nochdir, int noclose)
 {
     return daemon(nochdir, noclose);
-- 
2.39.5


