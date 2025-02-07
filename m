Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C55DC02194
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQKA-00081M-Uf; Fri, 07 Feb 2025 10:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK7-0007za-SN
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:19 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK5-0003wt-Fp
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:19 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso440527966b.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942274; x=1739547074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um1CwtmhdsQHyRWJ4xWo6y2AlcWR+j1kN7yWOVUF0WM=;
 b=LfD4fPp0TZbBGnBQ0dM6TTBLxRPNHtZOFOf5A8B5oqp8yXlj01MtfW7mXSe91PlpM6
 u6W7s5aiY69tIaAgkneDz7QDHskuxOiieTU4ajNLXPPWpAtcQq4XOg9kEfMVTF4v3IVv
 iiWQEKD4OkyrNZsEmB5w0bquGDjleNaCL5a/CwnADK/+NQ9N7SZCTkRDMvXPmuTrB2pG
 QKH5N4KoLBIKoBdxO9pMhmlk4tOu6UccAjDgGq3yM6PAkjhim6wDHiQ9+cc2/dYqKYPe
 KEyCJB58dB5ZSa23KRyvQJ9eApF4aAKtjvAy/+9/vC3C9iYuSxV6FPqRF4CZNZ5/7a6B
 7udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942274; x=1739547074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Um1CwtmhdsQHyRWJ4xWo6y2AlcWR+j1kN7yWOVUF0WM=;
 b=cRu65rQIWoLRb+3K7P7jt0EF+T8qf1DvW9R+n3viWeFeaTdWBE93P78QPHIr5DzmbN
 oaMFpKxYQUdzrZsYUlaAm8NqL75c7ekG3OASy5p/s0zqRTgAy6bsm2D765Zx1mCcTNKe
 xRAInOsMgFpQLEz0gTTngjHVK2P3WdknoYZp3JtCd8gxvSdpNeN57FjXyPtlcffkXU7I
 uLrXJzYLpnAuzkhkI0m3LFHr+C1ck6uApc9qwLDLON3ul4BUySDqZtehyOs+Jl+VWP3C
 ZjgJQhm4Nk8d9C9WL5xUrCPCB1503kpnKa82Y8EgzMKYP9XQvmugRCWvl+emLYKXssps
 Ku0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbh8M/t/IQ3qNRFnt1YZDovgQaY6/siCgtRwe/Q+BZmArFYjD3LTKBMvYPEy2W8040MPkwJSA+QCv2@nongnu.org
X-Gm-Message-State: AOJu0Ywr75j4D2x0E8o9lPvwXJ3BQ+7/865PzVH0NeUuItklW6eWGw06
 bFkF0kSVA2K8TRSUgvqdqqnpIExfBKKPpMLZJ9cckrYm7Qx2Z01OMFU+GDN1H9k=
X-Gm-Gg: ASbGncusR2r3dAbKOlRuJUXT3jubn1OYMOFn1niPTPeGC1n+dyib2M55Ufoh5z4aPcY
 kBiTtr+ZzF7peKJWEEigU3lhfyC/7Hqq4hlrnzFa7bjaPAeY61NWvc3puEL0uyvoa41Zk0Iz7ml
 PfPHOeWxembPYbAANlF0KhKuDn4X31yzN1Yk4wULPyBjzsLBqCYMZVRwOHEydmklMjzFrfKdkB9
 PCzPJb/LEKM5RNJ9fID/imYZO7aYEZuOVMS4fDgpw29LeqCFZ8Do4hrNBecjxgCQllftlL/lucs
 vJp2TXWyfg3VlETzJA==
X-Google-Smtp-Source: AGHT+IElHjFtPVYJA73ULLa7+KgfPOyHampW28+/996bqIedaJsi9vSXndyF9JnqnF8avBEpNO5jIA==
X-Received: by 2002:a17:907:7b06:b0:ab6:eec6:7cab with SMTP id
 a640c23a62f3a-ab789c3ac8amr448973266b.38.1738942273971; 
 Fri, 07 Feb 2025 07:31:13 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab781453f04sm205306266b.161.2025.02.07.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B6FC05FAD2;
 Fri,  7 Feb 2025 15:31:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 04/17] tests/qtest: simplify qtest_process_inbuf
Date: Fri,  7 Feb 2025 15:30:59 +0000
Message-Id: <20250207153112.3939799-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Don't both creating a GString to temporarily hold our qtest command.
Instead do a simpler g_strndup and use autofree to clean up
afterwards.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 system/qtest.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/system/qtest.c b/system/qtest.c
index e68ed0f2a8..bb1efba9fd 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -763,25 +763,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
     }
 }
 
+/*
+ * Process as much of @inbuf as we can in newline terminated chunks.
+ * Remove the processed commands from @inbuf as we go.
+ */
 static void qtest_process_inbuf(CharBackend *chr, GString *inbuf)
 {
     char *end;
 
     while ((end = strchr(inbuf->str, '\n')) != NULL) {
-        size_t offset;
-        GString *cmd;
-        gchar **words;
-
-        offset = end - inbuf->str;
+        size_t len = end - inbuf->str;
+        g_autofree char *cmd = g_strndup(inbuf->str, len);
+        g_auto(GStrv) words = g_strsplit(cmd, " ", 0);
 
-        cmd = g_string_new_len(inbuf->str, offset);
-        g_string_erase(inbuf, 0, offset + 1);
-
-        words = g_strsplit(cmd->str, " ", 0);
+        g_string_erase(inbuf, 0, len + 1);
         qtest_process_command(chr, words);
-        g_strfreev(words);
-
-        g_string_free(cmd, TRUE);
     }
 }
 
-- 
2.39.5


