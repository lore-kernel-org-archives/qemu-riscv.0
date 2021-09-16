Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQj9w-0008CC-33
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 00:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQj9u-0008Ag-OR
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 00:38:02 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQj9s-0007B9-GR
 for qemu-riscv@nongnu.org; Thu, 16 Sep 2021 00:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631767078; x=1663303078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLuylWYBtEa555dunSRK4Mk8tc3gj74iC8WdUNYeuHw=;
 b=N6MaiwgdThhUp9T/zWZdUo/eOc3mq3RMR9N7/JCP3NM5yPo6tx8VfTO6
 n1V/31rcPaVQL0Ao9HzRMGn8w9LGdHX0mDi9n873KUWhGk3UVfxuiuaSH
 xkkGaq/AcRJMiNLqd/tghL/ESyAXFkiZH+U1wyX5XeMtOTTm4uuPVAVbR
 F5caa7wo4oXdjm98Ev3dfs2YttmdSwVJr0FkydjftSm7DhtJt8uLfOud+
 Dkm9ucfoLOUVL+R22JH0AghMjrjFyVM71Aup/SuG3T/Tj1q9OWpDXu7W1
 KIoyTkhDZNygQkbgUgouV3NwnA+d9pT2tqAbWgsf/LSc4xg+3XGLCMaBc g==;
X-IronPort-AV: E=Sophos;i="5.85,297,1624291200"; d="scan'208";a="184925505"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2021 12:37:49 +0800
IronPort-SDR: vIsF1lpr0a7NzVgvuwfu/PzlFtFu7g+nDcRhaszW/USlC0yNLZ7oMiRr8pge+Kpt3lMCR4T6a0
 9h5ZNoJcf3zP5MTvOkS4ntQ5oAvO2ebYsR/jlhkCP0YdApnKXHWPFUGR9+jZ8bhp03mjwiYbg/
 +UEYyWBpaarnvNhET/IGLvXHAk7Oc6WXOv04Uno9rsdjOYevtbmmRvv747ROLBIHSjM1uur1bW
 rgkXIquYH8yMEuItYBnVjmkeAvrzq90O7TZ7JnBbcFB0H7mOe4sLULHHhRmuY6ey8SYH00G4sV
 +TIFpQM6IYBJmjWjv0XwOTs1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 21:12:38 -0700
IronPort-SDR: TZ6JysJZXFCTUFilADuVAFMiQdP5u/mMRq1oglJEHRDSjdHaOwPNkG1Zx/ZKYkOQ2zWzV9GQRe
 xu0QjRNJLs32UKL8PsnUlxplp+Zlllp6xwkEkUV01BmgsO6Ej2DYjsDBLghfv3H54kAsk4xbPL
 EcSnJcOYVC0+qUHEOdbcTwloivZNunXrMyC+KPDnihAWHru5H0l1Bsn44Uf8ovocgWGr486y8B
 OeinU8k9zNPHTs/jy/rQ4YP3nqXdrNjEB6KSCO7Emmvhc1Mo0XnLxThYGH+DHJC6UCdrQW3huD
 Iwo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 21:37:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H947y1mM7z1Rwrt
 for <qemu-riscv@nongnu.org>; Wed, 15 Sep 2021 21:37:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631767069;
 x=1634359070; bh=JLuylWYBtEa555dunSRK4Mk8tc3gj74iC8WdUNYeuHw=; b=
 NEwma1HpkXKZ5v4ZheDbufMdimNde1nIvtPhknX+yW65uPjVMD+w3mVI3+Whn8di
 htmUDteJCRtaoRGzh9+URc+/p3bNajBApA5fIxXtJ8D45KbQfKmDjO7FdJgrfI3D
 c6AbDANWmFJuFDOJkKSpmtm4KTuNh+5/ehB3OSKSJB7JrDJyHTfIN/AAGzxmJMXT
 h4YLQn8BbXWRBQ10Nyr6K2QWzuqpQJRBjKW4HOektcMZE+878YqMXMZPiWmczblv
 M1i8HrIjXHtPysTydwOyX4MEeVjNhHfZ6+0V9+9MGZ/labD7mWCnEXdC8ZaEn1dm
 9FTwhUjETDDoHOmAZVautQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id aT0zAOURpFaI for <qemu-riscv@nongnu.org>;
 Wed, 15 Sep 2021 21:37:49 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H947r4qp8z1Rvlb;
 Wed, 15 Sep 2021 21:37:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] hw/riscv: opentitan: Correct the USB Dev address
Date: Thu, 16 Sep 2021 14:37:38 +1000
Message-Id: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Thu, 16 Sep 2021 04:38:03 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 36a41c8b5b..d38c43abc1 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -39,12 +39,12 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
+    [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
     [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40500000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_PLIC] =3D           {  0x41010000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
--=20
2.31.1


