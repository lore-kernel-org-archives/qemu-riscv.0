Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A2FC25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:22:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2AY-0008CH-35; Thu, 26 Oct 2023 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AI-000714-Lx
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:55 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AE-0006NO-2k
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:51 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5b9390d6bd3so141888a12.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333646; x=1698938446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkwlpLYypRxSWiGHgKxtQp1RAJeqYUNkInw/XRm9smE=;
 b=ZOeFnU5WmpTwfjspwRMegpzGScG70SgdcNliSJpKaR+j+bW8/1AVgPQA9415FV9EqF
 WydMee9Ix0M0Cw4l5kXXCawmU4y5/+YNEjWi1BYZBiTfeu/qJBzUrKZ3cWkbrwGCuWwD
 oPui00EwqpOpjbNJL40RLxKDd4V1qQkotMXIuUCC85S+X4s5eRxzCIOB12jr0gof16a8
 hGIgJw57LFtJCJbCGd+DsKFkdMuQ3ZTg/2eNJafQI8585CtwOKz1Obh70K5ReH7Y92pP
 3ytiAe28sR02OuTqOHrCK/ET7nX9jof8uBJLNECRd/RTHbow9Utrgp8gx4NJGOZCCirG
 WsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333646; x=1698938446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkwlpLYypRxSWiGHgKxtQp1RAJeqYUNkInw/XRm9smE=;
 b=bbUXLtJ6v95wXd5RrhmJRDvtFycmIUNgL0P3LH9qNw7KPC1HwOTW77MifUsnRfo1xS
 Ka60n44t7juuHO7miO3GwDI6GJV5p1kQ2uji6Pmy3UmZcEoT5fon6UU7R0pQr6ASEF7R
 zXm7fTLxBsQHFa0gfQvl/qk8vxfxyVbvKe5S5ByIdtWB9EAW1jwZ0zVXMSzVVku/YweS
 MQAXU6FWUge5q1OUk2Tq/KJ5xlDG50bxX0+QHNYj+FfjphRbEDwT8Y6POj3KZ/Tc0oju
 ioZBS0xA4bf2Y6pvKzroSs0g8Fe7vTn4SKhCi6y6zVMcbt2W62kQ0NXSUKXHoT9w2Y2b
 bAQw==
X-Gm-Message-State: AOJu0YwmC3LhckHLqZqo3gNVjKShffm9nQndngK/fV6Dt60ILmVv5pO0
 Ee7BDpw7gwwL3dhBFDTqMvd5gA==
X-Google-Smtp-Source: AGHT+IGyed+0TNJ5I2UdgfuHkrlZXuOSUMwXpdSqYY/ZaWcoYQUE8jPDdK/h7USC2rcDdcUEAwQeOg==
X-Received: by 2002:a17:90b:1c06:b0:27c:f4a9:7e20 with SMTP id
 oc6-20020a17090b1c0600b0027cf4a97e20mr3718993pjb.15.1698333645902; 
 Thu, 26 Oct 2023 08:20:45 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:45 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 09/14] target/riscv: Expose Zvks[c|g] extnesion properties
Date: Thu, 26 Oct 2023 23:18:16 +0800
Message-Id: <20231026151828.754279-10-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x533.google.com
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

Expose the properties of ShangMi Algorithm Suite related extensions
(Zvks, Zvksc, Zvksg).

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8eae8d3e59c..1709df76a9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -133,7 +133,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
     ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
     ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
+    ISA_EXT_DATA_ENTRY(zvks, PRIV_VERSION_1_12_0, ext_zvks),
+    ISA_EXT_DATA_ENTRY(zvksc, PRIV_VERSION_1_12_0, ext_zvksc),
     ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
+    ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
@@ -1385,6 +1388,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
     MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
     MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
+    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
+    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
+    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.34.1


