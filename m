Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYObb-0001ZM-Vf
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 04:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mYOba-0001W3-9d
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 04:18:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mYObY-0005sL-B5
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 04:18:17 -0400
Received: by mail-pg1-x535.google.com with SMTP id q201so4933856pgq.12
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=az0PyQUrgiu40mZYqhgyAjMGnVo/wqEUkt6vs4aCBq8=;
 b=BHL88myk0PfQ2xKkix3+hamFy4Mc1N/EmMdgPBzeiAj4vFxqc3WdXuGH0uqfmtneUb
 Of5lKWmFW8wkSnsnyh1Br8nLNaf/5PxZmncQQXkNrF0BMW+mytK7EwVDZ8QNXSC/jMmd
 9wE/pwW6BvSWukm+NapUzUzLBsb41mLJlhaeNSVjHplUfGItcof8/NMZBtgveuEgJ/58
 jgw15+jKLNyk9kDSqwb7EyDj5L1ebwveH/3APIN2w75HKa9UXSmOg2pk2GoQ0m2zUq5G
 5E1f8+ueMPLhFt9dv+Ve/Ns3u/u1zAxx7kyB+JcGWjE9EYtP3n4mQXvqjQi+kw9qoSBT
 n/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=az0PyQUrgiu40mZYqhgyAjMGnVo/wqEUkt6vs4aCBq8=;
 b=Zaufk9bM+zDq5D2aiy149Cz0hp2/0XjQITEbasMR8EsVZAdXy0KXx2uKjZkKkfeurt
 E6dQ2AX11SZLzrbYJ7sE0Tz6uxnlOIwBXGBzLcr9L9hLQW9CoZv0Jl6ImYqWaDti4s3y
 SgrgzXN3X6QCWKsGsB8U1JVWAU/dHBFqKx6tXas1EjlWx5FTL7lv+5vgOFbfnc7XLbwz
 RdymUKLKfYjzG5Rkdv+FTDsLm76bXdt1Ma1oaMEOchFYBUCkaGoZynqfVUKcSdtx0AKx
 5h9GIF9KzYGbXj1EEinPVpwYoYMxQoxY1pMLZIGF/mvDQQaFo4VqCYN3G5FbhI3NzCjw
 0sOQ==
X-Gm-Message-State: AOAM530QNqAzcHDO/1gBpKMKpP6StjFLK7lO9aNTEKbhz1Q4eHCGmTGj
 evzzd+aQCgX0ieFTfqBKwtWEO/Xl8YIdRA==
X-Google-Smtp-Source: ABdhPJxzq9KcVhwkuvL5bfGllbl5VVI94RRPfDxv29Lxe/Yjl8JJk2QFvappN3JfMUzPMvCNBSkMGA==
X-Received: by 2002:a63:e741:: with SMTP id j1mr2337085pgk.86.1633594691729;
 Thu, 07 Oct 2021 01:18:11 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v20sm17056647pgc.38.2021.10.07.01.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 01:18:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
Date: Thu,  7 Oct 2021 16:17:41 +0800
Message-Id: <20211007081803.1705656-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Thu, 07 Oct 2021 08:18:18 -0000

From: Frank Chang <frank.chang@sifive.com>

oprsz and maxsz are passed with the same value in commit: eee2d61e202.
However, vmv.v.v was missed in that commit and should pass the same
value as well in its tcg_gen_gvec_2_ptr() call.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1e..f730bd68d18 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1619,7 +1619,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                               cpu_env, s->vlen / 8, s->vlen / 8, data,
+                               fns[s->sew]);
             gen_set_label(over);
         }
         return true;
-- 
2.25.1


