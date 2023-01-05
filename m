Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTLR-0007T4-ME
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTLP-0007MM-Is
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL0-00072Z-7W
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 11:43:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z16so20216030wrw.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lMJgjm1DvK1wLgcUqU/S1XJA9L6jfYX3fmzxSNKcYA=;
 b=K9aYT+Ech1VA7Vzll9S5stHUFVnUBqi2CxjynyXAMpotngTRqLGLRBm+/BcaqOXz+d
 lGjihXtYfLk1uYVy6PymNIQ6yW3puCRhvjNI0xuIaH+xrDRG91haacTImhLwnlLc470T
 SqdSQPRtj+hDsA2H3d3iSJ/odVGf6wE25vJslv4qta9zV4OMP7LFaey6JtdGBfJX+ty/
 2Z/aeoXSog5TeTWPUANCAifaPNCD9IrStFGcbd4dR0efRKJLTdnLZZrHjRtZxSwaUFdJ
 klG144UdA8P0UFX5p6vB/juBM+A6Jb+dcxH3PI2ouimoZ9/ANupnePX8VbEkFb747sgo
 DdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lMJgjm1DvK1wLgcUqU/S1XJA9L6jfYX3fmzxSNKcYA=;
 b=kooSUwf0qfQGmLjY49N8wTXJhUT61JjbWiyFSWUhKrQuCSWvRgyDXlupzti1HmtZl8
 QCncTRfmrU6k86KymBRNzfWvRy9H11CAtTrO563nShVfeRburkk3xnh9Ue8hDyXfYdDd
 r39W5mNbQh2tmOg3jX0/veydWTJrI5MDpcMDJ5T1NfsoIaDa6Ytejei/lykzco0QRzrY
 0Vbown3KjNaaAs7dqYNyWm8EwFrRl/4fZLgEeMd4ZDGZYpIJpuyMv4J/mNTZzIDbVLZ0
 r+Ph/usbn/TEiLl3stHjS2arLYaQRY3jI+hm/fBuD2gP2L+tAXWPoAw7f3p7AmdJ3UD5
 kkvg==
X-Gm-Message-State: AFqh2krQE8z68c7L1N86EJK08M/U4NsrLArEKkobALVgDqeJdteAH2kq
 DgJcun/VKFAvowWE1WlL2Yggfw==
X-Google-Smtp-Source: AMrXdXtBpRGasXG645y3Si0iD+NiZ5BM3DOkgfDeT3h2du/8jKfyT878h8Lq3dpg20hRYn9wWrgLXQ==
X-Received: by 2002:adf:e5c7:0:b0:270:de92:7962 with SMTP id
 a7-20020adfe5c7000000b00270de927962mr31319470wrn.60.1672937008513; 
 Thu, 05 Jan 2023 08:43:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm31319287wrw.117.2023.01.05.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D4F01FFC8;
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
Subject: [PATCH v2 17/21] gdbstub: fix address type of gdb_set_cpu_pc
Date: Thu,  5 Jan 2023 16:43:16 +0000
Message-Id: <20230105164320.2164095-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 05 Jan 2023 16:43:56 -0000

The underlying call uses vaddr and the comms API uses unsigned long
long which will always fit. We don't need to deal in target_ulong
here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index c293b8e43c..4547ca3367 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -535,7 +535,7 @@ static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 }
 
 
-static void gdb_set_cpu_pc(target_ulong pc)
+static void gdb_set_cpu_pc(vaddr pc)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
 
@@ -1289,7 +1289,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
 static void handle_step(GArray *params, void *user_ctx)
 {
     if (params->len) {
-        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
-- 
2.34.1


