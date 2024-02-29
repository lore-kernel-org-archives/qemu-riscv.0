Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1652AC54E49
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 18:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfkoL-0004Iv-VA; Thu, 29 Feb 2024 13:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rfkoF-0004Fj-KI
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 13:07:09 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rfkoC-00007v-4z
 for qemu-riscv@nongnu.org; Thu, 29 Feb 2024 13:07:07 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so399437466b.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Feb 2024 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1709230020; x=1709834820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ispNcME3Fnv2/NODn686pnGKi1e4GIPoFAIakhezmas=;
 b=OvD9aotzr1TPq1Mb4+qhtArlzoTxAYry7mqjRAK23J+lCyNKF9ER/6HnegDSVxNtNq
 eUwA5vTNECRxJzJPxYoVd1kSxN5AOG4OGp4uNNu4pSfB5Iprccc/uT/3Azqa5J2qcgve
 gxCy8jjQ2U/3ofEHAHPb16OvW7lwE2UTEVKR0tWELmviqlYWPSlN4wLJsMZ0+5iRF1g3
 XQJ7G3pZujMoAmxFeZaaGLP3631D2f9nEP4eodHlSXT4UCKtaCOaHf4dp+BIncf7zs9n
 0N0cyDx6/Zr2mGTQ/7k1rCAV9q7t0yUXiBThQ78NeO9qzHjyTPHdFzVHfedAfMwD6Jcy
 ++PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709230020; x=1709834820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ispNcME3Fnv2/NODn686pnGKi1e4GIPoFAIakhezmas=;
 b=Fo6RIks+tdlOV7gG/M/jCaIfPMmF9hX6Stl9jxLImOTLf8JDPisX6Eq5DZUx0V5sIp
 taWX0t6W3qEjiTkYnH3J4qTMhVUlAx0YOhxKzMuKLQIY9VpM9cWFEeyKea6sxX6syOSo
 ezO4C3s2429ipNyl/8phO5rLBLOiOm565VK3TgVHmhR1swSrg9c7Ws3wUnrsbQwt05z/
 tZTE/suTbS5T0sD5/g64DwTI98Gd9nuO7q0HCSXV5vx4MmrGqu05sSn3oDnJRf+62pii
 dDpf29NbyZOFAgJtHjpScxvEI8/fMlguCENVEsIqxQ7rpN/MKuJEg2327Qzx3Goeu7ZG
 RTgw==
X-Gm-Message-State: AOJu0Yw/6WlMHlMtLky7s2M0b+/a00ikRGh4l1Stm4ngY/zBIvw9GTJO
 5Z4uXCyx9yJMWxbGi+8UXOdmKfXXYSxFRA64jrLjfNXr0Ly8VObfXeK7hRnIGPNOG1S2gW8ADPF
 L
X-Google-Smtp-Source: AGHT+IEVTP1g8jGgKIH9oo9BrfMBuradbNfPamLEAH9WuH4JFNPzbaL49A+ddj4nyCbw7E9UXKXXlg==
X-Received: by 2002:a17:906:a417:b0:a43:f924:d65 with SMTP id
 l23-20020a170906a41700b00a43f9240d65mr1810605ejz.26.1709230020287; 
 Thu, 29 Feb 2024 10:07:00 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 ss18-20020a170907039200b00a44230eafdfsm911960ejb.83.2024.02.29.10.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 10:06:59 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tests: riscv64: Use 'zfa' instead of 'Zfa'
Date: Thu, 29 Feb 2024 19:06:56 +0100
Message-ID: <20240229180656.1208881-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Running test-fcvtmod triggers the following deprecation warning:
  warning: CPU property 'Zfa' is deprecated. Please use 'zfa' instead
Let's fix that.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 tests/tcg/riscv64/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index a7e390c384..4da5b9a3b3 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -17,4 +17,4 @@ run-test-aes: QEMU_OPTS += -cpu rv64,zk=on
 TESTS += test-fcvtmod
 test-fcvtmod: CFLAGS += -march=rv64imafdc
 test-fcvtmod: LDFLAGS += -static
-run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,Zfa=true
+run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,zfa=true
-- 
2.43.2


