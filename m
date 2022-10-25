Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onBdw-00085d-8i
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 00:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBdu-00085N-G4
 for qemu-riscv@nongnu.org; Tue, 25 Oct 2022 00:34:22 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBds-0000gc-Gm
 for qemu-riscv@nongnu.org; Tue, 25 Oct 2022 00:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666672460; x=1698208460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JRQyyYjmjxj8qhCTr74r1M15DhiJSKiwH38cniHS6o8=;
 b=eawxtG3X4XWd8i8FMH8av/679ODlAbd7hhxNtsmqWDKItYqIAjmRbhSH
 6Hth8VkVdeKlE4PoBVMvc6McI2SVgcDp4OoaybgNE0S88WBaulIUYCwJ9
 tLPDVzUyHwlnh7jCurQkoVj3oS8UxkpXr7vpMnygryPfQq8LdX5HIJq/a
 0z61sPiWs8dkFj9zqx8xMCtYXXCZn13jtoPXRE4T4qiQ5i9BPBaEg98lZ
 We2swwCWYw/6mwUbyw67hRqpJIQlTwrJtWA/JI0mEHntTWolCvpQNPdqf
 gRKrMIZxQ6wGTxCU6kd1W547Taa/QppHZCvI4LOcCZUO/OS4FmkY9ygzc A==;
X-IronPort-AV: E=Sophos;i="5.95,211,1661788800"; d="scan'208";a="318978927"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 12:34:11 +0800
IronPort-SDR: 4gog4NhpttsJSoVA5I1HDDMkxgVhZjkNP1McYj54ABL0uZBrlwG0S5zDYVHGMeFMvNtNRsBkUV
 fv+dy4GDJzMoXOZsfyQLmqcwUUsZp9U1un9u5Nms+TQ24xJjQV8/lgvV8IMn6CAxS4BtaoqTpq
 2rOCuq/cOc+SfbGgHcPrbzdSKAUR+76QO8IgkASjRHwGdkKgwGSvOE6+e3LWz5BmiUgdOwzpZc
 iVuOmaAve1de7CsVlWjebvZQdGR102GSVaJv5hG/driXAGwtYodMdXPRLasXUuvIp5JFDyWocq
 j5QScz74RmA6yxC3i8dw0BlQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 20:53:35 -0700
IronPort-SDR: lNA1In+xHFWBPZ0j2OzaL1qkYQhBfE672TDubvgdxJf79lPhAAJ/11MDskimkimXW9S1cN69ez
 s3ZdNnyU+FcHKDL5nJQIyGTWVryNFnHnc4EXn8lXU81ZasJIcZCnqYmpeQzNN7nJj47Aj/QGRQ
 sgvGsuk4cmOrmIFz74OWOr1Q5l9AjBFTYAHESDJZoCMYCjyG1d3NQVLq+Xk8QcLJ5m+TVGGTwg
 blRNGdBBDLJHZCVBMadeyNIvq6WbZAfoPECO/u2CSIZCZyo+anF45QnPqoYvyJ168hISvR128L
 BNc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 21:34:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxJxH0crKz1Rwt8
 for <qemu-riscv@nongnu.org>; Mon, 24 Oct 2022 21:34:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1666672450;
 x=1669264451; bh=JRQyyYjmjxj8qhCTr74r1M15DhiJSKiwH38cniHS6o8=; b=
 c2X7Z3t0Zm6soDtl2QMl4ZHT44lmO9xxawMo+dudxRX7rYTmIDQN0lJjsTqvmTQW
 LCJ8A14XQTZxFlnhregn+ULMJ16/q16lSGBjk5JS3pWRum6FG8aeyXgw8YSUjuie
 POXRYwTdxgEcSwgmkGgi5WXJPkDmPbRjkiMiJhyMBL4xY4Lb2Q/83h1K+SD4TRMW
 qU05F2raknFDQGUow+Lk1Hga4kEWD86fLxIwGmfX6T+nljKTzIeWWzhrTamD0oVh
 jbRrxeumv8A62tKv8IyzVEXCYHgv5cKn5ZWkX0uVV3OErw1aThOAkHfVAH1FfVC1
 UygyXjiipTNoTpPGN74xRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4lbJzvIH_nLT for <qemu-riscv@nongnu.org>;
 Mon, 24 Oct 2022 21:34:10 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.78])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxJxC3dGzz1RvLy;
 Mon, 24 Oct 2022 21:34:07 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 0/2] hw/riscv/opentitan: bump opentitan version
Date: Tue, 25 Oct 2022 14:33:34 +1000
Message-Id: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 25 Oct 2022 04:34:22 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch provides updates to the OpenTitan model to bump to RTL
version <d072ac505f82152678d6e04be95c72b728a347b8>.

A unique change here is the merger of hwip `padctrl` into `pinmux`, to
reflect this change, any references to `padctrl` are removed.
Additionally, an unimplemented device for `aon_timer` is added and IRQ
numbers are updated.=20

Patch was tested by running the latest master of
TockOS as of this patch.

Changelog V1:
  - Added a comment specifying what
git SHA of OT we are targeting in [1/2].

Wilfred Mallawa (2):
  hw/riscv/opentitan: bump opentitan
  hw/riscv/opentitan: add aon_timer base unimpl

 hw/riscv/opentitan.c         | 24 ++++++++++++++++--------
 include/hw/riscv/opentitan.h | 10 +++++-----
 2 files changed, 21 insertions(+), 13 deletions(-)

--=20
2.37.3


