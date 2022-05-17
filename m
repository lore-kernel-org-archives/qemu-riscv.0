Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqoYN-0001BD-As
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 00:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYM-00018J-1x
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:22 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYI-0001eh-Md
 for qemu-riscv@nongnu.org; Tue, 17 May 2022 00:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652760678; x=1684296678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztmteRWb8i441NouTFGuv8lt2boGY+fkUWE8ffGyLY0=;
 b=NKeAENyYfBCpgXtz9eHE/bLvYjJwW61ZjqSaaHfhuKOf9aU5yVvF1V0l
 D5bjfRuxYZJo5CKSkY+cTEU2Gd651LMwdqQf6GtoJnSTzlQXALT1l3fzi
 VW0Q4MhDWvBzonJD968gV4CRCOYKZ9eeTx5q+FbvL4xN+P6QjY9uDs/Sl
 2Lh5xGFKpM7xoJuVw4Xjz0xfxP7QmmNrc4lCniYHYjvoBe+IUwmEJ2wc7
 vxR9Le6eDk4y4O3y4vW76rudFS/Fli6mN27LbwSrmRz9hCvmy8pNhLrFB
 kWZb/oh6qcuS6TII4Kaa0C+zd1BD8tjFb2UsbIzCwYpfkhnjmYdDgZUCw g==;
X-IronPort-AV: E=Sophos;i="5.91,231,1647273600"; d="scan'208";a="205370379"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 May 2022 12:11:16 +0800
IronPort-SDR: Batzfs4ZzbJD0vIBfAJD4E4IUJIysvNsRpheCMw8Sb4jNAvqrO+ENAuCHOZOIGO+a2DgVjtW/h
 1ILjCmxn7zmDZTUQETC6ItU3Q9pkSY6m3HunxL0s+avctRMKAeFG7tg/y3vruexUd+QqfiD9wT
 K94Z+USfRLvyJfi4yEk7rhvhezhCefcP2oMf3L5f0iTQaPNulANPCw0pGqMUyPLfatgxZ6jGz8
 QtY4XEyL6ah6EL2CJ8cH9Xk7GqfGDbBqZ+vSDULgHGrdmFFWjwkP11F/uLbLf0H383iTWu7Gu6
 AAfRqByc7UJRauxv03jKnYHv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 20:36:57 -0700
IronPort-SDR: NaIR5ED/7FDSE9VcRTqSiUJ91yK0GjnOvKikBG5PLkH2SNxtaB0FAl2FMYyFcQrLF7pzSNPpF1
 LAMoKIpfFFtMELzw+7qaJrTQo/oQZKimzruHcmjQ+VS+sBBSMoJks55Y8nUmhiTOEUzjeeveH8
 Yb1D1WBvDvsL0O/5WYjH80CMcCZjenWHnY5WGLK+NQ4Ng2nWXbl09iqwOFNB3tuZSLBkV4as2v
 qONbcIln6M5OUeLO8Yfco5ND5vEBNjqI6x0Fv6RugT0+a+oV1XroJGfsQ3ogLtYUI36uVlK2k3
 9MI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 21:11:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L2N386Tzwz1SVnx
 for <qemu-riscv@nongnu.org>; Mon, 16 May 2022 21:11:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1652760676; x=1655352677; bh=ztmteRWb8i441NouTF
 Guv8lt2boGY+fkUWE8ffGyLY0=; b=oh9ZfSWLTsAa7fx4n47TUdWgAVUp8mcL4q
 n/Ej8YmLhbM/XJJQ3Cuk8Uyzxv/oh2RKPF53y9X0Y0fSQGDz8zKF+XjUe+yetiZY
 D4vsM1XCjE7ARTK2/QGj2sPykvUsWAKltE2stY3RxtVk1MBREK+UyMmqbDrY9Id3
 UoZEWrtdt2SXOjg85Mg7N3V7s1k6/iK/Sos94pEBJ5TPpyBwkMH7s5Bj0EJgS1u3
 /8n8NDuWKHFQRdZLB1PCn/WQ4ihqY0N6Gg98GV5pk+nHVZ97f+4xWebC4Gu1N1q/
 uqr/1YKKF4aQkwq4deLc8cTb334kBJiwbipBUVQIZ9JbggSqXVPA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3IyFvk1akFvK for <qemu-riscv@nongnu.org>;
 Mon, 16 May 2022 21:11:16 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L2N360cFVz1Rvlc;
 Mon, 16 May 2022 21:11:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com,
	palmer@dabbelt.com,
	alistair23@gmail.com
