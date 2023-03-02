Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoNq-0006aZ-No
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNo-0006Wj-8C
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:28 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNi-0000jg-Bd
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so2540103wms.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkhUerl9HMLvEw3fit+pxInPqsKmIKwDU7RamZamxD0=;
 b=QkLv0+eOtAYCwCmJedftemEobTPSKKWvlpHZPjXtS7Xt5Lnp+ADQ5od30gQc1GVZw2
 wsXL89hlobRtsFSDDpyOztNZudx7fTiJ7s7lbpCIkVIk6/fxQGrYlnnzUpEidVPeX2Jv
 D5Xqc6dl09R6aPu3+rQGcFtfcdK0ZpCTZsxvl5qIbu3x/rCY1NVzOaXV/B4x4un/Uzye
 OKzcdm1s1OZcVQ1j4lIjJTI1RwAsvHj5WXgNI5n+Zx7eqqY2pMAQqztn6hVnjcjXwinc
 Cbpwkx6mo7EfIG9yf4QtWIGku5RUKJDxCpSbRNTFK2ncpyW7HUOdwcKfxby6v0V+cMGo
 o83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkhUerl9HMLvEw3fit+pxInPqsKmIKwDU7RamZamxD0=;
 b=p7DDmNfWzPiJWXO6hqaF156RCsDUP/xhTvKYj+GugLE+dXcJPYena8IY2RLUQE9tkO
 x9UIUvdU7YOunB9B6u55McN1DAWBWulFhTG3IFsr0KLYLjqjOR+FDdx4nYyCQ4WhT0KM
 L16RkOnToJMkZAFBgx6UYMyULi6frqATm4EyMdmmZ7Hx3sxA1n8tC6oCcYFf23rPPTBs
 PCYM4Q+ltwZL9o8wC6EwXqNIVAvA6ZZa2yjkykw2Y0IkQCBKYhHuWMcnO8TKpA2uYZa+
 Z6f+lPUa9RORJ7Q9lkG5tUZhX1aWL8hX8mh/b+AvOJaqBMc6xNUsJscmqVb35ZF0l71p
 vd3g==
X-Gm-Message-State: AO0yUKX+mLgcKgffVR2DLgcBd09GVdGSh/KzmspWT5bkatPJdABDB3HZ
 /mkkQJmFdSIkmEeM47PtDyhKWg==
X-Google-Smtp-Source: AK7set/t5q9Z1Hr3yT7+q7UuT7SPkaO07wY8/R/Oryajsdhp3v0zZwHlvilonbAyiMin/c9qQ1y3+w==
X-Received: by 2002:a05:600c:755:b0:3ea:d620:57a0 with SMTP id
 j21-20020a05600c075500b003ead62057a0mr8022303wmn.3.1677784460520; 
 Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c2e8800b003e2066a6339sm404744wmn.5.2023.03.02.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 679A51FFC2;
 Thu,  2 Mar 2023 19:08:48 +0000 (GMT)
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
Subject: [PATCH v4 13/26] gdbstub: abstract target specific details from
 gdb_put_packet_binary
Date: Thu,  2 Mar 2023 19:08:33 +0000
Message-Id: <20230302190846.2593720-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 19:14:28 -0000

We unfortunately handle the checking of packet acknowledgement
differently for user and softmmu modes. Abstract the user mode stuff
behind gdb_got_immediate_ack with a stub for softmmu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 15 +++++++++++++++
 gdbstub/gdbstub.c   | 10 ++--------
 gdbstub/softmmu.c   |  8 ++++++++
 gdbstub/user.c      | 19 +++++++++++++++++++
 4 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 6bd6a05657..6534e373cb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -110,6 +110,21 @@ void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
 void gdb_memtox(GString *buf, const char *mem, int len);
 void gdb_read_byte(uint8_t ch);
 
+/*
+ * Packet acknowledgement - we handle this slightly differently
+ * between user and softmmu mode, mainly to deal with the differences
+ * between the flexible chardev and the direct fd approaches.
+ *
+ * We currently don't support a negotiated QStartNoAckMode
+ */
+
+/**
+ * gdb_got_immediate_ack() - check ok to continue
+ *
+ * Returns true to continue, false to re-transmit for user only, the
+ * softmmu stub always returns true.
+ */
+bool gdb_got_immediate_ack(void);
 /* utility helpers */
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 6907bdc99c..0476ee7039 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -239,15 +239,9 @@ int gdb_put_packet_binary(const char *buf, int len, bool dump)
         gdb_put_buffer(gdbserver_state.last_packet->data,
                    gdbserver_state.last_packet->len);
 
-#ifdef CONFIG_USER_ONLY
-        i = gdb_get_char();
-        if (i < 0)
-            return -1;
-        if (i == '+')
+        if (gdb_got_immediate_ack()) {
             break;
-#else
-        break;
-#endif
+        }
     }
     return 0;
 }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 6796761fd9..04e75449a2 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -55,6 +55,14 @@ int gdb_get_cpu_index(CPUState *cpu)
     return cpu->cpu_index + 1;
 }
 
+/*
+ * We check the status of the last message in the chardev receive code
+ */
+bool gdb_got_immediate_ack(void)
+{
+    return true;
+}
+
 /*
  * GDB Connection management. For system emulation we do all of this
  * via our existing Chardev infrastructure which allows us to support
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 23b2e726f6..0c8cd028b1 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -54,6 +54,25 @@ int gdb_get_char(void)
     return ch;
 }
 
+bool gdb_got_immediate_ack(void)
+{
+    int i;
+
+    i = gdb_get_char();
+    if (i < 0) {
+        /* no response, continue anyway */
+        return true;
+    }
+
+    if (i == '+') {
+        /* received correctly, continue */
+        return true;
+    }
+
+    /* anything else, including '-' then try again */
+    return false;
+}
+
 void gdb_put_buffer(const uint8_t *buf, int len)
 {
     int ret;
-- 
2.39.2


