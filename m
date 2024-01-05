Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF1C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:49:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmQN-00083j-C5; Fri, 05 Jan 2024 10:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPW-0004VJ-Bh
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPU-00041m-1y
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:47:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so17403805e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469618; x=1705074418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbggecaPR1KDAEaq2ZCHfcAMG72AfEJs1+ws0Qr91Tw=;
 b=KOIgIvdlo5bzOC3eFeSIBVzpCqo29wstSXlbatMD3Gb9Y1HMhUOTYtOqMTI5Xlp3sm
 PPppdL+O0nb/MiqF/ch2a3P+ypKdrQB0HTKB3XKbVpupd/etZdYwKn8I/NUhdfTCsCtq
 8F3xqC029CcZGh/hT0QnBiK2bXSy5CwOxNn+BEOTyoUo91r+wo3iOOF4dFKxlJuB759k
 /KnTtcS959Dky4F0iLQT1S+AB+K4yCilYqyEaSepR0QiqV6nsGyfYYEQZoT16BhQ54LX
 NlGcAFYPHdxj5obvFZc2Qq037sJWEDrbei6/reDZXmZNruiKIoHpMYUCEz6An2rzcuEN
 +STw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469618; x=1705074418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbggecaPR1KDAEaq2ZCHfcAMG72AfEJs1+ws0Qr91Tw=;
 b=exxHr/3dbO0JYCwO+IJtS8CWz6BoFhEaeYmu3vWl5ZaiO7Wk4FW5IJ9xPzvN0dHjpq
 Vembay5rYIhC8xKOUmrJyk2fQ872hFpVSzlSi4YxPZm6fC4/QvWclQ6wbWKDCUUclPFx
 a7dC8WvmjnGdJSDizcucOq2DETnfS+0ygEG+My9kYCunuCHQ/kR4WCO8cd4vL0dKQnoO
 CSew/QMFMd7Aa6J0wl/uavnBjkVjnmuodeBq/W2lP9D+KnMZhehl53vbJKB/T0Ei/H98
 MzO2Fni9uerd2uCv8CAul+ddR5rKsvdVPGQ3jM4BJd1AYQdyLjo0n9uVaUAFOqHK2FGs
 PQRg==
X-Gm-Message-State: AOJu0Yw7fQ3xt3vJSia6ZPBHGzNax3J/dRBJHQyS81DaAhOiEHtVNYGy
 mRck/CVStvu3Nv0k95nYVNRs3W6aGx1EhA==
X-Google-Smtp-Source: AGHT+IFA6+yO0f0vXnTz70uP27qlie96sO6Bbg1BzKCi0WprYekO/LbeL7sOPB8XwtAxlMBBBBGzgw==
X-Received: by 2002:a7b:c5d9:0:b0:40c:35b9:e2dd with SMTP id
 n25-20020a7bc5d9000000b0040c35b9e2ddmr1254424wmk.85.1704469618702; 
 Fri, 05 Jan 2024 07:46:58 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b0040d5ae2905asm1921248wmb.30.2024.01.05.07.46.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 34/71] hw/core/cpu: Update description of CPUState::node
Date: Fri,  5 Jan 2024 16:42:27 +0100
Message-ID: <20240105154307.21385-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

'next_cpu' was converted to 'node' in commit bdc44640cb
("cpu: Use QTAILQ for CPU list").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231129183243.15859-1-philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 44ff954207..238c02c05e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -430,7 +430,7 @@ struct qemu_work_item;
  * @gdb_regs: Additional GDB registers.
  * @gdb_num_regs: Number of total registers accessible to GDB.
  * @gdb_num_g_regs: Number of registers in GDB 'g' packets.
- * @next_cpu: Next CPU sharing TB cache.
+ * @node: QTAILQ of CPUs sharing TB cache.
  * @opaque: User data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @accel: Pointer to accelerator specific state.
-- 
2.41.0


