Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTf8-0005al-06
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf6-0005Xj-OA
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:28 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf5-0000Ry-1W
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:19:28 -0500
Received: by mail-pg1-x529.google.com with SMTP id p21so5378265pgl.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bmrQQ5mDYjBADfn4f4ipzmNX78oHq3CXThhzJoHA7E8=;
 b=jFaCntHh9K86lGQ6XO0bhAE2/ldoJK2FSFhliLrgldX2d+TKeE0hBgJizMuWCi/4oU
 MvV2oYrwhVAEIeb4R1EtovFmKkUa4bP5JTSXi8pWFymNGgz8UdvUxHqpLEJ0x2WO9Zyo
 fatEP3pqUxxN53htsHKSwP8tB3vp8kM/Q0MjMhR74crZ/omVX+3YmNrhV7dgCDAnMXr5
 xJ39xs+kb6aedznTacT+Y6ssRt+zsK6NPoBgqP7QXMtn91Vn3br5JT+GPkH+yhhr1vzd
 dqvmMcBOtSj0xFP2jeQcH44PUxCzZq2Rj6wJQYBA2mIJ796W/x5IPaLRahhdgOSP2Xq0
 Rmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bmrQQ5mDYjBADfn4f4ipzmNX78oHq3CXThhzJoHA7E8=;
 b=Cvw/teuTfD9Ve4MhjWcIugR/EMmg17+OFnhwxAEbaCBMWDkjaj/HWBAJEmQHMLcLrf
 gPJVXCL/NyCrFMaIgj/rrl0mcoN91/7Kd7n0Wf5MEjvU+oIGSKi07p7Egc+CrUwfamKM
 EFY4JBpBzBs2eLdBeAitRFTvGkoANgqu6ORpqfKqmalY0RXYNh3ILTbFgQ7ScBFcy/ti
 TkXKXxsDJy5wyBv6w1klse/4XUj8c2n/aF/pB88IRQqrEAD6y5xJzRB91edD6HthuCBZ
 OqEks1D3O34wrPyqseNP1qoOJV/0rY5/7x+DXHbNNeND4GdHCZNm0PnO4PnAZwttlN4L
 R4Lw==
X-Gm-Message-State: AOAM531gaxmi1st2W3yAUIxNa2GsmpG74wyLAdGVXOz277PgL5V8NzVf
 erivze+jF69lWkXCdzKckQJhebqyIj+Xrg==
X-Google-Smtp-Source: ABdhPJx8+jSjBuMcVuWN+adGcOmkKbEFCDhgle3IHYqOBIb2pHwWMKGrei+izqhs8+JLURP8Ht48qQ==
X-Received: by 2002:aa7:8c0f:0:b029:1ed:4d05:218c with SMTP id
 c15-20020aa78c0f0000b02901ed4d05218cmr978017pfd.21.1614309565713; 
 Thu, 25 Feb 2021 19:19:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 05/75] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 26 Feb 2021 11:17:49 +0800
Message-Id: <20210226031902.23656-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:19:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 098de1abacb..89867a93643 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -571,7 +571,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


