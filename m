Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615E7D0E6C4
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqh6-0003cl-Rp; Tue, 25 Nov 2025 05:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqh1-0003TI-Iu
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:54:43 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqgy-0001Ob-27
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:54:43 -0500
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-42b2dc17965so5060843f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068076; x=1764672876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jfyijvl1JFPahxbivQxrrAGa5h/+4fXCl7qTUyuB64s=;
 b=Z2ytID3XEq5wrX9W0qoX5GTwR2C6BSaLNfgqhgGdUpVH3vOnSlVUYQcGMQKjVvgzPn
 ntvCYByGSyZYHyYZXm3SMbrGtXzfn7RIDFUHW4m+6GL6HXKExthNv8cMeQO6aC2EpVxR
 8nWWIQ1627aEQJVc6d2migzMwN5a+Uh9vCEZllCm+pCqXYFjEKZrU2esVDs49rVWlN+l
 FcMJrZOlANNZfnIWyLyr98r1SamYM2dYMi0QI/7BChOTdVM8vjhXnL2ukDY7tUTbUyrj
 WQRVnqXSP6rXHPy5NLJcsBhysJLfi0zMzEF8KZrGBR62JTnGXNcRJ1CS4PYBWjfHRPc/
 TKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068076; x=1764672876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jfyijvl1JFPahxbivQxrrAGa5h/+4fXCl7qTUyuB64s=;
 b=XlT3Kt39/lqbeGyL/TdhomTNvLk6fYMXOu55vSP7g+VwxtAGRotTn+cWHUoNMdjtPT
 p0kngk2E2euyFl/FhfgQb5U4gcFRQwpYsal5SlLU33WLjssB25H/GoRqWl6qN12Rt66L
 mZd69pAjVhqPWiPzSunKtlAHh4mQlRH8/zPuqCr7bLJvyBYyA+FRVMzp6RpCwmsu0NUo
 3Y7CvuvD1px6KQxYvDfIklK6IohmasvpXqjSGtHaTbxubKKQ/9svIO9+Db3snxEDU8t+
 GzAaR2XoaFkN4RO6G2TCxsRhOPQXmal5K917L6p/e6ad3PpPdcLicdrerKfusxwv9vln
 1rHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+TmZhwpzLNMK+BuRoVlhR40O2vGm8PpE53ydOOSBH9AJiqN4K8oVwAEjpOy/7u6I3XGGZnV14aMp+@nongnu.org
X-Gm-Message-State: AOJu0Yyb0ETMaJBiv96MavQd97HHAZthaWBxHE2BjJoHr1j+eoShoghC
 pFMhWBb4a2JCc/yEpYw5qQeOhM5rbNDLWQDr45bmH3y8zebZLEI3jMwZL1CIE4urHDN5x0zEIr+
 TOf9dFeGyILOg
X-Gm-Gg: ASbGncvZPkD1tS54LsoHDA+q56D5jJSMWlZMbXnVE/eTmp6znP1h4cdiBin6AwYjCcd
 rGAeK+nt+9iJmg9JVuR80IG7GiXjWtyQ0wpD9EDvxGrpHdpyG3wurfZd1kTi8y5JTOJfVpjZ35T
 k7RseF0HMVZBB0FTB4A4Hsn0/UOAQFSfXrJsbMyCji5EGYSrVFRaubiByI7j2zy/SYg6/uVSoGN
 36xrYQjvmrvZCDBgZin7JD07jXs6mUEB4hpOlCtNtVqtuIQFoO57UmAdfpJJtjX9EQbDfg5cZJL
 gmIbDw3JTt1F1el1xUJFmhVnHMr1SxCIa3OFCURrkQsiEb0sXfxAU219yCbtxy4ISbAtVUTLd7N
 V6pF/Kzh/N82R0RZXCR+1tCSg+JxBWAgAj8HSoUU58RpyVfmcL6pLD/mwMWdVUuZdS9RP6x6Bp+
 8N/ZOYW/g78BGwytzM4udwfk75A8M4cfDdlNFJxFJje0E9CVyjc8kzjQbWvv3l
