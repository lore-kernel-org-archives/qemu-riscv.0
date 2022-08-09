Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLGg2-00071x-9g
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 00:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGg0-0006wk-TI
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 00:17:08 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oLGfz-0004ah-92
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 00:17:08 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10bd4812c29so12711722fac.11
 for <qemu-riscv@nongnu.org>; Mon, 08 Aug 2022 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/6PKI0QUD/9+yYYe7TmpMU06G0Kr05B5w6N+00Yhr4M=;
 b=SRWrWnpLYToiJN677yUU06TNWNUZTMMzZLITpRKIbOakokRBcNH3q1vy5x12N3eoNd
 Fcxo9nHvItLEUd2RtQtVgPTawtQNg9owl1ZkkujMAyF0w3HCOLYHtHAtz05BdiWhRcbI
 Xy4DuX8YYCjkwSRsy89sACIbyuLyAC98nemcHdajffyHljGcL9Cvdw1OKRHEe52OHJYv
 /Vt6Nn7BLWeuksHlNymSA2HZEx1fDpA7SayquhyhgEwRkeBDMOpyg6Eqyv9oZQ78wg/P
 k9WQTygmSWucyCMzNqOoEgkloBhMSLWhI9RqfNy3QjLfF+UVViJjjOvm/9yahwG+GQEE
 W8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/6PKI0QUD/9+yYYe7TmpMU06G0Kr05B5w6N+00Yhr4M=;
 b=umDIfqLde2vy2hgmoAoHI6GO7iix6srkBlk7LYosnVJ5E+gXocgTs7qdm+v19qwIuG
 qCwB2x+g1Qfk7NiIrIzjjye7f7muGTl0emElFgH1+elBvH4Cm4YOY6nVCe7DNsQDPDVl
 55s8wwGPXmtqOMbB58Wf3WSx9EzkJpdM39fuzc5xxdvkSTdxZhRxenvwU/b7g6+ZDEvZ
 obsbpqwO84oJYZtNuqxAaUlznKQEFTZpG1gPGl4266lcRFp0qNvp/cC6pDbFze5L1IKp
 //KAuNTmVaD8zRxRkVEWU1Lg0EIJis2SDfQA9ICjGBiM7hMLp+9xS+MYCwvzGrb4DWbK
 y6/w==
X-Gm-Message-State: ACgBeo3/p6pVbQopPcwreUTQ9qG379aZKsQSDXuNnqkyetJtDqh1mkf0
 d4aweXjsjAzFaZ5A/+V8V6dSTg==
X-Google-Smtp-Source: AA6agR7C36NQ6nipu4XJ4x4bZAYyM/KkOiYWjt7gNU8MP1ttlSUiLJZzKh5creAQPV6DMpTMOG6tkw==
X-Received: by 2002:a05:6870:f20c:b0:10e:e5e3:dac2 with SMTP id
 t12-20020a056870f20c00b0010ee5e3dac2mr10327621oao.228.1660018626103; 
 Mon, 08 Aug 2022 21:17:06 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a9d648f000000b0061c9ccb051bsm2712738otl.37.2022.08.08.21.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 21:17:05 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v8 4/4] target/riscv: smstateen knobs
Date: Tue,  9 Aug 2022 09:46:43 +0530
Message-Id: <20220809041643.124888-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809041643.124888-1-mchitale@ventanamicro.com>
References: <20220809041643.124888-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Aug 2022 04:17:09 -0000

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d4635c7df4..d8a0f4e700 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -99,6 +99,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
@@ -1001,6 +1002,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


