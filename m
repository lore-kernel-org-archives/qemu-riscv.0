Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CA8C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnCJ-0008Bo-Bi; Fri, 19 Jan 2024 06:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnC6-0007qo-Sy
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnC4-0003Br-0H
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:37:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so6791265e9.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664270; x=1706269070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nr4OUHS+lBPFXd43ccavf7bhITrAw62IpLJRw1qHBNM=;
 b=rN+smCISHU8mn4jfzBBQCtnZWDkmz+dy+rKhFkNdItQpLzJQhUAr2bBnqbKVGA5GMP
 3HgEoiMFEJ0Cqe5a9BINjCfA2aqnP0ELGMvhUyqpcmhvo9WDDdGxTdk2jv8HhfCh6V1V
 7Voe2KLE4cmdItrzWk0QPENVbzdmIDWu/+kg8XigSFSZIK+AVEgSnp2D+k/KAEkD6S5V
 lGwEUBqdT3850r23JoXY9B4lUjVLxpZ9XBzS2xvkQk+t2+lSwDaE36AYEVcm8bnl3ruz
 g1X7FG0PIeEGI4M1H/cejHwM4nXFclqMZLdPiBJ4zFpSbh2nsYP54HLS1WSqtf1C+JV7
 PEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664270; x=1706269070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nr4OUHS+lBPFXd43ccavf7bhITrAw62IpLJRw1qHBNM=;
 b=cGvPEnAjFVDrgOf7gTgQXh1p6mhYHZ3/JRq1lqLa2Di4ut0nGpGrRgVt0vLGh02Ebe
 Vrta3H7MY7veoyH+YgjviIVCKLjck2DN/n8mgHIbglaa1xkKQBaGEt6zUS1bBAHXbfva
 b3ROK5Hs+yWWjLI8i8AcLNJIJ90nzJiNM3H+nSyH36QAPW8AilJolGMAmXDOL5+USIlE
 5HgE6CRdSBX2U/stkwTUZS4lqklQ3p3LbEzqoIM8XEItoHXEqoJqj1zKi0DDEgkSuTdQ
 PqNPbMk8SGQUa/PKtfWL21/s4pSZMex8gEkCEedtYd2Ex+OCB5+dEO+r8iAR6oA8vpMk
 73gg==
X-Gm-Message-State: AOJu0YwYZuIp1LEJyh2xRejMYFVekMn/5L1kb8hyA3YFyPdUXIZ6suRl
 wGRsaYUw38Bo4kr6Fgn4iDXtAEFckBJn40HSN+kz28GV/mfcbUo94gUUkynR77Q=
X-Google-Smtp-Source: AGHT+IFyTbs9SjNe0bzDqWuc52RujTUb9c4usvahIXvdRm1GAXWN+0NECvsNYTHwwL2fqfD9VRtwkQ==
X-Received: by 2002:a7b:cc88:0:b0:40e:6207:2ecf with SMTP id
 p8-20020a7bcc88000000b0040e62072ecfmr1314432wma.10.1705664270639; 
 Fri, 19 Jan 2024 03:37:50 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 hg14-20020a05600c538e00b0040e5cf9a6c7sm29076314wmb.13.2024.01.19.03.37.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 36/36] configure: Add linux header compile support for LoongArch
Date: Fri, 19 Jan 2024 12:35:05 +0100
Message-ID: <20240119113507.31951-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Bibo Mao <maobibo@loongson.cn>

When compiling qemu with system KVM mode for LoongArch, header files
in directory linux-headers/asm-loongarch should be used firstly.
Otherwise it fails to find kvm.h on system with old glibc, since
latest kernel header files are not installed.

This patch adds linux_arch definition for LoongArch system so that
header files in directory linux-headers/asm-loongarch can be included.

Fixes: 714b03c125 ("target/loongarch: Add loongarch kvm into meson build")
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240116013952.264474-1-maobibo@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 21ab9a64e9..3d8e24ae01 100755
--- a/configure
+++ b/configure
@@ -445,6 +445,7 @@ case "$cpu" in
   loongarch*)
     cpu=loongarch64
     host_arch=loongarch64
+    linux_arch=loongarch
     ;;
 
   mips64*)
-- 
2.41.0


