Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqgB-0002Po-3D
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:43:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqg6-0002KZ-W2
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:47 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqg5-0006Bc-EK
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945823; x=1670481823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayBTYXwSr3LpHDfXsatQL6OmSGThM5dBa3wy7BLUtaE=;
 b=Uyp8XgSn5YX976rQ+yfgtln3p+z2L23+9RYVxIyoUmAtI3gUL/HO9A06
 fH1cyrtZiyWwiigG6D1+emN8C8syyzxL9hbaSDwy37zzeKSQOazhFoQFS
 NIgPJLeEtuFwFmYYtUs+qoZZhItrH+f/lCRyGuNB1LyfTo80GDnEEhcD6
 iSGLIDleNniNa4wWllkdYDFP37cL4ul0V71zS5WSihTyyhrqa9/eQMbxh
 DyltsbmAgWRFSmUhFzZscDCFTF642tog9HEwcGtlO0CwbanEGVr43u1W7
 CitGDdM4yQCOb2/8nXbyJ9cjtAfHaFyWGYvEsG0ZGUehXmeomwayDNnTC Q==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="192503615"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:40 +0800
IronPort-SDR: RMt11j1JtjpNlRhRS697inxBBgigJN6Izue1OZw3Un/wmYki8zAQiz5hxmXSxhZIhdyrwv5iJ/
 +Cg4zm8Q8WZUHeSiekTJA91/A1/HZW0qQNPygb7e6V0npZVPcnzqbY6GWyI3HaGo7Xv/blCvib
 9VxQ5kkkRftHXAS34OYxoerKyr+XXDtQn3DcbhTkCvdcuEuAuDC2fvJpjjfNcEzZJP7vBisl40
 dSEwfGeIIylIqYdOG727QCDTTK4aWGp/CzxGahk8Vd4NeRFtlmXGukhRMFiGnkVDnkym4gnfPX
 DfWCzkvY3DGsXBoBiIaxyK95
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:44 -0800
IronPort-SDR: J0NLq5WEYbiCEclBkuoe09ztXQRwJX4KMdb1u+usSBY7AjOGwu2WO/mHwRZDXs9Gw+bTxTa8u0
 IxumfdBEPrZHB4g8g8z0nGJEPgVjfenpjxPmVbJloQ0sv5UfgW1r6RDEz1oVcdjSAUuubQGPM6
 XKVWoZ3ZxEWTcMqkcyeK2Tn9Bw9+R4xzlRzYGo8XIVbhkZtowh+xmSsO7wGsHqAK/QQZrRWVtF
 tfHl0Tk9dHjNBro3GdzJJlnnaFmku3KPrDJJuX6hcsAEkoJo/Ak9C5Zf9CFg5QYIxkwirTSXHH
 Tcg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870r2W10z1RvTh
 for <qemu-riscv@nongnu.org>; Tue,  7 Dec 2021 22:43:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945820; x=1641537821; bh=ayBTYXwSr3LpHDfXsa
 tQL6OmSGThM5dBa3wy7BLUtaE=; b=fIHOfkVT13kC52vFjXAtAFaiwbir4Ow5D1
 3Jo885/ISxbbBMYPxwQAz7Ne1QrlPQz5TTHL5dhTE6DrjNJZagTXuAW4+BySwVvf
 C0z7T6x7q+fhz+75H82hdvewj/86M0/qAVV54y7DZJS7q+olhCAq9U+Mi19GZ8Gc
 bTV5BmQlMowOpaUCWwwu4XXxd5iMLieN1xfQhJUMyCx5PfoA1UOjntjUPP7YQSwu
 /Ci756ddpO8EMPZVidPYUTGQFdsdOQ8t/A1WonPG46x0/OoxqQljKyIdX8pvvA5u
 BvX4FCrG28JwCg6ZAFmbv1Cyhdvk4NR6SWmmEozWO59A+24DxTXA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GoyKmHxYBVQb for <qemu-riscv@nongnu.org>;
 Tue,  7 Dec 2021 22:43:40 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870l3VZ6z1RtVG;
 Tue,  7 Dec 2021 22:43:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 5/7] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Wed,  8 Dec 2021 16:42:50 +1000
Message-Id: <20211208064252.375360-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 06:43:47 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..1edb2771b4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.31.1


