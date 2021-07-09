Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6I-0006t1-1I
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5q-0006DV-1c
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5b-0001OR-Vs
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:25 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t9so8708192pgn.4
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/hU2uapDI+t0AiME6/idPJJwaWzQYUK8p3YV8Vnf0A=;
 b=pgeFHwzMQSByCKFQWRoBHyZ2kJuQ7l523s5pYs1hpRcPfFzSKAvgRQbrvN2FJmofVj
 OTtnck7zw+S10VI6w9p1qYDXFKPawWBffMB5do45+tIKV5bxAOwxg0Dmngch1tY2HmXr
 /y2v6yJ/9gt4aGPPD2xXMNJKm62/6GjwD96m5OoNquUehS8e8C6LOMEy58b+UCgBRFK3
 0/yvWCoJKheTL4gK3EvFM8SgE8Ej1sEJSZvjup+oKECQDgGZ/WGOF+0j2mF4eJqB7C4P
 5CMQHRo6UYvOLm24WNVB/Y+dmxYvQ3zrMPbc8KErLOwf6eMpyEFwJbndvGjDdKMo+YNz
 oKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1/hU2uapDI+t0AiME6/idPJJwaWzQYUK8p3YV8Vnf0A=;
 b=i0zMo9UbmxPN/Wt9kx93XEcWs3Hb09MQVaE6k9FWWdGikbhDw7Be+hzeW1xWyy1WH6
 5fdYu/txg+dMiNlErMJ4r0SkbuSgzTBb+q6kSmqMVufOm5F3OTHalrgwT/0kCakO+eEM
 eNZfz+N25XDZ5b4RzNMEMVODVVp2Z5c0Q6qs9oxQcHeaAWKJfzL8aBU5gENAxt3MQmOx
 Edxrzf2pKdkQ79Zc1sttSNBlARj/mMkdunfGgck4jCdCeKXgBRYh9KF5oRbtyBzOXIRC
 dgekFr6S/liq2kJWvV6b/hkxOoyzkoFgsKEZ3G2OZS5RJH1JDSjbbuvj6evicb7qeQDj
 FVjw==
X-Gm-Message-State: AOAM53287ToInT4r6bRICm+P+iIIwigKxcgg4qwwU0pry6iibDHgdITA
 +ZHQCAKKVHU1+apT1tPZRcWcVQ==
X-Google-Smtp-Source: ABdhPJx78xeNCh4oMZ5Pq8T/qs3jOnpkYO+eXtvThA5xnavdrng+Vw6olApyDPsjKEVZySg1RgC2dg==
X-Received: by 2002:a65:6404:: with SMTP id a4mr36082667pgv.175.1625804769419; 
 Thu, 08 Jul 2021 21:26:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 00/17] target/riscv: Use tcg_constant_*
Date: Thu,  8 Jul 2021 21:25:51 -0700
Message-Id: <20210709042608.883256-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:28 -0000

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.

Reorg handling of $zero, with different accessors for
source and destination.

Reorg handling of csrs, passing the actual write_mask
instead of a regno.

Use more helpers for RVH expansion.


r~


Richard Henderson (17):
  target/riscv: Use tcg_constant_*
  target/riscv: Introduce gpr_src, gpr_dst
  target/riscv: Use gpr_{src,dst} in shift operations
  target/riscv: Use gpr_{src,dst} in word division operations
  target/riscv: Use gpr_{src,dst} and tcg_constant_tl in gen_grevi
  target/riscv: Use gpr_src in branches
  target/riscv: Use gpr_{src,dst} for integer load/store
  target/riscv: Use gpr_{src,dst} for word shift operations
  target/riscv: Reorg csr instructions
  target/riscv: Use gpr_{src,dst} for RVA
  target/riscv: Use gpr_{src,dst} for RVB
  target/riscv: Use gpr_{src,dst} for RVF
  target/riscv: Use gpr_{src,dst} for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Use gpr_{src,dst} for RVV
  target/riscv: Remove gen_get_gpr

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 273 +++++++++-----------
 target/riscv/insn_trans/trans_rva.c.inc |  42 ++--
 target/riscv/insn_trans/trans_rvb.c.inc |  11 +-
 target/riscv/insn_trans/trans_rvd.c.inc | 116 ++++-----
 target/riscv/insn_trans/trans_rvf.c.inc | 134 ++++------
 target/riscv/insn_trans/trans_rvh.c.inc | 264 ++++---------------
 target/riscv/insn_trans/trans_rvi.c.inc | 322 ++++++++++++++----------
 target/riscv/insn_trans/trans_rvm.c.inc |  24 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 144 ++++-------
 12 files changed, 534 insertions(+), 821 deletions(-)

-- 
2.25.1


