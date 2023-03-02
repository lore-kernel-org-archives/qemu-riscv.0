Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXoIg-0007Zl-JY
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 14:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIc-0007VA-WA
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoIP-0004UU-Uo
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 14:09:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id l1so103043wry.12
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 11:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbnWOXh4ZExL9KJ5IqauLpuFcCfssFumF9ny95ox2i8=;
 b=IPI+6Gk7NYKXNZza05A834y6TpN8DALtHsZetaiTaxMlqJmMqUfqEWijlq7+vj+GZU
 T4sTwET7CEM0Ksqjf8q9uWmPjCMFogW6HfCic9FuCGZAsCc9vYNfJ09m3CIBzt1lhNMu
 mW35GsGmBrUNTqCqT/LByr1cOumN1O9v9jHOe0Xp7urTyaTpW3yrs1I7ExnPRg3hoppv
 68AC9nvaklylPBBkUSjNThhscvVbQFRit+YWGCe+U5bqbNE838b0cxUA6VoDi2RsjcVt
 h76y+TstjC5Kp07+PUCXJP2gbzVDGslt6hZUyRcsBzLvS8ApKyeVt9vTxTjng939Qw5u
 RWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbnWOXh4ZExL9KJ5IqauLpuFcCfssFumF9ny95ox2i8=;
 b=QCs/a/TNAWGf4HLN0taSwKQWWYvWvi4QtSLplTh1dWnS+Mc4WLAcEuZ1C4x4NtMhHC
 x00SVNOBbwT7XpndbiZ6tY9GZTBRm+0ClB/DX9ugz2duAmjVqiph3pI09p0eN7i8S5Vx
 WmrBRiTYr2RhnS+ikuN5uyg/95hTSR9yrcGUVifXvlojLR4ej7P+eATTN2hWG11bOFYy
 oen8+P8ho32pDFLx/wkDObbsQ3OVZgB0YxX7OZuNends+u2Ykhi1f15KJxFr/vD6L6UH
 K7DozKTrtm4rrZnLaPPi3acLjiF0NWmu29VniZ3phlo7fqGdf0cqUvVXaRYI7LnI6zUu
 YR4g==
X-Gm-Message-State: AO0yUKVQvZGiPYtBtsKAXLKz0i85rikpx4t61Z/qLijDNsY/E1rcQmPy
 9GSmWh9nZkPcU4jfmTcClJe+rQ==
X-Google-Smtp-Source: AK7set+sgWnQU7C1557YTr26sjJJG7QJkrJhRZa4q9qR+57x/VqQHBAAVOWgrFutk1LRjL326N5Fuw==
X-Received: by 2002:adf:f483:0:b0:2c7:d7ca:4c89 with SMTP id
 l3-20020adff483000000b002c7d7ca4c89mr8552024wro.58.1677784133103; 
 Thu, 02 Mar 2023 11:08:53 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n1-20020adffe01000000b002c4084d3472sm141397wrr.58.2023.03.02.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:08:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4781C1FFC1;
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
Subject: [PATCH v4 12/26] gdbstub: rationalise signal mapping in softmmu
Date: Thu,  2 Mar 2023 19:08:32 +0000
Message-Id: <20230302190846.2593720-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
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
X-List-Received-Date: Thu, 02 Mar 2023 19:09:07 -0000

We don't really need a table for mapping two symbols.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index a6c196ade6..6796761fd9 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -506,20 +506,14 @@ enum {
     TARGET_SIGTRAP = 5
 };
 
-static int gdb_signal_table[] = {
-    -1,
-    -1,
-    TARGET_SIGINT,
-    -1,
-    -1,
-    TARGET_SIGTRAP
-};
-
 int gdb_signal_to_target(int sig)
 {
-    if (sig < ARRAY_SIZE(gdb_signal_table)) {
-        return gdb_signal_table[sig];
-    } else {
+    switch (sig) {
+    case 2:
+        return TARGET_SIGINT;
+    case 5:
+        return TARGET_SIGTRAP;
+    default:
         return -1;
     }
 }
-- 
2.39.2


