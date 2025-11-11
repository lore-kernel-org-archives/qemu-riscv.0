Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5D3CCFA18
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vItAm-0001DM-7k; Tue, 11 Nov 2025 13:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt8W-0006gR-4i
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:41 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt8R-0007x3-Mf
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:34 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7afc154e411so16598b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762885830; x=1763490630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtwyPP7veGakivKkZ5RT11DzhVP7xIaN1NJCE3YY26c=;
 b=OqwInSKdHm3Z0JIt5O7Lz+Y85AJW3L1QR/4HRNz5GRMRTM4Br4hQfhRduozzijquYo
 IU1eWxVQQnTQYp9a3a80xhJb9sXFzx0sSB9JTvUzwFKx/mpDb6HoR0cMc9FQbBaHDolD
 ei3u1t+h8jjTIvnhGuUc6P/TcKDxr2Ndk9aawUDvydv8LWLHhR2ETc/NrJ78QReWJ3bv
 7s/kZZ2QY3dzYo957APmEcdzQU0cincoVcrDaiRat8HxQiHv+SR6F+65+MjD4pmtYMI1
 zFfxb4Utku4aM2Zuq60NaWLf+5Jaox7PJ7Jwls/CCVJAwQAlnGTPr/60zrIEkMOqepV6
 Zr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762885830; x=1763490630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rtwyPP7veGakivKkZ5RT11DzhVP7xIaN1NJCE3YY26c=;
 b=gMXFYHK+56j35uqqLehT9ob1e5o4l7Hc6cl0r/VLMfkxU4OdEAT6ROtcc3gaOlxZcp
 KQa2ynhLNo6UZBXHI8APe+OctOx0KV4v5xAoarBStpdcL+FHSN8hPn7c8foa3anpU3k0
 OhiENHpYDQukq/j7+vTexPyM7ou1L0wnaG4gt0b90ViYqYSQ0BcDtwnUQwIihUXKr6+U
 IfvBk1KiAfizMkE3poVcwdXPf/lGdiht9TRffPPuYWNwpLzSCcL0sgOfyIp1iI7iZkfR
 pLON2ru/YH/oSn1ug+EByjfwahNK6yBG9nTNaLwIQbz6tDthXE6g0Vtlb3Fvdgff2yss
 cC2Q==
X-Gm-Message-State: AOJu0Yx8cxBjgIIlP6tDK6uWe+dChMx++fMdJNvaRw8F95hqbTUVkgzZ
 rFUEUGw5g1Ae4TMf/HCYpeJGQc67kZ4ws0UchBjK6j3r7Mhr0Zm8YuII13fHw9BTwAE=
X-Gm-Gg: ASbGncvt6DVTwGd1fajsq5T96URJdxe9Jqnq3HSBLocbAQZ9qzcTs147XOFcQexAuGx
 XGMu5YeLAqWd5iSvTTLKGXhQJofv0Ukt3/JRbwQeZLbthYgc+a61x53/QHwAlELYPemzqiBvOIs
 4VvsrO5CqTlKDe7G1eWqJX/bsTFVSxeMgdI/hLTBLmLaykm342ZndctCO9R07m0GfRpGLhjIP9S
 ia6KdpQ1WNa45kJV0ktKVIQXD6TY4eW/ql8IuSEGLdsAD8B48l2zDPtk81yuwttNYe1E1I5FGZI
 fvL9yxQZX3QJRSyh6kovkgj92lrNNvIMlEyY2d88kF0KobBMvcYsb2vxq16SRsgRG5auQjDJcF5
 bwRKJUX4enJviTIqqkLEKV/eXPNa05AG/kES3+IzP/fk/2zQCoSMQDXEqHtsnxW7hgsyz1Terre
 8iFYZ23pVOVHOBAW7AkkcJYba+kTs=
X-Google-Smtp-Source: AGHT+IGLxd2arqkC7GOAX6hXmU8L63K9XsVIo/gsSdPGKgIXkDrrxyjvnersYW22odnfr5V4hBrVjg==
X-Received: by 2002:a17:90b:554d:b0:341:c964:125b with SMTP id
 98e67ed59e1d1-343ddec54e9mr292955a91.31.1762885830250; 
 Tue, 11 Nov 2025 10:30:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c2ffdecsm15207419a91.2.2025.11.11.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 10:30:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 5/5] docs: add rvsp-ref.rst
Date: Tue, 11 Nov 2025 15:29:44 -0300
Message-ID: <20251111182944.2895892-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
References: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

Add documentation on the new experimental board rvsp-ref.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/system/riscv/rvsp-ref.rst | 28 ++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 docs/system/riscv/rvsp-ref.rst

diff --git a/docs/system/riscv/rvsp-ref.rst b/docs/system/riscv/rvsp-ref.rst
new file mode 100644
index 0000000000..3889fce413
--- /dev/null
+++ b/docs/system/riscv/rvsp-ref.rst
@@ -0,0 +1,28 @@
+Experimental RISC-V Server Platform Reference board (``rvsp-ref``)
+==================================================================
+
+The RISC-V Server Platform specification `spec`_ defines a standardized
+set of hardware and software capabilities that portable system software,
+such as OS and hypervisors, can rely on being present in a RISC-V server
+platform. This machine aims to emulate this specification, providing
+an environment for firmware/OS development and testing.
+
+The main features included in rvsp-ref are:
+
+*  a new CPU type rvsp-ref CPU for server platform compliance
+* AIA
+* PCIe AHCI
+* PCIe NIC
+* No virtio mmio bus
+* No fw_cfg device
+* No ACPI table
+* Minimal device tree nodes
+
+The board is being provisioned as *experimental* because QEMU isn't
+100% compliant with the specification at this moment - we do not have
+support for the mandatory 'sdext' extension. The existence of the board
+is beneficial to the development of the ecossystem around the specification,
+so we're choosing the make the board available even in an incomplete state.
+When 'sdext' is implemented we'll remove the 'experimental' tag from it.
+
+.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 89b2cb732c..2ed337c8cf 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -72,6 +72,7 @@ undocumented; you can get a complete list by running
    riscv/sifive_u
    riscv/virt
    riscv/xiangshan-kunminghu
+   riscv/rvsp-ref
 
 RISC-V CPU firmware
 -------------------
-- 
2.51.1


