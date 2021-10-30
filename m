Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgops-0007jI-AC
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopf-0007ZP-67; Sat, 30 Oct 2021 09:55:42 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopX-0000eD-Fw; Sat, 30 Oct 2021 09:55:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id b4so5618662pgh.10;
 Sat, 30 Oct 2021 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmLuHzlvcb9WcoNLmfNdT+VYLFfi+YqVA0HLjJbSjzU=;
 b=TGAEvS+mR2N/PY11Pzet140i7MLxASlkFQcTC/2rmhEnu1oJqgFPupMyY64ljSrV81
 TRuBBBWOw3Mrs+hV7OdkYS+kkSczb8T+aTw6NmHjIYjGmFMS+zH/p33ATJ+KHoOfz4lJ
 tYenbHvzuprUl7CfgtLsKeXQRZptwHvCM9Sh97ARj5WBluf5P/ZukRXylmJOUSjER8+u
 QYEs6+OvhviEx9PzGKqFoiERdO2g8UtA2/8PQcBnPS21+oDhtdKfekibDppnxMe6SZhG
 KD780C4AlUUoaois3L4gDwkSPkEPuDMg12fjHbp6g6a0bPw+1XbIx27ncumb5A9VERFK
 qSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmLuHzlvcb9WcoNLmfNdT+VYLFfi+YqVA0HLjJbSjzU=;
 b=eiCGryYMuoFO8jTSWhpUidW4Z0Le1n9wb99HrzJVnhQWUEFdMcEvOpvKCHxkQ4b2by
 G8ZpRSw+7mfCpt/YRY7dV82ZNfMgjP0XA7px9kq8LFY9NddBh2+MpZO35+vUDGDoH1Dq
 p9QF+OTBw2ceLf38KCnBAM/ymB0f4xexzzf3pP8FeIKixfmfVYjjivRUKGUNKy/HDrc3
 df7OZ9sGT9B27FGrHpkQIYZggWyB8hWI5YY+H53611/GMwdlB8UoNyAi8FTKb/19T4tT
 kw+ik6y2UPKbN1AWwh339neSSm0OL0hoZXHVnFxBXzLA8Jt12De3j/CYLJbwppcYZGR2
 CF/w==
X-Gm-Message-State: AOAM533jGCPipCWxusLRMdUMvkXaE4iX4LaHJjMYFJPh2JniYfRQFAtH
 2A6U2g/dfiAeyQn6Gvciham6UglUlm4=
X-Google-Smtp-Source: ABdhPJwi61T7xbSjMeoy3ZZNnPVh/Jo2alySGef9chh3I4Myl52i7HdTXZXCG7SRk8cuCZ11yoLtfQ==
X-Received: by 2002:aa7:96f8:0:b0:47b:eb13:e0b6 with SMTP id
 i24-20020aa796f8000000b0047beb13e0b6mr17488645pfq.27.1635602127035; 
 Sat, 30 Oct 2021 06:55:27 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/7] target/riscv: machine: Add debug state description
Date: Sat, 30 Oct 2021 21:55:08 +0800
Message-Id: <20211030135513.18517-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

Add a subsection to machine.c to migrate debug CSR state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- new patch: add debug state description

 target/riscv/machine.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..25aa3b38f7 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,6 +164,38 @@ static const VMStateDescription vmstate_pointermasking = {
     }
 };
 
+static bool debug_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+}
+
+static const VMStateDescription vmstate_debug_type2 = {
+    .name = "cpu/debug/type2",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(mcontrol, trigger_type2_t),
+        VMSTATE_UINTTL(maddress, trigger_type2_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_debug = {
+    .name = "cpu/debug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = debug_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
+        VMSTATE_STRUCT_ARRAY(env.trigger_type2, RISCVCPU, TRIGGER_TYPE2_NUM,
+                             0, vmstate_debug_type2, trigger_type2_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -218,6 +250,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_debug,
         NULL
     }
 };
-- 
2.25.1


