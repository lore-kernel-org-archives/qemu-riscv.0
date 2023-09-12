Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A916DCA0ECF
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3OL-0002vH-D7; Tue, 12 Sep 2023 09:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OK-0002uW-8h
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:20 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3OE-0003qB-Mx
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:20 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c0c6370e5eso2694773a34.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525113; x=1695129913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EY7q/ifwlBfCMI8HoRzhiL//2ixtNee6/k+VtF9bmb0=;
 b=ICnhYAwgcw6GOzZPabZxtyupPC+I35HaL3KOv9ShfT1+XNkq7Xq9oPgTNS4NaXCKEG
 myg4WKFSGlNa0WP7h53ZC+L8mJunECYCYfToSxFb1/0Q+nBr3M9O//Tvv2Ygt1fc3gCE
 aRFRE/EEjUHlrwufLT6GuRw8LWXNhUF1f4ksmu0lMS7S9ugMUdQLusJa5rk91qNgaLz/
 zi31REMu6L1GDliNLq4pCpfJQ5f04Qo1jn/9vpR1HASyvE29qmn7oTmo66wXzpF3jQ27
 l/7/SY9sBE7tgy48tlAauxsGVuPDw45QKC07OPGyFlhKA8AyEWMXZ8EBnG+RNwg+yQAf
 3adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525113; x=1695129913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EY7q/ifwlBfCMI8HoRzhiL//2ixtNee6/k+VtF9bmb0=;
 b=QQIPaRrBd+rvwftffiGdgUp55myh0p8VJhmyPNe28SbkyNQQ7ufA8UBmt5lu4nhabi
 OGw3UQ7DI39Wm4uFwO4uX4XGjkt9U31csIeI9cIHFZdBkWoU/AzXKs3O1Kb4bvNi5mrE
 zMznq68WRy9R/Fde1jcT8ziro5PB4ZUQAtvtItxmSJfF5YppkFE8K0MCs/oc9lFtVqnV
 70ezngwyt8/HZoc6XbE4zSNDJETM1Hde8OccXnY5d1PiWQrw/ilWuOeUWFNeVUQRLS1g
 GwsC2In6Ehqtp4yKPoMEhteenRknTW8NYe29KLYhc4n/z7Am41WIEuiPgLIDA7fVHOt4
 lWsA==
X-Gm-Message-State: AOJu0YxqfJ6Y/3dqp/ZhPjY9adA7tQIdvovJgpa/kgQ/gIx8lfObfjsM
 zQP5g7NBglNa95FYdNAFadX8tw==
X-Google-Smtp-Source: AGHT+IFz1YZnIxDtkCjoNQ4sqGHQKo3iHltUPF4D4uA+DPfAylA1uyZFROGzMyL1tSCzDSvhiFF7EA==
X-Received: by 2002:a05:6830:460e:b0:6bd:152f:9913 with SMTP id
 ba14-20020a056830460e00b006bd152f9913mr12047331otb.29.1694525113547; 
 Tue, 12 Sep 2023 06:25:13 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:25:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 12/20] target/riscv: deprecate the 'any' CPU type
Date: Tue, 12 Sep 2023 10:24:15 -0300
Message-ID: <20230912132423.268494-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The 'any' CPU type was introduced in commit dc5bd18fa5725 ("RISC-V CPU
Core Definition"), being around since the beginning. It's not an easy
CPU to use: it's undocumented and its name doesn't tell users much about
what the CPU is supposed to bring. 'git log' doesn't help us either in
knowing what was the original design of this CPU type.

The closest we have is a comment from Alistair [1] where he recalls from
memory that the 'any' CPU is supposed to behave like the newly added
'max' CPU. He also suggested that the 'any' CPU should be removed.

The default CPUs are rv32 and rv64, so removing the 'any' CPU will have
impact only on users that might have a script that uses '-cpu any'.
And those users are better off using the default CPUs or the new 'max'
CPU.

We would love to just remove the code and be done with it, but one does
not simply remove a feature in QEMU. We'll put the CPU in quarantine
first, letting users know that we have the intent of removing it in the
future.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02891.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 target/riscv/cpu.c        |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index dc4da95329..694b878f36 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -365,6 +365,18 @@ QEMU's ``vhost`` feature, which would eliminate the high latency costs under
 which the 9p ``proxy`` backend currently suffers. However as of to date nobody
 has indicated plans for such kind of reimplementation unfortunately.
 
+RISC-V 'any' CPU type ``-cpu any`` (since 8.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The 'any' CPU type was introduced back in 2018 and has been around since the
+initial RISC-V QEMU port. Its usage has always been unclear: users don't know
+what to expect from a CPU called 'any', and in fact the CPU does not do anything
+special that isn't already done by the default CPUs rv32/rv64.
+
+After the introduction of the 'max' CPU type, RISC-V now has a good coverage
+of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature complete
+CPU for both 32 and 64 bit builds. Users are then discouraged to use the 'any'
+CPU type starting in 8.2.
 
 Block device options
 ''''''''''''''''''''
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dcc1b3ad8d..447913636c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1522,6 +1522,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_ANY) != NULL) {
+        warn_report("The 'any' CPU is deprecated and will be "
+                    "removed in the future.");
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.41.0


