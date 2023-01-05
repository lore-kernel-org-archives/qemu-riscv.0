Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTTJ-00072p-Rh
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTI-0006yK-B0
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:04 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTTC-00017C-CS
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:52:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id z16so20238717wrw.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eledW64ITyXCJRysHgCO0tP2RH9YIIThzccmYjDKTt8=;
 b=Ky/q1lnuWeRl0J7fyVbf/oPZRUuAPii0RjSWgKvcMe8anv2MCeTbcQoZy/9Bk+HSny
 m0yVpEqDM3Djjqb4+MSu/RGkbRJ6YdgzZl2JnEtbeK+aamaZDFSFG048F/5McbqcPh0H
 QxSkb0plvFDawJ+OF7v1pwg5NBueO0WZM3vF4gB/PLd6HslkmlO6isIV21fdJxcoPvyn
 6JRx2ZX5+NIg8qM3/RBf+J6RVQ/8lb5NSZWNK5ZsuMEWeeuc4fcIINkG8drBcTs62Fhe
 iKY86pZlOemqR/o52/mAkBfZFi4aAZtTIIUKaGSPVo1CXiwPM9xWvBU/JMIohnRytMPK
 /+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eledW64ITyXCJRysHgCO0tP2RH9YIIThzccmYjDKTt8=;
 b=VEcvZfLRQZmCblpv4BtEoRo1p+hdM7upUOZkoUxG5gGYc2vc1FoWqogTX87J34X39I
 oLl/70B3pssKDbnnOmVLSWe+TP3GrKnORi0bbAdP9mzy1+j3SuifnRjyKoiUquhDSwmj
 HDQ2r7VtXyfZl83EQU4Lrg5WBvgRmtblJXt5H3ZUJPWNsgBj2Gz6CTfo4Cwk0Gc9wl9n
 rc6+v5w6+xco8w3vRuZTjJ/eHGfikDFT1OdBMIHgGnTuQDswMc4hGp5e6+bnMFGFgeXD
 +uBngV+odplBcJkI+Oytu5BJp8VctV9/Qw7xSQODsVKtg/CvDSqW840TtlIn1KATz1Yd
 DxnQ==
X-Gm-Message-State: AFqh2krAc4Sh9HYYdySKo6C1mtwBp/gsR1mmU1Z6T5hhxL7gUXI8xRR+
 WLm0wVEU15Evyn4zVI962F2jlQ==
X-Google-Smtp-Source: AMrXdXumbuujYM05FNfUlsAdyZ31Qd+bF8kQa4bed7Pg8d0RHk1u8CyuHIEefJF+SRYl5PABX6W+zQ==
X-Received: by 2002:a5d:430e:0:b0:279:53e1:5178 with SMTP id
 h14-20020a5d430e000000b0027953e15178mr24462986wrq.45.1672937516748; 
 Thu, 05 Jan 2023 08:51:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d5681000000b002714b3d2348sm37438617wrv.25.2023.01.05.08.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:51:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B51E1FFC9;
 Thu,  5 Jan 2023 16:43:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 18/21] gdbstub: don't use target_ulong while handling
 registers
Date: Thu,  5 Jan 2023 16:43:17 +0000
Message-Id: <20230105164320.2164095-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:52:04 -0000

This is a hangover from the original code. addr is misleading as it is
only a really a register id. While len will never exceed
MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4547ca3367..c50c2f8e0f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1192,7 +1192,8 @@ static void handle_read_mem(GArray *params, void *user_ctx)
 
 static void handle_write_all_regs(GArray *params, void *user_ctx)
 {
-    target_ulong addr, len;
+    int reg_id;
+    size_t len;
     uint8_t *registers;
     int reg_size;
 
@@ -1204,9 +1205,10 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
     len = strlen(get_param(params, 0)->data) / 2;
     gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
-    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
-         addr++) {
-        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
+    for (reg_id = 0;
+         reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
+         reg_id++) {
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, reg_id);
         len -= reg_size;
         registers += reg_size;
     }
@@ -1215,15 +1217,16 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
 
 static void handle_read_all_regs(GArray *params, void *user_ctx)
 {
-    target_ulong addr, len;
+    int reg_id;
+    size_t len;
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
     g_byte_array_set_size(gdbserver_state.mem_buf, 0);
     len = 0;
-    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs; addr++) {
+    for (reg_id = 0; reg_id < gdbserver_state.g_cpu->gdb_num_g_regs; reg_id++) {
         len += gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 addr);
+                                 reg_id);
     }
     g_assert(len == gdbserver_state.mem_buf->len);
 
-- 
2.34.1


