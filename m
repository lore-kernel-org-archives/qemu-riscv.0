Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6Iqt-0000hT-9d
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 17:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqg-0000aN-AJ
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:37 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqe-0005mY-7n
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:33 -0500
Received: by mail-ej1-x633.google.com with SMTP id t17so9340617eju.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgRh+J8ugBdTp+hBAPKxvrVE6x2miNoYmydbOZW5heo=;
 b=HNUeMPgzvuf6AsZmElsdhHeaksTRLQtyPVlctzXt0s+RftDHFpCzUNFYprNzhhJbOY
 o7NZ8KpQbPujdhQqVFK2K/eHcYw9gDbOQo16JfxsQL1dJHZv8gGs3T+8cFP6fTWXxpZr
 tvMxjF1uC9UDQLtTA6zQ9u/yAJINT5VlGns1UzWYWi222Go/JAwbniNEcoMntAZoEde1
 BwRxGn9bmKJCgxfw2T3mFM8pjloOyF26G6ZwOs6qsoN1Y5snYZQwtb6GYaxgpiWOmxoZ
 6xidAvRxPjlU3mUtrs6lOEPiIEmW4Hofzoe20PxgFr/foQ43Ypj1zzoW2sHNGDoEPrIp
 SI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgRh+J8ugBdTp+hBAPKxvrVE6x2miNoYmydbOZW5heo=;
 b=1G4AbejfWrSCTrLjGnPl6CZtJrcVriW0xl7ParJi22lgQ32ImCajtnriPHCLSRc+BL
 UMYA9SYNELZK8+YQ6qDBb6gToSGp7n0aq5zvLqCU/C9gTgwA4KaNeAAFy+92M6XkXq+A
 biZ2qRQ3uOLOvhhkIwwRbgBIbQWq+46qITajmLSopy8ujxVI4ujJWF/CZ+b+jAEvp+6l
 6JxuvTylAmelewsMcBOmq1w1QARR/nqekNPhjaJgLORagtPKAgQ2j9wg1bBskwZjq/V2
 mw6IM1Nybh/Cw0/DXXQ4f1f3dVXpg7M3LGgpWPLGU0jswQEC6TywxVZ7tEO4/xbHkxuh
 VIFQ==
X-Gm-Message-State: ANoB5pklw50CWhD0N1CgYbMtFL8xB9JrnZI6jErN84yLFw0jcTdX8vfI
 rSBIzwoNy5Jq8YshjVPuYNKpeQ==
X-Google-Smtp-Source: AA0mqf64ZR0uLQR9LOIGCEXZVqJpMTXiNJDeOkdZ/u6E1Hq6gzDZC9uXtQLjzidWR7ml/klyNpol9w==
X-Received: by 2002:a17:906:a886:b0:7c1:8f53:83a0 with SMTP id
 ha6-20020a170906a88600b007c18f5383a0mr13347269ejb.13.1671228390734; 
 Fri, 16 Dec 2022 14:06:30 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a17090632c100b007c10ad73927sm1293554ejk.28.2022.12.16.14.06.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] target/ppc/internal: Restrict MMU declarations to sysemu
Date: Fri, 16 Dec 2022 23:05:36 +0100
Message-Id: <20221216220539.7065-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 22:06:41 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 337a362205..901bae6d39 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -242,9 +242,12 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+#ifndef CONFIG_USER_ONLY
+
 /* PowerPC MMU emulation */
 
 typedef struct mmu_ctx_t mmu_ctx_t;
+
 bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp,
                       int mmu_idx, bool guest_visible);
@@ -266,6 +269,8 @@ struct mmu_ctx_t {
     int nx;                        /* Non-execute area          */
 };
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* Common routines used by software and hardware TLBs emulation */
 static inline int pte_is_valid(target_ulong pte0)
 {
-- 
2.38.1


