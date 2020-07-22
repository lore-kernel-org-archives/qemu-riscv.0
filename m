Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwz-0006i7-Lq
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwx-0006g7-VE
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:07 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAww-00069G-88
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:07 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x8so647241plm.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yqh7XLC8qZitr5dXFkR4oqQGB5Ty6ak6uA+SOmZyzxk=;
 b=YP2LQNXwRgt0sOCvcjMzXtBDgHa14zZEu/JJRVNoQ8/+FD9VdyQqexnh2DdgQk6s/s
 bBMvcEZPOuuJg6Z/WwbA4HmRruZZBDOZCX8L+PrwkSyZ+pPi25cBWujADLt/WqZmsnqz
 Irb7B4Bn4WqLeoKn0P6DjaNMs2w5NPGexWAv1QyYwtZINnKpqVaYQXuxr2JqUzB32xRo
 wHcvWE0QRPiV15gvesp8snok/jL4h8GT7VS5ooMbWhG3YdXbmddFD6Y0H7ZdgAt3pW6M
 QMANv0lCAWtgENBU46/5aMnv4iWsq9Y+6Tt5YzfW0FOALSsATe9M0JmIYPglD2yP1Vqg
 iE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yqh7XLC8qZitr5dXFkR4oqQGB5Ty6ak6uA+SOmZyzxk=;
 b=PDX/P46E/pDvdpv6sCiDAevepCBUBsE6hgZIvqAf8Qb+0LywOAi6WyKizAiKavZFFp
 B93d++sAxovJF+WDzC6jWpzGxuE55HbORWul/fdvtO9yF07+jGYsb0IqydpuxDMTJoXb
 H8NMxEOcxI5u1HZIuutd0Sv6mC56/PQZAF9z5C9TnDhNOat55BndMeFM2mZ6wUV8D2wv
 7ifqeFywgMUxPWVpVuvxpFHoS2tA2eVhW9vmBUXBOQ/+hKWsQRI9SpDkSeoqeLl5xtuT
 1lykBADmzkF252z5we3DbDtkJSCvggaoTrnd4XJiBLQncJ72s1VU6HdvEeO1gtZw3Tax
 XI6g==
X-Gm-Message-State: AOAM531dfxXI66ax8GEKOasFp/Hq5JlO2SuYLHD61LdCrCuljdVE+nPt
 oOnZzrkMdDWt5GE0kdCUzQAkc6wi90Y=
X-Google-Smtp-Source: ABdhPJxRvvKUmKlK8o7ObgdpXl+M5pVj9bwF4+FkYF50C3UDR0MlTbF9gONG4qQaChzK3dbFxAI2ag==
X-Received: by 2002:a17:90a:dd44:: with SMTP id
 u4mr8419692pjv.203.1595409725092; 
 Wed, 22 Jul 2020 02:22:05 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 64/76] target/riscv: rvv-0.9: single-width scaling shift
 instructions
Date: Wed, 22 Jul 2020 17:16:27 +0800
Message-Id: <20200722091641.8834-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:08 -0000

From: Frank Chang <frank.chang@sifive.com>

Zero-extend vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 10d8b8b00d..fb8478a456 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2406,7 +2406,7 @@ GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
 GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_ZX, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


