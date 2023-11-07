Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606BC4167B
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:27:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0LAW-0008IP-W3; Tue, 07 Nov 2023 07:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LA0-0006wu-Vn
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:25 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9s-0005Im-6M
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so840226866b.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359972; x=1699964772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmG50O/2f50/2WgP2HPpZwiYXOel5yrYkpXTGRW5eAc=;
 b=YqDKViovIWaWNrSqs0vCDmYg1PEvUvvDip/VCoId1cERTIbMa4XR0RWxhVzZdjR3Ty
 +gFu49p3WcAIouwhKo7T9sDVjdpimbAvMkgnHzZFyOXuZLT8BqZzeQ3pz6IJUHqF0t54
 YzrfjgjoSpTQPPUu7TkrJhyTld4z/XEdiDWbHiOzys+ohKK+yLSuf56eDrFZP/22iTXh
 9u+aqpad2VMWFPcpqF/C3KRi59ftlgPoEbr9VIYP1Qeqf0sMdXMaveOqO716cgXj3Up+
 /jUDrz6B/vlGieQI1M8Ukf02J2SkTAOL1pFuiDz/WJi+6viybbwcmHHmb04lplI9h4AA
 1rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359972; x=1699964772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmG50O/2f50/2WgP2HPpZwiYXOel5yrYkpXTGRW5eAc=;
 b=J7A7DJ6BdoA8FIRJyrbRMdhHnBtm6CtknlRsFUEim3zt7Z/U0YOnXuEG8ydAF6NMAf
 UhGUVqWrmR/GQ7o+vt3V0HI8iV1zfjNid+ZUqfwgOJJo/zsCKc8A608pQEswVE0usxvi
 WW/f52XQzG/271RXyYK6b4hlhnHWxZbXZ058hQxAK8fCP3F2EzfQA1CcmlzcE/Dcg4Ue
 NbMZWURLFwhExp70PfWr19w1PR/ifGBIZrYtyUPKJXtO4VNxuIgK5+adtmnh/RaTzGIF
 8wUaJWRV+s6Uu+jRCKUCWPUuy3VrJzZFsUmGhE8FNI68yUGG6EpChwS6cj2g3qoVAV31
 +IFA==
X-Gm-Message-State: AOJu0YzAyRf7BByhnThKjhdlFrKr1PZY6pUDcgyMiGhL1VeKhPZca4uE
 rksjEV5eSbVkHmw0kCi/JZ/4UA==
X-Google-Smtp-Source: AGHT+IFxWQrfEBcl5NXrCBGPBwPhcJoKBU53mNboU0c8IUkQBQXplWulnu+kXpy+b3L94b87BBhvNQ==
X-Received: by 2002:a17:907:934c:b0:9bf:b6f5:3a08 with SMTP id
 bv12-20020a170907934c00b009bfb6f53a08mr15984029ejc.52.1699359972231; 
 Tue, 07 Nov 2023 04:26:12 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906168c00b0099cd1c0cb21sm972160ejd.129.2023.11.07.04.26.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 72/75] MAINTAINERS: Add include/hw/xtensa/mx_pic.h to the
 XTFPGA machine section
Date: Tue,  7 Nov 2023 13:24:39 +0100
Message-ID: <20231107122442.58674-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

From: Thomas Huth <thuth@redhat.com>

These machines are the only user of the mx_pic code, so the
header (which is currently "unmaintained" according to the
MAINTAINERS file) should be added to this section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231107102104.14342-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a17decd31..2a9354e695 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1861,6 +1861,7 @@ M: Max Filippov <jcmvbkbc@gmail.com>
 S: Maintained
 F: hw/xtensa/xtfpga.c
 F: hw/net/opencores_eth.c
+F: include/hw/xtensa/mx_pic.h
 
 Devices
 -------
-- 
2.41.0


