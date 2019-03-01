Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3r-0003ze-4o
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3j-0003nf-A8
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3f-0003aU-5j
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:09 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3N-00030H-Ve
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:05 -0500
Received: by mail-pg1-x529.google.com with SMTP id m1so12044318pgq.8
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=CwGbOovvbC6X9loSjoOaeu0Upqt9RE5VNft3qrOGVD0=;
	b=mcug3y4SE1z+vt54ZasuMq3yBJvtnhs+53llj5z2M7+m8uA1FTSieZFlnNYzXdWjZM
	JQXpk3Btlu9AxHgV4ZNMB0rIPryWKv5oK4saNN18DfmOoulrlUkjAfdaLJLYqyiV7Svo
	VkdfMrpi4dsyk/uI/dsrn5NxfwYeHi0zydA4+3K/HRibG5GAJaT5cOxe5/utLWl0B54x
	hUIOSDY3zZk5DRB2D83vDmRUK0din5RoNld6En3pzBi9KHht5ZhV2SVDzTGCLLgcaOUA
	6MsbRhEWT/eixZHEmn8plpoUj1H10nmoDgjibYW6tZjbwkhu7I20Va2j8lnG823ltKOf
	xDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=CwGbOovvbC6X9loSjoOaeu0Upqt9RE5VNft3qrOGVD0=;
	b=fzjytaGpki+QLQ5Bi2b+Zz8M6dTbjBZSwaeTwA0GTdYRNfT9XllmRM4l0Ku2/+zp/V
	oqAcJU+7b13m+3lIyyEUsSRbyvHhVhZHabPiVXc5kGM2a5487zdulwthUOwgDasNodfV
	HWgXsWisCxRDk7ibOycXcBsGiK3p74DIZPJevjSvnDLbIQ7tEC7KhbnJHY5+KoRk/leo
	2D4hs3u7BdvmxPofTb+cf5EBnIXo+qwEDe0NVuMiZQQyB/XNvSAx149UJTda0U3G0leH
	FWK9a43hoPYRnfk/l9GsDPPVRt3Gtx7vl1DYKmIH55V/hMcGChwVS1eDquI8zR8uQKDk
	JUhQ==
X-Gm-Message-State: APjAAAWKFM8bbvvF2sv/LYYXwZ8NM6xBZShXel5l0CESyll7ii8h1dxr
	TWPVdxK6SLUIyEjBzAOZbQ6NgA==
X-Google-Smtp-Source: APXvYqxMl9UwfNHUAlCpDNNI8urpSZdqnxa8XQvL2DMVHgbG07/DMN+3vtMgj6Ga6Kai6obPvXtf2A==
X-Received: by 2002:a63:fc64:: with SMTP id r36mr7032104pgk.280.1551477048806; 
	Fri, 01 Mar 2019 13:50:48 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	20sm34268931pgr.80.2019.03.01.13.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:48 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:42 -0800
Message-Id: <20190301214945.4353-32-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL 31/34] target/riscv: Convert @cl_d, @cl_w, @cs_d,
 @cs_w insns
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:13 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn16.decode              | 20 ++++++++++----------
 target/riscv/insn32.decode              |  3 ++-
 target/riscv/insn_trans/trans_rvc.inc.c | 24 ------------------------
 3 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index c7a58d80e5ae..c215867ff947 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -43,14 +43,14 @@
 
 # Argument sets imported from insn32.decode:
 &r         rd rs1 rs2   !extern
+&i         imm rs1 rd   !extern
+&s         imm rs1 rs2  !extern
 
 # Argument sets:
 &cl               rs1 rd
-&cl_dw     uimm   rs1 rd
 &ci        imm        rd
 &ciw       nzuimm     rd
 &cs               rs1 rs2
-&cs_dw     uimm   rs1 rs2
 &cb        imm    rs1
 &cr               rd  rs2
 &c_j       imm
@@ -67,13 +67,13 @@
 @cr        ....  ..... .....  .. &cr                      rs2=%rs2_5  %rd
 @ci        ... . ..... .....  .. &ci     imm=%imm_ci                  %rd
 @ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
-@cl_d      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
-@cl_w      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
+@cl_d      ... ... ... .. ... .. &i  imm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
+@cl_w      ... ... ... .. ... .. &i  imm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
 @cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
 @cs        ... ... ... .. ... .. &cs                      rs1=%rs1_3  rs2=%rs2_3
 @cs_2      ... ... ... .. ... .. &r      rd=%rs1_3 rs1=%rs1_3 rs2=%rs2_3
-@cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
-@cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
+@cs_d      ... ... ... .. ... .. &s  imm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
+@cs_w      ... ... ... .. ... .. &s  imm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
 @cb        ... ... ... .. ... .. &cb     imm=%imm_cb      rs1=%rs1_3
 @cj        ...    ........... .. &c_j    imm=%imm_cj
 
@@ -95,11 +95,11 @@
 
 # *** RV64C Standard Extension (Quadrant 0) ***
 c_addi4spn        000    ........ ... 00 @ciw
-c_fld             001  ... ... .. ... 00 @cl_d
-c_lw              010  ... ... .. ... 00 @cl_w
+fld               001  ... ... .. ... 00 @cl_d
+lw                010  ... ... .. ... 00 @cl_w
 c_flw_ld          011  --- ... -- ... 00 @cl    #Note: Must parse uimm manually
-c_fsd             101  ... ... .. ... 00 @cs_d
-c_sw              110  ... ... .. ... 00 @cs_w
+fsd               101  ... ... .. ... 00 @cs_d
+sw                110  ... ... .. ... 00 @cs_w
 c_fsw_sd          111  --- ... -- ... 00 @cs    #Note: Must parse uimm manually
 
 # *** RV64C Standard Extension (Quadrant 1) ***
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f3ab7aa52d3..b59a00cc429f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -37,6 +37,7 @@
 &b    imm rs2 rs1
 &i    imm rs1 rd
 &r    rd rs1 rs2
+&s    imm rs2 rs1
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 
@@ -44,7 +45,7 @@
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
 @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
 @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
-@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
+@s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
 @u       ....................      ..... .......         imm=%imm_u          %rd
 @j       ....................      ..... .......         imm=%imm_j          %rd
 
diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index 639c381edfc0..d932bfd3e0cc 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -28,18 +28,6 @@ static bool trans_c_addi4spn(DisasContext *ctx, arg_c_addi4spn *a)
     return trans_addi(ctx, &arg);
 }
 
-static bool trans_c_fld(DisasContext *ctx, arg_c_fld *a)
-{
-    arg_fld arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
-    return trans_fld(ctx, &arg);
-}
-
-static bool trans_c_lw(DisasContext *ctx, arg_c_lw *a)
-{
-    arg_lw arg = { .rd = a->rd, .rs1 = a->rs1, .imm = a->uimm };
-    return trans_lw(ctx, &arg);
-}
-
 static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 {
 #ifdef TARGET_RISCV32
@@ -51,18 +39,6 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 #endif
 }
 
-static bool trans_c_fsd(DisasContext *ctx, arg_c_fsd *a)
-{
-    arg_fsd arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_fsd(ctx, &arg);
-}
-
-static bool trans_c_sw(DisasContext *ctx, arg_c_sw *a)
-{
-    arg_sw arg = { .rs1 = a->rs1, .rs2 = a->rs2, .imm = a->uimm };
-    return trans_sw(ctx, &arg);
-}
-
 static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
 {
 #ifdef TARGET_RISCV32
-- 
2.18.1


