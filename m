Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201ABC3600B
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 13:03:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1txmt3-0007W3-0I; Thu, 27 Mar 2025 09:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1txmt1-0007VX-US
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 09:03:07 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1txmsz-0001xj-Jj
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 09:03:07 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-223fd89d036so20442075ad.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Mar 2025 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743080583; x=1743685383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QhUmyCnCJH47I6FdFjUF7qnokOxyiOlkbqeZeFnvYxM=;
 b=afXDkuvb7moy+HS7N9hMvb+m/gGLFVkL34q5xaTCQaNs9HXj1MihujxWRJdhSdjVBH
 IunByAk3vqxqbeHlaDNwacFkbi5yBT4AgPp0vg78JWHNOn02JcJ9jYz3o35BwfjHlPw8
 ba5rdT3jiNbIQ9HXwJQ5XsjdrJq1OAbPESG40P2D+rQvaIlL66xzJNYFlbfnv49Gx8gi
 5bj7UkE+B0hzZ0U3d9n9eduOJLamqvCtqbYodypNwSIQ/6xnIY/5M3zStCKtWPBAbI9O
 ej58/1EeDWV0VGlrYEMg7U347eQMeA5v9NtcfkrgfJLfL7Tpmvw6EUKg414NS5Q886n+
 rxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743080583; x=1743685383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhUmyCnCJH47I6FdFjUF7qnokOxyiOlkbqeZeFnvYxM=;
 b=sV7PrpmSSyrNOzCuBgCGb5QaClf+ijyc8ErxNYnd7Y2y+GARkcv/gx5tONNl4ixnYZ
 +b3SXYMgD7vs7pyjZo+Ovp91PyrmdDIDy4hv1A6BGZf0RyFdu+keaAQAwV/GyLM4bYEC
 pPwQ7WTpC4Ba4nJLC0EtzW4ut1QYKCjmF+ULcwsGD8fqxxjjj3CA4tFB8eZDB6aoQ4me
 gIOvZi4tqgO1mxcvgVxpGfVb2wrCELt0DR84vQZ2a5+349dldlmIJ5cUjveWJXPpP08M
 soyB5QG0kD0POnbtFjAn4fX0mqjWCxLQ8zxizPaXD5xALBnNdNijQRjIsl/drdKgJEPb
 W8yw==
X-Gm-Message-State: AOJu0YwqxOlzAApMNP5nVfcGKHdVtOUpP9ZV2ROtkzYSIUEgQCfSXrZT
 fTNQ1058beU1NVaDO4gPEQoeHKPjVshmKTgXx4Bt5gqDL57raz9H+vLMNP0p+VQ=
X-Gm-Gg: ASbGncv6RVjBLE8xeQ7IB6ooQ7Qz+CSZCtgRPVwyRmRDwG8mmio9Y4B5jmRqQnGZoXT
 ZbJ77NLwQNFnYAzecGyaCHAaItbxwKyPmOl0WKIpDifpoG/QALPiiszgrftTNKIjYsrvJ0MMeup
 TRsTbF9ULhTYVE4qPEz1f0thYBV3eq9gLxxod2SHnv1Hcc/B4v04qDCgYCS4SOS3jikZSV5EpTi
 Pu16XrT2G7eUIXNmQi5DUpGxokW6TXUKivGZTbr6Hqq4IBcgsz0uhBCeCqmSXLObOJCemvWSZ+m
 BWyJSHKNPWlzDtxHyiQI7aOUd7NlaDorLLw0OgvlnzGfsmMtE9LqLTvCBqes6CtMAHDgwZ2kRfD
 j6dv2oNcjhVSurJHT98hRZw2Q7F72T+hOHQ==
X-Google-Smtp-Source: AGHT+IFSaBar3pl65ES5L8QcW7meBKWZz2rUipMMTldGWW48KYx6BCANTEmqEh4ZD1BOKYSTR3h5XQ==
X-Received: by 2002:a05:6a21:99a1:b0:1f5:79c4:5da2 with SMTP id
 adf61e73a8af0-1fea2f4bd97mr7210398637.31.1743080582259; 
 Thu, 27 Mar 2025 06:03:02 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-189.dial-up.telesp.net.br. [201.69.66.189])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a2805e0esm12654038a12.29.2025.03.27.06.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 06:03:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.1] hw/riscv: do not mark any machine as default
Date: Thu, 27 Mar 2025 10:02:56 -0300
Message-ID: <20250327130256.653357-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Commit 5b4beba124 ("RISC-V Spike Machines") added the Spike machine and
made it default for qemu-system-riscv32/64. It was the first RISC-V
machine added in QEMU so setting it as default was sensible.

Today we have 7 risc64 and 6 riscv32 machines and having 'spike' as
default machine is not intuitive. For example, [1] is a bug that was
opened with the 'virt' board in mind, but given that the user didn't
pass a '-machine' option, the user was using 'spike' without knowing.

The QEMU archs that defines a default machine usually defines it as the
most used machine, e.g. PowerPC uses 'pseries' as default. So in theory
we could change the default to the 'virt' machine, but that would make
existing command lines that don't specify a machine option to act
weird: they would silently use 'virt' instead of 'spike'.

Being explicit in the command line is desirable when we have a handful
of boards available, so remove the default machine setting from RISC-V
and make it obligatory to specify the board.

After this patch we'll throw an error if no machine is specified:

$ ./build/qemu-system-riscv64 --nographic qemu-system-riscv64: No
machine specified, and there is no default Use -machine help to list
supported machines

'spike' users that aren't specifying their machines in the command line
will be impacted and will need to add '-M spike' in their scripts.

[1] https://gitlab.com/qemu-project/qemu/-/issues/2467

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 74a20016f1..ba88d3a07b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -349,7 +349,6 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "RISC-V Spike board";
     mc->init = spike_board_init;
     mc->max_cpus = SPIKE_CPUS_MAX;
-    mc->is_default = true;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.48.1


