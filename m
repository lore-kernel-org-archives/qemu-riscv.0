Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67CDC47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnBX-0005Wx-0b; Fri, 19 Jan 2024 06:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBM-00054z-KM
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:10 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBL-0002wi-2K
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3392291b21bso261119f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664225; x=1706269025; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A62n8Zh8RpmMErwo1MEyf8UlsAdx9GAivnN08aL/XMQ=;
 b=eiUOTzRxxJhCL0AtVbS+3pkyib0S8oN3qJuJU9cAOpzky0vokNRM4MF4JkghJ5CM+1
 sOWQMBjr1jHAOtOG9yP4K/T6NIfIukxVieXTtusZG3svU2YvafRSzayMxqcyKMvSD4SK
 FxALO+Dn8OFGlAXmAK5DvIlPewQWT0y7auz1qCJB20L6Kolqz0tiV6nemk3SuVJxdMLm
 OjRR7MaGcrjC/Dp1ys/FdiVbc1SMudzuRwUu9ZEpKTUmIgM3EcfSKJMxYuZofsPHM26l
 SbmnzrWV7i0a8oEauHLmUp7e3ODHmVecmWEufNQpkcHZVUdYzKjPuNym7oItk8GRua5W
 uINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664225; x=1706269025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A62n8Zh8RpmMErwo1MEyf8UlsAdx9GAivnN08aL/XMQ=;
 b=Bv6qGjI+qR2OlU5jjzqzhZF0Vt0GvX2iTdnnRGNvUG5rf5LzzxdVTA09HvBcXCRBjy
 CmSJiNIkv1QAPFmmyRjGtosWhcqECcgAFwOhpCODkDqOoP0/ie2uJSD9iT0dx+nlLnVd
 r2IPK4XNpAoojtSFJyLKpJ5c2VKtRUtfNFrjrn20VjWhdkK36DOLPXAKyOxk2JVKjIg6
 OhbjnBXjPA82KxIOO3tt1J+VMUuPMD0hpOhU+ob4jKohrPSs+qQmMs7W/QHP8gNwZ58I
 A8MO87Q2HIn7HVZ/vnJ/+7j5f5vdxvb9VgBc0dIYqr205Xzj+cevit4adVWg8RqrgFV6
 20Ng==
X-Gm-Message-State: AOJu0YyfwnfxNQ2dR6TSRfHU7tkgeTbrrocwANuwfhQwEaCh+X7vGZsD
 XzJtLczJC3joAJdvQvqNNk0CPJPEnEHotD1LH3Rd1d3zlEZkHT4Kh6jYneZY3U40q+kxFrmHL3L
 EwHSbDg==
X-Google-Smtp-Source: AGHT+IEYJKMhZoipY90su9FxNi+mxyI+XCMb0EVZ4VpukD7X/ShNOYCPR7zYhNczZ6ezJ9j3Ldk5TQ==
X-Received: by 2002:adf:e610:0:b0:337:aeee:4bae with SMTP id
 p16-20020adfe610000000b00337aeee4baemr1442716wrm.47.1705664225789; 
 Fri, 19 Jan 2024 03:37:05 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfdd90000000b00337d6539d52sm2974212wrl.18.2024.01.19.03.37.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 26/36] hw/s390x: Rename cpu_class_init() to include 'sclp'
Date: Fri, 19 Jan 2024 12:34:55 +0100
Message-ID: <20240119113507.31951-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

cpu_class_init() is specific to s390x SCLP, so rename
it as sclp_cpu_class_init() (as other names in this file)
to ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-ID: <20240111120221.35072-4-philmd@linaro.org>
---
 hw/s390x/sclpcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index f2b1a4b037..fa79891f5a 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -73,7 +73,7 @@ static int read_event_data(SCLPEvent *event, EventBufferHeader *evt_buf_hdr,
     return 1;
 }
 
-static void cpu_class_init(ObjectClass *oc, void *data)
+static void sclp_cpu_class_init(ObjectClass *oc, void *data)
 {
     SCLPEventClass *k = SCLP_EVENT_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -94,7 +94,7 @@ static const TypeInfo sclp_cpu_info = {
     .name          = TYPE_SCLP_CPU_HOTPLUG,
     .parent        = TYPE_SCLP_EVENT,
     .instance_size = sizeof(SCLPEvent),
-    .class_init    = cpu_class_init,
+    .class_init    = sclp_cpu_class_init,
     .class_size    = sizeof(SCLPEventClass),
 };
 
-- 
2.41.0


