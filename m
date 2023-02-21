Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbeJ-0006Vz-Bf
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 18:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe5-0006Nb-Dr
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe2-0006D3-Mp
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:00 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z8so5769319wrm.8
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3nout0t/bB9b3WOA6rURz0GJJBClZpY0Y1XPX42CvU=;
 b=RA1kyLu9oFH+P4+AwgJstTyE42cB4cL+vo3UoZiuLw8V91KTS+gOeUIZEPSBOwxTDu
 II0FQMmY0t+pt+qIMptmOx8Wx9hDxw4ygfc0aEzk9QoNl3eW4nfuqbWzMKQE8+T0vxOY
 xruV7kwMij7B0fOlBIlhx9uSvSkFtH/K59jtkJVHN2NWmombQKjhBq6hwOta+gnwPRNQ
 /WGO7yn76SfTEh6xNttjrIBAm7ggyOBQgeilE5/op/CdE2/eCj9i+5Skc2t2bDTtVe4e
 fFLD0Qhxx4XN/HuyZv48CjcyYTGKLp/3zRS9e00rCz1BiJRf6JfYaBub7Pgr6QRmQNDU
 ghAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3nout0t/bB9b3WOA6rURz0GJJBClZpY0Y1XPX42CvU=;
 b=wVT5acveF6ELzPdZcJd+T4KR/lZ4MwQsxnO3+/JoVY4jnk6nBmr1AdFod47ZFm9qXI
 3/Mitoeka8OA4yYkzA3ww2VykbrQNz5JIV5bywWOuGqFBJ1/kO+DSwnpL+4SxAL0ahsz
 aSzdHHHaMs2HYSLLIBrOUgNDjI2P3svCBLOC4314m3M4r+DU4RBdoG6vJE47Pizu99oy
 O5K/voxovLoYhMcne8zWvf+F94HlNpgiXdfle6CKG/kGw8jtBUl83fPWOOmblPl0PxTh
 rrdMXCYSNLRLJhxeUBoKnDEPccCOn1tDF51iPbzOkBr2AUpz9OwjJMJCO3iQSZeneIE4
 C14w==
X-Gm-Message-State: AO0yUKW/G1UxgjoPcVTYKEXICxl+EfrQHwL02sIZcm5VGhIl4JmRcLz2
 drpu9YHe10wWxP+4Fyer/R7d6Q==
X-Google-Smtp-Source: AK7set8zG1yCoqKGQfmjNL5uVl4SWm6wBWKQjWlB2OawZ64Iu0Q7Fk52y3JxXv7+GcVzTkjB8Ljdtw==
X-Received: by 2002:a05:6000:c1:b0:2c5:5308:859c with SMTP id
 q1-20020a05600000c100b002c55308859cmr3857811wrx.18.1677020516626; 
 Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adffe05000000b002c5539171d1sm8289828wrr.41.2023.02.21.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F39C51FFC2;
 Tue, 21 Feb 2023 22:52:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 12/24] gdbstub: abstract target specific details from
 gdb_put_packet_binary
Date: Tue, 21 Feb 2023 22:52:15 +0000
Message-Id: <20230221225227.3735319-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 23:02:10 -0000

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
index a3dd629ee8..3912d0de38 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -108,6 +108,21 @@ void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
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
index 4bf99783a6..76c24b7cb6 100644
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
index 79674b8bea..0232e62ea4 100644
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
index 1c9e070e57..33a0701cea 100644
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
2.39.1


