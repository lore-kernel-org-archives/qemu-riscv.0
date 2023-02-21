Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbeY-0006kR-3k
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 18:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbeB-0006OP-8l
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe3-0006EU-SS
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 18:02:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso4821592wmq.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 15:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMicf5MbOGOq7OlwruPZHVb+Ki+l+2GcwACskyg7sb0=;
 b=Se6r6nanSNv3SGL2ZPDLYua+qn0ydW5lxXxfvjQb4eodVOf//zwxbZsxd5B54DqJwt
 81akZNOncSUgJgVWkfFCqjjVcF4f3t+7JHYIQnYIIVDg6KJkL9rql1nML8wfC7p+Sbl1
 jxTAdkhgfGuHdbgWW78kZgQT2GOf5Js3QZoYRQJzsioFanXCOgRn1Fog1GZ1U2aoxWse
 5D6FLJT2RhHM4IOg5DbHWHi5PwXUdaY9tmcgePe94fAhqkkjqiI6tjKN7u6/ugTTMJz0
 gjn7I4lVJPqvVCdSft5T9N5AMEhmtOXpbHDe6iwGPSzCVf6XIT6qs9Xp/312NNtRcG6+
 emJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMicf5MbOGOq7OlwruPZHVb+Ki+l+2GcwACskyg7sb0=;
 b=ysPTzc/Jvn3MJS3TUrrt4xNwUkaAJrXW0ARSs/xq8+7v5FNdigk63Dar3RJIo7PuZA
 7jKOKajE9gti1TZjmPtK2DpzjwGaAwhKFTdgHpl/TDskpCcJTFTxbTi5lBPdCb27kelf
 vBzMrjFugpuEm6E4GJWjDErbneMnPt5nJgVCzG40MrCNwZdxG5u3kohshOAsWBTOgicY
 xFLC8i2jUqUXQXFnCMkqOh85jzVI1P2t6zgX/mcltxZifT6iIY3H11LFvTpZkYMHSPZb
 YTK9HxcNpXUHAvxa4SFL1ffVOvOsM2tiyNlkoo0hy+AFuF88buj/TiY8KTAkEwkyAstQ
 N3GA==
X-Gm-Message-State: AO0yUKVZrTujiHntYXYnmq3cPa8e2Inno7fAxGDbKiQh16EWeDEfwukP
 fdjo1JOTyfN/Vvjiykw9ruv4bw==
X-Google-Smtp-Source: AK7set/YgGh4OVZDzugNmXahxyznct77VCQmOEam1gIpSP9W7Zdt7U9QAVU3rExy1YHoQ7fz5dixlg==
X-Received: by 2002:a05:600c:5121:b0:3dd:1bd3:4f6d with SMTP id
 o33-20020a05600c512100b003dd1bd34f6dmr4294092wms.32.1677020518044; 
 Tue, 21 Feb 2023 15:01:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003dc4480df80sm4966219wmc.34.2023.02.21.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4A3C1FFBB;
 Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
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
Subject: [PATCH v3 17/24] gdbstub: fix address type of gdb_set_cpu_pc
Date: Tue, 21 Feb 2023 22:52:20 +0000
Message-Id: <20230221225227.3735319-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 23:02:12 -0000

The underlying call uses vaddr and the comms API uses unsigned long
long which will always fit. We don't need to deal in target_ulong
here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e107aa065c..4814e8fbf3 100644
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
2.39.1


