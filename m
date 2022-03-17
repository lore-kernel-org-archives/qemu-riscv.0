Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUjTS-0001th-5f
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 02:19:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjTN-0001rY-2M
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 02:18:57 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=068022f98=alistair.francis@opensource.wdc.com>)
 id 1nUjT4-0004O1-UX
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 02:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647497917; x=1679033917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5IjcgmQ28uU5Irg=;
 b=Ev/cZZSLPmfZdE5QMRJDdAE561DkiuVqP5vQ+Fmd8CtJvsmKfe1pjTtF
 55MpJ6PCCwChWFOcT5u+i8rGa0Epko/+h1zpDMJqDSdUuWvjATp+GgFxs
 3uAM5L/aIjKPgw0ff5JeyV9T/ZGvNpVtM4RCIkp1Q8jjzb8KUp1+1o9fW
 krWHGEfeh9Q20Uc7qjD1O6qpN2mLXt8vjhvMwo1cNGzyczGR5dNoSIWHW
 qpmuBmny6xT1CXF9sSPBZWdEVMlbm1ZSmW3IcUmiVLvM1X0QePeRKCvlR
 fwSGVvPICBkjro6JR29eK/1pKvI0os10uVG7Us3owcseZiwrLVwH6RMSP A==;
X-IronPort-AV: E=Sophos;i="5.90,188,1643644800"; d="scan'208";a="200422234"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Mar 2022 14:18:25 +0800
IronPort-SDR: 3yyducnUhjuLNh7e5QN58jEi30By0ypgOS6IR5gKkHZ6XdS64oL3SnyFzjyY7p2RcSN1vDAGO5
 55ARewzD2rC8BsYBqACiR9Z35MiIvAVEvyhQqCivAXCIjk908deCUTpe/b96d/Cq0o1TNh0o4m
 xTambDqjFWYq+JK0x7o+qOhWvu8+dQRu1BTPHsT1cLHPiYRSUwKwxOtsXeqtImvqCd+KG5oc8q
 rZt/g70dR4fW7jfdSSRm+Zz+qVRThhrAJ7h8BbCAa7m8wDgr/OfWl5u07kq9R2Hv823SDBzrVM
 UHTlOwupNEoSSS5Ys6Kjr58/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:49:32 -0700
IronPort-SDR: ir+VPF4QItV+i83B8qb9Vr8CwNjwy8BydZQ9n0lfKmXnLs3STvOh5aAJtP41+43ucFhusXvDkS
 4bXdUTjAZQEJ9/kzcOO3uYk57U89dI80ylhagrqcefgJZ8WCFm9nfVd0g7kMEmtc0KxM0OhF/R
 JBiCAEg+nwvUDZGLIoMN/emwpwS9IAq5I8Unm29R8Js7E8wigd5p2OdAdYyL94TCLrJeYGhzxm
 Q9nZ4sowaEPPEMg8tttB8uMa2SOqRpbK4Jkf29y3bW+AwdsNuceGD5aSXEr5Ze3sk18UPxIDPk
 VwM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:18:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KJxm241ZLz1SVp3
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 23:18:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1647497906; x=1650089907; bh=EK0FagbRAlcOP2ydcIVZ7cjxZBeV5Ijc
 gmQ28uU5Irg=; b=jeJMIMPzfQ4kNpC1V6+2EIhGJ0lqB6+yh9BVu6iNFv8Ue1+a
 xIx+nVTjPbES+y2rdHY7gVCww4J2esj82y4RlYGjNUbVlAkvGDB8oHIFJgSR5YHA
 agFciwGYmBekFObp4feeZLP2ROIQQEcEo0Pn7pJQXSO+84ZmNmS9fNYK+UlLRu3Q
 ieCX4fxNUSlkQGwmE0rU03QJHscs4xUCTGbrhuZoMAZxcv/XW1Sr+iK3yJqiql1Y
 p8cvkl69TFTdS+y0oh/ANmJtNbsQmV9Nrke+XqjsLyUFLX4HTe/S9ttPvpbMYHmE
 0YnHO5mZrNPzymb13zthlnvGV9hA8zd+88tFDQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iwPwbHwQikwF for <qemu-riscv@nongnu.org>;
 Wed, 16 Mar 2022 23:18:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KJxly09gDz1Rvlx;
 Wed, 16 Mar 2022 23:18:21 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, alistair23@gmail.com
Subject: [PATCH v3 0/2] target/riscv: Allow software access to MIP SEIP
Date: Thu, 17 Mar 2022 16:18:15 +1000
Message-Id: <20220317061817.3856850-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=068022f98=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 17 Mar 2022 06:18:58 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

The RISC-V specification states that:=0D
  "Supervisor-level external interrupts are made pending based on the=0D
  logical-OR of the software-writable SEIP bit and the signal from the=0D
  external interrupt controller."=0D
=0D
We currently only allow either the interrupt controller or software to=0D
set the bit, which is incorrect.=0D
=0D
This patch removes the miclaim mask when writing MIP to allow M-mode=0D
software to inject interrupts, even with an interrupt controller.=0D
=0D
We then also need to keep track of which source is setting MIP_SEIP. The=0D
final value is a OR of both, so we add two bools and use that to keep=0D
track of the current state. This way either source can change without=0D
losing the correct value.=0D
=0D
This fixes: https://gitlab.com/qemu-project/qemu/-/issues/904=0D
=0D
Alistair Francis (2):=0D
  target/riscv: cpu: Fixup indentation=0D
  target/riscv: Allow software access to MIP SEIP=0D
=0D
 target/riscv/cpu.h |  8 ++++++++=0D
 target/riscv/cpu.c | 30 +++++++++++++++++++-----------=0D
 target/riscv/csr.c |  8 ++++++--=0D
 3 files changed, 33 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

