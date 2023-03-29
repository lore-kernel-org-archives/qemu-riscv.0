Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZc3-0004O3-SR
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc2-0004Nf-0Q
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:30 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZc0-00016q-9q
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:29 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 h22-20020a4ad756000000b0053e4ab58fb5so1499705oot.4
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XN8QwlWXfuuvqzT+MC6qiuRxAks3MkDcrO5Exx2TaM8=;
 b=lmCHK7a0YbNP2rX3QzrZgeDDRab//x0RzDlWqvmUV8hnbvmbo33TcGnLXtW5mP5fga
 g2dyhtO9QcC5Mh9NrvLt3QZAlT4OygGrg97DbxXZIwOtHrKHucPNNqaMy+fbeigaLZ8y
 E/2sR1ps8mwootV4dUYpuUGOAurLtkKxCjB5hv96USwAIoVcFsSkVykqhz4tpC1Dzi+j
 GxkBpJZbIErBdK1kHFX/RoZF40se9iY1MWa/ndb1UIhatZvunEw/RF3Ycel1NhB3ewdb
 YoQsZdCYBg76i+7gYlU6NXb1F+Q18mT+dUJ2z1Ynbnz+vBWmkaAGfWGzXc+lsnypHNoW
 tvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XN8QwlWXfuuvqzT+MC6qiuRxAks3MkDcrO5Exx2TaM8=;
 b=SSvMuYevXxWfm+iaggphqw1jTc2VuiDgt1y6MBAINeMrihk5MggzvirI1dGn2N/gAs
 O29JXOh70QGhDaDV5sWqKOJbYbk555Ygcd65v3IkgdIEHqjYDqOzVxqMMouZoIZRnz3o
 WoNFH/Nonw3KuGP8PUGuwT8no3tJtWib4XE35eOoX68oeV8iMR5duRSIA0T5POw+TGSY
 IKwnrQUcYPDdCSSUnE+ZvEja3n6s0WMVyuezJzUJwnRzZGz8N9trbFtQOWHfLk+PZLY5
 j3bAbmlHXEgUmKyHqO8pBPY3Ez9U31+O7q2EScOtqQ5NTMd4L/SXoTBd8hy3y4IoHDOx
 EjBw==
X-Gm-Message-State: AO0yUKVWPzQJBbqiqusGgxYEAYNa+r4rpNbDJo0eZYpj8nq+EHVqeJF6
 tr9+0wRtLILfmkI67FwScVOPog==
X-Google-Smtp-Source: AK7set9IxU0pmN83YITfc5tPeGIkOrKTB2AGxR6XdKGH4J4AmIehoe7/KTUbLmDEZ55V/gaauhl5Ig==
X-Received: by 2002:a4a:558b:0:b0:525:42c7:9a5f with SMTP id
 e133-20020a4a558b000000b0052542c79a5fmr12040744oob.6.1680110967259; 
 Wed, 29 Mar 2023 10:29:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 06/20] target/riscv: remove cpu->cfg.ext_c
Date: Wed, 29 Mar 2023 14:28:49 -0300
Message-Id: <20230329172903.636383-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:30 -0000

Create a new "c" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVC. Instances of cpu->cfg.ext_c and similar are
replaced with riscv_has_ext(env, RVC).

Remove the old "c" property and 'ext_c' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 7 +++----
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 63efd1b313..693ff10cab 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -400,7 +400,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_c = true;
     cpu->cfg.ext_u = true;
     cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
@@ -1108,7 +1107,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_d) {
         ext |= RVD;
     }
-    if (riscv_cpu_cfg(env)->ext_c) {
+    if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
     if (riscv_cpu_cfg(env)->ext_s) {
@@ -1438,6 +1437,8 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
 static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     {.name = "a", .description = "Atomic instructions",
      .misa_bit = RVA, .enabled = true},
+    {.name = "c", .description = "Compressed instructions",
+     .misa_bit = RVC, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1466,7 +1467,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
-    DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1580,7 +1580,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_c = misa_ext & RVC;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f703888310..c6dc24d236 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -424,7 +424,6 @@ struct RISCVCPUConfig {
     bool ext_m;
     bool ext_f;
     bool ext_d;
-    bool ext_c;
     bool ext_s;
     bool ext_u;
     bool ext_h;
-- 
2.39.2