Subject: [PATCH 2/2] target/riscv: Run extension checks for all CPUs
Date: Tue, 17 May 2022 14:11:00 +1000
Message-Id: <20220517041100.93045-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
References: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=129fa4c84=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 May 2022 04:11:22 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Instead of just running the extension checks for the base CPUs, instead
run them for all CPUs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 161 ++++++++++++++++++++++-----------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49b844535a..ee48a18ae4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -593,102 +593,101 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
     }
     assert(env->misa_mxl_max =3D=3D env->misa_mxl);
=20
-    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
-    if (env->misa_ext =3D=3D 0) {
-        uint32_t ext =3D 0;
+    /* Do some ISA extension error checking */
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
=20
-        /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
=20
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
+    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
+                            cpu->cfg.ext_d &&
+                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cpu->cfg.ext_i =3D true;
+        cpu->cfg.ext_m =3D true;
+        cpu->cfg.ext_a =3D true;
+        cpu->cfg.ext_f =3D true;
+        cpu->cfg.ext_d =3D true;
+        cpu->cfg.ext_icsr =3D true;
+        cpu->cfg.ext_ifencei =3D true;
+    }
=20
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d &&
-                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifence=
i)) {
-            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-            cpu->cfg.ext_i =3D true;
-            cpu->cfg.ext_m =3D true;
-            cpu->cfg.ext_a =3D true;
-            cpu->cfg.ext_f =3D true;
-            cpu->cfg.ext_d =3D true;
-            cpu->cfg.ext_icsr =3D true;
-            cpu->cfg.ext_ifencei =3D true;
-        }
+    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "F extension requires Zicsr");
+        return;
+    }
=20
-        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "F extension requires Zicsr");
-            return;
-        }
+    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+        return;
+    }
=20
-        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
-            error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
-            return;
-        }
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
=20
-        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-            error_setg(errp, "D extension requires F extension");
-            return;
-        }
+    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+        error_setg(errp, "V extension requires D extension");
+        return;
+    }
=20
-        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
-            error_setg(errp, "V extension requires D extension");
-            return;
-        }
+    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f)=
 {
+        error_setg(errp, "Zve32f/Zve64f extensions require F extension")=
;
+        return;
+    }
+
+    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+        cpu->cfg.ext_zhinxmin) {
+        cpu->cfg.ext_zfinx =3D true;
+    }
=20
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
-            error_setg(errp, "Zve32f/Zve64f extensions require F extensi=
on");
+    if (cpu->cfg.ext_zfinx) {
+        if (!cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-
-        /* Set the ISA extensions, checks should have happened above */
-        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-            cpu->cfg.ext_zhinxmin) {
-            cpu->cfg.ext_zfinx =3D true;
+        if (cpu->cfg.ext_f) {
+            error_setg(errp,
+                "Zfinx cannot be supported together with F extension");
+            return;
         }
+    }
=20
-        if (cpu->cfg.ext_zfinx) {
-            if (!cpu->cfg.ext_icsr) {
-                error_setg(errp, "Zfinx extension requires Zicsr");
-                return;
-            }
-            if (cpu->cfg.ext_f) {
-                error_setg(errp,
-                    "Zfinx cannot be supported together with F extension=
");
-                return;
-            }
-        }
+    if (cpu->cfg.ext_zk) {
+        cpu->cfg.ext_zkn =3D true;
+        cpu->cfg.ext_zkr =3D true;
+        cpu->cfg.ext_zkt =3D true;
+    }
=20
-        if (cpu->cfg.ext_zk) {
-            cpu->cfg.ext_zkn =3D true;
-            cpu->cfg.ext_zkr =3D true;
-            cpu->cfg.ext_zkt =3D true;
-        }
+    if (cpu->cfg.ext_zkn) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zkne =3D true;
+        cpu->cfg.ext_zknd =3D true;
+        cpu->cfg.ext_zknh =3D true;
+    }
=20
-        if (cpu->cfg.ext_zkn) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zkne =3D true;
-            cpu->cfg.ext_zknd =3D true;
-            cpu->cfg.ext_zknh =3D true;
-        }
+    if (cpu->cfg.ext_zks) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zksed =3D true;
+        cpu->cfg.ext_zksh =3D true;
+    }
=20
-        if (cpu->cfg.ext_zks) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zksed =3D true;
-            cpu->cfg.ext_zksh =3D true;
-        }
+    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
+    if (env->misa_ext =3D=3D 0) {
+        uint32_t ext =3D 0;
=20
         if (cpu->cfg.ext_i) {
             ext |=3D RVI;
--=20
2.35.1


