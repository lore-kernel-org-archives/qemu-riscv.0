Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzCUX-00076B-W7
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 01:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUW-00073O-7R
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUU-0002Ox-IH
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982986; x=1671518986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwpHVZ34H5xvnsBDSFpMYg4ASzoasBi2diS1mv6DgpI=;
 b=Ew03/VDvYPoq1KJAC/uOKZxjRQDOYhsYEvAQUPeELp56sRaysKBc3qcI
 fSLXRYdpahygp8KXxgU4dmDlvdpdCN1IWFXxZbjE7znxVsQ7s48NbLGSX
 pVx0THvvpclcqrOpF5VccIk92rB57ImbojFkG8Tlqs/K09RnWwjWEyt8q
 JvyXju8jjo1Aox2qFqj4igzoUUYZ1fRxfwYXq+R4fPWeInymH30sjiwjL
 KwCSoqZZL8oQnVvh2Rhfrwhju4bgHIZbP7l6rrECQLmKujECY7sS4oRbY
 qya1Xt/1CEc4pKlf7U+7PNSryVMsiEjHic5XFfwc+RYKYLTMNSDyNn5g4 Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="193458407"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:42 +0800
IronPort-SDR: VZiVviZ3eUve0zoY4ZDF/AEliJlyRgDiQosPbbaiVZWHca+fUpW2Uhb993dtI+ly+ab9IxozTf
 FtqlRqBqORRAFl4sAQTisfnTdHSaU36xxSsMpsH+16K8FoX5S+cEAzYOiV9UE9vCSyTKzbmDI/
 HeCkA2okVeLnTUByeaw70W8G7orteHzAB+UHwA4/S8xZVJjxSGyxHkAyRK8RsnURW3ipvx6VNl
 CHzWAcbQTL3DNJTG89tIRNv78dZhyIvOBgL96Fy2BpIVD1qVrMI7Q9WNN4sDj0Emazk3D1J9Lz
 fVAQO7WjOzfXIk51cSxVti2d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:24:00 -0800
IronPort-SDR: PsM05zPP2xWokShcESiyZjAZFowyij4SEDYEFdi+velcAvCIPeqiXjmtedo4YIS72TIlkZOCzK
 pk3ofoVk3OnH7raSGW4YDhT4KQorcMc/nKap8smG4QKQPsOYRvTj3iSiBDwS4gXeZqM1tlxRA+
 GvzPo2h1qbKQyySs7+2kohDf/hzGQ/ZyARQDaTjFF4+PqlSYIUAx8cnCoOPBlJV4v8oJ10Ek3A
 r5C1U0LFtoHXhM42EWmqQ/22rU24uxI2mBGC/mWDYtXh6Y+7NIWBVvm1fq7lqoPMJ/0kZR/4zj
 vTM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZG4wv7z1Rvlf
 for <qemu-riscv@nongnu.org>; Sun, 19 Dec 2021 22:49:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982982; x=1642574983; bh=NwpHVZ34H5xvnsBDSF
 pMYg4ASzoasBi2diS1mv6DgpI=; b=oldIyxlefZWLkPgW44cJKMbxJL0FORNTx1
 74+M5Lj/C4364zedijvK1HmbCGnMMueuYZuxgbBLPL6sRSw+UUbdYrSbYzRPGkAr
 GAcRE+cK34AzmryWTQE6IZeHZ8GfKRZXa7Jbxqhob9juJBMLy/l5AYRGb7XPICiC
 555vWtXVdyH/hAlgBrOz5NoBFu7THaY9eN73UkH4XVW2jfFXknWAJWYQ3KIC9ndv
 9fszeeNy+VZahlEhL3W2Pt8ouNZoebnWXEDYy8GvY7hRVyqr6i+D5b74sTagMDsd
 ZB/4LK9q5sO8MnNr62Si37QwrKrLQTFf27W/QBCRQD6uUL9NGqgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id n5IqAT-BgLhU for <qemu-riscv@nongnu.org>;
 Sun, 19 Dec 2021 22:49:42 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVZB1QFKz1RtVG;
 Sun, 19 Dec 2021 22:49:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 3/3] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Mon, 20 Dec 2021 16:49:16 +1000
Message-Id: <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Dec 2021 06:49:48 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers.

The RISC-V spec states that "The stval register can optionally also be
used to return the faulting instruction bits on an illegal instruction
exception...". In this case we are always writing the value on an
illegal instruction.

This doesn't match all CPUs (some CPUs won't write the data), but in
QEMU let's just populate the value on illegal instructions. This won't
break any guest software, but will provide more information to guests.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/translate.c  | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..3a163b57ed 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -127,6 +127,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    uint32_t bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9e1f5ee177..f76ba834e6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1007,6 +1007,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             write_gva =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            tval =3D env->bins;
+            break;
         default:
             break;
         }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 24251bc8cc..921ca06bf9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -167,6 +167,9 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
--=20
2.31.1


