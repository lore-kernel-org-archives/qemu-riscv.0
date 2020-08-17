Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7arl-0000eF-GN
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ari-0000Zr-V5
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:40 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arh-00056D-00
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id g15so3266919plj.6
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5gJQpQuBdx5+IRqoLCBuH1Sdjx31gU5U1EvDuXvWhTM=;
 b=gPLkrDuD2m4pKCNQx88ws2dKEf3vRIFW7Nla+ZxMhaActW0DUKkajMV4SthEtlt3Rv
 H/GBAvApITL7de5rLy582fdFxSRSaQHeUiBpNRPOaBZILN95U8RTTvx8fJ7oiuoX1s/e
 xfkfdp4fZki9UxyHIBmEThkqXRaantl2l6dhs3JyA1KeiJGZLeAPZgzCzTxxrdZw4a/g
 Ggfi6s2BxtJurf2Mi1ht1QpThDKVSAwllU9juEBmUXDv/h8Hbhi2PMTFL1cyd+dS0dAl
 u7Y9/bjImOYNoHkFVB9G9de8KpujHfL1GVqbkTbYJwoSx2xgDGMpB1KmtdJ39TAz6l5b
 5xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5gJQpQuBdx5+IRqoLCBuH1Sdjx31gU5U1EvDuXvWhTM=;
 b=I0khEG7Ndk8uF54reg/WXgiwzvCftv3+24mcT1r4loY2kshpZj//nHeNWOnWM4OCqG
 TuLWyrZQbf5VtXdualb2F7kAnosa/fgFeW0Fr0rSrcTVoS15fc5o2SATW6MpVGbxvhae
 BS54mkDn3txdUacVfGZ1dSk3p71t7wJJoVo109ef6+GyLW3u2/b3fzqia3aBBSW7rwR1
 IxSFsFbSrhWEvxNWO2CNPsAGZxewSpNQQWzkwYY6EO8rhbsYFjDkSrkz6lQRUmn44BUf
 5WHasI99iJ4RPnwKfqZaIYeVWYRAvA8piqU4vxVV1tcKGR3MvuMB+ROBSEGtx6hUbyv+
 2tng==
X-Gm-Message-State: AOAM533nlxl9opbnw9lnUhIHXODiThIMsMQvXgCAMw8rQ/tjiZWvf3du
 UXkm6Mtq3vsmRZJeHJuPBAWcDQ==
X-Google-Smtp-Source: ABdhPJzuOHawyqvvoqkF0qolk93kWpFNMecTz647odkJTiPyn5lX8CtVljCP+xX5NFZE3pNVLbzLTg==
X-Received: by 2002:a17:90a:d98f:: with SMTP id
 d15mr11797197pjv.212.1597654295871; 
 Mon, 17 Aug 2020 01:51:35 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 32/70] target/riscv: rvv-1.0: element index instruction
Date: Mon, 17 Aug 2020 16:49:17 +0800
Message-Id: <20200817084955.28793-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:51:40 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7a10fc27c5f..15afc469cb0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,7 +597,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.17.1


