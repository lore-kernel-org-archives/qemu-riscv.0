Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA90CD610B
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:48:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptPT-0004eT-6w; Mon, 09 Oct 2023 12:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptP3-0003E7-Qy
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOl-0003Z4-Cq
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4064867903cso47901235e9.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869976; x=1697474776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54vdWxoInkKQLiHeicKKqmeJW+RARqhkyr/iqwsF+dM=;
 b=gGSX6fyXLKxe5f/lt/YRLEKujMia7z4hd7yRP9qwOd6O92V2nFQe/pOZardhizG+fb
 gLFcq3+gf8WVpdfaJqu8yTUnNYim8yiMHpIlGb7RwS8QZeb4lDtIcuCtTgptudtW7FKX
 OaQVfSP5RXdeA8+lgOK42PwEwPJCG5A4FctyVkO38A2TKxCJi9R4SDLq0WiQNVXM2XXF
 uUlkmaBox6OjZEv6zA5FMGgcpht1430EMCAWSDj+OLRWQVH/r1EEoqb1/KvPx4dtLHmV
 d68uHqEWwvlxQs/AcMGM2QEkByNR+4sNmlgDRevjG+NBWiwMULQ1NeKNYwY2EfRzmocZ
 aoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869976; x=1697474776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54vdWxoInkKQLiHeicKKqmeJW+RARqhkyr/iqwsF+dM=;
 b=jC5zi6BZ/zqt0LKW5klam27j5lowMpJvwemNvPFPA+59VOwSNRak+TwCiI0yqTyNn3
 3S1B3O6BbPW1RjEnBlTWXwK33EgstCDZCe9sJMlaDpMSgaJiJeifUHmVtUm66UD7lPBs
 caEKjHDiTvt8ZWjVAi7DJmph3Bv4UcZtNKOG5JYER0vM7N1WmHXj6a6K+GHKaz3YlMp0
 bN3s2mIbSIdrz+LPGES7JfffQIjGtIz+Ea8/hsI4OJ8xjpCBXb7g4DFcPTcKIE+nK8ZO
 pXISEKFH698dVIwnPRte56hy3g5Jvchu5lH0ESylaOL+N+/ngt2chauuR7bUhKjjErb3
 VkFA==
X-Gm-Message-State: AOJu0YzGHqni+JpG4b/5q/Je68LrsjVzkd7iMZy2VkVTX3T92oyjcCsS
 pipS11TqCbGn0q39SvdEt56wRg==
X-Google-Smtp-Source: AGHT+IG+VeXWkvAeELLizDA+7nLTk3jWt2nNJh35de6iE9D81R1Xd0fMrSOGt7lIfcCl5vsoBq4pHQ==
X-Received: by 2002:a05:6000:4d2:b0:322:dbe8:e18f with SMTP id
 h18-20020a05600004d200b00322dbe8e18fmr15952672wri.46.1696869976074; 
 Mon, 09 Oct 2023 09:46:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0031912c0ffebsm10119250wrm.23.2023.10.09.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2634E1FFC9;
 Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 17/25] target/ppc: Remove references to gdb_has_xml
Date: Mon,  9 Oct 2023 17:40:56 +0100
Message-Id: <20231009164104.369749-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

GDB has XML support since 6.7 which was released in 2007.
It's time to remove support for old GDB versions without XML support.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230912224107.29669-11-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/gdbstub.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 778ef73bd7..ec5731e5d6 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -54,12 +54,6 @@ static int ppc_gdb_register_len(int n)
     case 0 ... 31:
         /* gprs */
         return sizeof(target_ulong);
-    case 32 ... 63:
-        /* fprs */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return 8;
     case 66:
         /* cr */
     case 69:
@@ -74,12 +68,6 @@ static int ppc_gdb_register_len(int n)
     case 68:
         /* ctr */
         return sizeof(target_ulong);
-    case 70:
-        /* fpscr */
-        if (gdb_has_xml()) {
-            return 0;
-        }
-        return sizeof(target_ulong);
     default:
         return 0;
     }
@@ -132,9 +120,6 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
     if (n < 32) {
         /* gprs */
         gdb_get_regl(buf, env->gpr[n]);
-    } else if (n < 64) {
-        /* fprs */
-        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
     } else {
         switch (n) {
         case 64:
@@ -158,9 +143,6 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
         case 69:
             gdb_get_reg32(buf, cpu_read_xer(env));
             break;
-        case 70:
-            gdb_get_reg32(buf, env->fpscr);
-            break;
         }
     }
     mem_buf = buf->data + buf->len - r;
-- 
2.39.2


