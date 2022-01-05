Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ESu-0001Zs-O2
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ESr-0001Wy-3E
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:09:02 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ESp-0001DN-55
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420539; x=1672956539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SEiOHlJj5xbKXbw7cUvBTuIDNdThltjWHQqPVs9QSEA=;
 b=R4lSFgvKpfAnY3eNSE46dYccpOMeVIFfT2nd/g6QyIFlzehyQa0U4s8z
 sNpzfxY8pKlwg98xvmvAmw1sp39AjjCtIfX5z5hIS5qZwoVQnP9On9mfQ
 8mIAs/JfhGNVOpOk947KNbb6xtiGuEO4EWwcz3bSsvLaEzvAWF/drMCVv
 KmlIPf2RBu5uNFYUxpl9GygdAgWzxssJFpZFgdPqvHsE4J/ijVsY1DRSp
 7WYB9lKfmm+MnCH1SudHSoW3ZEUS5hNR3hPjLiXZ/761svSZ7OH5tUyt3
 gUQtkVUyvDX4Z4OsN7SimmI4hUV7f57E/XA0cgRbvVY78nqPwu+T2UDC+ Q==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="190799253"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:42 +0800
IronPort-SDR: kJCUZa83i8B34WrJOVwkDVo4SOYx6aG9SDfiSuBUNAJDGgPacL59zUT+CuJIitD6YOJ2BDb39s
 zIjlT07bTKUmm74ZgPgMcTgUcI+9sgYdg+XBI6UHmGtiRBm2xF2m60Q4pW41Q0W87e11sb05gc
 J0pbjew8V6xnjbwS7Tgdb3Ef67CXyDPF0Uc1uoCJ8r+LvmVG6b3MqYzK7mPelQodQH8agvaFqB
 Iik334X4cxVoSg2meZ0mkcZWUXGYcuyulgZjC4lGZiirBeJF8DbmfhQFjIWiJDWvV3ZYU96T8P
 TEpnmiAGcF4C87oduZHT/RDw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:13:11 -0800
IronPort-SDR: H0dHFGlGr3HtP5WxsB179eO0oFHxivORDhiFNVifsi8I+nkQgVsIKEwX8AXRi6740iMtFRlwkg
 IJ5Dsu7Ugx63pYLTPLA0hm5Suz3+nx7Z1WadDPjU5Sd0hEhpIx9lC/kWMpPkWV1HF9fvnmJh2c
 N4kLg3sX59DA94NW3RSb/tROGTzcxu+TZPgkIshuzN0egDyyenP/5d25o8A6tYyO+DBeUiz0pN
 y1X5QTv5qpq/PDM0ZOOIXhBbcH0Sjo1sG9PpYvNHeFLVzeXYpRa0MM7nUPVWx01mQwuocXRLYG
 a/8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZw3bjWz1VSkj
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:40:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641418839; x=1644010840; bh=SEiOHlJ
 j5xbKXbw7cUvBTuIDNdThltjWHQqPVs9QSEA=; b=YvOiuzaJZVqooc6jeIYe6Xu
 MsExGqhNUi8IJlfJ7hs5xem5dlzlHvYxKoKwbnDsrVV4mhpLYqhGxENaHIklVC/2
 siIfvA0P7JMAW3Jj/9U0KZeA2vBAlrKTbxlPjhVX17aatOBTARk9/1cNeQY8g/uU
 Jz0hcKJHQhRf/ZmqxiP709DFkTTwEXhcUW/rtsEACBSC6myVUu3v9JTrySrxZaOO
 GZREx1YZUTKVrtwUtiKBFctqvOyDDnN1ToSCbNzdsfRzvtXE2W0vgDx5VeIl9DeE
 YxiZt3Z4BfinzKAiTisjF9HSRd83wc9cf0SltHMIrZTypPFsx2+BS86Zw9b1tFA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OstjYK2F9uiG for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:40:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZn0fDQz1VSkV;
 Wed,  5 Jan 2022 13:40:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 8/8] hw/riscv: virt: Allow support for 32 cores
Date: Thu,  6 Jan 2022 07:39:37 +1000
Message-Id: <20220105213937.1113508-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Wed, 05 Jan 2022 22:09:02 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
let's set that as the maximum for the virt board.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b8ef99f348..6e9f61ccd9 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
=20
-#define VIRT_CPUS_MAX 8
+#define VIRT_CPUS_MAX 32
 #define VIRT_SOCKETS_MAX 8
=20
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
--=20
2.31.1


