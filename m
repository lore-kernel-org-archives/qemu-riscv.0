Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe6mb-00042v-Et
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 23:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mT-000404-KQ
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:33:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mS-0001aB-5H
 for qemu-riscv@nongnu.org; Thu, 29 Sep 2022 23:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664508820; x=1696044820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2DcQu+pC91BO5Pmhw/ct7ghDnUuC5IVKwmg5u4/jxyA=;
 b=Ot1HFh+xrvVpVYsLiv+gpvWCwTEYuWRxTqfpqx++iauGijkfeu/F3ycW
 4xxnX9GBzaL20h9Ai2MbXKmwJHt8JFn1pwRLiUfsoEZ06+T2FEmwJLPiN
 oo2+Njw6JnLuEX24mAwQWHLhAssYlYbaY8MeeaFY4u0cRuGmkCewdBhLt
 /JiT8XJhJPlfbal8yO9NaURoi2ogdO6NjSxinnP2leYFXopGSaJayhCUw
 kxiG2B63ORda6RIE3U8B2GbqYvc7KZkwMls0CfTHFQu1TzHBFVdU4H3EI
 Q04sHAFW6BwU29GrMLAKbaPZRdfUZwNKQs/YC4U/vwqk+aACpNsedmaTt Q==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654531200"; d="scan'208";a="210991982"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2022 11:33:28 +0800
IronPort-SDR: YOmcu93ZK2H8AOQeyzGw3O6Gdf+A4V9+IOG9n24R3nF2jOGcHMqgBx+KumxkODOR1jPibeOZRR
 uGtKgcb1pxIIWwCYYKz3SXG/Iu9aYjlhK06z4dMXyIM4SNHxTtIft6whqmSThI77mGocRggR/b
 UYJFQjEEqmntYgy508Cpc+aKDYoR2fxu+TzsZDjbu4BWg4dmqQluXWNMs2LugnhhhBrIpoOe/M
 oSHli2KbFNcbehQRH56Zg0cmylVLUbeKj6zK8TCjB9rmhWvwl7oU1DA40s4PnfHKfcZ7Ixt3i9
 pSMnF6tSUNmX4aAAcgdElizl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 19:47:49 -0700
IronPort-SDR: 8M57wOptfC6wzSBVCj87kTSW2CHO4NU4mQhSemMNdgK9DoL0kV92hhtyouqDnusXu6tApHZz4t
 z+w0Y4cP9oGZej2U1cMjCv1Gcasjqhp4FrE49u4quzZG7k3gt69W3BTK+4HWP6Ry/v28oPd9xK
 bJN/DmLzkVtpW9F7Q9j7yT+tsZAIkPIkW56dG3zTRj++CQvsqWrXgHvILNYoyEbE8aJBulSDK1
 Mxir+NvdbEB/KDAk6VBJ/aqQQf819CAZ9FLFjfFnqeK6d5s6NTLt9SE7cczLPiD/hjcPrxMOH0
 2YQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 20:33:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mdwmm0Cj4z1Rwrq
 for <qemu-riscv@nongnu.org>; Thu, 29 Sep 2022 20:33:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1664508807;
 x=1667100808; bh=2DcQu+pC91BO5Pmhw/ct7ghDnUuC5IVKwmg5u4/jxyA=; b=
 lhjjLlFgqK1+Sp5O6HTY4CSIXrsuXuxB2HBPjkFfMNB4rnlSzPjsPiWi+1YXZKPF
 pjgYldCQ3wZuGMPpxpGPY9mruqGcyIRHFc0316I2eN0MExDTrhnoYG5fDdPaFRuW
 kR8A+Jmc+UG7qto+/HxFiFeXIZAPsS5yoTs9JF5IJl365WYxq8FKNw6YOw4w/7V+
 YVyieVxM6XK9Gb2ibqw+FMpAvkRiRekgMmTG4CvHWhJ+uhT9wYWEATo22OG8X3BZ
 bdeeAoFV/vld6Gz3JY1kGPaxc19VWToFlpj66cgCHnI9skOOOSuIUx40AhNbjWRd
 z5F+AXXQoBuM3/696wd6Bg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id U4sOz9jV-nyl for <qemu-riscv@nongnu.org>;
 Thu, 29 Sep 2022 20:33:27 -0700 (PDT)
Received: from fedora.wdc.com (unknown [10.225.165.55])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mdwmj3Jz5z1RvLy;
 Thu, 29 Sep 2022 20:33:25 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v5 0/2] hw/ssi/ibex_spi: bug fixes
Date: Fri, 30 Sep 2022 13:32:40 +1000
Message-Id: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=265e2c498=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 30 Sep 2022 03:33:41 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The remaining patches in this series address:
	- Coverity issues for `ibex_spi`
	- Adds rw1c functionality

Changes since V4:
	- Fixup compiler warning for unused variable `data` in [1/2]

Wilfred Mallawa (2):
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality

 hw/ssi/ibex_spi_host.c         | 166 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 102 insertions(+), 68 deletions(-)

--=20
2.37.3


