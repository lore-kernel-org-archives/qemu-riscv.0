Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzCUN-0006uf-LZ
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 01:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUI-0006s5-2X
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:35 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUG-0002O1-7M
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982972; x=1671518972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6JKwS5ppCb6tYc4q1z6gITxAoMMDoHNGnK3uVsKI14=;
 b=Gg5nKjsFU17fy8jAPQYV3IR87BtVh7xt0/LCIw3s1FUkEY/jc2+ecx1g
 xuWE4wThYUkUx/1OUu7D77o/YClZQdghoC/2OBc/siafArHGOGAQvuwW+
 cbjfSkjs0VcnzDf4LfeVG5uv/6SiGvXslrHlPVrQNO+b+c0OjqJvIF574
 j52GagyNRlkb3RNbTxbG+b1NMwiRCdLAXhirtuqttiiQp5t3myKiJmSTP
 T0Se20xwN7WZ3xt3cLfxhTnDkq61YeZZVZwarfff37tw2tMUT/JBDIZPT
 mj5+UTNJKjDjzfIqrcK0Fz6R2EVb5xz2SsaK5A2QL1kojBj23mqBb3iGU A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="187632717"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:28 +0800
IronPort-SDR: FpXlRmhEhuPo5+BMq6eh1RSEyno7ej+Diu6eHoidxO0zXhZKxH/eAdgiReS4bvpccBqOfWwucB
 iJ8DihjE0/RJS99UIWZatiFDxtlGnqUFbgiL+6i4xhXiY78uiQM1xOjkUFrV/7CfO/VFcUd9Bn
 MPobjETRURDnfbQmO67b56fR8up6IBFEsN5wrBRNeZ/rf9OHcuGMpsNUuboT2kZ+PVZVBQJ5IN
 c0rTVq402Wv1UghI1+NoFFDkE5Wyh/DI/y3ap2VvHR7hO9kmDFPnZuvtzoHmFz35MrvpBfdmG4
 NDpYMEO7aUyg9ZVS7BoTv4xV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:23:45 -0800
IronPort-SDR: l5v8hJXkoyPsheduGsAjgCpvRKZl1qNU8dNkawe1h6QKBTXpkahiJ5BuC0DhWlWfiKYoyy85Q5
 4STfKV0Fh7+SfmF++1CgNw2T9ZCi/8XC+SqHdsnUU9YWGD0ileAR48nZLayiBTVoJ56myxTKx+
 ZXotQwk5C3+H/w9c2PJiFLqcv9WnbEJYOpva2spNrEEyRnRb+iAXWwwUZNcCD1xtQqdglB6Boz
 j8C/owF72bRsa/+iHg4r/tO8dn/Ydy/Fko9nZp+VxlpmT07+he2cnLqCWYvO2+uOP/7PD7vJba
 9hY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVYz4YLTz1Rwnx
 for <qemu-riscv@nongnu.org>; Sun, 19 Dec 2021 22:49:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639982966; x=1642574967; bh=W6JKwS5ppCb6tYc4q1z6gITxAoMMDoHN
 GnK3uVsKI14=; b=Bu6dc+/OqR8NhvLEj2BLZojiCvMsgBDQkeZRTITLbq+ZXwLq
 DJzkjk0uPmxrzlhtfNu3FndkdrQ038nYnyWC7+5JAAAic4w8uTUu3jaWeFYIwsaw
 u9dKR7uV6MBlo1FQDnMVs7pdKUWVjxUvAMr9jQ5uXY+vv/303726PI9M7kbDUlT2
 rppyosSBvp5vxbMB3lWEhQSj0drjoTDFV+Vudf9U2/BLve7IRaiZq7R+c85u+Cu6
 EcPOC7gJQa4sqGKR1Xt0yePFmEviXzCyXQco4n3vKtJGWjcMIa29V2GCuWYEkhU4
 0r9vWr68ST8xE+kSdSY0VrRdfOuZ/ClX1B2f6w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6AbK0HMsmpXf for <qemu-riscv@nongnu.org>;
 Sun, 19 Dec 2021 22:49:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVYt52mdz1RtVG;
 Sun, 19 Dec 2021 22:49:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 0/3] RISC-V: Populate mtval and stval
Date: Mon, 20 Dec 2021 16:49:13 +1000
Message-Id: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Mon, 20 Dec 2021 06:49:38 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

Populate mtval and stval when taking an illegal instruction exception.=0D
=0D
The RISC-V spec states that "The stval register can optionally also be=0D
used to return the faulting instruction bits on an illegal instruction=0D
exception...". In this case we are always writing the value on an=0D
illegal instruction.=0D
=0D
This doesn't match all CPUs (some CPUs won't write the data), but in=0D
QEMU let's just populate the value on illegal instructions. This won't=0D
break any guest software, but will provide more information to guests.=0D
=0D
Alistair Francis (3):=0D
  target/riscv: Set the opcode in DisasContext=0D
  target/riscv: Fixup setting GVA=0D
  target/riscv: Implement the stval/mtval illegal instruction=0D
=0D
 target/riscv/cpu.h        |  2 ++=0D
 target/riscv/cpu_helper.c | 24 +++++++++---------------=0D
 target/riscv/translate.c  |  5 +++++=0D
 3 files changed, 16 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

