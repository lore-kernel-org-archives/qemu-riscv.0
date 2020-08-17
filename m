Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asL-0001jd-Bv
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asI-0001bb-Ev
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:14 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asG-0005DA-Pd
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:14 -0400
Received: by mail-pl1-x642.google.com with SMTP id t11so7172859plr.5
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8AHmQ9os1R8vl3YkHmoCbLc+gv13dnARAhx869gfPzg=;
 b=IWs5liFYvzjxU4HMiUKZIneCpgs8hPUaSePflrwJwNg2HOUUHbYMqiSX6RFRNe+XPW
 gS1wxt0l5Qmjk+r/2Bo/nGddO5/EG5/AgXafZ2gaI5VmSQE+qv8bM1ViffS4Lu+XGVAD
 BEl/+CX2CHh39Z2zJ622bozMi0o/BgoCu5hlaVj3kdKFLvsJcn1ARn8YohCqKdLqis3p
 6qD3hmorTOH/BERHO+4FMOza5LZ5MtNrnSzulWwzmjQc/KMZ8v8Eq7KhluiPtiGDSa/f
 WGoP4YildEke7+0d7CnV8rysi9CaSk1BOJyPVpxdSKCNTSo8NsWXd5/Lto3Vyi91pT0D
 6C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8AHmQ9os1R8vl3YkHmoCbLc+gv13dnARAhx869gfPzg=;
 b=VqgXwpQC4UVP7STp9AQpoJ+XCHXnpY6ZcwZZqZzia11pT/krLShU4FDTPIxD4f+PqI
 KcQOveTOPDo0nZaVgUQcEpP7cIIv55maMSvDQTYaFONOaywAPCAIbv32HIrwGXr6QAV7
 cz3Ai3dolp/YLMVHabNj++IlOrL93LCy2sNWDG+0SMX6iuQcUyIjoV0Fvi3h3olnZief
 XSNpqDNXwAwCErCLsDEcjajJdwcljoQEG+rz3kd+REpjesG+l6ImlKf+0belwvOkWYIv
 0z8v29q7yqAXBJdG2SPAIXQJRW9bvCJYVMMs9sUv9c8UuxIVzhIXxDTQrODx670+5Ix0
 pPqw==
X-Gm-Message-State: AOAM532rPUKh8vyBAETQ1oZgXek8GRMDTOHblQCDvv97RNPEWvXk2bqp
 6uiboMoB3FwuZf14TEraTFw9Og==
X-Google-Smtp-Source: ABdhPJwzP/2C/IfXvbLIi4e+VlI+Fwjhw2THeEZJEXohEGkhv594nIKpKgjXgWEzkaW79Etf1mHYJA==
X-Received: by 2002:a17:902:9345:: with SMTP id
 g5mr10674558plp.192.1597654331516; 
 Mon, 17 Aug 2020 01:52:11 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 45/70] target/riscv: rvv-1.0: add Zvqmac extension
Date: Mon, 17 Aug 2020 16:49:30 +0800
Message-Id: <20200817084955.28793-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2020 08:52:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c       | 1 +
 target/riscv/cpu.h       | 1 +
 target/riscv/translate.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 085381fee00..8844975bf94 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -512,6 +512,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zvqmac", RISCVCPU, cfg.ext_vqmac, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 715faed8824..6e9b17c4e38 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -285,6 +285,7 @@ typedef struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_vqmac;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0b3f5f1b4ba..5817e9344e9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -75,6 +75,7 @@ typedef struct DisasContext {
     uint8_t sew;
     uint16_t vlen;
     bool vl_eq_vlmax;
+    bool ext_vqmac;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -870,6 +871,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_vqmac = cpu->cfg.ext_vqmac;
     ctx->vlen = cpu->cfg.vlen;
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-- 
2.17.1


