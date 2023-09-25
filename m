Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A4CE7A97
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3L-0000Da-EZ; Mon, 25 Sep 2023 10:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn35-0008KN-6f
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2q-0002D9-Q9
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-405524e6769so26305805e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653922; x=1696258722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAyYQkrKbWdgjPeSFpAKf8LHOxPMb7ttiO+d+H3EETQ=;
 b=eRiMNCprFqO+yGRM9oCTiA6Y0gwO4jqNb9dDsE33sA3iQFEIFTtvIUJYpYntOgaWXI
 1ou0z6vyjLg4xYJj5rhzA0oCbCLvu1xmyJ7jH3L8DnrreZKVPe+9vP4VttZthz9gz3Oz
 CXsOL31lp/vEdZtQelIC4q2LRmsfP+xC56w/HsvqhM2xLXlbsl/gbkNhMOzW1RpWb7n8
 FQdYPfdLoOMHlaiviU04i3ZgJ74Andxm+QmRYvaLNVBcVPrmmnH8sVyqRscRcZu9DokJ
 UixhJvqs/E4KTi8f3BioxfE3fk2GFp9hEJZv55+VxlxMD5Jo93v2LB2ofKulLk+Ff5rZ
 KkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653922; x=1696258722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAyYQkrKbWdgjPeSFpAKf8LHOxPMb7ttiO+d+H3EETQ=;
 b=BOAnS7ZhJ0QZHGYqDkw5l/P0Q7Mrj75WAgLWoaEoN2K6NxS3ahg17ikKWXaak1P7X0
 N07Ww0bUfZLz3HgvLcKrPmWbAkj53NUJn6PnXiXuaJ+CdclnuirkE7O3af1waE3yXnwM
 9J3EJwosP7ghSHMxfznxN0CdCarW6MVZRkLi7BuSbgQDXuFK2iMTb+VMw7cbnOKoHkht
 laA8xaUr/SgsEM1n70Q6x2xJxS7yQLexGyFXpCT8U9I4TdvB6D4Go4tdRFUXKsu+umgs
 9oQM6cuyfh41YFK7I40wxeuCf/oYWm36HfDHHrJvKarDr00ZYkfOW8DWaV465o5LM1t6
 5l1Q==
X-Gm-Message-State: AOJu0Ywt5UWfyrVlwpmc9wGaRXigKjgmXESgJTFppiaphmUTa4/AbXR+
 L2Amvm4YbaGiFq06N6FprmcSnw==
X-Google-Smtp-Source: AGHT+IH2XfJb3x0zHxvnBuTaxCCHgYT/tdglQoUrYMFI2CY3Q9o2lM+MyL+r+0MoUc7+RKqmMdKqZA==
X-Received: by 2002:a05:600c:1d8c:b0:405:d70d:1790 with SMTP id
 p12-20020a05600c1d8c00b00405d70d1790mr196064wms.13.1695653922594; 
 Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b00405959469afsm1656915wmi.3.2023.09.25.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:41 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 139401FFCE;
 Mon, 25 Sep 2023 15:48:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 25/31] contrib/plugins: fix coverity warning in lockstep
Date: Mon, 25 Sep 2023 15:48:48 +0100
Message-Id: <20230925144854.1872513-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Coverity complains that e don't check for a truncation when copying in
the path. Bail if we can't copy the whole path into sockaddr.

Fixes: CID 1519045
Fixes: CID 1519046
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 682b11feb2..f0cb8792c6 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -245,6 +245,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 static bool setup_socket(const char *path)
 {
     struct sockaddr_un sockaddr;
+    const gsize pathlen = sizeof(sockaddr.sun_path) - 1;
     int fd;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
@@ -254,7 +255,11 @@ static bool setup_socket(const char *path)
     }
 
     sockaddr.sun_family = AF_UNIX;
-    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+    if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
+        perror("bad path");
+        return false;
+    }
+
     if (bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("bind socket");
         close(fd);
@@ -287,6 +292,7 @@ static bool connect_socket(const char *path)
 {
     int fd;
     struct sockaddr_un sockaddr;
+    const gsize pathlen = sizeof(sockaddr.sun_path) - 1;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (fd < 0) {
@@ -295,7 +301,10 @@ static bool connect_socket(const char *path)
     }
 
     sockaddr.sun_family = AF_UNIX;
-    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+    if (g_strlcpy(sockaddr.sun_path, path, pathlen) >= pathlen) {
+        perror("bad path");
+        return false;
+    }
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
-- 
2.39.2


