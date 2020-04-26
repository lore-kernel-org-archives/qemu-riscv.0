Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jSk8D-000583-8D
	for mharc-qemu-riscv@gnu.org; Sun, 26 Apr 2020 12:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8B-00053v-PX
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk8B-0004gR-EU
 for qemu-riscv@nongnu.org; Sun, 26 Apr 2020 12:27:47 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:33806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=378a396a1=alistair.francis@wdc.com>)
 id 1jSk89-0004Yo-V0; Sun, 26 Apr 2020 12:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1587918466; x=1619454466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xsVCLS5q0xjogyAiHTL/Msy62bmfV12C+dpazgU4Msg=;
 b=B58fVmt54w60d5OMLjVBHH9j/TPobpIGBpjc3W7fND+kCtNEpVOl5WAE
 2SfT6oAFWDapoyL8gGXyTvsd05PGTy1OzhEcgVmXM98cCr4kPCLIfj0oW
 xYLH9zbTGLjNLnRK1/vsfoaSTnedlOtshweg/UkO7EWGV4pBML9+yqrbe
 DLV52V46sOUrAY/VrjISDVWndgFEN7Nx3XQ4cW4iNBqtlBZyhO4EFjCAk
 1Epp91QN/r+pgquiJWupNawnLeqs866OOF5gH6W6/KcoFqu6Lg48yANKd
 EjZqPMd8qdAbuStB4NFP6gXeiuZm2TxWz+EV9I3zzxXS76px+F6gUBA/y w==;
IronPort-SDR: kmwDZT5/QpK3EfP+dYyNpeJWTZ2+t9+KHbUsuKDKtQBNfJhBB3tjwfvpdiV3WceoUl2kCht13n
 YI+OB7rILNy1fvyZbVhhzmKIa3K0YRiNeghu2kR/NcTMIxG5aeuAdorL1Yfl12AiftoHIiZSAW
 aIoRBVdCgnTh0tcHwgJNXUlzCMwTEN3tMIVbAvH1qZC5RnrrPgtD5LXoLbbBlv4emOu+9JPjAg
 ezjnHN5NiZElpiz42G2Lf8jH1+O0WX/UXjwlGyFTPb0H+WpQZNDdMgxgN08BxxhuNxQdeLjj3/
 H18=
X-IronPort-AV: E=Sophos;i="5.73,320,1583164800"; d="scan'208";a="137626684"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Apr 2020 00:27:45 +0800
IronPort-SDR: XwocXQPvrzQZTBQHxwI1oVG1AgVkb5o0az4KZYA9sWGx6XOeLGQgE3gO9E63ohSdWQztl2xcX+
 84065km3/vbKY+Wa/90qq/yyYpPWEBuhI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 09:18:27 -0700
IronPort-SDR: HUjn9UwYewyWya5zLTLgjvcVkZBXzg8riK2nCB2ogyVS2CGRhjlxgukZLDLp8inaaUsizWQSWL
 BoNHFdgyvwCg==
WDCIronportException: Internal
Received: from wdthnc17-0189.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.50])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Apr 2020 09:27:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 08/15] target/riscv: Don't allow guest to write to htinst
Date: Sun, 26 Apr 2020 09:19:34 -0700
Message-Id: <27e54a61a2698944896f28637242218c9d0fec0d.1587917657.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1587917657.git.alistair.francis@wdc.com>
References: <cover.1587917657.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=378a396a1=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 12:27:33
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Sun, 26 Apr 2020 16:27:48 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 11d184cd16..88cf0ff600 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -940,7 +940,6 @@ static int read_htinst(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_htinst(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->htinst = val;
     return 0;
 }
 
-- 
2.26.2


