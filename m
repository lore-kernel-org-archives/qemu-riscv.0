Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5BC36010
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 12:29:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0gAY-0007Yq-OB; Fri, 04 Apr 2025 08:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0gAX-0007YX-DH
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 08:29:09 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0gAU-0007p4-Ok
 for qemu-riscv@nongnu.org; Fri, 04 Apr 2025 08:29:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-223fb0f619dso20099535ad.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Apr 2025 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743769745; x=1744374545; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kEOFIV1qt1V2bKvkYxtGDBDLbtt18qBSOEpiQi49TN0=;
 b=ouHjispTVj/QggDz+JIF9hkCa8k3V4KUEJhS1OuLwUBUQW+XVdTrlkqH71jp6x3Qyo
 VPE1Na407iqP9lFFt9SceaN3HkGB6YKF8ETx49otu5ReNt7PWWEGStzGXFPW88J+xd6L
 UdLrHDtNusg/z4QlnzygxtJkPjKnjy746FIu4X5Vtlqjjl6gaX9kGGb4NDMDQtvgb1tI
 hqLkhsqnBLZUF3rGhUklX13+R6Et9z7rULnmwzEfn8s/jwkHnkCCt/wD1bQ7Qs4/9WyB
 Ycgv3GPhihnHT5x+00t+kswUr9kMN244df7upJkH41CSPpmYiey5cNV6I3Q+yCfS9e/s
 CCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743769745; x=1744374545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEOFIV1qt1V2bKvkYxtGDBDLbtt18qBSOEpiQi49TN0=;
 b=A2hWDqxf6jEKB0caaNn2QzHOlkMwOeZP9s/L72J06FRSN7HQg1HvFEHPqUybUoJ7C5
 NwGNiXe/UsLRb6StVMXTQctdfHdz/IJVWF0hBEMTXh0Ip+j0/SWDca8pMFeXQPeC+aQP
 gnagV+WDLkdRDOSfaX6zH+DvDoSWmV6eJcuk/IdWoA95B5KdUTppVreDfCveTJyGYYNl
 +5yee1bXriT1nHprSgdl9Lqb1b0to1Rlj5KiOK+3XEwft3eI/I1eHHmcb136cBc5QFv+
 MKYPEy2LCMW/JXILfGm1FRTnfqugoZa+eJULno45avQFK7HB18Tk1bC+YlI+muqTrXLO
 IKDw==
X-Gm-Message-State: AOJu0Yy2NPnScdtt00v0M9aRwac20GGpO4kKo6ffw24msO/9Qm+ea4BJ
 hk+UlI7Fb+5CUHzUByViHCQP4LUaNiwWkEROXDL/ip5RYuJ8cTZWHPEWjbYjvKk=
X-Gm-Gg: ASbGncvp56LqiPbuVcSrU34jPKgvHYgkTmEwAdyPgLebR2t6uSQoOo7msXRp/xSCiCr
 UriUAmqqFtonc+hS/YdybURkjcbAApVSWi/zzaCfy3hIQlCMiW82RF19SqDiy5a9dr1CKOIB6Tk
 zXjHp063CMJNpBoEa+EggWldUO6BrpLlJfwAC8AoPMDph/jJ7rRDQVAgJqz+h2CEJXlY999ndnM
 6VEqZwMG6VE/eFAEJSE2R2bvSzXXzlQeoNIRky27Ev1g5FveIcyte1ZftZet/fowpG5eEE/E6cx
 CYtOKdao5vPT/iSOByQY9vutz1PYrTb89UzEAbdi5kl3wnhcaDiDwjK0FM9e9+OgMgiFOC0GeA=
 =
X-Google-Smtp-Source: AGHT+IGOXam7jhWMQiL1PtP9JtkbsuRFA2AEdyVL49jx4sE7XOyZmeiRQLaQWWyva8zsN10K6ZzQWQ==
X-Received: by 2002:a17:902:d48a:b0:220:f7bb:842 with SMTP id
 d9443c01a7336-22a8a0b3707mr31781065ad.42.1743769744688; 
 Fri, 04 Apr 2025 05:29:04 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0b4851sm3306137b3a.146.2025.04.04.05.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 05:29:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-10.0] docs: deprecate RISC-V default machine option
Date: Fri,  4 Apr 2025 09:28:58 -0300
Message-ID: <20250404122858.241598-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

Commit 5b4beba124 ("RISC-V Spike Machines") added the Spike machine and
made it default for qemu-system-riscv32/64. It was the first RISC-V
machine added in QEMU so setting it as default was sensible.

Today we have 7 riscv64 and 6 riscv32 machines and having 'spike' as
default machine is not intuitive. For example, [1] is a bug that was
opened with the 'virt' board in mind, but given that the user didn't
pass a '-machine' option, the user was using 'spike' without knowing.

Being explicit in the command line is desirable when we have a handful
of boards available, so deprecate the default machine setting from
RISC-V.

[1] https://gitlab.com/qemu-project/qemu/-/issues/2467

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/about/deprecated.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 76291fdfd6..0f41a99c67 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -304,6 +304,23 @@ online to check that this board did not completely bitrot yet). It is
 recommended to use another MIPS machine for future MIPS code development
 instead.
 
+RISC-V default machine option (since 10.0)
+''''''''''''''''''''''''''''''''''''''''''
+
+RISC-V defines ``spike`` as the default machine if no machine option is
+given in the command line.  This happens because ``spike`` is the first
+RISC-V machine implemented in QEMU and setting it as default was
+convenient at that time.  Now we have 7 riscv64 and 6 riscv32 machines
+and having ``spike`` as a default is no longer justified.  This default
+will also promote situations where users think they're running ``virt``
+(the most used RISC-V machine type in 10.0) when in fact they're
+running ``spike``.
+
+Removing the default machine option forces users to always set the machine
+they want to use and avoids confusion.  Existing users of the ``spike``
+machine must ensure that they're setting the ``spike`` machine in the
+command line (``-M spike``).
+
 
 Backend options
 ---------------
-- 
2.49.0


