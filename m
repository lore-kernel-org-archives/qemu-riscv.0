Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DB0CA0EFD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 16:52:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sk4nN-0000y2-QN; Fri, 30 Aug 2024 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nM-0000tV-Le
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nL-0006yj-13
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2d679b094ffso1605229a91.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Aug 2024 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725036497; x=1725641297;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVrxnpz839aLLYnBnHuqeTltn+xpAuxyl7GsFPJsO10=;
 b=xWMXYNxa3n7GucP5TMTZMfGD+5cIMKmSWwLI+vIpkTbcTgbUBdGgXa0NleknVZJjyU
 CTpuKVbchlhUUryd5PXqnxIj16SxhgzhFZU2ZJk9kusU6Jw/Qp/+huBQ/rIu8eDC6LVz
 Jp+DyrtSKxMnkNwTWguyrGQpNMilBdvIoPsO2J6/uSc8e6zu7cRnHsE1C4ZFr9tB3jir
 z2d3+Xb21m/r92ZaJiHDPLUnfVid42kAptGHV3CPjA8dL1LgNjGpiF5innzie89gbj41
 Y+JyAgQKIc8fGh1jjziuqsSdZOVQ2Qw/ZR4JZDGKTQHooicDjyobE5iFv96PbQU9OXVP
 FxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725036497; x=1725641297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVrxnpz839aLLYnBnHuqeTltn+xpAuxyl7GsFPJsO10=;
 b=YYDcfq0ecbxGfjpNxanAsoW7OOr4SHrK5rGmCD3ioZ+UgszlEyE4g/izu286elqr3o
 +wDxTJ59Ps0ftXsHD+pceMOZ564/abXV3xvdXYoacmu/4Uv4rS3ww1KskELrtdcRotcA
 W47wUBFXKg5WCLzdm+Br1jj9rI++n/zbQUKMw4ywTah1vmokChzXclIMJBNnqKyqrLhT
 jDcJB9nuhE1Zt5kCgfjpa6E5bEq45kR77McAeq53oYTNVrvJlPL1YH06vEW+Q8Kw+vwH
 XQAyM6DAU+Yi2MgsfDp4TkdDgoZ3zij4856Vs9mOGUoqPFcI0j8HZB+Zn0tfMVo4hZ+p
 kXpw==
X-Gm-Message-State: AOJu0YykJoyA9VeLG8TpbHg+g1c8+QR5DNwCC36jPhtdBDasQf0jYeH6
 IGRdb5NB4tPqzwhTlegwP6CHhGd2lOQ8/wbAkjPAJDmle5dYZ78zHD2Blxb72S+Tr5d3h8ntmoO
 9
X-Google-Smtp-Source: AGHT+IEnLXzEHBCXXMwhrd3WkM1niPey8NG6Ui+wXmAK4ahG/q3vVVZeoJXinuCntIBoLo83KY7ocw==
X-Received: by 2002:a17:90a:a10f:b0:2d3:c0e5:cbac with SMTP id
 98e67ed59e1d1-2d856173cb8mr6966223a91.7.1725036497400; 
 Fri, 30 Aug 2024 09:48:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445e813dsm6591257a91.17.2024.08.30.09.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:48:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v13 09/20] target/riscv: Expose zicfilp extension as a cpu
 property
Date: Fri, 30 Aug 2024 09:47:45 -0700
Message-ID: <20240830164756.1154517-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240830164756.1154517-1-debug@rivosinc.com>
References: <20240830164756.1154517-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 55754cb374..c9aeffee4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1481,6 +1481,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
+    MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


