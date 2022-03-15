Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU16E-0000DJ-Oe
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:56:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU169-00005g-Ea; Tue, 15 Mar 2022 02:56:01 -0400
Received: from [2607:f8b0:4864:20::102d] (port=39917
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU168-00024m-1k; Tue, 15 Mar 2022 02:56:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so1472357pjb.4; 
 Mon, 14 Mar 2022 23:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VR9EE00fMhTE+6DR1Hf+kiPhRLGTDrPJyiDc0tREi5g=;
 b=pX3VTHbrBg/XqUmh+gmbEfECTmUBWoma6AzV2QF5AnZuMfpKpjuIz+r5QVcfg0OtA+
 VO4KWvpMV363UTXJJ7lHchi6xCEJVH3mhSdiU/0vTchhJPHpvbtA5RJ60zeQ4Zosnj6p
 qJlHD2+ZJy6/k44T/G3TQZ+L61HCGKKXdFat/zbx/IC0QIP553+tWh2shL3+rxOQmb2t
 2+hhonpNNwmsExxs7rw8tq23L6JnWTml35fA5k/Pc254PVasDH5uGfvL7ihvcf89WBIX
 DBTAqPcOzbAA2jtPxHbRNNLuIbx0ajB3z708mfts+gzaCMvn73W89wT9S/Dcw7kjrCSm
 1c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VR9EE00fMhTE+6DR1Hf+kiPhRLGTDrPJyiDc0tREi5g=;
 b=2F8Cw0FkqjrE3YPgm1mflZr4oxFk9+sJfG12HDAKljQ1Pv051CNulTuglpnPKSxD8/
 fsQkUitQXPzqNdoD2zW4BoXnGeK+a9/3SzNPbuuzYjqQDAdlxqjVEF1TiXLtOwJkCHyB
 AueM+kfjeFNIk5pEGrl9h5IWlcldO79oSdmnPPCuZhfjNVCi16tvYLE8fwzhgkuaczqx
 WdJr34PpHHhoPaPRnw90H7C7j74ktzduAXXcu1X6ltGki7tpc6HZ6gXsU3RG/ZkkNj6k
 7fyftkavS1OUYu8menZ484CkTwHIKiz6KPw1Rs3XFpGYJbW4tI/R2hyyHEAyBFYeMm2H
 Uydw==
X-Gm-Message-State: AOAM532EXUhPjKH/2k+EQpZ4ZJyoNgzbrdTiWFw3uT2EI2SQ3uikPUuy
 xuv4IrqxJvH3md4dPMYYh9dq3tB5LyMoNg==
X-Google-Smtp-Source: ABdhPJztQcLQ/JtcafI6l5e5wL4oBtF2wmODB8OS01IfCTpQSzoYAjCipIYtseU7CRY10OiCl2wAFw==
X-Received: by 2002:a17:90b:1652:b0:1bf:32e9:6db3 with SMTP id
 il18-20020a17090b165200b001bf32e96db3mr2970295pjb.179.1647327358554; 
 Mon, 14 Mar 2022 23:55:58 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:55:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 6/7] target/riscv: cpu: Enable native debug feature
Date: Tue, 15 Mar 2022 14:55:28 +0800
Message-Id: <20220315065529.62198-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:56:03 -0000

From: Bin Meng <bin.meng@windriver.com>

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v3)

Changes in v3:
- enable debug feature by default for all CPUs

 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ba9cc3bcd6..08266b163d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -788,7 +788,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


