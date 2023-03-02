Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoId-0007Vv-DY
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIb-0007U0-A1
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIO-0004Wt-GY
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2524567wmq.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62eIWH+UgNDIO9tL0abCF5DS6hbxUYuKBS98TK1uNAY=;
 b=Y2EwnqrCp+qDTcFz1EW3YC21JHlRf1J8aYrGwA16D/IrPQ+aPQqDJHH+7FThelkDFB
 8P/fukV7yJd4T0msEj12mSBV5ljzbAuK6Sg3R+g9QsoN5jpHqQxlkHkrKYLjXCAIuFRL
 5S5C5B39krQZ0rFy9pIr/itagrEREMhfC3EVUx+d4tsUUzcbvDECSEuEHxCVWJS8GDxC
 gXYle4/apt0EhZXe174MMqRCyJIGjlK8TLBqhbQwZEZaz/OdMjUChqu5R1h8exkjYA67
 CeV9ATLtLKGKbS65+050zb/YnCyfCHofOiHTJPzr5sRxrbwBNYOAwmSee/eKW7BsEBor
 vDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62eIWH+UgNDIO9tL0abCF5DS6hbxUYuKBS98TK1uNAY=;
 b=kQIvDEwuEIyPVdZJ3GLpXW9IGcfemzLYUEIuQvEy2x2k0oeahye56bilv9wwgGK2ZJ
 iB8pc1CMM4Um/7qt3+SC9fAjue/+03zii/JhW9wFhMnkOwXW4axXEwb9hNcihGu8qQks
 cm5aQ9oFk5GgJd9qls5AgxC8w0FupdpKpcn7ZXw0n00adgatvHX1A5zSumiquG/Szif4
 bp+haBV56wGQQOH5vpQPwCvjx5hTIpUSvNqw1N4wMVT926DKxoa2Fk1tFsmxHH/vyGyD
 nEVehH1uKXkVV5oXdb0to/khXjBPQtgRKHB8xZbbo4Frx857cB+H8O8usJykN3fjWt7J
 sS3w==
X-Gm-Message-State: AO0yUKVTC8lDBwi6U0wUjAxIBJmn0RwdPgL4Bd8WhuDePA0G7s2qEb8Q
 r0CapWetGprRVH5H3tpFtMnuZw==
X-Google-Smtp-Source: AK7set+DZpUV+fLm5EmXNvZFeuE5OsROlq+aBaJRW0JmuEXUuessAEZ306eoy59qqadcmgINWU/Wgg==
X-Received: by 2002:a05:600c:170a:b0:3eb:37ce:4c3d with SMTP id
 c10-20020a05600c170a00b003eb37ce4c3dmr4634014wmn.38.1677784130856; 
 Thu, 02 Mar 2023 11:08:50 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d508a000000b002c54241b4fesm125929wrt.80.2023.03.02.11.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07E891FFBC;
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
Subject: [PATCH v4 04/26] gdbstub: clean-up indent on gdb_exit
Date: Thu,  2 Mar 2023 19:08:24 +0000
Message-Id: <20230302190846.2593720-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Otherwise checkpatch will throw a hissy fit on the later patches that
split this function up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fb9c49e0fd..63b56f0027 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -3021,27 +3021,27 @@ static void gdb_read_byte(uint8_t ch)
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
-  char buf[4];
+    char buf[4];
 
-  if (!gdbserver_state.init) {
-      return;
-  }
+    if (!gdbserver_state.init) {
+        return;
+    }
 #ifdef CONFIG_USER_ONLY
-  if (gdbserver_state.socket_path) {
-      unlink(gdbserver_state.socket_path);
-  }
-  if (gdbserver_state.fd < 0) {
-      return;
-  }
+    if (gdbserver_state.socket_path) {
+        unlink(gdbserver_state.socket_path);
+    }
+    if (gdbserver_state.fd < 0) {
+        return;
+    }
 #endif
 
-  trace_gdbstub_op_exiting((uint8_t)code);
+    trace_gdbstub_op_exiting((uint8_t)code);
 
-  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
+    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+    put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
 #endif
 }
 
-- 
2.39.2


