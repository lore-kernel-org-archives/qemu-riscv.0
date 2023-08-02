Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C02C41513
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qR7Y7-00013K-PT; Wed, 02 Aug 2023 04:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7Y5-0000iN-Qv
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:41 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7Y3-0000D9-0X
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:41 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a5ac8717c6so5069400b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966178; x=1691570978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UF5S4BAA/eK+ZwqrbbvWnZLqcwv53M7+DITdN+nup4=;
 b=YYYPirH24uWg7w/+2GQEt8PnEr6ndcrCwToWcTIylCL9ZOFMATdIBokhxiHySCpdnN
 u4FKHg02k6fsXM1xvYzyW9kPI4tS8AXV0dw8h37LBZnNzZ5EeHBoIf3YMdXFBcaTMS6r
 tgikHOvTAQFlc52x/SL3B3Ls6SHknMjm9wSkrvJS2oX51+lXJtOMzZ1sAyR92LpSac9a
 wXyh5Bj+rvYyHHW2sH7ZzsrT8gvzb066JznuyiSRGkzFz6WcJDkzgEtGkWEjuv74MTO5
 IVFJGu9tP6PjsjmuQPAtqGmZIPJ7zO7MtZHaOI3D8TzyqYEQLgdmfiVf3W3U217k4US9
 qS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966178; x=1691570978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UF5S4BAA/eK+ZwqrbbvWnZLqcwv53M7+DITdN+nup4=;
 b=ZpeUfyua1gklvi6wA2WUr8Zxd+K5dGWnIbXWsebHOTFJyN5bYdjhJhd/JRZ48mFt8z
 +/3sVCEwYRXeikJBuFIz2rG0o5ou4lUjKhySDb/Y4DJDX+0PJ11USvJmU1fRyFSRSMHl
 12E4jy5z+G0asdfSxDTdEHbOCvYISutBmAGt+R7hhMjbd9K59PTY3ut/e9JfYMF+prgB
 rjL++7FngAHXE3mpUQJfHDo3yO9ZN52Jov3pyNQBmPZHebbYdK8ici105ajyvKZw8poK
 Mz9wLLIUGQDtTIWxFMECDmjNx7PkYrHfleDiubvoU6DmqCSaseiehjOAjhf9Cs6o0nvL
 2QaQ==
X-Gm-Message-State: ABy/qLbcCKYL4T1mmTGM3vSmL8J74xEP2dPenJg/wKmBdn+rTszyh48U
 Jz23H+uGE91hxzLjTtpQL1FWxw==
X-Google-Smtp-Source: APBJJlFrQBDzH2I3mg74KwFQ0Q8QnXZRyBTfiWFR68SVT7RXFCg1IlIPcfLorCZvXM+RBFRLS3jDnQ==
X-Received: by 2002:a05:6808:148e:b0:3a3:613b:2787 with SMTP id
 e14-20020a056808148e00b003a3613b2787mr19582390oiw.32.1690966177903; 
 Wed, 02 Aug 2023 01:49:37 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:49:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 19/24] gdbstub: Hide gdb_has_xml
Date: Wed,  2 Aug 2023 17:46:07 +0900
Message-ID: <20230802084614.23619-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::229;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

gdb_has_xml is no longer referenced by the other components.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h    | 8 ++++++++
 include/exec/gdbstub.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..92f5ce8cbb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -234,4 +234,12 @@ void gdb_breakpoint_remove_all(CPUState *cs);
 int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
                                uint8_t *buf, int len, bool is_write);
 
+/**
+ * gdb_has_xml:
+ * This is an ugly hack to cope with both new and old gdb.
+ * If gdb sends qXfer:features:read then assume we're talking to a newish
+ * gdb that understands target descriptions.
+ */
+extern bool gdb_has_xml;
+
 #endif /* GDBSTUB_INTERNALS_H */
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da4b9173a9..aafbea78ab 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -40,14 +40,6 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
 void gdb_set_stop_cpu(CPUState *cpu);
 
-/**
- * gdb_has_xml:
- * This is an ugly hack to cope with both new and old gdb.
- * If gdb sends qXfer:features:read then assume we're talking to a newish
- * gdb that understands target descriptions.
- */
-extern bool gdb_has_xml;
-
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
 extern const GDBFeature gdb_static_features[];
 
-- 
2.41.0


