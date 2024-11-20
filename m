Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA549D6E2CE
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 07:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDfQO-0002UN-0i; Wed, 20 Nov 2024 02:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQM-0002T9-BC
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:54 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQK-0006Rp-UU
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20cb7139d9dso18654795ad.1
 for <qemu-riscv@nongnu.org>; Tue, 19 Nov 2024 23:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732088811; x=1732693611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR1sFxsLrriO/BPDZ7OAiWQXKRll1xzEwd9fI6XIvNU=;
 b=hyVn7UTavX9W/xYL6Y6np721TdH7SKtTvIdmcrXesoK6q+MLV9zNsUgEYx4IzllWYp
 Za2CFeTglcbP9TCB0XC+bCgV1/he4xN3/Qv2I2Ehf84vY+gh+TZ2r3KoiW5pWEEnrcVo
 trWTZllxCC9BAdl4oPiszwbmpcJRKwYjOqcMQZ50ikaHOvbs047XWdkNPPNv4cS5P0yY
 zsEMDYRdNw9aDP0RARmPd8HKAxR2U8rilVJ5ol4wQ7AyBFumHAPCx+c70mjrPWP2WVOD
 B8YJopnE1rfeCpmR/pvs0ZSA3X16WjRm5WYMDRgCRBVU2bWo3BSUdtW1eyWkwvhsPz9+
 v3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732088812; x=1732693612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR1sFxsLrriO/BPDZ7OAiWQXKRll1xzEwd9fI6XIvNU=;
 b=f0Gq3NsVtETdG1IIpvM5MQ/eQ/lI9Yv40sg6vdJq2oTgZ9Sio8FwsxYnRsWIjqQgS0
 AFA7ojSxvKo5gY0SibHHe9PSI4f2m20Qq99UObaZEs0uNBgPBhzBJvjM9a2d4RAWxz6l
 rB1/WCNyCCW/LOFoRQqLFyGX0DG3HDJf7rOj90vwwdCTtbR5EhIonHl+RlQKOnmcHav5
 YlZzLF7GOoDvgzWv9vEp2QZpJjGMJNsaRt+JstwyVqTakgddv208EWtePUP4C7+N0UUT
 Y0txrANAR+t8FRQtiVNFJZ4YDRX+fvVzi6/eOX8T8z8wp+N37oZFzFf7G8g0NYkytIA0
 taOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMTU+ZAcZxk8CfUHN138phKFiQiNWY9U7RHnDM/Pzn8Tk/Ye+TlABVUEB733+dsv7W9d2jrvmsGgaq@nongnu.org
X-Gm-Message-State: AOJu0YwN6A2UHjc/pGmknyXCAAAJuEuWFHNLuUovDqmh0tBJSg0EVF1V
 XI1QqNqWh9f6x75A3drW7CA2CQF+xDjrxdlxMCSws3Rxn+XJj1AWspQHtHmOq34=
X-Gm-Gg: ASbGncv6EJV0loXnrioHpQLhAG0uJnYmUdHhl7PqhCEbNCd7KZAUr4m5jL8bzCiv4wL
 z3EbFG4hetzf1hxeCXoh6u5IJO+rsrS1j94bpNbvfpr4+i0XzkSAUEoNdwcKjohdcSEJm6c8r/0
 z699Dvx2/cZzYDaM9PE57JHvFBDSmRiEMiYXHfnob1iFeQQRXEsTcahPhKNl7Y0JUm1gV/PR+5Q
 dMd05F619R9qedUqZLd1i55suJcoY5WgUdYqAKYk0lIvYXcok+DmpjNaZ0EPD25iqFMErYBoaPJ
 awKGFcI/QU3dSOqm7KTxgd4fB+vtCJUzRKxZN8RbDg==
X-Google-Smtp-Source: AGHT+IGcjC2zsB7038QVaycnOA00MoJQXwuwdXeTXVJA8GTE3hBHQdu5cZRc7+Qi8pQ4M4Est+tYKQ==
X-Received: by 2002:a17:902:e74c:b0:212:1f:e66b with SMTP id
 d9443c01a7336-2126a474ee5mr16915655ad.51.1732088811665; 
 Tue, 19 Nov 2024 23:46:51 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0f51fe0sm86206255ad.233.2024.11.19.23.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 23:46:51 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH v4 6/6] target/riscv: Check svukte is not enabled in RV32
Date: Wed, 20 Nov 2024 15:48:54 +0800
Message-Id: <20241120074854.1767780-7-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120074854.1767780-1-fea.wang@sifive.com>
References: <20241120074854.1767780-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62a.google.com
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

Based on the spec, svukte depends on SV39, so it should not be enabled
in RV32.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c62c221696..4273f1f472 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -652,6 +652,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (mcc->misa_mxl_max == MXL_RV32 && cpu->cfg.ext_svukte) {
+        error_setg(errp, "svukte is not supported by to RV32");
+        return;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.34.1


