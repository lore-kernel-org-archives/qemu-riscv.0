Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C78C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:23:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYD-0001Uy-2K; Fri, 22 Dec 2023 07:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYB-0001Uh-OO
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:47 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeY9-0005mk-2V
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:22:47 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5cdfed46372so19071a12.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247763; x=1703852563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNKontpfLUZyadIzXzNBnB69eWAYBQx8Z06ZfrYR8/0=;
 b=bHR973U682ixIDlPQ+i/QFa6uoEZHk26LTME1cebpk9GHdutDjWSSPjXXx5XUyEemD
 KsSNGfYmvr803AsYrx++JYaCDwUMwMoe1bVV+Ptu14RxdyilZEbKoHN40VMuJoGLyy9z
 8/FwArjJKjClG1up3P/cTB0FaEi6J5bOyh2KnvMbgB/ripnIYHmHf6tWifxmVuV7DlNP
 yiw5SP4Rvg6gL1mMrrlWT6WPSBcQ/7sfrG6wT0VZEE3noslEADJWEu5dK17RBmdxlxc3
 f9lylD6qiqbzyksitBkA6lkWKCuedYxMK2I6y6sNzRwJbesGN6XmS3P7+OOsrPtugw3T
 pXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247764; x=1703852564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNKontpfLUZyadIzXzNBnB69eWAYBQx8Z06ZfrYR8/0=;
 b=awJmddIN5FtdprcvZBHcN4fhzCBMi4388TVu9gl4HdQNaCPi0IY3R9LB8DYMYoYUJr
 oA7mpydeXwct08L1eBqyTPXehcZKAMLFTwk4wgA17vochFh2aB0lbdx3EsJCKXE/wHl1
 H7ebs99L1XhMAsxznuDTQjvSoKLsUsLVaJFDSpQEvCe7royTB/WIi7vjcNCB46DbMcNR
 DE+G7MRhntu+iZBV4aQZHsaCB6ahWTdz4mBLHhAhp48rRze/8LSqxP2NczdHEwwnLBBe
 lkzkC24eM0gE3Kn9qIqhrxJvO1Wj9q1jqyBSIHuZ6diyyz4MqdIoRkCLtFl/4ziUS4VS
 bg4w==
X-Gm-Message-State: AOJu0Ywv87uth3Z12vW4lEZf8SFpT9Ro30MjH9v9Au9HSV1WhHh6gLiy
 DbLXONTCYV/akEkeHFO6KqqiRWy39ix/YQ==
X-Google-Smtp-Source: AGHT+IGVsM/Li3YD6MuFO/G8cE7Px9qU45nHLuk38M8cY1Zc+0fHGtcYFu6e3WJKguSMrsMhEDoWSA==
X-Received: by 2002:a05:6a20:78a1:b0:194:b3af:8674 with SMTP id
 d33-20020a056a2078a100b00194b3af8674mr1122908pzg.10.1703247763704; 
 Fri, 22 Dec 2023 04:22:43 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:22:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/16] target/riscv/cpu_cfg.h: remove user_spec and
 bext_spec
Date: Fri, 22 Dec 2023 09:22:20 -0300
Message-ID: <20231222122235.545235-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
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

They aren't being used.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_cfg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..c67a8731d3 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -136,8 +136,6 @@ struct RISCVCPUConfig {
 
     uint32_t pmu_mask;
     char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
-- 
2.43.0


