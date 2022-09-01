Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oTvOR-0005ZX-7X
	for mharc-qemu-riscv@gnu.org; Thu, 01 Sep 2022 21:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0y-0000XA-Kr
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:24 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0x-0005CT-0z
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:24 -0400
Received: by mail-lf1-x129.google.com with SMTP id z25so853035lfr.2
 for <qemu-riscv@nongnu.org>; Thu, 01 Sep 2022 15:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=F8wVZOpwAJXo143Rii6ZOZtMb09Fvu3VjBq5m97dwGs=;
 b=XrtB9HDCYMyJqI1glcgQkfSSEzGx1EpzQO5TENF6O7ud3DSkhpWv3czMA1oB+YkD3I
 s/ET5IK2cW+rmA8s4XuKYaV0RkQdz5TkxZD5A+t7SK6eyUksrM8Q4kS2p9yL59YcmNQv
 umsAPAXPlhdkfPtj5I45ehAeJT8HC9hfhRBE0E4O8WckTT3kHzmA2XrYs2qJvgxvZuPg
 3tlC0JOn9njKuWjXRX8NacRJbC5kIEG/zNkmkdSawzjx2C4qeRBOGI65CQCBCn7wW6N6
 57qQZ/y8cnVJU27z9EVSSIgpO3Nwgz1DB8HqSyVbult9WEGwOlE4sKQjrms7NcnOslbR
 B7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=F8wVZOpwAJXo143Rii6ZOZtMb09Fvu3VjBq5m97dwGs=;
 b=0D7nb2zEz2ZZhvBXeiN5wopOYB2wT+VWwXk+twIHjQD+GSpHSkjujcqc0TfpARezTt
 onYzWxbn/4Qn+Dtb74tlcaw01TCNEHGxTdw0xRFLQ2kdSEz53yLonZ3KrpML4eZHqfmI
 JEvs802GmW96WldHnjtaynLFFV4FnxrH65dcR62oy7fHMa9qOHkRV0foJ8+40B1hMTB0
 JiMtznHnVjHvyfz/mCsjZZH+AFYc0ZAk8hGYL4EPsnvkG/RieJ83J7onag3cVj8GSIPB
 xWVzNT7u9reYX/UMrYo9OHYOp+adN7Agj0dd6PtvZV1oG4JmO7xS+GraCBnr8/YcJi6w
 mkJA==
X-Gm-Message-State: ACgBeo1bAdaYUbQRdOWKIiT9CXGKIBjGtans3cDwiQWn9D1/6gbABtm9
 A7lJQmDqcOHhHuH01K6gxIsJQUq2DMeevwNAgcH/09lNKmY=
X-Google-Smtp-Source: AA6agR5ANaLlr/UhJHJsLdmmbeIKX+cA/U2pVny/S0zbTF9jnVf1TlVJLKVr4RIw0ovxIxfsNsUVEGW8679CcTrWW/A=
X-Received: by 2002:a19:e342:0:b0:494:7859:ad7a with SMTP id
 c2-20020a19e342000000b004947859ad7amr4450443lfk.347.1662072621419; Thu, 01
 Sep 2022 15:50:21 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:50:11 -0700
Message-ID: <CAB88-qPZr7G8Lp0Q=851JSFyb5v7ub5Hi4DaD6mVQKZxFt5UOw@mail.gmail.com>
Subject: [PATCH 3/4] hw/timer: ibex_timer.c: Update register addresses
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tkng@rivosinc.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:44 -0400
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
X-List-Received-Date: Thu, 01 Sep 2022 22:50:24 -0000

Updates the register addresses to match the OpenTitan spec.

These changes were made in this commit:
https://github.com/lowRISC/opentitan/commit/a25e162b8f91bd0ca32258c83d1d480f93327204

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/timer/ibex_timer.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364da..9ffd4821e8 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -38,19 +38,19 @@ REG32(ALERT_TEST, 0x00)
     FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
 REG32(CTRL, 0x04)
     FIELD(CTRL, ACTIVE, 0, 1)
-REG32(CFG0, 0x100)
-    FIELD(CFG0, PRESCALE, 0, 12)
-    FIELD(CFG0, STEP, 16, 8)
-REG32(LOWER0, 0x104)
-REG32(UPPER0, 0x108)
-REG32(COMPARE_LOWER0, 0x10C)
-REG32(COMPARE_UPPER0, 0x110)
-REG32(INTR_ENABLE, 0x114)
+REG32(INTR_ENABLE, 0x100)
     FIELD(INTR_ENABLE, IE_0, 0, 1)
-REG32(INTR_STATE, 0x118)
+REG32(INTR_STATE, 0x104)
     FIELD(INTR_STATE, IS_0, 0, 1)
-REG32(INTR_TEST, 0x11C)
+REG32(INTR_TEST, 0x108)
     FIELD(INTR_TEST, T_0, 0, 1)
+REG32(CFG0, 0x10C)
+    FIELD(CFG0, PRESCALE, 0, 12)
+    FIELD(CFG0, STEP, 16, 8)
+REG32(LOWER0, 0x110)
+REG32(UPPER0, 0x114)
+REG32(COMPARE_LOWER0, 0x118)
+REG32(COMPARE_UPPER0, 0x11C)

 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
--
2.30.2

