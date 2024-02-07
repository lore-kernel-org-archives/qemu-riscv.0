Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E0C4828F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXkwM-0002tV-1z; Wed, 07 Feb 2024 11:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rXkwK-0002sE-Ho
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 11:38:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rXkwG-00067o-Ef
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 11:38:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fe3141e1cso8097425e9.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Feb 2024 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707323899; x=1707928699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IbvextsUKhbDQgPyuaeoL3jSODZ/hWaknGrv+i1g18=;
 b=CuiGozEyOhm69oPTra3QbwGv1ujJrl7spKqq1nSc9Soav9a4jHRHJlqaBWGo9w52tu
 xwNgzbgaIO9v5og1jX4xokyT9SHeMFF/UvdrLDY4zLS78DkjAEBJsM3Atr3v4Iod9Esu
 httmM1D6pO6ISUTmPqaipHDpcVjWIzneqnPrNfdAQjWMAF3AYvAR1sOUXD42Qb/APhJV
 57uxaPfYhB3aneVqtu1eMT0aONloQ95zygqGf6grqAgd4Nodf+XtZsNccGWk0aXy/2tN
 PT3XYD4GU503dhPQcPxniiGMMVfzJTWbYi33jbKGHsVRrztdl5SLQh65JNKXWmGdUutb
 48pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323899; x=1707928699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IbvextsUKhbDQgPyuaeoL3jSODZ/hWaknGrv+i1g18=;
 b=cnQmlTjeXtGmWZhzswUOcSivc/wiWElluryYnP3anP3DLQbnuEXyZmfp4U8hBzIZD/
 jayi+QxncsdCcWaLNRQv5G0cFu/QERpZQQJ7FJ74GjfR4pii7TaeIYD0KwjMs5fv6BaD
 yEUbVDzJo7eH43LkmUE7kqu4XtH2/QOgHBo/Omnca36nk4yWvKdOQyvyr1n6x0GimQQ/
 leWv+My378KeP+M5lJcYYj7mt+wLzA0eLhaytbm1UzaQKL9vmTVCnaZY+62JlFIENTyq
 E6vrtcgOXIWDzcKa2CHNXz5PQKfCmtsE332EQD0VZas8qlepxz27fBnaPXvlu+RGeDat
 mmQA==
X-Gm-Message-State: AOJu0YzitGPqwpv9jdRH4+woIldX5F2x2RDyA09O1+zYhNv23/ZgpM4W
 9UtYh84Z0pQ591O3qilT8HI4tltr/zmeZmvBmk9tuSLtJsqK5RFHc3u7PXIa/RM=
