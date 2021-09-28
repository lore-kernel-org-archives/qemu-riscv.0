Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVMYD-00063o-WB
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 19:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=89863b41f=alistair.francis@opensource.wdc.com>)
 id 1mVMYD-00063W-8R
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 19:30:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=89863b41f=alistair.francis@opensource.wdc.com>)
 id 1mVMYB-0006FK-M7
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 19:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632871815; x=1664407815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tmIJEd3zAacH3o4eeUio1NR536Z2ac06vmlZzHbgeiw=;
 b=SP/erZnFXoA7BtyIiS5VB7kD84t9gIJNkEm4+R8n1QWoZVJGDAdAZtHX
 gLO81B0k8EfrCzW8cV1g036ZBb6ddSaiGgCwDTMR2q7NqFV8jkMAd7zE5
 JiWa3QH+fuezjmptNBy1WLqVphierZjXg03HXvs77uJ4dlNBns+6mQru2
 sjlsCsLssdRrZTX5SwxcZ9Qzzk6c41xv4wuC61q8t+1Iwo6EU1c+jMi8p
 KC10Z0lDLlmel2BOo17/u6tPQUg636wE2y78DwwIVfpkK+pnrbAmvfi5m
 LggrNHSDDfwoiVJ/dGZoX0nQx4EfBDmtVD82/8byS5FYBHNTSh+YvYwT3 A==;
X-IronPort-AV: E=Sophos;i="5.85,330,1624291200"; d="scan'208";a="180294282"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Sep 2021 07:30:07 +0800
IronPort-SDR: h2Wf9WLxv95u+QEb19v5Gubxpoi73NcQlsKw1s5809alNG6MjTWSfYK80cUsX1PLbOpYasigFZ
 fmXlyqnJ4nKkAb3ZnyLaTQYgoKkmuZPxqtj2NXpZRzWWCjU3jjOzssBqGByWkdj+3UVz20xRBT
 68hTUOBDDYsnmixKp09Efw48ic6WoccBtdz4FXbMFUyma7vW5VaEIrmbVL4uQ+YNFHbbOFvxcM
 hyXFLoTI9bE9Gav2VwrOH0+fUQLw7suCnahqqwheqWNQo968TAmcCU0J4nFzHCGS1tPSZW+7e9
 uljkmR5fBwPsuVhbfoy8HP1e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 16:04:38 -0700
IronPort-SDR: +2vVh/bZdKQlc37jQQuoVsGyvkNvC6MWmI+illHjyvLAUuZ2ERZcWjyzdSZ7F/Ngs0U0mgobaY
 /54sjP578c2mEaWcZ6Hyc3TrZwt64Zfmlj01xMlms5yWSbMjk2xo2vVs50ehJTusRrVNfQ49P+
 2VHYnHSGPjSJT1qkNm7uBxT580LET9bM4wkE4uLYO1wpNpPI8BgGm8A9nwkPVlii0miMgqyRWo
 D07VuTceANfNRL4g8bbUHYC7pbv2JaDw5XqeJ6ZhjQKsITV8al0BvYjGva/JmmyNiNfakpXc8B
 vD4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 16:30:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HJwht4NN0z1Rvlg
 for <qemu-riscv@nongnu.org>; Tue, 28 Sep 2021 16:30:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1632871806;
 x=1635463807; bh=tmIJEd3zAacH3o4eeUio1NR536Z2ac06vmlZzHbgeiw=; b=
 uYebWlIt/qDk/51y/EkIzJGHjidtWOQOWxqOz4cuMMteNkGZ8ZKp5PoXQ8JgobeI
 mzb/loVQ3EYyaI/1SnMX2w+HNJfKL17g3FowC2Iwwv72WBAL5hPHd9oW2CZhKFqw
 e7ShCNUgxKqRnR9oYStUaCr3ynmMVLNHESYbj9AJxy7YdrVK5jFKUoRebMM1Zu83
 SaOXK3N8gaX8xJ+qm69VfqrR9yVsfnkOXQQyrXe96wF7oSJcBxTdze0Yywq/81Gl
 iIYtwyU2fliuKOiDOBswimJ969O6cQdCrdHG0QA3xRXd9Uk23CBfLRirFfrr/PGz
 PQeSjXtBQIp3XbEBsnIRhw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id k66mXFlTCEGw for <qemu-riscv@nongnu.org>;
 Tue, 28 Sep 2021 16:30:06 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HJwhn2mdnz1RvTg;
 Tue, 28 Sep 2021 16:30:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, f4bug@amsat.org
Subject: [PATCH v2 1/1] hw/riscv: shakti_c: Mark as not user creatable
Date: Wed, 29 Sep 2021 09:29:55 +1000
Message-Id: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=89863b41f=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Tue, 28 Sep 2021 23:30:17 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Mark the shakti_c machine as not user creatable.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 2f084d3c8d..e7cd3bdfb4 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -150,6 +150,12 @@ static void shakti_c_soc_class_init(ObjectClass *kla=
ss, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D shakti_c_soc_state_realize;
+    /* Reasons:
+     *     - Creates CPUS in riscv_hart_realize(), and can create uninte=
nded
+     *       CPUs
+     *     - Uses serial_hds in realize function, thus can't be used twi=
ce
+     */
+    dc->user_creatable =3D false;
 }
=20
 static void shakti_c_soc_instance_init(Object *obj)
--=20
2.31.1


