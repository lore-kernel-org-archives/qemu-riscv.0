Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A73C47DD8
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAo-0003Qf-BM; Fri, 19 Jan 2024 06:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAm-0003On-Tc
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:32 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAl-0002nQ-8c
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-337be1326e3so588387f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664190; x=1706268990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ti8d6bE+nqA1U4OtHFV3Ptf3sJVQ6hdYw2WwbY+h+tg=;
 b=jtC4+k3XnelZv7GJiyBwnfVasVVy5r5+TDjQe89E0a2/rwO7pYHCnFpS8O6yVo1vPw
 l3on6WFWfPNxPHxLmjLhjbRxy/Cc24kSrNFSzKg3NKceUmPecRUbgdW8/nyS9T/LgWX8
 rOKN3/zdsQV1yP/VqTKtzdx2ecOb9LXVxzeUIfHs9AzL7dyJiPGqLJWEkVQSIXiluzYa
 fwq92QjNLIdySWx5tbmGhdiddeUdUoTOM42udllBwgPCBQVxSuRza2YG1AoBx0gbXd34
 K+RrqA0TyTbcBw5RFBHVMZHgRYmW8cd5OrEHCa399iIySnMa4zSQLj2T9Y6fQ7eipg6M
 3ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664190; x=1706268990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ti8d6bE+nqA1U4OtHFV3Ptf3sJVQ6hdYw2WwbY+h+tg=;
 b=v2slGYhZzJj5h2j4TtHs65wgx/5v/Gmwj/UqdndZ2Mh6rY54v58z7kAUG2+WcREY++
 DkENGdeVQoW0SZ0xD+u6DH7B0xTW9Gn1sSqLopfwqW5M6GldkjGXK2f/88GkUvXQpG0N
 pukj+keK3AElg1u0SKPKhXsoCnlUksz7NaavXF1bFeFtQ8qjfJjDVDywg4dUv1cKLUTl
 +iRWelc7TLUCwhDsHvDEvL15HM3E6G6Iz25FR6CyBg8c/YPCSYPzOMOF/H9d8V/FOWek
 hjj3jSz/8ytCJoDC2dKJk2Iugb4/YKokBeaaP9cUjkGNyDdulDGfs5fRhtpgUpnhBJPd
 7gLw==
X-Gm-Message-State: AOJu0YwtaG1yW/b0fMNbj+1M8tBSC4Tsn0vXnh+LL5azlXAJlOCqCbRy
 ReVJ+nTjr1YREj/7w8lN9zU7dG8W4kHhgm7vhrZDSIFi68NGLLY7NMO+9Dfsu2c=
X-Google-Smtp-Source: AGHT+IGUaVDvU8/UnjvcbqmMmv00VZMSG3WnmvCh4DWtfRhrNADK7lOhDGW9HQGQ4b4gSX5EQVz8gw==
X-Received: by 2002:adf:a1d1:0:b0:337:c872:7146 with SMTP id
 v17-20020adfa1d1000000b00337c8727146mr1312014wrv.13.1705664190046; 
 Fri, 19 Jan 2024 03:36:30 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d6307000000b00337d71bb3c0sm2533871wru.46.2024.01.19.03.36.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 18/36] hw/pflash: refactor pflash_data_write()
Date: Fri, 19 Jan 2024 12:34:47 +0100
Message-ID: <20240119113507.31951-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

From: Gerd Hoffmann <kraxel@redhat.com>

Move the offset calculation, do it once at the start of the function and
let the 'p' variable point directly to the memory location which should
be updated.  This makes it simpler to update other buffers than
pfl->storage in an upcoming patch.  No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240108160900.104835-2-kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 3e2dc08bd7..67f1c9773a 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -403,33 +403,35 @@ static void pflash_update(PFlashCFI01 *pfl, int offset,
 static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
                                      uint32_t value, int width, int be)
 {
-    uint8_t *p = pfl->storage;
+    uint8_t *p;
 
     trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
+    p = pfl->storage + offset;
+
     switch (width) {
     case 1:
-        p[offset] = value;
+        p[0] = value;
         break;
     case 2:
         if (be) {
-            p[offset] = value >> 8;
-            p[offset + 1] = value;
+            p[0] = value >> 8;
+            p[1] = value;
         } else {
-            p[offset] = value;
-            p[offset + 1] = value >> 8;
+            p[0] = value;
+            p[1] = value >> 8;
         }
         break;
     case 4:
         if (be) {
-            p[offset] = value >> 24;
-            p[offset + 1] = value >> 16;
-            p[offset + 2] = value >> 8;
-            p[offset + 3] = value;
+            p[0] = value >> 24;
+            p[1] = value >> 16;
+            p[2] = value >> 8;
+            p[3] = value;
         } else {
-            p[offset] = value;
-            p[offset + 1] = value >> 8;
-            p[offset + 2] = value >> 16;
-            p[offset + 3] = value >> 24;
+            p[0] = value;
+            p[1] = value >> 8;
+            p[2] = value >> 16;
+            p[3] = value >> 24;
         }
         break;
     }
-- 
2.41.0