X-Google-Smtp-Source: AGHT+IFjRUT+msrD2SiPps3yoAGzJKkJykfls7gYzHMq8saSuGNCfpdBwg7XDW7/VHQ/a/4boJir1w==
X-Received: by 2002:a05:600c:a08:b0:40e:fb8f:debe with SMTP id
 z8-20020a05600c0a0800b0040efb8fdebemr4884205wmp.38.1707323899069; 
 Wed, 07 Feb 2024 08:38:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhimZaeVtx0FbFGdLUmex+udSHN5v6slNAzSoXl1zK5iRAUFOlXiGyxUEPsIAB2Iw6yrfJpfy9JuFtECw1ez1I0fM0OiUxhmSd3VsQ4a4FINLxD3LzvA5fA1t+hj0BEY8du8uGuKhPI7FhZv1gYWRBNA0gytf/ZLiiHhvuIi630KxG2wUx8oxHpTPP7yfgjuAN+lESvm3k5gMaj/V3/k/8HpebV8NR99nt8a2ZpDXFYU1JfeqQMymopOj5ui5UpnALi4+keqhcBbhDM3dVbVlWYq+MlpFJntUv6+SzSkvQq3pd0IMPH14/kYspXRxw/PDoQSYld6+FO8CQe18ThwbpgTQbS9WELPTpMxBe0/OSO8iBB0cdtPpT/9m1ce1xzOg6dVSBYwsncfpClFmb3fzcZ/VK9CUxmlD2QMDSOaehe8Oan5kePrC8ceZYrbqY4pymxdAacVIPvqhRnN1MLewenZhTCXDQ8oE7WQluSJtMCxlwoEySZWbjm2ZcOAlZyXlRF8a2bYrYhaxIcdbN17/Ptn25JYTZabClpR1woxuDKVy7F+892PF2HEOhcvjMtwys8eJOgLa10bBxoA0d+TcGYPAdPJmsiRiWyTjytbeLi4eXgIZvxq/MP7qxsipagt88zTduIPWtmccczuTW6b9JDQniuRoZRNNLkfmZkEIShnrZNSWR5Jo+8Fl2/qUchSYk5IaiX6D0TQ5WhKU4hl1rlW1l4x3tmemdhrT57yHmdlrulASpAS4OaCJVuo8/r3LLkP44c8kSDWfBFPdkSW9TEAOpFXxncX69MHkzxjrjQFpyXrZT4TsV14ihoP032F7GgOv6KL1GwJbTPVEwAz33ICZ+e+rpZKqOwtQF
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 w14-20020a05600c474e00b00410232ffb2csm642397wmo.25.2024.02.07.08.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 08:38:17 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B8E675F8E3;
 Wed,  7 Feb 2024 16:38:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: devel@lists.libvirt.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Chris Wulff <crwulff@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 07/14] test-util-filemonitor: Adapt to the FreeBSD inotify
 rename semantics
Date: Wed,  7 Feb 2024 16:38:05 +0000
Message-Id: <20240207163812.3231697-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207163812.3231697-1-alex.bennee@linaro.org>
References: <20240207163812.3231697-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

Unlike on Linux, on FreeBSD renaming a file when the destination
already exists results in an IN_DELETE event for that existing file:

    $ FILEMONITOR_DEBUG=1 build/tests/unit/test-util-filemonitor
    Rename /tmp/test-util-filemonitor-K13LI2/fish/one.txt -> /tmp/test-util-filemonitor-K13LI2/two.txt
    Event id=200000000 event=2 file=one.txt
    Queue event id 200000000 event 2 file one.txt
    Queue event id 100000000 event 2 file two.txt
    Queue event id 100000002 event 2 file two.txt
    Queue event id 100000000 event 0 file two.txt
    Queue event id 100000002 event 0 file two.txt
    Event id=100000000 event=0 file=two.txt
    Expected event 0 but got 2

This difference in behavior is not expected to break the real users, so
teach the test to accept it.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240206002344.12372-4-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/unit/test-util-filemonitor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/unit/test-util-filemonitor.c b/tests/unit/test-util-filemonitor.c
index a22de275955..02e67fc96ac 100644
--- a/tests/unit/test-util-filemonitor.c
+++ b/tests/unit/test-util-filemonitor.c
@@ -360,6 +360,14 @@ test_file_monitor_events(void)
         { .type = QFILE_MONITOR_TEST_OP_EVENT,
           .filesrc = "one.txt", .watchid = &watch4,
           .eventid = QFILE_MONITOR_EVENT_DELETED },
+#ifdef __FreeBSD__
+        { .type = QFILE_MONITOR_TEST_OP_EVENT,
+          .filesrc = "two.txt", .watchid = &watch0,
+          .eventid = QFILE_MONITOR_EVENT_DELETED },
+        { .type = QFILE_MONITOR_TEST_OP_EVENT,
+          .filesrc = "two.txt", .watchid = &watch2,
+          .eventid = QFILE_MONITOR_EVENT_DELETED },
+#endif
         { .type = QFILE_MONITOR_TEST_OP_EVENT,
           .filesrc = "two.txt", .watchid = &watch0,
           .eventid = QFILE_MONITOR_EVENT_CREATED },
-- 
2.39.2


