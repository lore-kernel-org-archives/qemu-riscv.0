Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGAE-0002ov-Ic
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAC-0002km-JQ
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9w-0006vd-98
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:26 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s15so1098592plr.9
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dti7koq9DQcuH5xVI8JF2UeD8QDeQp2eVQLoYkRGiyc=;
 b=N8yb8GUJIGVWoVjbJ66nqrIlGy6rvVVXK/TqU5KKPfH36R4WggJn8gCu8c/GrhlyUG
 C+9mOyJ3r6iZVsSQ94zKh2KnmqoSMhD2JSWrYfoYYaaw2txFiCucfSQcwVmR7RUPjoiY
 lrCUMhUXwsmF1MROKQBWOYOlQSWnGanEa03ZAHS/8Z8QbOxb5hcIfg87EC3zEORCOF91
 zg/v9r7D6MrBFSNKZTAYPFpbXhz9wGlOOzdgBOKl5++2+2k4HDzohkyplHBjEDwRZRQY
 fC3yU1s4zNmRKhal0+jqpbnBoCLaoJMvigHP2whtCJbT0JczflugXCsPPbdr/eT4kSJC
 ZWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dti7koq9DQcuH5xVI8JF2UeD8QDeQp2eVQLoYkRGiyc=;
 b=RWei/jGUzO544ry51fkF5zNX+F2i/CHWnBD7m7sccsDTX7qg5+Xup+/aP7w36InA5g
 tsta9Os7RsmPtAkHyLdUW0Lwp/9YP0FHfPAv3yIyquZFLlZIJAhFnMX5rEnhEHBJFPHc
 +0Vc3Gk8ehSk5CNoVcRkkCV1YR0shxnWJwQhb2uNCqb+d9ZD5hb3m5Tf7P5/4bZRkblM
 gU5fsTvNcdfvqk5bsNTJlpsdBZXrTxAxOUPGlgZjDOvpMetxPDIzANs8E69o2iyOKRt2
 xg5ZEBbmt7Zwy0NPDT84/ApZ3vDIUtmdn7OrvJRurGB1OUcHG6sL/zgxc/At/Z2Pa0ZJ
 +nVg==
X-Gm-Message-State: AOAM530TE8C0Zid8amYHPyM5oxC72V/E/ezAoFO2X0mTiLvXwsDovacO
 r0L+Z193Mezqx4rRpeFScBk3ufo/S/b/cPM4
X-Google-Smtp-Source: ABdhPJzkgVBwjnK+JHKWGDTZ/oiwtdYtCwxXCUT9vFYZwWSYNY1hlv+spVmLRm9wyD/NEYoYn3EWfA==
X-Received: by 2002:a17:902:d351:b029:db:d63d:d0e with SMTP id
 l17-20020a170902d351b02900dbd63d0d0emr4372011plk.75.1610444413893; 
 Tue, 12 Jan 2021 01:40:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 04/72] target/riscv: rvv-1.0: add sstatus VS field
Date: Tue, 12 Jan 2021 17:38:38 +0800
Message-Id: <20210112093950.17530-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:32 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 82c48b7b9be..8edf81692e6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -414,6 +414,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50862df9e82..a70a78386da 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -448,7 +448,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
-- 
2.17.1


