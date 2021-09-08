Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNpbw-0008Lk-Rd
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 00:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbv-0008FS-5J
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:59 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbt-000481-BM
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076897; x=1662612897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEO1kCxZJwHAqSHtUt8zjoYuh/MLhfznEY4xo9ze6iY=;
 b=LGEPAmj20qP5W5YL2FGwSQ9byt8Bo1Y0gHcC99ZgO2/I4j/S75PpkMHI
 lDG58I8nk+D+DHNSoHTKIi00EwvblaYt6S/7dVGDKuIL5SMtXaRKuXZZ3
 nV5nk3yWsVtuEUSOl0NPlb9NtSMdjnF8HoxE/pxGQW+P5yB4REK7jcKzc
 IRolC1o/Fn0znwe67iuX3O0YbMn4TbagJfaalE3AHMUkBYaXfIoUCQnfd
 g452vPF6jLRXOA/ibOdCZ4CmnYdFlXHmzXLUWOkwZ4/TafsnYIboKWdch
 opvkiPkFAHPc3gFjFpLEw9R95t/ETL2yXCcULRbv3/KEIBfpr29Gu4c2F g==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="179971602"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:54:56 +0800
IronPort-SDR: /F4Cq/Kns5ovBYZ//8YwjPz3RG1uBJvG+1QBfcQAMSRr1bnlLK3WQEjSeIrVmSiHCLzZy3zGOV
 YlEbxKDPzECudsn/TGCJ3FrxbP0nX6FUP9BhPiciIBBcpDpkFPnzwM8OmcBuupyN3+j0brX5Z6
 FbKvFFAHxT590Oa8SaKjQ8+LmllQWL5U+4yG5a7gPesn2mcRkWnKvAg0Gj5wsDoH7MP7uCHnpR
 i5sxrk4bVXRZnpCGSo/N7BMd+YHzhnk/4YIWhuoDWBqQ9SDmH1YDy+mJYRloXm1qWW21BwFBMp
 sSTOewlYABHrEKtGaKYdKUDk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:29:53 -0700
IronPort-SDR: /YhciuP1XeS7/fcEH1+/1ov+57rXdOJB/K+D7a3NdhRdjc8ZunuXrK9OQX8fgkPF8zQxY5Oh6p
 7VycB+rvzLJBCWZjvAJhetw4ryuwss855Aq4P9yI4L6sVRPI4kbFfvt9X0PcD5tO0fLYc6hLY0
 dRJPWE8lfCPleqd0o5gBQzLluxUZqW67E9ZRliHXeIfkZfhRQqdAHUgo0q8uwb0kQa37jKYs/q
 R6yDZQQhdjrvY9dAxR3D/hFxdG9TrciFAFIahCwDP4VrRA6ySimAOLEDmwMT0NutJFQ9CSl/nz
 lcc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:54:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48vM2swLz1RvlZ
 for <qemu-riscv@nongnu.org>; Tue,  7 Sep 2021 21:54:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631076894; x=1633668895; bh=HEO1kCxZJwHAqSHtUt
 8zjoYuh/MLhfznEY4xo9ze6iY=; b=Sc3mhlnc/bsWEkmhhg59v7rb6ZSHcWjqJp
 /N8l2l/WoC3rMC6E2VoLWOMq4CCDs0Dc2yBlRCLcKUGLR46+ZHtDt6k/MW/IhoYB
 GQA+QJwdQkehhSAq6ztcJJNwL7fjhFakrKtSf7m5FQflPj5OXrYdLZ1lpQaApxaP
 5IwCZCaF7sWVz7ptUVn0cVpndBuZEKrSnRSb6dP4R/20q2MrogbWWcO+X4JL3xRd
 ZfGu/w5wwiS47+q5c5IsGotljgXN0tDZYiSPen2kyjgz+Zb3JnM9FHD78lURsXBI
 rl1qFCpKpQCLGiBdDUdhTUQ6noSawKeVZdhOZX5tp5QKVRXHKw+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r69UGHpZPIEZ for <qemu-riscv@nongnu.org>;
 Tue,  7 Sep 2021 21:54:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48vG74cfz1RvlR;
 Tue,  7 Sep 2021 21:54:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Wed,  8 Sep 2021 14:54:44 +1000
Message-Id: <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631076834.git.alistair.francis@wdc.com>
References: <cover.1631076834.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 08 Sep 2021 04:54:59 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers based on the CPU feature.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  5 ++++-
 target/riscv/cpu_helper.c | 10 ++++++++++
 target/riscv/translate.c  | 31 +++++++++++++++++--------------
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..d11db1f031 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,7 +77,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_MTVAL_INST,
 };
=20
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -130,6 +131,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    uint32_t bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..65832967e1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -967,6 +967,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             write_tval  =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            if (riscv_feature(env, RISCV_FEATURE_MTVAL_INST)) {
+                /*
+                 * The stval/mtval register can optionally also be used =
to
+                 * return the faulting instruction bits on an illegal
+                 * instruction exception.
+                 */
+                tval =3D env->bins;
+            }
+            break;
         default:
             break;
         }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 25670be435..99810db57d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -173,8 +173,25 @@ static void lookup_and_goto_ptr(DisasContext *ctx)
     }
 }
=20
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply th=
e
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
+ */
+static TCGv temp_new(DisasContext *ctx)
+{
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] =3D tcg_temp_new();
+}
+
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
@@ -195,20 +212,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, ta=
rget_ulong dest)
     }
 }
=20
-/*
- * Wrappers for getting reg values.
- *
- * The $zero register does not have cpu_gpr[0] allocated -- we supply th=
e
- * constant zero as a source, and an uninitialized sink as destination.
- *
- * Further, we may provide an extension for word operations.
- */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] =3D tcg_temp_new();
-}
-
 static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
     TCGv t;
--=20
2.31.1


