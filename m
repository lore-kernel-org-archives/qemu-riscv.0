Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175BCC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:15:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhKK-0006CN-AL; Thu, 31 Aug 2023 09:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFn-0003MG-Hg
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFl-0005br-BS
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:58:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401187f8071so4883255e9.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486708; x=1694091508; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2l3etk60u9ufgIOfv/s6JAhxToUw77UDbpQWhQFU8I=;
 b=Mwo5Z+AsbGQCYpaTW6CftIo1L21sFXa9Xrb3tkMT3yuXCyDAPdeZdc1vQhUobpceBx
 6hk5xLrU4g/wpD1chFcenaIXOB8Us8I8u2iYcYLbmRLNq5OhiRtXiEbM0UGq149bYWc9
 qMjBnH0oAU0qYVOOIN2JvpKvLkQtZ8zfS1fhGP7gVnr9MOe7sjQfH+g5kb8DxAtCjRXh
 3QH0+jUePmRRIac/bh6aRGXyBXTPFiZwxa496CreC69ldKWyXQHt74RsFU/ZlSAON5DJ
 3GYFknVOYpIV5TvC1fZ0ZzNbUP62QTfwBaDIDOskFkhacR9mCicVLg4j43rpwT1gNF19
 BOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486708; x=1694091508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2l3etk60u9ufgIOfv/s6JAhxToUw77UDbpQWhQFU8I=;
 b=CKMfdfJMnis5Q5UtQDdB1R2Lub+Wx+jLPZb4acGZyBpWEUodWZQeNTgFdzhNrAkxNQ
 25zqXCT4nuDiEZE60lD37oEPzyuHhhRrpFlW9aKiuev7nu0T5eZqFEPTVbOrEe2wPV42
 gSRXTcVxPrDemH3DQ2uMwI4JsOFkyUldo2MgSab0hKQI5PgUZbm0dTHaz0asJQuFPMMl
 UXeENCz+UQwagz66CK8+JwGfiHboOvbZ0e6OCyGnsKvCPLXDXOtQoQivgMiMm22Tmwvb
 61B1kD1tREo59hWYx8PIv2deWkDBjYVqzw3ONV9B2jsZvHzDkAKCAv4dl1wSlTdsCNUh
 4mmQ==
X-Gm-Message-State: AOJu0YxG13J8Rd24udfbA/cmSODLjS2QgHs3cqVv6FSc3VIfFEyeugNS
 TXNfxBu3NRxcTIlIJ4a+6EGYRg==
X-Google-Smtp-Source: AGHT+IF+3diPqXGYpQoVNIRjWkycdXC2KgZTSuP9e45nVHMTbCz+nN949o8Tzc5cUdV913L1MjMqpg==
X-Received: by 2002:a05:600c:3591:b0:401:bc03:1aae with SMTP id
 p17-20020a05600c359100b00401bc031aaemr2130849wmq.12.1693486708110; 
 Thu, 31 Aug 2023 05:58:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 hn8-20020a05600ca38800b003fee6e170f9sm1902522wmb.45.2023.08.31.05.58.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/41] qemu/processor: Remove unused 'qemu/atomic.h' header
Date: Thu, 31 Aug 2023 14:56:19 +0200
Message-ID: <20230831125646.67855-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-11-philmd@linaro.org>
---
 include/qemu/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/processor.h b/include/qemu/processor.h
index 8e16c9277d..9f0dcdf28f 100644
--- a/include/qemu/processor.h
+++ b/include/qemu/processor.h
@@ -7,8 +7,6 @@
 #ifndef QEMU_PROCESSOR_H
 #define QEMU_PROCESSOR_H
 
-#include "qemu/atomic.h"
-
 #if defined(__i386__) || defined(__x86_64__)
 # define cpu_relax() asm volatile("rep; nop" ::: "memory")
 
-- 
2.41.0


