Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkpp-0005k3-Sg
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 03:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=897d3aada=alistair.francis@opensource.wdc.com>)
 id 1mUkpn-0005i6-Mk
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 03:13:55 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=897d3aada=alistair.francis@opensource.wdc.com>)
 id 1mUkpm-0004r0-4P
 for qemu-riscv@nongnu.org; Mon, 27 Sep 2021 03:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632726834; x=1664262834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t3bzS1775j+tHFw5+acFJ7DeBVfviDy1b8XEhnA5Z2o=;
 b=lwESpP9PiQfnTMhMwAj8ukwG6h9PjD16BqzTPstCkOCPZs3CRfv/V6VR
 K5y9PBcLPLbxFC5CA3nqThniMXKDkXs9xp4dFnlf3AAh0bTlC7mc0Q+KU
 3/QjxZVSNwaK7rvngrq/8mlOI5Qxkcy4TD3llGWwCOgae7C59eTwYxWxi
 YAFL6ct/9AtMeyxOSrNN3tI5Q5NoHFJ+pW1tA1BoNd2aHFvJQi7f4s11+
 lXwdSr+mp6/i5yzG+J4NqJ1lK2Y524w70ZZtFKg2yCzf29RnFmy3+j27F
 wk1OXuKWhfzaGuDH3H0uksL7wEZfgnUj6ocLVkmA0DbEJupPhWrQp16Tu Q==;
X-IronPort-AV: E=Sophos;i="5.85,325,1624291200"; d="scan'208";a="181654341"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2021 15:13:44 +0800
IronPort-SDR: yMohCmw9Wjhcux7rL/+iWc2/tPCazQ7LVJOh6/U8fFJIzmFpm36y11Be7MTLpXlFQk5a0Yu54i
 DDc9SWUv7oZRa5SIyTwYUglWJheRzt5lnQyT7XUSHO4vcTeVKceNfiieCDHzpXQeJ7XXpPxYf1
 wNMs/cxzx9+DPyO+XNF/Z1S2ZgIvce9H4jkmh216OrMGiA5c3q6Q8KkCN8188AQkK+pPEq7GtQ
 uF10zJ61ph3tey4xnDtj/CHNEKsWPSQcezBI36d9EXnv6mG/LpNHWyCnQAoPCEQ2YECnFP2YmX
 ldKkY30xmk2dUn9E0GdhV3gc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 23:48:17 -0700
IronPort-SDR: X1MmiWOrzjs9fpyBHKKZZK2IABQTCFadaBq9kWwShZ/Bc4V2Qfyb4l+uVsqC9RHDQa85nqHyzp
 UXASl2VYBEltl7J7+qB1X5GIyUY5XeCrvn1tKciJw5I7oBO1JkXjBuakTjKcjQqGW43FQe7JJ2
 GyWN0GFOFchvf1OP87w8HKLCUG6kJq7BIm/CLQW7WqY3dwWC2V4Z9Ln+4zG7lRAqJFAhyJW2Gc
 4ongILd7WfaJPDNY9GtDatiNOYTO8iHQCE6e+gsqLwkqKSL2KfYflNlCJ6rOCBYrcoGGPlfuCr
 A+I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 00:13:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HHv4l2ry4z1SHvx
 for <qemu-riscv@nongnu.org>; Mon, 27 Sep 2021 00:13:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1632726822;
 x=1635318823; bh=t3bzS1775j+tHFw5+acFJ7DeBVfviDy1b8XEhnA5Z2o=; b=
 V8ht1vBn85SSKKHEuXBlstNju/7JhOOwRqUI0zSPYQscGsooff0Grtp579ml4IoK
 YhzPpT6oRblAzxe9/ppU4NNpL9kjxijA45H4jHZp36upUY4sTxvw1ZkuHEKmWvYK
 DlRf2EY1YiEeWaWDTkJooxtfWj/WTRA5XOXTONeR+KCY4PnfjGItWofBHARsC5id
 0GXH+d8SY/t5BUTO8KPgSmX4Ij+kiUeoZ2ctxpNrHa6LTBAeNJWkmfNW0iAS+9MF
 x8jugo0hawBC3y9A5CFgrgkr1JCElP2K8AwlutMfS4nADfB9eyup9mgekteoxdfM
 Kyo89DhPRx/cibi+rIXFIA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EgSPQz2g9LYO for <qemu-riscv@nongnu.org>;
 Mon, 27 Sep 2021 00:13:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HHv4f2JQSz1SHvt;
 Mon, 27 Sep 2021 00:13:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, f4bug@amsat.org
Subject: [PATCH v1 1/1] hw/riscv: shakti_c: Mark as not user creatable
Date: Mon, 27 Sep 2021 17:13:32 +1000
Message-Id: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=897d3aada=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Mon, 27 Sep 2021 07:13:56 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Mark the shakti_c machine as not user creatable as it uses serial_hd.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 2f084d3c8d..603992d442 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -150,6 +150,8 @@ static void shakti_c_soc_class_init(ObjectClass *klas=
s, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D shakti_c_soc_state_realize;
+    /* Reason: Uses serial_hds in realize function, thus can't be used t=
wice */
+    dc->user_creatable =3D false;
 }
=20
 static void shakti_c_soc_instance_init(Object *obj)
--=20
2.31.1


