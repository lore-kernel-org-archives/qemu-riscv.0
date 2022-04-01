Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1na6bc-0000EO-3o
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 22:01:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na6ba-0000Dt-EE
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 22:01:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:55578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na6bY-0000xL-Pk
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 22:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648778496; x=1680314496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=75BTIXjlkkpMJB2aDet3Nh7SNyZyeFFMVTU0ncbgLvg=;
 b=k2c2Ljg914AI9sWhLXCpf+jp5781zxXy1y2WfhK9rfepaAsWye4z8RiL
 HPx5damDE+6Ah5pv+X9nCW5YjbIzZnmVX20cnxAubn6jV7nAHUbRXLIjo
 GE/6QrqdrBfPfb/jHQ97acE8n2+QtNHUZIzVgWzot0aR7VaA/LFjtJ4iD
 IlsyngSdAEfyTVvEllmCK4UDORnTLe9YpmJHrdMJj9x8l1thoP6rzOchP
 QApvIn4KZ32GHOf9DHy0RIDohbDHYUHxDbB92cY2QYQ9KWbgbTh8qiL3H
 3Jb4amD9j1pdwWKc/oVjmfxRPRorR/Nmap9Fr9E+EEtsKiMpa0k2vk74K A==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="196798098"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 09:49:30 +0800
IronPort-SDR: TelsDZy1PPhp8GRYaAfgao6NgsoEeg69hDOv+j5FjJM8u/zQLqBl1c62h7IMyzzYF8cp1wx/oe
 XQC7AqEUcTJ7GmPnTrQgpwu8au3j5FzCZOL1WkqZj3JOg9+v0/t0MJc79rxiBNnOY/dJPytigx
 t0IQQ+B0HQacn8GLz7+BcoCP9eMydKmeTqknK3Fz9EV4NnqjsegiyceQkbHx9yeLx302bQAwfZ
 jHgwbnOTsLQejZ34QuX0OSy9QqxKDOAQTDT6HrD6CXxxZ6SSzzrj4jMwxPx9Y93k2SvyIhlCgI
 dLqP+yfAzQUfti/fREuAcjIZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 18:21:11 -0700
IronPort-SDR: GOa23GhHqWl4jCW7i2uSi8DXmqDS9+8oSSzXHLlHAxlDVDMoRdRdLKMP3LJWSWL8FPj0kE3aKQ
 Dsbvt2NxWEuMlBHvHbxbVw2J+uemRl+lZ60rW6TK2eJ+C7vDV2hcdC/bbI+TLgxOd+mY0/Jow8
 wOdWpLTmJqLCsk49of6xCnicLbJd5fotYHLOcmIEFZKAc1X7ICmd4lrXxnp9BMbhMvuxCtAiN3
 dPM6cfE98jf87p87QkrcFL7ZS0/QvkcNanT5LksaRySErBoCzx8Hcf2CempZTeHF4PuBLnhP5C
 1wU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 18:49:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV34p6nfcz1SVp3
 for <qemu-riscv@nongnu.org>; Thu, 31 Mar 2022 18:49:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648777770;
 x=1651369771; bh=75BTIXjlkkpMJB2aDet3Nh7SNyZyeFFMVTU0ncbgLvg=; b=
 MiMv/h/98ybKGLL3kvD15biKe/0Dh/xo35/aAW0AsTcOjBwWMo90cd9gqKhZQX9N
 3EdA6c9/BxI7EFLTVT/HtL9ssw4JwmErZrJIVCL9CMoxaujFiQScm313En2qL6cJ
 1lG9Y0Ulv9n1jAykpA0EgCJ7WLBQanHiE4i36lOhhvNWqmSFTFcHksDXSNImhw4z
 nZT81voK0bVdPgPQtHhEktl+DYax3Yvuk5sJ9Se8skMpLYozS0Kktu0h1f0HrBI0
 xF2TLjAuutsA+2ZBQw9HBIplHEv4E7bRC449mxKEB8wm84UIVNY90w/bjUupca0u
 lMHl98fB4/7vsQkIfI/3tA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1d3AjiLDvtyM for <qemu-riscv@nongnu.org>;
 Thu, 31 Mar 2022 18:49:30 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV34k1yHyz1Rvlx;
 Thu, 31 Mar 2022 18:49:25 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 richard.henderson@linaro.org, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2] target/riscv: Call probe_write() before atomic operations
Date: Fri,  1 Apr 2022 11:49:20 +1000
Message-Id: <20220401014920.1709379-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=083ec5d20=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Apr 2022 02:01:38 -0000

From: Alistair Francis <alistair.francis@wdc.com>

If an atomic operation fails on RISC-V we want to generate a store/amo
fault and not a load fault.

Currently if we have no permissions to access the memory location the
atomic operation will sometimes fail with a load fault (depending on the
path taken in tcg/tcg-op.c) as the atomic helpers perform a load then a
store.

By performing a probe_write() on the memory first, we can ensure we have
permissions to perform the atomic operation. As RISC-V doesn't have
write only pages this should be pretty robust (PMP might be the
exception).

Note that this only fixes the fault for memory regions. I/O and
non-existant regions will still trigger a load fault.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |  2 ++
 target/riscv/helper.h                   |  2 ++
 target/riscv/cpu_helper.c               |  2 +-
 target/riscv/op_helper.c                | 14 ++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |  3 +++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c069fe85fa..c215cd1b6a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -179,6 +179,8 @@ struct CPUArchState {
     uint64_t mie;
     uint64_t mideleg;
=20
+    bool amo_store_fault;
+
     target_ulong satp;   /* since: priv-1.10.0 */
     target_ulong stval;
     target_ulong medeleg;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 26bbab2fab..12f8a0acea 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -106,6 +106,8 @@ DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
=20
+DEF_HELPER_3(atomic_check, void, env, tl, int)
+
 /* Hypervisor functions */
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(hyp_tlb_flush, void, env)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..294687f001 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1139,7 +1139,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, =
hwaddr physaddr,
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
=20
-    if (access_type =3D=3D MMU_DATA_STORE) {
+    if (access_type =3D=3D MMU_DATA_STORE || env->amo_store_fault) {
         cs->exception_index =3D RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
     } else if (access_type =3D=3D MMU_DATA_LOAD) {
         cs->exception_index =3D RISCV_EXCP_LOAD_ACCESS_FAULT;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e6..d0343b15f8 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -114,6 +114,20 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, i=
nt csr,
     return int128_getlo(rv);
 }
=20
+void helper_atomic_check(CPURISCVState *env, target_ulong address,
+                         int mmu_idx)
+{
+#ifndef CONFIG_USER_ONLY
+    void *phost;
+    int ret =3D probe_access_flags(env, address, MMU_DATA_STORE, mmu_idx=
, false,
+                                 &phost, GETPC());
+
+    if (ret & TLB_MMIO) {
+        env->amo_store_fault =3D true;
+    }
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
=20
 target_ulong helper_sret(CPURISCVState *env)
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 45db82c9be..b3e05613d7 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -83,6 +83,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv src1 =3D get_address(ctx, a->rs1, 0);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv_i32 mem_idx =3D tcg_constant_i32(ctx->mem_idx);
+
+    gen_helper_atomic_check(cpu_env, src1, mem_idx);
=20
     func(dest, src1, src2, ctx->mem_idx, mop);
=20
--=20
2.35.1


