Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plsHH-00012P-41
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 10:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsHF-00011h-9o
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsHD-0000Pq-Rs
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 10:13:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-246bb512038so80538a91.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136026; x=1683728026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OcH4w6tRPn9WyarG+LzAEbQ8PKEmCZEgzDYRD1X2f0s=;
 b=WdAeWmWs4AEobpIJcf9xEinJEzl0oQNoqp6xEFW/g2+mx4mfKCedj0gvu1GjFUE5KT
 s4Zk4eEvIN5K3vXxZZ3oi0E4wewk8b0ACH/HLo4xfsdEoCUVZi+ketL0GwsvRZpSMCE0
 MP7xcvZDZ8G1EPpXmq/0FjB5Nb82+sCGPjFUPlwWgADxYThOUqi9P/8FL9roxmbgHNUZ
 Ac50YeYfXb83YOu6v1lWP56NnBNW8M1PQgcxr2er8MuEh2TTodtgQgsBCg92F4epSiMx
 JyJ0hBP2TwGg6UTWT5sbIX+ftmvBM84YaO4FOfSMKr3D+j2HgEzFaQ1bo0Ri+9gvnYxF
 gHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136026; x=1683728026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OcH4w6tRPn9WyarG+LzAEbQ8PKEmCZEgzDYRD1X2f0s=;
 b=BGnK4Xmv4ne5+kY3GcM8M+yazwGt85Y1nKTOpgPg+WbiAqOO9s0XBWd190c4ztYNot
 bazni8PldIiGpBjlJqMBsD9aO5wSiw28ETV2hegN5aXB+XUQcTWln3/sRWCNtcNdx0FO
 35vuHCpaeaTgm4a2jn2PvvuYeJRuvcoU+tOdg4EF5wfMBn/kdzzQ5mt5LjJfRIq06jXq
 ABooDLP4SzLN5BGk47+noGJcus5laaM+1AJjFRjOp2fYHdkcGpngDUQS+lLEXZjGM+XX
 eunnLbo2GaDLCvB7LyOD9b2tunW+Is1Nl/rLARAbdzoWTiEUkjvuqYLzvyqvJCk0Vyl4
 tROw==
X-Gm-Message-State: AAQBX9dPeYaSDaWjWcmdpLgCXOMMa4kc6ADH3NCgfLhykojxA/t/PWuP
 fB1kOhMs5RCBElcDE0Twbd2F/Q==
X-Google-Smtp-Source: AKy350ZnzifSjf0nEQ8oBZMBe+7i7bIzUfTWtdzWU7r2NC4yoU+xKjLnxxf6Lp3d2jITMg8F6xgazg==
X-Received: by 2002:aa7:960f:0:b0:5a8:4861:af7d with SMTP id
 q15-20020aa7960f000000b005a84861af7dmr11954953pfg.20.1681136026590; 
 Mon, 10 Apr 2023 07:13:46 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 4/4] target/riscv: smstateen knobs
Date: Mon, 10 Apr 2023 19:43:16 +0530
Message-Id: <20230410141316.3317474-5-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141316.3317474-1-mchitale@ventanamicro.com>
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 14:13:49 -0000

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..4e926b0143 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -112,6 +112,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
@@ -1395,8 +1396,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
-
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.34.1