X-Google-Smtp-Source: AGHT+IERb9JX2msGUhosBK7KYnxgaVzJeCNqY8/qwfS0VTZe5M/yJxvfuGH+GR0rR4EcCKGJXvCyMA==
X-Received: by 2002:a05:6000:22ca:b0:42b:30a6:9c10 with SMTP id
 ffacd0b85a97d-42cc1d22e12mr16261013f8f.56.1764068076531; 
 Tue, 25 Nov 2025 02:54:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8a29sm34188178f8f.30.2025.11.25.02.54.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Nov 2025 02:54:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.0 00/12] accel/tcg: Remove most MO_TE uses in
 cpu_ld/st_data()
Date: Tue, 25 Nov 2025 11:54:21 +0100
Message-ID: <20251125105434.92355-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x441.google.com
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

Still trying to remove MO_TE uses, here looking at cpu_ld/st_data()
in fixed-endianness targets.

Series split of bigger one [*] where Richard made a comment on
*_code() patches. Since not related to *_data() uses, post separetely
since almost ready (still few PPC/MIPS paths to update, but I'd rather
check if this is heading in the correct direction before looking at
them).

[*] https://lore.kernel.org/qemu-devel/20251121134503.30914-1-philmd@linaro.org/

Philippe Mathieu-Daudé (12):
  target/hexagon: Use little-endian variant of cpu_ld/st_data*()
  target/tricore: Use little-endian variant of cpu_ld/st_data*()
  target/rx: Use little-endian variant of cpu_ld/st_data*()
  target/m68k: Use little-endian variant of cpu_ld/st_data*()
  target/s390x: Use little-endian variant of cpu_ld/st_data*()
  target/sparc: Use little-endian variant of cpu_ld/st_data*()
  target/i386: Use little-endian variant of cpu_ld/st_data*()
  target/hppa: Use little-endian variant of cpu_ld/st_data*()
  target/riscv: Use little-endian variant of cpu_ld/st_data*() for
    vector
  target/sh4: Replace cpu_stl_data() by explicit endianness variants
  target/mips: Use big-endian variant of cpu_ld/st_data*() for MSA
  accel/tcg: Remove non-explicit endian cpu_ld/st*_data*() helpers

 include/accel/tcg/cpu-ldst.h         |  46 --------
 target/hexagon/macros.h              |   6 +-
 target/i386/ops_sse.h                |  12 +--
 target/i386/tcg/seg_helper.h         |  12 +--
 linux-user/vm86.c                    |   4 +-
 target/hexagon/op_helper.c           |   6 +-
 target/hppa/op_helper.c              |  44 ++++----
 target/i386/tcg/mem_helper.c         |   8 +-
 target/i386/tcg/mpx_helper.c         |  28 ++---
 target/i386/tcg/seg_helper.c         |  16 +--
 target/i386/tcg/system/excp_helper.c |   8 +-
 target/i386/tcg/system/svm_helper.c  |  48 ++++-----
 target/m68k/fpu_helper.c             |  12 +--
 target/m68k/op_helper.c              |  88 ++++++++--------
 target/mips/tcg/msa_helper.c         |  51 +++++----
 target/riscv/vector_helper.c         |  12 +--
 target/rx/helper.c                   |  14 +--
 target/rx/op_helper.c                |   6 +-
 target/s390x/tcg/mem_helper.c        |  48 ++++-----
 target/s390x/tcg/vec_helper.c        |   8 +-
 target/sh4/op_helper.c               |   6 +-
 target/sparc/ldst_helper.c           |   6 +-
 target/tricore/op_helper.c           | 152 +++++++++++++--------------
 23 files changed, 305 insertions(+), 336 deletions(-)

-- 
2.51.0


