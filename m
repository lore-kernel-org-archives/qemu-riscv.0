Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BEC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:00:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0Kq-00083S-OK; Fri, 03 Nov 2023 16:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kp-00082u-8P
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kl-0005KI-J6
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4094301d505so18885285e9.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041598; x=1699646398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPYnsi2vv7vTp2m4L+dzwYGsIeLimoixnt1R7Ke6aYI=;
 b=izFMecW5QboeUK3UzbGTXdwfwocJGjuq9j/8Tv0OM9wEkMzs3apMw00cDyCYmVoO9G
 uqSEWRK1Hn6VwPbl77s/I0DC04oQcFrmgPMXLRgO6T4pDdnb2tJX9HgFHgWq8z5aY7+a
 b43HWXD7Jw56uQsnK+BRd1UHdlH1BDSzyq8BbM9cvhEPHGjoZTw/ODcpKPzMHzyIiObO
 /jVMaf21q9Y7onejH9s8NcfrCnnTz7jChXkz3hYGqXcLpzDGFPZfWjUMlmsL0opzRMCu
 VhSUgObAsyGd9DB+MistL+qjhj6JLRm2g9jkh9R4ScUgVb4qDMAQTs0IFyUKbB4bvMZ6
 5+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041598; x=1699646398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPYnsi2vv7vTp2m4L+dzwYGsIeLimoixnt1R7Ke6aYI=;
 b=bqtzZ5skVFtkJrFr82KWvR9nE4FGvwCNsuDBiZdeUclL3DDSXN6RJUfgSD4vCYwfVx
 lYZxa9efgVZOr4m5wiVZCVW+Z1S3MUtUjWrRQko/YI8zw7N+KQisvx0fC9vOlsqYD2vs
 zArMM/0bs/JY4bgLwGcumIEU3XTbhrcCLzDgn1zdgad0lDRpdINIdXUg8y+GevZC4BAf
 72KrLVL96GZD9GTQd09n/smPLZldmJaoorC02iLK/f9tsmK49Nrqf1D8sM03B6wVQQ7W
 /Ph5FbIaEsZIZxu9JFwvBbsky9MFYiVekGf14Z0gZsV5M0Mgq+N7NEfQfuhnW2z4s1c6
 Nzzw==
X-Gm-Message-State: AOJu0YwZ5CH68dif3Bvp4AmHc3/RfIop9TuycMz5vRSlnQao1Vxp/RHs
 P27UkMXi2Uf0qfYwIdm6EXEu0Q==
X-Google-Smtp-Source: AGHT+IF0EEeWumzOzRit4pV2GFbrcEQZ5ln2ATNMRp6Ox9N/rjU7pE5YntCIjWgWCe6CerKNSD+v0Q==
X-Received: by 2002:a05:600c:524a:b0:407:8459:2ef9 with SMTP id
 fc10-20020a05600c524a00b0040784592ef9mr19220943wmb.21.1699041597974; 
 Fri, 03 Nov 2023 12:59:57 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b0040775501256sm3595619wmq.16.2023.11.03.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 12:59:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D47F865741;
 Fri,  3 Nov 2023 19:59:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 02/29] gdb-xml: fix duplicate register in arm-neon.xml
Date: Fri,  3 Nov 2023 19:59:29 +0000
Message-Id: <20231103195956.1998255-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdb-xml/arm-neon.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdb-xml/arm-neon.xml b/gdb-xml/arm-neon.xml
index 9dce0a996f..d61f6b8549 100644
--- a/gdb-xml/arm-neon.xml
+++ b/gdb-xml/arm-neon.xml
@@ -76,7 +76,7 @@
   <reg name="q8" bitsize="128" type="neon_q"/>
   <reg name="q9" bitsize="128" type="neon_q"/>
   <reg name="q10" bitsize="128" type="neon_q"/>
-  <reg name="q10" bitsize="128" type="neon_q"/>
+  <reg name="q11" bitsize="128" type="neon_q"/>
   <reg name="q12" bitsize="128" type="neon_q"/>
   <reg name="q13" bitsize="128" type="neon_q"/>
   <reg name="q14" bitsize="128" type="neon_q"/>
-- 
2.39.2


