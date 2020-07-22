Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAus-000267-SU
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuq-00020S-U7
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:56 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuo-0005dQ-24
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id cv18so2629359pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4piOJT33/Ks8zF+9lTjhNZDrDdEfFTDr1vcWWDQC6yw=;
 b=C1uNwpcn6DVXbFosicjBeiHqTCuaxM5YkcRemZVJjGjBew1JJzG8e++v3GiVL0w/aA
 ahtMlU/hlI2QoVjuxBfgkhXJdLK37WqRICOwVCpDswK0FpkXfkwHyWzPZH6vfOPoXEIV
 rG0EcH1icZgQ58y/tiIVuPizuk98bXY4VIPqNZWTtGpOf4THJBTfCGnZOYV5+H1a050j
 /vaL3IAcnd62WdSf5ffM8shoQJB8U/w5EbjOh/Crk898A0Fu+XQOW5f8MJ/cmq+cHdju
 btzYuGBUGXdWfeTzWVMEEeAdHlq/3j7gxkPvETF2GxKemR3Rftk6sA3QT4R+FwPbpn9d
 xWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4piOJT33/Ks8zF+9lTjhNZDrDdEfFTDr1vcWWDQC6yw=;
 b=ooIqO5Ep0nY7Q+ur1MiKIZkVqXhq5FtGd/iI9Ab/leQeYZy9cn0Z5Te41Iqyse/mjj
 XtparK++rySeJHX81HhxGsjaNHclfW+hsLHnym7wGcdwXjGTWHhCelf/edpeksfDEoL8
 OFJpQTLf4+8y08OXG53QZ38RDisk2TQ63m3We+VzAHF6tO5pADXRCYEhg+VHRqWggZMC
 YGLi2iuqXQD+Q0H+o4qNSmvrCw5MznorDopxSljlzmD/zueyKuZ4D6sYnbW4TH6PG/pZ
 +Ef1e6pzF74gq+/J2mq3GpBgOZXxHUpv8A6dfGZFUK8/KiKtD5kx9WX9CW6bOcd99/vq
 /RMw==
X-Gm-Message-State: AOAM5339CCazPsoANdfknZpTMdJls7532d2+0pZcRcf47Jt/D3VJKy6s
 tFrLyqiUb+GOxseGNpCo0AM0PA==
X-Google-Smtp-Source: ABdhPJyayt+RE2BbcPL5Qbk+24xYDL0+o4vI1yRNlbnIekYyi/8DMIRymJkUzgSrUkugz/kmdNgxDA==
X-Received: by 2002:a17:902:7292:: with SMTP id
 d18mr9103648pll.137.1595409592826; 
 Wed, 22 Jul 2020 02:19:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 31/76] target/riscv: rvv-0.9: floating-point classify
 instructions
Date: Wed, 22 Jul 2020 17:15:54 +0800
Message-Id: <20200722091641.8834-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1d34fa647b..7ad936e605 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -532,7 +532,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.17.1


