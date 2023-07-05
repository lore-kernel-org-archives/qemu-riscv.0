Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDFEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 13:33:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH2cl-0006Te-RO; Wed, 05 Jul 2023 09:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cX-0006OT-Eu
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cV-00024Y-I5
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:37 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-992b27e1c55so779793866b.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563953; x=1691155953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTQw0+m/TSUjm/E7y2FkWg7UcKy3q1iulYca/mbmODQ=;
 b=mgXBbAvoJ1d/4T84vYM7w9ALmPodsi78fAF8trS6HASjpjd+vvCvsUg98x6nHSmT5a
 l8GiM+pS/kcyjazWKzCtIuwBkHK/6u4cpLELSBpdkmbDPcFeCanwpP5tMRaqxnf2gnhX
 XQ1pvvnkgC6mQ8U2wXVw6qvikeSI4Tm+pi+2aQQywp6no31K+q0Kknyud979R+hE2b24
 3xzJwbDquUDpIKKOebKsq4m6tWfG+UIFe5OTOzu1lnWt6fYoNxEXyg3prBYoFFpCvlfQ
 L38QIEQG/soeqypPOegcF1GlJ6HplJG2FalbawsxvzqZKwsIn03dEBFm+8Xn+a0Apau5
 owgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563953; x=1691155953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTQw0+m/TSUjm/E7y2FkWg7UcKy3q1iulYca/mbmODQ=;
 b=NMYJHKHMywwUvYut0vBrlEe/4SUJj27Dpp3MkCtSdvppbUP4NRkKr/p4T2cMOL6rqy
 hcs5BDAsjMEtzUEQ5yqGZ7NTEFzdMK2y9EmpCizIwz3U9C61tVK6vevcfBqPUDB//QUd
 dcwIfNMkCJHMEBG0y7QTDGXUs8DzRPwuvUtYcVBFz5UPZkqD9vius1+lECJRu25+ts5/
 MstgzvHOKMsBlQbsIIPS3goWfVCByTsz/SD23KuxnuqVABnQW/l3wNabVuRNLHzlb0db
 LyKRPyUs9ojMnkCfvy/CQ7N19OZcnX8lsAuah9EWZSHxuKFsTBLb0x+JzaxzLLMaqACr
 L0OA==
X-Gm-Message-State: ABy/qLbfLMJu+bEVTGa8dXcASTx8zoolInxpZ799AZjIFLLTvb7ZlLeJ
 VC0uL+3LGe4QuDNWiEZYBhyGSQ==
X-Google-Smtp-Source: APBJJlGqAdiV8A5xSfVdO6bx22twXoTcD3psqTpayoqOL9g/5EDDLn8iFch/1nZNLsBwohMjLTnPYw==
X-Received: by 2002:a17:906:c408:b0:991:caa8:fc3a with SMTP id
 u8-20020a170906c40800b00991caa8fc3amr10944746ejz.72.1688563953770; 
 Wed, 05 Jul 2023 06:32:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a1709065e1100b00991481e7c53sm12507910eju.206.2023.07.05.06.32.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] chardev/char-fe: Document FEWatchFunc typedef
Date: Wed,  5 Jul 2023 15:31:38 +0200
Message-Id: <20230705133139.54419-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/chardev/char-fe.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 309960046a..ec3f706a14 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -175,6 +175,20 @@ void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 
+/**
+ * FEWatchFunc: a #GSourceFunc called when any conditions requested by
+ *              qemu_chr_fe_add_watch() is satisfied.
+ * @do_not_use: depending on the underlying chardev, a GIOChannel or a
+ *              QIOChannel. DO NOT USE!
+ * @cond: bitwise combination of conditions watched and satisfied
+ *              before calling this callback.
+ * @data: user data passed at creation to qemu_chr_fe_add_watch(). Can
+ *              be NULL.
+ *
+ * Returns: G_SOURCE_REMOVE if the GSource should be removed from the
+ *              main loop, or G_SOURCE_CONTINUE to leave the GSource in
+ *              the main loop.
+ */
 typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *data);
 
 /**
-- 
2.38.1


