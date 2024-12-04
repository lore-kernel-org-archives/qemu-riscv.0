Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC10E7716E
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 12:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIox7-00081R-LQ; Wed, 04 Dec 2024 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIowl-0007zF-PS
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:57:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIowh-0007Zo-J1
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:57:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a90fed23so57325385e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 04:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733317053; x=1733921853;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1FnTMiXuPkhQQ6QNckrBef68BYhMTfBUPg6gnsrR5Ck=;
 b=0ElfBWAUAgE7f9PZhz7G9CWRXGOH+MlN4ADTz0XBtSHRYFymppJV1T7vDU39acTDmc
 kXncucj8WZTKz+IvCCDK48HOO4JmuYDNgjzY20InUxPlmqEkM+2KC3frENQCkX9i3yLc
 y9HxgT/HRH9z3Zxm7bnl5weesHcp0L5tmELBzF844koXrWe1/CudU5od1+hAcHTD7FQF
 tT8sPePT8ZYfhyxXz2X4f/8aPlBJ9sVCJPOsMIbGB5lj9nsFSvwxlfLmOENnbiwzAC5Z
 9LPc8xdD4RT5MgMOhxqEP9Cv5yRcDWmX31+A76UdHjHXyCG9xhynlTwgVLBoYEx5TQza
 J+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733317053; x=1733921853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1FnTMiXuPkhQQ6QNckrBef68BYhMTfBUPg6gnsrR5Ck=;
 b=DERFi9wpu0FMvjie2FraIGwX882xlptMOvXzA80vD5qln3ugxku5OMEE+HS/8yy/50
 WmxGJxMKru0EKLzlyVEpjirvYvcqscJ4zz5yi1SBitH07KVdyNoled3UhS5ZBM/ysNX8
 2WAX3tpKNyexu88jmskg35dXrmgbhY8bz+eL0u1Px6imBv26+z28MT6Hhxga+lqNaree
 n8QZw3BIPB+OPw77xeEtByHDoLLU4/1QQC4cfEf+dub3Var/yKnQYZ7Uz6ckqHVRMBGe
 I2bomzxSEI808y6Ecp2WbxOyBFjqgnJUDUYjfpfg7UIm+f2tM7FuxRK4Ec2zY/aX+z4M
 ymWg==
X-Gm-Message-State: AOJu0YzhaHk1Ul2uKdsFC81EdW5cIiv43cWGyOd8ERo5ZAYXx/BTE78T
 HuyDBAivF4DvtBcOuicJ6PziJQ0z1M1RgClYgkBeRIjTjmfdCzTIPleUahbJfbFi8dq+3qmSECy
 51Ho=
X-Gm-Gg: ASbGncuDPha5tQZMVx30+irLwFWfFcguzIc0oz+nCK7BxGzo4XxkxpdNuT/JktbECet
 g5fpAXAL3kHPxdkCaV6v0EB7DVJsFgutU/dLX602JKcoSXF6Hh1XDrmf9DDryp90OtXyvsGe/Ug
 lK0apsNUbJSoZgBc/7tN6JmZDTCyS0Zi0eRAPqL31J3QaYgToWKCxDMmMRuVyC7QiQEe+f2Clqu
 Ybmo3YtEdZfePsSGAj1SbSYiYEhQh9Z96/iNF9ijJ9Nm6HAqkhDACa9fgsztEL39IQvtKl7swkJ
 N0XGZQ==
X-Google-Smtp-Source: AGHT+IHXkLFcZy8q0ESesZOdwe4vvvKXPZsJb8jBgsIgEB9bwXOOGSqTey68BE/qrv5v89z2J7N7Ug==
X-Received: by 2002:a05:6000:70d:b0:385:e17a:ce6f with SMTP id
 ffacd0b85a97d-385fd3e9d2fmr6051925f8f.24.1733317053279; 
 Wed, 04 Dec 2024 04:57:33 -0800 (PST)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com ([137.59.223.84])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385deeb6acdsm15826428f8f.81.2024.12.04.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 04:57:33 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 tech-control-transfer-records@lists.riscv.org, jason.chien@sifive.com,
 frank.chang@sifive.com, richard.henderson@linaro.org
Subject: [PATCH v4 1/7] target/riscv: Remove obsolete sfence.vm instruction
Date: Wed,  4 Dec 2024 17:56:39 +0500
Message-Id: <20241204-b4-ctr_upstream_v3-v4-1-d3ce6bef9432@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204-b4-ctr_upstream_v3-v4-0-d3ce6bef9432@rivosinc.com>
References: <20241204-b4-ctr_upstream_v3-v4-0-d3ce6bef9432@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/insn32.decode                     | 1 -
 target/riscv/insn_trans/trans_privileged.c.inc | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e9139ec1b9cfdb2dc5029dd28430933a2b4e1442..a2b4c0ddd47ad9464b4b180fb19e6a3b64dbe4e5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -119,7 +119,6 @@ sret        0001000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
-sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index ecd3b8b2c9e6c698f63c9bd3b3e5758426fcfe63..0bdfa9a0ed3313223ce9032fb24484c3887cddf9 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -127,8 +127,3 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 #endif
     return false;
 }
-
-static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
-{
-    return false;
-}

-- 
2.34.1


