Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNlhq-0000Pt-60
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 16:31:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhm-0000MY-RV
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhi-0001ir-Pg
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:10 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gNlhh-0001i5-E3
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:05 -0500
Received: by mail-pl1-x644.google.com with SMTP id e5so1693042plb.5
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 13:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=jiJQ+JOIMV0I2GJ3MV1g+OOMPgoMF7Rval6G4QIiJEo=;
	b=fLjdESVhv2xwTT21MeffYpIh0HMhB3SFnlF7rgYLDWMBY6hFo3eibRHJIUQEVcUZuZ
	eB2x/xXykGAkS3rb8eON9G8Ln1yte39VFHUu5qqBCdN4cd2Jv17ds73SVThOQd75CR/7
	PCVnR1qGraKHrhvFNcUeYCFby+BcHl6KQtoXqNW0f5O3hV9AOjBjmgVmZQmN9Y+r9PWl
	buItHvdU2KrzYZC2n5OyREdxZupTkgAFYGDjt37xR0GXyaYjytPz4uyxrEIRCrA0k4j3
	lcdTUTjmllZ/CV+pR7LuX3Atqf3hD7zsDjcaHZ0EptfXAYqqoi5bILPFZfe4nZelYAbi
	hcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=jiJQ+JOIMV0I2GJ3MV1g+OOMPgoMF7Rval6G4QIiJEo=;
	b=JBuQHwQXnYDwLUe1lLhNtBCkq3jawc+y4dYfcaoUNbIs90V/CB/B+a+0L8AYS5hqAT
	/iTTHpBRzbntg97B7KazrZgJOypXrmgaXtnZJnFx1LeVnn2iaV+pUwlsbvnYExp0Zujt
	U2ZGYJBmGK2/5Of/YM9FVdZVvZacHn+t4+LzRZnEjyA01Y4XSKxhMUY0KJjOA/ZgNqen
	sixz4BoMogAaDiYEg+gN5KNX6AnLq+4pYgZZ3Hs3MtBDRIwf4ziqlNOIr16yK6aQFgOS
	498U2VceXskl6E/mdX449/cUU3sREXqZIsQ/uiBhDC/Q8xsEj2MFytbIIjU8GmlBx3do
	VNmQ==
X-Gm-Message-State: AGRZ1gJ0KKcFf5IVDa+kqvbEanAjzO1tELcO6jWavLJR/qGYy/3zJHjd
	czQQgCEaq8aJG+PHj6iSHj3Cdw==
X-Google-Smtp-Source: AJdET5eiq0GVlZ+LqLj1BVw65NbTf4O+nPvGB8kWWoSiL+XcBAolYxAVHSU713GwVIIK4MKF2wYhgw==
X-Received: by 2002:a17:902:930b:: with SMTP id
	bc11mr8729361plb.17.1542403862612; 
	Fri, 16 Nov 2018 13:31:02 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	c13sm11588314pfo.121.2018.11.16.13.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:31:01 -0800 (PST)
Date: Fri, 16 Nov 2018 13:30:44 -0800
Message-Id: <20181116213045.19825-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181116213045.19825-1-palmer@sifive.com>
References: <20181116213045.19825-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PULL 4/4] RISC-V: Respect fences for user-only
 emulators
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 21:31:11 -0000

Our current fence implementation ignores fences for the user-only
configurations.  This is incorrect but unlikely to manifest: it requires
multi-threaded user-only code that takes advantage of the weakness in
the host's memory model and can be inlined by TCG.

This patch simply treats fences the same way for all our emulators.
I've given it to testing as I don't want to construct a test that would
actually trigger the failure.

Our fence implementation has an additional deficiency where we map all
RISC-V fences to full fences.  Now that we have a formal memory model
for RISC-V we can start to take advantage of the strength bits on our
fence instructions.  This requires a bit more though, so I'm going to
split it out because the implementation is still correct without taking
advantage of these weaker fences.

Thanks to Richard Henderson for pointing out both of the issues.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f44eb9c41b48..312bf298b3c2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1776,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
                      GET_RM(ctx->opcode));
         break;
     case OPC_RISC_FENCE:
-#ifndef CONFIG_USER_ONLY
         if (ctx->opcode & 0x1000) {
             /* FENCE_I is a no-op in QEMU,
              * however we need to end the translation block */
@@ -1787,7 +1786,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
             /* FENCE is a full memory barrier. */
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         }
-#endif
         break;
     case OPC_RISC_SYSTEM:
         gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-- 
2.18.1


