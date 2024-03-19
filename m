Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD5CD11BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 15:51:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmbf3-0002sG-5p; Tue, 19 Mar 2024 11:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeY-0001a7-Dh
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeC-0005SP-RU
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 11:45:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso23541955e9.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863102; x=1711467902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJDlH3IcOyAIPXzpINjBXtBvgS8Gcx3JXjLnmPdWxeM=;
 b=hE8RTnq/ClWfhEVo2r5OHgqY/W+Lzq0pFD1B5JiE+JHTY5eNm+rck4WAceJlLf8/Yd
 D5E1RZ1SJNYM2njYFVnxWrirMCEUWRi8iunskkIYV2x9bXTkiCCtmvShuE4jvxcIRr+B
 Y5NPki0V+jrDim93T1ARAs2um1ZirzW7mUDgK2EcB7PzqeloLvMRqsw5+PuKHq2zMmh2
 ILHuNz27tvpLZ4YmVrvDMQ79FkvbiOCyJ+NRJ04jy9x3W1NEbRznPpEvCkRW3T7jUbMc
 WpWWFyYtwpjhS0Svxa0Yl1ZGps1lMj0nKfdATI1Pi4nwdxUryvtF5MFeHo4TgZE9gJf5
 G31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863102; x=1711467902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJDlH3IcOyAIPXzpINjBXtBvgS8Gcx3JXjLnmPdWxeM=;
 b=m6kb+Xcqn6jv7y9Ztaj9blMPfpMNV4p9Wpi0aeEDssW71Qfa8ppSo7n3Z9X8np/70p
 8Sh4QtyPU78A9ZBScJQyx9EbsR/mf7wq7S0LbVR1EHgQb3kALnzEyK/0iDM131BD9Tmu
 IZ7HKAXaL8leAcrDywBXomo0SRvBycFiBmqtebmN2UY/onXvrgWBaaLVvmk6A0F3+AJd
 sjB51mZmDbiahfFwk0JibRMY6auUlCMWNw4GX33zGzuTsBAOFQUUer/FBCcMYcRvuwYY
 0NLw62XE3cqjt2K31HRpBRiDAjZN74Slw1Yo+ix2mEB+JffQap9OfJk+OjYtJTY/p1x0
 ACsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzfTm+BVIt718YyAaSO+QSvO4bhggCOk9keQjsgwzHQ/n2IP1Adz9A5AMkA8TUrVdwDeUdqDJ704uJdrFOFVEG7fqeORw=
X-Gm-Message-State: AOJu0YzL6hlA0+mjexKQt9PIRVjDAMFwQHljBX8KrjeKufuIgfQrMEMo
 5g9DihlIWLqlQR91TPwNKa/jJKnSG5+Za9btGLvKgErzEHjAvb60yl31ZgM/WwA=
X-Google-Smtp-Source: AGHT+IGwQrOEEKFq39kvMb2rUEIJJbIzrkejECZTx4zU2qkt2Jf2TBS5atBbo3GFJHP+7teutPYluA==
X-Received: by 2002:a05:600c:3503:b0:412:c285:1091 with SMTP id
 h3-20020a05600c350300b00412c2851091mr2952541wmq.7.1710863102010; 
 Tue, 19 Mar 2024 08:45:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 fl6-20020a05600c0b8600b00414692977c3sm426238wmb.14.2024.03.19.08.45.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH-for-9.1 21/27] target/s390x: Restrict TCG-specific declarations
Date: Tue, 19 Mar 2024 16:42:50 +0100
Message-ID: <20240319154258.71206-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
 target/s390x/s390x-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 825252d728..559c9f561d 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -398,10 +398,12 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3,
 
 
 /* translate.c */
+#ifdef CONFIG_TCG
 void s390x_translate_init(void);
 void s390x_restore_state_to_opc(CPUState *cs,
                                 const TranslationBlock *tb,
                                 const uint64_t *data);
+#endif /* CONFIG_TCG */
 
 /* sigp.c */
 int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);
-- 
2.41.0


