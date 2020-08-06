Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRv-0002mU-Au
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRs-0002jE-91
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRq-0007sD-Ct
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:35 -0400
Received: by mail-pg1-x532.google.com with SMTP id j21so7757859pgi.9
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fGmZi4G6G8HBm6kSF0AhkPZa7UesVkFkZsuvcd4O+2c=;
 b=R6du+1DcDEU9q9Jf4F1QYzrnwFdudp1yW+7VoColi7zvPA59WzLSmiK75KQpExyWq3
 6RZqhL49s9j7qsT7OM/dkLgPsz0cO/WfWs+0zWfoKmnq16A0k76wdFTL7pUWBApxuQxY
 krcVRaFlNnzszC4DbTYP84tH6jkh2IK+M5WDsn+xjto/RWUrVk6lvhxcrAKNjGiNXNlI
 GKIj8062kQfbNQx9jplX/RXzFOTGEEyP1MFENteo++uof1NExHk/hxTC8XeeY30I8g0t
 Afkq4ao04vvoy3YjhM+9QLDtKl+I8P/44q3E1O3/V/Ka7djoXLJ9U8+orhlSepYTeO70
 uJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fGmZi4G6G8HBm6kSF0AhkPZa7UesVkFkZsuvcd4O+2c=;
 b=AVlx+0tCOaeCdm2VgB+GCA34k0yYxP6kCgjGyNNzAA0eEn+dJfU0xrvXYats1BwD3l
 pZNs8oa3jTSVyNJw/9hjoyM291xxS82YxP8/AQKGHWIadCm0BEI5QlOqgGsEfErAEuAj
 kE6sHRn7A2xCVy/7VyH62XNb1Nbv6hC7ZZEYPY49bbUcobnBc/QvKSOggN/1XZ13Zx/o
 mrb5rKYX2rSdfQrP7bBgrn64w/6rmOJEEa19yr3vf/q/15gB2/k7XcPEtJqAkkuWiNqO
 zjvfTk0mCSB3gP3HVzsRYVwMJVVBwFNZLPi/UK0hoffbRbYEuLh3XtNlTDfgWMDEqFe2
 gwGA==
X-Gm-Message-State: AOAM531Ke9dTFqXwoeIeX290IZJjeKR4PhAwcycbMLf2G8j80FeSeJty
 b8+tdqCBSTBcc39A+a2FDuLVYwUM86s=
X-Google-Smtp-Source: ABdhPJyHub4FH4VlmHxGOsZRReb6OeUHPTUSIJgyxSf1cgG91ZvKqUHD0KCU8+22OizWLqKGF9h0PQ==
X-Received: by 2002:a65:43c9:: with SMTP id n9mr6578329pgp.452.1596710913213; 
 Thu, 06 Aug 2020 03:48:33 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 29/71] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Thu,  6 Aug 2020 18:46:26 +0800
Message-Id: <20200806104709.13235-30-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:36 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f142aa5d073..a800c989050 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -550,7 +550,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
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


