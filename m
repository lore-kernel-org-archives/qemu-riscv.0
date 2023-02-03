Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0V9-00073P-Gy
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V7-00072P-GT
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:29 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V5-0008AZ-MU
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:09:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r2so5384205wrv.7
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=fCrQpY/B0WPvykR/ypTqqefxBK8DwNly0OXMnU2qMfqW5gm4/NtKE1gcc2kOGS4G+R
 K0K98fG/kenQ8SY4vt9EQKVU8myl/Ab48UmBjG1uu+m6hNrnsZ3vput7UHGf0EAcVMcK
 ZrcqGBUr6r24pN6eaPDMmy32xkEljZXdb2MpbWO/axaZrpYFGo0TrB+ALPAlLHmffVwh
 DvLJg0xdWHJOktZltFeByL2u7BYs1idlLzJjzWWdU3nHSXMOYyg97O6uEQuDL8juZWGO
 CVYtXvMXm89e7Z3onE50xKaZIToE9DDReA4m+Zaw6uC94zBpngm2DlSV9KM2J84TN4Yd
 rGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=vzvzpUk78SNSUaDeDLF+uYFAcPGShv+dTlbLRnqwDdCJZUKMH1mwdWO79tj5EWNgkQ
 b5jZPp3hhIPK2qwBmHuoxYCrjuWRXGIPZXTgoIifeDEvyVq+v4pMfeY0o5TC6HYWmgXu
 tEllRyKgbEA+elydjfsa0aCWYdPy18X+cOhU0cgupEftipEj12q2JgmxzuKac2Mqd1Qd
 kUCcrcU3fIVfWsKTeuPelepB/wX1x2JgW9ieT9lDfUtAAAGlhpo5xiFRuDCm9WbWMUl2
 YBkAV38R+X4c4XU75aqOltVpnhFCrn17FQZlNMkMFD+QVufY5mQ8oxaL4YZnk10l3noL
 uCrA==
X-Gm-Message-State: AO0yUKWjYdEpEznXkvgj9+yg2NXYrkZjahIVO3XEV44ZhrHJAS9hDJ6B
 ntYi8Ix2Klj01FzXkQi3ABAEZg==
X-Google-Smtp-Source: AK7set9W3aK6n1hfLPEcZHdTYgkmNQeapXReOUFJDqF5aWpvMMnxPBElUKcvLLIgEyAsQJPLpPJqzg==
X-Received: by 2002:a05:6000:144f:b0:2c3:be89:7c22 with SMTP id
 v15-20020a056000144f00b002c3be897c22mr5197083wrx.5.1675447766299; 
 Fri, 03 Feb 2023 10:09:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm2474545wrs.40.2023.02.03.10.09.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link()
Date: Fri,  3 Feb 2023 19:08:57 +0100
Message-Id: <20230203180914.49112-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:09:30 -0000

Introduce qdev_prop_set_link(), equivalent of
object_property_set_link() for QDev objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 5 +++++
 include/hw/qdev-properties.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 9789a2f5de..46236b1542 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -694,6 +694,11 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
     }
 }
 
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value)
+{
+    object_property_set_link(OBJECT(dev), name, value, &error_abort);
+}
+
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value)
 {
     object_property_set_bool(OBJECT(dev), name, value, &error_abort);
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 21f399e9a3..c16dbefb2f 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -191,6 +191,7 @@ bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
  * Set properties between creation and realization.
  * @value must be valid.  Each property may be set at most once.
  */
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value);
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value);
 void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t value);
 void qdev_prop_set_uint16(DeviceState *dev, const char *name, uint16_t value);
-- 
2.38.1


