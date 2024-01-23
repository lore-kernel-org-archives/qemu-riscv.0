Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAE8C47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 18:44:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSLkU-0004ts-Eq; Tue, 23 Jan 2024 13:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rSLkL-0004mV-1q
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 13:43:43 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rSLkJ-0002pd-65
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 13:43:40 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A9BE40772
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1706035407;
 bh=cpcO92XOl2zNt9sq2MJVJ7XaxnnPhG6+lYWq+HSy79Q=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=aq0TYRlLZAhXgAu3MAyN2TUcukSxg4VgPOH2rGy4xiogj3R8gAVzMev64tTdvZf87
 pkOCDuK9IfFDquCjsm2DnPmItfdt524lLkXF4rBK2fQHYhfx50s8piBvY+3ULSWs6X
 O64H+ucSOl8vDa3P/sMQK/oshXu7xY3K5EqpSVyXMCiZHdKB4W8GoTL4k4FW1qxvSN
 E77L2RsRKKWcQ3mzUtUEVy2uLRdJf712HUHSMB71dwY7szkQ1HHIEq+vvhBnfsmePQ
 qtFKAkfzPqqgLLic8ucvY7jcHapX9DhSvjNw6mEdQYg9bYKwvPnKVmYadOYKkhNief
 W0pxpq8dVaKQA==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33944381671so464066f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 10:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706035394; x=1706640194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cpcO92XOl2zNt9sq2MJVJ7XaxnnPhG6+lYWq+HSy79Q=;
 b=emo4qZh4MPP4OPnWt+n/Y23PK5UEy66iRLxRoKNqppmuoDCGNgy+N7HT4J0/X7vfow
 PWI5H+O+UHwLQqhVYJnyb9euH5mj/4ulXwi8rO3Y7vDL6XtWdEmprnPVxjCDCxI3bkr8
 5XxGzafOdiPTcq4rvVMD7BwoYnBcluq7NkPHeS7ZnEPzBmlABctc1N6qBBU4Fx+eWFPB
 sBzwLq0cygF3m6czgiIVmpA5EwND78MpZudW0aUjArxbq3a8eYXN+jbPl+TeYgLEZGyd
 ukjGwbugmWIwz038SIBkGBXjW8A0zjMUr00hXKjx+hrbnbM2a7dB3T8W8uVYlBru307c
 6D9g==
X-Gm-Message-State: AOJu0Yyy0x5fTen5XR/RUa8m9rerWDqCw45ILfUtviFmo3k8AhZqquHX
 w62+Dy6IsnxaRfTvAHkiNLCtDeXkOzonK72qqd0Jc6/fbOIfT8BRgjKUJGpnNm7hYIP3jdCeR8q
 +NcyOqdf+IGNwSUQDSK21ZQPGlNNrVquG5KtZFwIfktEDBLG0Otz5VX7LsjQ3ZAIcRVDa
X-Received: by 2002:a05:6000:1191:b0:337:c658:9952 with SMTP id
 g17-20020a056000119100b00337c6589952mr3233719wrx.107.1706035394518; 
 Tue, 23 Jan 2024 10:43:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu0IRY8+uf1KeQwVMffTCixbfa+fmoMjDnc3VXSJ4eZMwG8v35HE8xmwzX+psaF/O6gw4x/w==
X-Received: by 2002:a05:6000:1191:b0:337:c658:9952 with SMTP id
 g17-20020a056000119100b00337c6589952mr3233701wrx.107.1706035394265; 
 Tue, 23 Jan 2024 10:43:14 -0800 (PST)
Received: from workstation5.fritz.box
 (ip-178-202-040-247.um47.pools.vodafone-ip.de. [178.202.40.247])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a5d6ac9000000b00337d392c6c3sm14180252wrw.13.2024.01.23.10.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 10:43:13 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v4 4/4] qemu-options: enable -smbios option on RISC-V
Date: Tue, 23 Jan 2024 19:42:29 +0100
Message-ID: <20240123184229.10415-5-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123184229.10415-1-heinrich.schuchardt@canonical.com>
References: <20240123184229.10415-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.327,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

With SMBIOS support added for RISC-V we also should enable the command line
option.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
v4:
	no change
v3:
	no change
v2:
	new patch
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index d90bdffc7a..935aec7cb9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2697,7 +2697,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 17 fields\n"
     "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
     "                specify SMBIOS type 41 fields\n",
-    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
+    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH | QEMU_ARCH_RISCV)
 SRST
 ``-smbios file=binary``
     Load SMBIOS entry from binary file.
-- 
2.43.0


