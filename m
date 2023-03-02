Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoIe-0007XV-3r
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIb-0007UV-GS
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIO-0004X6-KZ
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id h11so137858wrm.5
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhv1r+37cIdO73Hx2ePtuQOU7s/kw+X5fYnQSMO6fRk=;
 b=fv7CdPJTK9CJaeTbeeSsek2LKFF9kpjrFZaRix6juRaohfp3SLvfs3Ggy602Up+h22
 rM2xGkf/oXZa4xPJz1dMsS/9nSu4BO2fUaLutGMQQZBJacAaysZ9yjQaij8vg+rbctxQ
 Q5MnIaXHSg9UzOK0B53f4LSbOxoFhEJqE/JrC9ChRXQiO2ZQZ+9DU+Xq0CMEbWfA2HBB
 Kxe50BtD8Df5BZeNZ2RrVKItDRm/fhDLrIk6vt0R20H34+d4SvBadDANJHcqLzxkCqCV
 kc70xW8lcrMlG6QToYS7BYHHbJOq+m1tQBnEwCkuHs+ArsDP3CmduWv/bJKuT+1ibyy2
 VQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhv1r+37cIdO73Hx2ePtuQOU7s/kw+X5fYnQSMO6fRk=;
 b=zVLZ61aZ0oJpjYYdAxsfLLOStQ0hrCRwKq+wLLqOxCSfKxoPuuJgh6VSsLHGhuzqP5
 cYtPRld6QusOjcWpssYo5KCaODzv9gp5ATXuwVcJP8PGlNof5AMa9F7QH+iW+6rzSX3A
 tc0/h//bG2xaywiRdi/UmjZIO8nnuGgHdDg/a0E8pZ6YUdS2PIiCf+2epnDAB8u/Lj8g
 loGFBBJIY+wBK25esFb+HWeAPJdGGDBWgigXPpwm9aD0qWDNEhkoQoqjjloTnymTOKi3
 sXqK1WgvwHDG4MIhkHoIpE3mlsS72tmaRGv7mlmo+mHOZ0jt3EY488q47t3ayc5S/PI0
 gHnQ==
X-Gm-Message-State: AO0yUKVfDCCRMERP8AUkUA+FOUlhUEGGMw2rD/sBH5OjmSbAQDz4K0b8
 24RgpWL3ARtL2b83KilhTNXCVQ==
X-Google-Smtp-Source: AK7set+LEp66kxPk8JP5WMjaKbMYNiQxBVToigX4wmvxYtjwSkY7GbDiNpyXd9Ln+qPbqAZZcuMcIA==
X-Received: by 2002:a5d:604b:0:b0:2c7:faf:af32 with SMTP id
 j11-20020a5d604b000000b002c70fafaf32mr7953987wrt.14.1677784131052; 
 Thu, 02 Mar 2023 11:08:51 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4944000000b002c56013c07fsm114369wrs.109.2023.03.02.11.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 941401FFB7;
 Thu,  2 Mar 2023 19:08:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 08/26] gdbstub: move fromhex/tohex routines to internals
Date: Thu,  2 Mar 2023 19:08:28 +0000
Message-Id: <20230302190846.2593720-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 19:09:05 -0000

These will be needed from multiple places in the code. They are
declared as inline so move to the header and fix up to modern coding
style.

The only other place that messes with hex stuff at the moment is the
URI handling in utils but that would be more code churn so leave for
now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 27 +++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 20 --------------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 32daaf73a3..b4620f99c4 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -57,6 +57,33 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+
+/*
+ * Inline utility function, convert from int to hex and back
+ */
+
+static inline int fromhex(int v)
+{
+    if (v >= '0' && v <= '9') {
+        return v - '0';
+    } else if (v >= 'A' && v <= 'F') {
+        return v - 'A' + 10;
+    } else if (v >= 'a' && v <= 'f') {
+        return v - 'a' + 10;
+    } else {
+        return 0;
+    }
+}
+
+static inline int tohex(int v)
+{
+    if (v < 10) {
+        return v + '0';
+    } else {
+        return v - 10 + 'a';
+    }
+}
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index abb1777e73..ba46ed73b3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,26 +546,6 @@ static void put_buffer(const uint8_t *buf, int len)
 #endif
 }
 
-static inline int fromhex(int v)
-{
-    if (v >= '0' && v <= '9')
-        return v - '0';
-    else if (v >= 'A' && v <= 'F')
-        return v - 'A' + 10;
-    else if (v >= 'a' && v <= 'f')
-        return v - 'a' + 10;
-    else
-        return 0;
-}
-
-static inline int tohex(int v)
-{
-    if (v < 10)
-        return v + '0';
-    else
-        return v - 10 + 'a';
-}
-
 /* writes 2*len+1 bytes in buf */
 static void memtohex(GString *buf, const uint8_t *mem, int len)
 {
-- 
2.39.2


