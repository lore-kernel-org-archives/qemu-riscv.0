Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSZ-0003h2-5L
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSX-0003bR-0v
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:17 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSV-0007yU-Az
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a79so8952842pfa.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/QB6MM6my3+zghgo3JxQFAhPc1E5NUjOg7eIVy9GGiM=;
 b=buYQOliX+mE+WL5ac2AeYndKjWKSCZ9sMPxk7f9R0GHBaTo/PUx+TxNKsw1Uh0IZmi
 34thI0fv7VqwV01mx9VIMpBhwYGx5ehO2W8DT8i/WL4jNVvfEaFdHaILUmkFjfUE6WlV
 tSYt6kRgS9e79HlEJ4i6MkCK+/G8fmEjH75w1biyzQ75CqJixdJ5uO1JjJ40eBbNmm/9
 WUAE2tprlJrR3e5JyXGgbeZBKHjP9UkPxyHv5+Z09V67Efem0Naqbj6HqsOwAOKEFTUl
 Zz1KVccdolOhcAjHADGCFLlTIYegVSxWrMa31vZicHxNdOUHigna93oRAa7l8wMEkEuk
 +OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/QB6MM6my3+zghgo3JxQFAhPc1E5NUjOg7eIVy9GGiM=;
 b=GsXKV4MNb07Vhhf53gOWJKr9AjjtA9+879QS7N1EQlm5fFGlc6oKl0Ut2mEhHpmxPF
 LHP/yJXNir6Quptvw4o+f5JrKh12mR+bHlJlxf8r48fieU85oB2Bg8UIIUKpZH0I1JQ7
 R0tuGS/1wi9H/TZKIJtC8K36tQGlmar+CDS2N4XwO5pVbPEudVG+J5w/3fjSiWCe7/0X
 Y4RJZRc1FbHs7KukzKMaA8Cm4Zf45LbAlFOypMsyJ5RV0hAg5b7gZbg27GwhiBS9iJN8
 MDKRqJwEC3o+UCM6es2xk+J3AfmZzyA4fejFyIw7CmYB7HQBW3lnngs6G/o6/8effr8D
 hYPQ==
X-Gm-Message-State: AOAM533El2ci97CMm5h7UlhPglX3C1jpkjdgvaPUn1kROXuTDinHD6RQ
 OhW7HULYwRkkg7y54wwKkhHomA==
X-Google-Smtp-Source: ABdhPJzYjXAy+6IuWMEODwoxK+naZW3j85ipztrpPH+/lQkK71rNhRE0ZqweZylkLWezS7c3NAKUTg==
X-Received: by 2002:aa7:9a5b:: with SMTP id x27mr7453062pfj.15.1596710954111; 
 Thu, 06 Aug 2020 03:49:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 46/71] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Thu,  6 Aug 2020 18:46:43 +0800
Message-Id: <20200806104709.13235-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c4fe9767585..2e305d492d8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -438,9 +438,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.17.1


