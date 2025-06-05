Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC9FC5B543
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN6u7-0004hL-Vn; Thu, 05 Jun 2025 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6u6-0004gU-Bi
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:54 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uN6u3-0003PG-RB
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 05:28:54 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-525b44b7720so294850e0c.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749115730; x=1749720530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gf349HyvTUqvmnJweMD5K0+HO6vv0hnLTyOfOoMNvOs=;
 b=IpgnbdlZr+XgRWN76rXWmLVaJTuZeDrhcHMbF0fxCtrC6enAgeVlf8aPMwZr7EQUX4
 5REt+RHtjLD2XNAJgp0svXTgRiD6+kqXInVFvuLAvzDWegu7Hds0g8h4TpKhd4h43Rse
 eV6Ay0asiA3m5UGhOQPs9+wdXk29MSehXcbXidoFTEj8IWY9nDdZ8rsm8mHfET2vnBH8
 W72lm+cNpJQv9OPzdTj2jzB+NmMekqi7Fcrr50Ao+0NaYJjakgVN3gPWMq79JykSVUNt
 Zkkcv9IWzp2BS5GfivILlo2C29ld0zYfUIBSu4a3RmgYbEIBZ9PwZ1HcNDGODzTEsRoV
 yo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749115730; x=1749720530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gf349HyvTUqvmnJweMD5K0+HO6vv0hnLTyOfOoMNvOs=;
 b=XxTw6oTdyiIIUT+gb7SNRvAyGK4uD0i5uhaVfWLC/lUSTVzv79rfhqxY+HU8r+TLnE
 rPTSobPH17KAPqjBhjnfsrkNl1qDZ6ROcqwBWKE1Nr/vL6It0LynsyZ/BoDB2z7u7yo5
 u0CaLGW2cyywz/diBeTwYZDic9xaUyDDTxFnFdE7Yl+72LVvrpGTu84On9Q2EkA6CZSf
 CgTXQUrmxb6QbYpR+epBlXFOfqVCY1/FXJiwysPcH9yWaP/guF0+yrUeXkBJl+W6Nrd2
 evTbzaMetdnjyVdtJfwtXTGv+bI7SjxuGTOaGh7EMedJBMSGnhyOoq9Ri+o+GWmAAYWb
 nk1g==
X-Gm-Message-State: AOJu0YwuIUd/mx5cMQFGBa//DVsyG7tZplAKUYqs8g5ltDc8rKZjzzw2
 z2hn5HhhwRr2V2GMUXrtaiiZCAydl4fu6jFuv0zdD2fY0FOnuMm8xUhrYa9QZskze6s=
X-Gm-Gg: ASbGncsXNvV5gz/zKzdKmzg+vMupNBlNM6f0fkO0at0QYmLIEGZlQk0rRUuLit/8jwp
 Ib2O3TMZSzvgue4lBIGtozIuDlgPm+3qB4ubWV4V5lj9IRy2ggZVafNvNm7pXzezSbBpxZoIB0T
 3b8dnMsSex1LLt0g6Qz54aeVaAnV3MBg3p+hw3QfY96dMa8set/1UzBdSc1pDz1l7OZv+jjLzbc
 y7ZBtLNW9XqakN2ES9uKaXKINDAO8SerVEcvLcQWWVYES2U2cdxhgpV8wjKSh3mTY3BbCN7IHfK
 ORdu0PcpusiCrAj+1TxHVroJ3Cv/870wiMOAy7rSox2dmHR6BHWlL4wcGdocYIHCgj1Z7B/h+6L
 8sW4E
X-Google-Smtp-Source: AGHT+IGCk5Lhq/vdr5bdl8LIV8fLWaqKNlDZXl4ECwjhfoZ8jyLqb8bUoIvmZ4Yvccjwqjadw96jVw==
X-Received: by 2002:a05:6122:3123:b0:526:19e6:fa34 with SMTP id
 71dfb90a1353d-530c72e2ea9mr4636938e0c.1.1749115730693; 
 Thu, 05 Jun 2025 02:28:50 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53074bf86b1sm12311772e0c.36.2025.06.05.02.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:28:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/3] target/riscv/cpu.c: add 'sdtrig' in riscv,isa
Date: Thu,  5 Jun 2025 06:28:34 -0300
Message-ID: <20250605092836.1383882-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
References: <20250605092836.1383882-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2d.google.com
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

We have support for sdtrig for awhile but we are not advertising it. It
is enabled by default via the 'debug' flag. Use the same flag to also
advertise sdtrig.

Add an exception in disable_priv_spec_isa_exts() to avoid spamming
warnings for 'sdtrig' for vendor CPUs like sifive_u.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                |   1 +
 target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
 tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 406 bytes
 3 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 629ac37501..3c1b1dca47 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -189,6 +189,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sha, PRIV_VERSION_1_12_0, ext_sha),
     ISA_EXT_DATA_ENTRY(shgatpa, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 55fd9e5584..e9d80a13ef 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -451,6 +451,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
                 continue;
             }
 
+            /*
+             * cpu.debug = true is marked as 'sdtrig', priv spec 1.12.
+             * Skip this warning since existing CPUs with older priv
+             * spec and debug = true will be impacted.
+             */
+            if (!strcmp(edata->name, "sdtrig")) {
+                continue;
+            }
+
             isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
 
             /*
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 13c8025b868051485be5ba62974a22971a07bc6a..156607dec45b0e63e5b3ebed62e81076dacd80d0 100644
GIT binary patch
delta 49
zcmbQhJdK$v$iq2g8Y2S(<Ex2W2COEGj0`#x?N_s=loVyAPkd23IgL??BZrZJp^TA%
F0RTq!4730M

delta 43
zcmbQnJb{@j$iq2g0wV(h<JXB?2CRCFj0~z1?N?9ySUowLQJEu+k%6Irk%0jK_Q(p3

-- 
2.49.0


