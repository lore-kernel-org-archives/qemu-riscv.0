Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB4C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:31:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxTu-0008Mj-0Z; Mon, 06 Nov 2023 06:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTs-0008Ca-1B
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTm-0005O7-Rh
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:19 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso33613125e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268953; x=1699873753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gh2da5PI+FWVTGRmyCu8rnn16q3Vdl/J/DOzB/U83Dc=;
 b=HIimFuQvk6iTv5qCGB/EnbHhUITjNTjDzAej5T/jYn84/Z60WETbG882sWWeeCuAjp
 DuJgYu7oFhySdxMvbMzRVMD0+Ac2oO46E1aX3nvJcQWAYGJzha2TMR5tPZX7HgbPc3K6
 zkkcm3/ULvpovhbJ5SgyXehOOoh2ODv4QYtyyXDim6MPTv1DfsQ3vCn2M1xnz1pdYDlr
 NeAgcqb63KmB9tbAI+gHh5gnGpApa8cEj2MyupVqgWo107l/6i/XwVB8NNpNYDcxDq3j
 GBv91S/KgCAJUXrM7G7WWuu7S/kVp3Y+OTimqlXhK6wYS6eJC6tGwVksLUCghw8ZF/LB
 5a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268953; x=1699873753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gh2da5PI+FWVTGRmyCu8rnn16q3Vdl/J/DOzB/U83Dc=;
 b=aldzwB+5Y4V0Vq+Ta+qk8L0XDMJ2Voniv1mMqcxya8bEw8r4E7ysx1TncYMN2fPdy1
 bubJ2uKbuoN1pKXn70XYcwHs419NBxSFRJuY/tTijuBQNsAI6TzpdDGCSjCfbGV9y56u
 mGmnW08jT1ryPsDFl73M8+2gYOfaDRtvlp+e2MFa1UvITKm03IDrKCS4MKi7YhCDPQ+t
 SNL3t8vg1nfYNYMIz70QvXyjx19H6hE48UHvW7ESWsMHWR7t41+PBRwubraDCgTBb0br
 Cmk4vxcNo5gCaSQNGHbPwT7zPAbZdwrOpG4ko4XuHzeMapzxkEe/6hngTPPF4gXKdToP
 jGwg==
X-Gm-Message-State: AOJu0YwsanLS84aPPB9NUONcf+3JQoiTYx9PrL+D1I/+l79TVkFPjQM5
 Zn5PPNz/ZcKAqZ5qgG/gg5ShRq4gPdxKEiSxUyM=
X-Google-Smtp-Source: AGHT+IEhelvYuVMEs34Z0aXzBUC/ehzDXNQDAvKbf9n6MtiLZ1bFBIXsaS/OCjeLNPDbQR8d540Asw==
X-Received: by 2002:a5d:5a06:0:b0:32d:a101:689d with SMTP id
 bq6-20020a5d5a06000000b0032da101689dmr35272735wrb.56.1699268953327; 
 Mon, 06 Nov 2023 03:09:13 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a056000125100b0032db4e660d9sm9181558wrx.56.2023.11.06.03.09.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 49/60] hw/i2c: pmbus add support for block receive
Date: Mon,  6 Nov 2023 12:03:21 +0100
Message-ID: <20231106110336.358-50-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

From: Titus Rwantare <titusr@google.com>

PMBus devices can send and receive variable length data using the
block read and write format, with the first byte in the payload
denoting the length.

This is mostly used for strings and on-device logs. Devices can
respond to a block read with an empty string.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-1-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i2c/pmbus_device.h |  7 +++++++
 hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 93f5d57c9d..7dc00cc4d9 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t data);
  */
 void pmbus_send_string(PMBusDevice *state, const char *data);
 
+/**
+ * @brief Receive data sent with Block Write.
+ * @param dest - memory with enough capacity to receive the write
+ * @param len - the capacity of dest
+ */
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len);
+
 /**
  * @brief Receive data over PMBus
  * These methods help track how much data is being received over PMBus
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index cef51663d0..ea15490720 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -102,7 +102,6 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     }
 
     size_t len = strlen(data);
-    g_assert(len > 0);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     pmdev->out_buf[len + pmdev->out_buf_len] = len;
 
@@ -112,6 +111,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     pmdev->out_buf_len += len + 1;
 }
 
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len)
+{
+    /* dest may contain data from previous writes */
+    memset(dest, 0, len);
+
+    /* Exclude command code from return value */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    /* The byte after the command code denotes the length */
+    uint8_t sent_len = pmdev->in_buf[0];
+
+    if (sent_len != pmdev->in_buf_len - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected %d bytes, got %d bytes\n",
+                      __func__, sent_len, pmdev->in_buf_len - 1);
+    }
+
+    /* exclude length byte */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    if (pmdev->in_buf_len < len) {
+        len = pmdev->in_buf_len;
+    }
+    memcpy(dest, pmdev->in_buf, len);
+    return len;
+}
+
 
 static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
-- 
2.41.0


