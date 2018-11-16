Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNlhk-0000KM-1C
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 16:31:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhd-0000Gi-7v
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhb-0001fi-LV
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:01 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gNlhb-0001fJ-Ez
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:30:59 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u6so836142plm.8
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 13:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=LrSNAK5VmQ6c5x3kGvqXMw47hLHndptPmbk4QMAiCLc=;
	b=a/hcY+/2A6ZlMkYnKbGHZ6W+GNtlOKG5YVd4eP3VG1tLf+RggoA7VIQ3dLxSyQEFh1
	74mRWfVZEXE9DoIhOYjmSyIjT9BOB72b8Xl3gFX2Czwxpz7pPB64wjHxpovD1QPPriX0
	o9fUxxbS93TB8gg8G/v3sTaHPKHn9wOmLBPI5cQw3v4gW5BlbkjSOXi6xT5mZy7srefO
	/N7DIwMii5DztHr9hLlnzsqORukZyVj07CJZRssKPHiRzyKsgwh79g33EbkBWmTRK0UM
	mImvpBSj62AWWgI7zsSZZAB1Pz9p0IK6gjIGL0DpyeXprLaZhGVV8VYwZzh5V/LxEVgD
	SsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=LrSNAK5VmQ6c5x3kGvqXMw47hLHndptPmbk4QMAiCLc=;
	b=PN0xOAyuineQksQuKtMre3BQWgzfxxhGyl42kaEobLtCZJEBWSrf7TZ6gp049rxQi2
	gGFk1FqSWE0wFL48+iiMx0a/b6q29c8KFhkELujaPVI697QW9euHrmvrJIeZqu6WoRl7
	oiOUwup0uCLQD30Iudr4xi0+9B48gJQCvKhse0w/mBP3w3wQnEL3ajp8SqnhTfFGJdDw
	ILjJFoStDTht60DNcnHxQW6QeVSxDpOwcTJr6cBptePyhIAJ4I1DDypqwC7G6oHybykd
	V84pJPLl9M+Gs6pbm/oqIcmaTCaFH4t4VPXAVNIL761GFBP+DW7OcvNH9xCy1NkxI34E
	zG6g==
X-Gm-Message-State: AGRZ1gJVuI1a9gTOe93uQCorfsfWguGmDZykWE6U5dVL7lvojPBjJgRU
	LgJVMQ82UC+8BI9dFvR/3KaKDMR2HEH0Jg==
X-Google-Smtp-Source: AJdET5dcal9BK8meX6WtMFWHQnQxRJ7mMNwUnXesaPwGsqWq5vkrzscomMcZGegc0RPWc05dsP1xkg==
X-Received: by 2002:a17:902:d697:: with SMTP id
	v23mr12294752ply.261.1542403858480; 
	Fri, 16 Nov 2018 13:30:58 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	t66sm2547081pfd.54.2018.11.16.13.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:30:57 -0800 (PST)
Date: Fri, 16 Nov 2018 13:30:42 -0800
Message-Id: <20181116213045.19825-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181116213045.19825-1-palmer@sifive.com>
References: <20181116213045.19825-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-riscv] [PULL 2/4] target/riscv: Fix FCLASS_D being treated as
 RV64 only
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
X-List-Received-Date: Fri, 16 Nov 2018 21:31:04 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18d7b6d1471d..5359088e24bc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1237,13 +1237,14 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         tcg_temp_free(t0);
         break;
 
-#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_X_D:
         /* also OPC_RISC_FCLASS_D */
         switch (rm) {
+#if defined(TARGET_RISCV64)
         case 0: /* FMV */
             gen_set_gpr(rd, cpu_fpr[rs1]);
             break;
+#endif
         case 1:
             t0 = tcg_temp_new();
             gen_helper_fclass_d(t0, cpu_fpr[rs1]);
@@ -1255,6 +1256,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         }
         break;
 
+#if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_D_X:
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
-- 
2.18.1


