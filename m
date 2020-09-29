Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKyo-0006lg-F7
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyn-0006iN-4S
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:01 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyl-0002L4-Bv
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id d9so5547151pfd.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dKXFHFiIXP9JYtyVSpnpgKdh+GGJff1eG/Jdv4eJQdA=;
 b=G/uPhAfrEjiQeaFt8vphLIpubrGPlS3A4DdD5YHgYNtpSen2bEmEZfBepL65M4ImBJ
 7L6cLBLXgl2/PbGvkY17ERJseqRUAg0ZTvSP8qIadK6+enFjWqhOcAYgPyF3wiujuoNp
 Go0bdg77LQMRS8Ss6Z+JNZ644DuT+nBYiWb+ds+BcxS98FeJ2Vs38s2kZ6A/Lk+uw/2j
 NkwKoz6u8LZElj3ID5fbJNwYsdsgQ8wbzanWToUCslI/22J4UUbIWrR+YKWFEoN9QEzG
 sKmCtCQwxe0qBrH1CjhYSB0s8UcTHAOQuJMxJnWcoo3MDArP/keT7UJW31Vi1ZBZ3YNs
 GcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dKXFHFiIXP9JYtyVSpnpgKdh+GGJff1eG/Jdv4eJQdA=;
 b=DKCtQNm2NSjN5tkyecxu+v2aA7Ep3RfGva5QEXToqvNclkYPfxg+GR+6zGgiAJAF3x
 hVGxYclU1SvDTxGbVSI9HeD9084YnIPGM6iDftkoGFP9XQzM+b5mJa2x3DAQSNSyBETj
 UIXuJStcNZeM+0UZGlwLkR26vXHHAQjbWQ3dABxWmzG5iXjUSwlRM4RzxYj3oIiAli+9
 wvQ87U6bORLQSpa/CiupdlCRA423XajASzkUVKf+6cA3lxTXGAYvkwbc/TcVtb2w4PZW
 NiH2n3IdHpkGPLw3NG6P3YaWGKtIbkXcdI4wTJclBbU6J4skvh2Kb/BYjJlDpXc0BHrq
 WhsA==
X-Gm-Message-State: AOAM530clRMNOaq1BlWbsId9HWnNHLnJLpebcGsipbYZtpj1q789h8hH
 LAV5JzfPjUOCm2Bn4SDJPTSGtw==
X-Google-Smtp-Source: ABdhPJw3xaPyYcZqyFLOhPzrQGkTFiQZCIHD93fsd/i+B4aQHPXGiLbHVY6HzYwATgZAoe3z95p1aA==
X-Received: by 2002:aa7:8a46:0:b029:142:2501:398a with SMTP id
 n6-20020aa78a460000b02901422501398amr5252752pfa.79.1601406478028; 
 Tue, 29 Sep 2020 12:07:58 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 45/68] target/riscv: rvv-1.0: single-width saturating add and
 subtract instructions
Date: Wed, 30 Sep 2020 03:04:20 +0800
Message-Id: <20200929190448.31116-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:01 -0000

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 746db60337..16f051a8d7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2249,7 +2249,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


