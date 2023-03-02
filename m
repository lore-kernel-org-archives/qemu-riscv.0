Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoNz-00076M-GQ
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNx-0006vD-2C
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNo-0000np-Ly
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:14:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h14so155909wru.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kebJRJ/Zd0hMxCtlzPa2wrDMn74tVWfVULcszCFYnrs=;
 b=RHVfSsXSeOsHZgpUTWIlzcqkeEi3+plFRd6crMtuBIX/nPCnvRLS3NA5NERG9MQxDC
 kLTG8utGQ9QSoL2omBP8n8BU69T6lQnPcQAHEn4BfU0784JW5LZ1h3B/dirN0aG0LOUn
 ZGuJyeqfT+u4C5dfFRXEEKN0qyFtD0m/K16wJcdae9PY/dxrQVHb/bAtbVMCjXBYzZ6a
 2f3Lhn2hfn6G34LFcDwxVJRnPPNxvjCjk3iEtZ7Rqa49kWFOzBjrZgCZQN1SA7vNIxE2
 gY29OoR0T8jS/mYtLH59BH3VlNYg8yS9ILRxnl1jUabfs29WHqXloX8fEb9uGXXNKavg
 6ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kebJRJ/Zd0hMxCtlzPa2wrDMn74tVWfVULcszCFYnrs=;
 b=2b3lW8OslMWKG7OOJpv/pj8Z/lME3M2afkN5sNPTjWxAVvLvgga6fusTZebpAjlZ8U
 yu12m3CdS0etcW0qVGPROeR547lUBOcPl3z2kEe88M5pibaLZQbAMlfHweqjaO8zrJi9
 C1zZEkf95phu/EQPQ8V5bRnRuOHp6qEIjGpwjF4qNO9/duJrtl2XzswWoSCSD7WVYzgC
 NPLvrOd76egwsVBwOI34ZaXoRtds+GGGP01NVGboQfRtiN9ru5SU1HE6pVuxzwclagiK
 wGrTdQ388eT8T/Sge4+FjmhtM9eCypfDjuzB9ebuKG8eIqx7CL31zbdMaNM4zk96CnuI
 Y8iw==
X-Gm-Message-State: AO0yUKWruHUr+ypSoQKzWkx3Ecrgwl4rXLu8QrdL/XcCmP0Y+t99f0Zm
 aWu59mjvIwJVqn863nk73Re7/A==
X-Google-Smtp-Source: AK7set+D/4mTEhIX+7Jk/ThTEoGUCRN5R/1wUY3+La0dBKWoMtb+xw5AxRlJ8TNMrqyA30xvhuE2qg==
X-Received: by 2002:a05:6000:10cc:b0:2c7:e60:abe8 with SMTP id
 b12-20020a05600010cc00b002c70e60abe8mr2230369wrx.9.1677784465139; 
 Thu, 02 Mar 2023 11:14:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm384899wmg.24.2023.03.02.11.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 234561FFC7;
 Thu,  2 Mar 2023 19:08:49 +0000 (GMT)
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
Subject: [PATCH v4 19/26] gdbstub: don't use target_ulong while handling
 registers
Date: Thu,  2 Mar 2023 19:08:39 +0000
Message-Id: <20230302190846.2593720-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 19:14:37 -0000

This is a hangover from the original code. addr is misleading as it is
only really a register id. While len will never exceed
MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - fix commit message
  - use unsigned for regid
v4
  - revert unsigned change
---
 gdbstub/gdbstub.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b8aead03bd..f1504af44f 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1193,7 +1193,8 @@ static void handle_read_mem(GArray *params, void *user_ctx)
 
 static void handle_write_all_regs(GArray *params, void *user_ctx)
 {
-    target_ulong addr, len;
+    int reg_id;
+    size_t len;
     uint8_t *registers;
     int reg_size;
 
@@ -1205,9 +1206,10 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
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
@@ -1216,15 +1218,16 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
 
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
2.39.2


