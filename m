Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C251AC3DA64
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 15:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sZXy5-0006Kp-9q; Thu, 01 Aug 2024 11:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZXxz-0006IY-R4
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2024 11:43:49 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sZXxy-0004v7-AI
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2024 11:43:47 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-39a1e26ca96so28969585ab.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Aug 2024 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1722527025; x=1723131825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=JDMFkqj3zpf/48FLOo6RFHhZ+Z81ntIEf67K2RTLK5so+kLWl4pceEynevCHGCglkS
 S+R0UuJU/9wyYkuYShBNzMN4u0/JXxX4umSPdkup09R14JwCyGZBu9W3fW3jvdWAidDh
 SrV2kSMiE97Kgnwt+KVdo5Yc82LrbWv9Fy+CoEjBAiIAF95yz0/gKrL/GeDE6Q6het/w
 hTJOynGFHV1yQDstR43LLDVcqGk4vaudXhbooGmnFoWkVwY91YVn6bWSfcTuTjx4uuNq
 vNz0axSI8TuZRQJ1kNyzkU/H8hzHoHsPDSEuAXUoaeGfHWfOXZtxbT8x+9BSQtrGTXOS
 5xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722527025; x=1723131825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=cr7ghUokDn1SwH+gkiISFuAvdO/gbdorAzOc+5oUpOqy+RJl7mTzfHTZe02IUtWfdh
 zvYVlu0E+bkFipau0SLGWLA/C6gVp3lKOC1v1D3mW1heee+/7Z0HdbjFzRdb5YOPY5IX
 3CaRsebYdf8JEJvffb0V5eixrBS7/kK3sFesb0IivOSLaF5B/djbAQfzPutN6ovZiLlo
 +ZlEimEsPz2HqNdT7V1169dvsYrT9hnaSdV3UGsigqbtqYNHTNM2iCDypDOvjeWvgRd4
 9aqt3zWBfSuoEvlSjScSoGXf2PorGRAiznFlZkKgpwLKTKKa5nYeq4JeFrMyg0/F9rbC
 6iWA==
X-Gm-Message-State: AOJu0Yx/q7XUTTnuR/oibA8T47dZmkr8f/fZ3AnIipU5aeQ3Bal6fFaL
 sh1tTLRhLDNDm8yO+GeATPRxsXHwrV2BzSw1THLtOyonyyQ81rWXEVad5KNHgoQ=
X-Google-Smtp-Source: AGHT+IHzyAeYJ3Uvstn1GJm9hScDb9jWMAVg631hWCE4vXOnxDrSLKzNr7XgXyOAc9tccsIH00hOHg==
X-Received: by 2002:a05:6e02:1d81:b0:37a:7662:7591 with SMTP id
 e9e14a558f8ab-39b1fb6c01emr9052535ab.6.1722527025076; 
 Thu, 01 Aug 2024 08:43:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.197.107.101])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7b762e9c650sm17183a12.16.2024.08.01.08.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 08:43:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 jason.chien@sifive.com, frank.chang@sifive.com, ajones@ventanamicro.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.2 v6 01/12] exec/memtxattr: add process identifier to
 the transaction attributes
Date: Thu,  1 Aug 2024 12:43:22 -0300
Message-ID: <20240801154334.1009852-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801154334.1009852-1-dbarboza@ventanamicro.com>
References: <20240801154334.1009852-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x130.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Extend memory transaction attributes with process identifier to allow
per-request address translation logic to use requester_id / process_id
to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..e27c18f3dc 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * PID (PCI PASID) support: Limited to 8 bits process identifier.
+     */
+    unsigned int pid:8;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.45.2


