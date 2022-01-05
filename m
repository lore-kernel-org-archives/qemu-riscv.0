Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYu-0007u2-2o
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:02:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYl-0007l6-Jf; Tue, 04 Jan 2022 22:01:55 -0500
Received: from [2607:f8b0:4864:20::535] (port=44717
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYi-0007Qu-4V; Tue, 04 Jan 2022 22:01:54 -0500
Received: by mail-pg1-x535.google.com with SMTP id y9so5809157pgr.11;
 Tue, 04 Jan 2022 19:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JHwHfuV9hmWrxQ5VW+DQoxoqfBUBj55UNvF+Xci6R6M=;
 b=S8I2n8o+RfNnWvQMdrWAKVuvNZVYgK11tO4c7DoOu1MG5/9qlarxSRdrIvYEmahjzj
 MYMNwsxlrXwrmXdpjyTxosrZy8uwGp6SGvdggKblassCw0ZMJPMTHkarDJnsWgRjGko0
 Hn/TRSbROBIibok6Ta5/zz2/FPu9RLV7DnZU/RpVaGWTbn4rt+/eQihF0B+WCaEncCgF
 /2g4WzswMh3Dpsa2n9mhUO9F4e5Mqk9JebqDbN1eqPcwCCNnS9/O0UHpz4fZreIDFowC
 HUT9KN9OirnNVhSVCxXEF9WTtAWO1XB8E0xUfiS01FqzYxfXT0MMhvvvyrY3lSTcjyhO
 f+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHwHfuV9hmWrxQ5VW+DQoxoqfBUBj55UNvF+Xci6R6M=;
 b=tBHn6hCtTR61REw19NWic3PvZzeBrya2VEcT6h4vFCO/QKTrmEBydsvf/B0Cvur1l/
 5p89K6F80J/R3tmzq76RLtjPWlKKHBKm8MHySmdjwR246OyY7bBcHgpMMz/HSE5VxG5t
 +8pwFIeeXr4KdgcMBpJrpJDNwD0TJINZT1UvoaHOarJrcGOPhQiazJqFmMBCJZcm8hsn
 SymUB2RBaF0QT2hkoffju+iwIuG3fzAWVKvs7s4E2DQbtcPC10SaSxtMKR6/Z0ZD3Iq7
 nCVuvyMMVgmOI/wN5DOSrKJxqYUWaN7jdc9ICtDKia43XSlNXQJYfuZef+ZfaKNTD5Hf
 DMIw==
X-Gm-Message-State: AOAM531A4+DAnu1LHwW/V6rj5ybLhFns/OZuh4Vs1knCu36pR0hR2WZc
 b5G7Mu8PFjufm2RevTeBwCS4aVVRTP9yJA==
X-Google-Smtp-Source: ABdhPJyYrxjdl1BMImyElA06pYYmJMbIN+NDi5X9xUpTmGqtx78+XfnFf/hlg6/vP71HJxmLADf4AA==
X-Received: by 2002:a62:83c3:0:b0:4ba:bb14:4bf7 with SMTP id
 h186-20020a6283c3000000b004babb144bf7mr53275627pfe.32.1641351710507; 
 Tue, 04 Jan 2022 19:01:50 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 6/7] target/riscv: cpu: Enable native debug feature
Date: Wed,  5 Jan 2022 11:01:25 +0800
Message-Id: <20220105030126.778503-7-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:56 -0000

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- enable debug feature by default for all CPUs

 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17dcc3c14f..17444b458f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,7 +644,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


