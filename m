Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNpbW-000745-7h
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 00:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbU-00073m-7r
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:16629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=87817de26=alistair.francis@opensource.wdc.com>)
 id 1mNpbR-0003bh-OZ
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 00:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631076868; x=1662612868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ncX/nTcrB+USZpwB3qA/0kd/YLWr+7KU1EPURpT8z2I=;
 b=TmwKuzdiWLNb71P+XLnAXaFBfn2OPLSCK2VubFwj24GsjVtv6SmLOMRf
 vAxa9TxpPkzLWD9TpJWPfA0eBhh3/cYb5j5CLCAONHkNvaEjwHIjZBtEi
 /3ESqAaYKL+ABNz8pH6bmij6VEY8gBnhDvEeO6gSKuF4zsIT8rej3CXBo
 rGG5FxQcEO9V2n6PCC+UiPJL3nUtTvNdcnhZIP9vwTKbLHfdUsq2fQnKK
 pguLBE4YR94aMeAv5YRqOsS9dy+DgvYhBYbG6U3o2WSs+otWcPFoGDmK+
 RC0reNNOAn3kDduoi4/Ti1Ham8MAsFFMkHy235HqJGhrq3fBYAPgdWLid A==;
X-IronPort-AV: E=Sophos;i="5.85,276,1624291200"; d="scan'208";a="179443420"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2021 12:54:25 +0800
IronPort-SDR: x7cTGJ0qZ71jyQyvqwbgaZLjkEkyjyOg0epSxGMk810EQsAjXHepzfW+eGpynJmC3dhIlzb8zN
 pG6pGvYbXeH+eeqgjI+hwPqXX7rlF4CcgJeIVm7SRrdJJqrwKThda6bfbVG08oKXMHeNWmksWb
 gB71oiuYvpAWeX+Ms4ItqTQpkA3pBVbV7K+qxjodySpuZFDGuf4qOiXsbfqna8NKUPzWAx5b7c
 HXaD/xAxohkHsGLe96mS30kphwQpBhEXivZst70S/8G+2bQK/r+jbjWBDVgvbTRLmsPYE1NKdR
 KNSBugh1BK6zXhSToflecW1a
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:31:03 -0700
IronPort-SDR: CcUEl+VPM9bj664yf7cYjHKM6bO0CrVQk/+BgjlDF1wiStJ40DjdV2FC8HFctPakCS/DOqMXAV
 +XpJQXDW6HVOzSoOtM5q9ij4UFJjHkdQCA+B0tBbCW200Jmac0bOy6EXKNJlf12oH261UQGKK+
 vJvBEKCsVPuGULPeOQ0e+c0eWl5iIn/ZFrjNX5gPlzYIG+U5dW42Z7HCs50S1llHaxUz3/kSeX
 Ktjv0Dd+DM+6mi7LfFGCQl7QQ+7I+xO9gffU7MwII0+GvcXvEXsp5nmu1+GKi2RTzu5ISbOls+
 Yl4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 21:54:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H48tn6j2Zz1RvlY
 for <qemu-riscv@nongnu.org>; Tue,  7 Sep 2021 21:54:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631076865;
 x=1633668866; bh=ncX/nTcrB+USZpwB3qA/0kd/YLWr+7KU1EPURpT8z2I=; b=
 Vq81Ra3My9IsPcMeT7/PBXjhuRob+qoSI/YHrX9Ge6dl1hCnFTkXLI4X//lhFJSd
 GTJMlwkOVV6Dpj+GhSBlgY5mNLedIOJ0hwcld7EYz9mWA6gLCShwa1OSGhQhuWlS
 aehY3TRu+dEBIgkkDpMOpTgwKO4Alheq9cACruzC7SNFJzHhqZXjQHz9dlo+jdov
 O3UBBOmw23zdS4ZDe/chHOk1nE0fAJw2lyvsfl60hKEclNagovQWtoiP7pyF6/v4
 ZBPJGGBbxY5+VSel9FIsKDmKOYJXdRfUTxxMRi5rtsp6ElIafZm1IIOqOFC2iD+8
 YDy3LYkiNKtEEFQmUcC+WQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Jfk3bjNg4Auk for <qemu-riscv@nongnu.org>;
 Tue,  7 Sep 2021 21:54:25 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H48th0Nj2z1RvlR;
 Tue,  7 Sep 2021 21:54:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/3]  RISC-V: Populate mtval and stval
Date: Wed,  8 Sep 2021 14:54:13 +1000
Message-Id: <cover.1631076834.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=87817de26=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Sep 2021 04:54:32 -0000

From: Alistair Francis <alistair.francis@wdc.com>


Populate mtval and stval when taking an illegal instruction exception if
the features are set for the CPU.



Alistair Francis (3):
  target/riscv: Set the opcode in DisasContext
  target/riscv: Implement the stval/mtval illegal instruction
  target/riscv: Set mtval and stval support

 target/riscv/cpu.h        |  6 +++++-
 target/riscv/cpu.c        |  6 +++++-
 target/riscv/cpu_helper.c | 10 +++++++++
 target/riscv/translate.c  | 43 +++++++++++++++++++++------------------
 4 files changed, 43 insertions(+), 22 deletions(-)

--=20
2.31.1


