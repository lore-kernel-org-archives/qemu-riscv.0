Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxf-0004ts-JC
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxd-0004oK-6T
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:32772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxb-000284-HM
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q123so5544469pfb.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Scdzj96FfL7pUjXSYLA4a+TTflohdoYCZ5nFPT7xIBg=;
 b=Yz5Wb0JQ8u2PJldthxenMFbKpfzj/+8Lt7ZhRYJAJjPf+o9tKihB1as+HhmXjz4Ttj
 vC6x/iw4k2Lv0+UrW2+9q5tdOft69yl5k2jsrTTBWnNnEOq74gCdPgGPQzgpwzJlCInF
 1niDUUEoGKs9un0lYx+28ZIrYAGZLI4MHn/WsvKuH/fvNjOfFiJq182cRzJ+1ZDa0ia5
 7NdmvV3g4hJ0bBZCkmUpKGuKnRywwioQ5N/bksNwAbG1MTe82ww3kyqLq/2hA2H7YJdt
 ywxJ2w+RSUcQ80R5LkAvkKlsHtqG50cfXnjwQqU8PebLdh2rkJS4rC9fTDcr2Pf7f2fp
 gaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Scdzj96FfL7pUjXSYLA4a+TTflohdoYCZ5nFPT7xIBg=;
 b=YdwCgSxXfmbcLiBlNNjyaKT83yYUh1JQEUAQQuv/gpkHjzlHPqduAa4B0yVMOKiG0l
 ZoMoHP9Q2tQIc6AJJndQElE52aK7O+IVTeckUQNrmvYYu5d/H1bAbt/XhTq0GJiKFYGr
 qpl6OWp6VfJxMnOBtFM/k+v10GsDxVpG/ELTT58lzauAnybYU2AoZfXqgfQNRWiiMftu
 Ax6fcxLKxSqp4I0a42ggp5uLeb5sWwY+haOd9dBaMd6Xm3Sjuc6LPTYDfgzTmWqksFHj
 lNiW57GV1+5K96R+MqNwkexU/LM3+NevM6VlbqhBffajxg09kL0k/L9IsTvK9r4ix6Jm
 p9Fg==
X-Gm-Message-State: AOAM533/I8Y48QF6KT6gi6u/X5gEo6ZyPBllCr8y69eaY+UNEvk12A+F
 qiODgN9LUvL1n17CqxMEBT/w3g==
X-Google-Smtp-Source: ABdhPJzqIP5yhs9mef/3BoMjz782TpvYrlM+ZdsEVdVY4/Op3FOme6eKfZc/DwaCCEKvUANJv3ZfmA==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id
 k22-20020a056a001356b029013e5203fba3mr5295969pfu.3.1601406406361; 
 Tue, 29 Sep 2020 12:06:46 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 26/68] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Wed, 30 Sep 2020 03:04:01 +0800
Message-Id: <20200929190448.31116-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 44d35c0271..6c95a3460a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -538,7 +538,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
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


