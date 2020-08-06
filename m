Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRs-0002j1-16
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRp-0002gM-GR
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRn-0007rr-Tg
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id f10so2368735plj.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fR4JpsXJUuT5lJNobC6iQBq0EFUGSIwBclP3cnYK+Jo=;
 b=hIqzOksJkAKffpftrP2k1yMu0k5UaCvMrho+0eVcPut+IRsGq4xWUV+W2/6u3AAXsd
 pwnuvO1XugCLOMhr3n8r2+A8We4fK2Xe56pPaJA1FnlMuLvJ/7B0+7k/VvCTHQxNqKPR
 3ijBATdcdFfANrGPEaPhn/8ddv6bIXppgOF8t3rLdTFr8CCKH7FEEwt5RMkm7Xyi9ca2
 x+rf000F5oHVpkuz6NDUFFkiuP5dcjoRGvH5QDasXCE6IN9KfaZnwEHwdScpUiTFJGEG
 JJogtZdFQfhwDjVh1M1RdCZ/+tejr8byDdw/4LrJh7wGUZfTSEyO6KwSz1Wr1W0w/TpW
 Kw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fR4JpsXJUuT5lJNobC6iQBq0EFUGSIwBclP3cnYK+Jo=;
 b=N5O58HKPvJ1/PVjDn3yp95bOHVsibiysfp9zPPnf7vgm5NxMwvnmlZQGaOZe9O0oNJ
 sMignBThiRxHVSqRWow01NAZSbx0OR5aZckDg7Ccw4u7yvObWYlzxpk00DBZjmEqrs6t
 4bbTLobqN7cCE9ivYL9Qfhwu2QJYeTZk11RUYd8yDjmb5RfAMIGnK3xzAWWsCWEVWJHL
 OjDA0423xYNODSWzuS8LgZSbaFTV7ZZpwJzQl4GM0+OE0HL6jvhooYE8Ppkpw336CqRj
 ijKGQOCBwXHFMqPwJmwq8FuXi/GM/KNtDwzpF2F85w6dCOY/XZT2B97EI3xEV4TrKNcl
 t8kQ==
X-Gm-Message-State: AOAM532khgabgm7ilzSIQHx0vTDsr6c402+GsoTSstocJ/uRPxiXoL9l
 aVpQI51ciuB6QDIRG7MByIDtyA==
X-Google-Smtp-Source: ABdhPJy4lCpitlQqAlmK+zbQCX+WjIuXjMSS6enJ0MuGJ7A59MAotsk9kDlIqvf+eMeriwKb6upOMw==
X-Received: by 2002:a17:902:8c8a:: with SMTP id
 t10mr7178377plo.112.1596710910735; 
 Thu, 06 Aug 2020 03:48:30 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 28/71] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Thu,  6 Aug 2020 18:46:25 +0800
Message-Id: <20200806104709.13235-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:33 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c99575d1360..f142aa5d073 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -527,7 +527,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.17.1


