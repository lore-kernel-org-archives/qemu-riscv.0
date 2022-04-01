Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1na50m-0002lS-Jj
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 20:19:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na50f-0002iE-Gj
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 20:19:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na50c-0007FC-PO
 for qemu-riscv@nongnu.org; Thu, 31 Mar 2022 20:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648772361; x=1680308361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zjf/rkpNgyjimgM6fecK37xXhvCXdQFaoc4ojq4+dJo=;
 b=qCwGHq0203+Ngp4H96havJ7o4ZG/3DZkTE5rg2wQAZpm86Xuwm5zfh5t
 7pKeCA36BnIozaZ+qHtwUjhOgLjCoXyJs+lzz6DmhbLQ+t9Rv/gF4vxEW
 PBl91XozOfJw52859uRx4v7xt393w6XTzb0sbXThltpxtcBTuf8XHOx6E
 1EaOUKJz0qgrBV6wC9CapGtO8JjSSRNwTWyOkFwV/gY25juV5li4v06jR
 jt8wQeub2ZDvllNOulLGyNn1iaKSQ4VBQ+eJ7GxkEfu060OhI0lr2Z2oM
 K5utlyb0EFN6YnnI7xPSdzWaMbff5CN/IEFOEkBsoiyuuPFUbF4UP7G9J g==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="196788805"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 08:19:15 +0800
IronPort-SDR: GOlTGcfxj28d3BDAaKKA37aFdLMgeyjW6N6wb2kSKfFT7FLMHINjrKMwxKa2L3HlGBwcqMEoiE
 nJ2Sog+PquzDtzupEHSxOQ0WaVP3h9si2MIKvdrr+AKictyfnZVnjaZjNy3Dhl7N7ROEsV+/um
 bKFLgMn6PAJiz/rOMGb8eTwxG1ZYN0grkjn4g0qKJfQjNeGhhpqytWizQ7oHs1DQNyGOcMOJUa
 Y89ymH0I6FTIkDIqPB9g9UOcJwKYNc2jKl90kpEXEZgtddPJqYOuj9Tkzv/8u35asjiEGODx0L
 y/Hlw85mn6xeyrzd/BttmwKi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:50:04 -0700
IronPort-SDR: CwPDWQ8f64IhaKW6REEcHZb4LJX0ht9ECQUe1Jkm3VBD7XJx08EJIFvUba8wJ4yH/LIdMaA/ac
 fwytbuZwoXcxvn5cObXv1eF8EdBYeDg+7i9tsops94yd1vM4uO7JLNu9NriETnaRDqOrS6bg88
 FkTAsb5xLAfeVTxZDqKw9eYrQerbZ8SYys3+yAVeNOn1e0QhAL8/iW+rLPu6BWP0RW32eDw+/p
 GWjSjrgKBTF4rTNi5vrQuOA+uPekq0BUvujywOc/u0PCVXoBtIq8ORHorJCbHCLUgTJEK3xHcz
 6TM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 17:19:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV14g4G1vz1SVp2
 for <qemu-riscv@nongnu.org>; Thu, 31 Mar 2022 17:19:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648772355;
 x=1651364356; bh=Zjf/rkpNgyjimgM6fecK37xXhvCXdQFaoc4ojq4+dJo=; b=
 QJHYjjgZ5lLKDaOS0patmgyfn88W9FCK9JPcFCbttIWqYRnoL0O3+DNurNPlvSeY
 Q+Ev1rj6wdB28/PN74ht3wwuNuSWG4Fa8ILsijgmEO8HNkjaxR38dEVEuZQtjhtR
 oSklLDZ5Zx8kF2NxS2QYNI8Pnkzw2D2TMOR+20Qrvq40NdbdeGBSAR/1AbL60ble
 hMmQ/MBFQkZIssPtG/9SYGQE7AD/B1gFLbo7gJ5ph0TAahUFky7nSBdZNHsMDGnT
 7g6ZDI+lAj2aRagsFMQjizesl5ZqDg9aInJFoa0D8BO8nsetUQQAsc1lhy5gMVY9
 zJHUkev18DMq7pT5l327vQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vKJuoe-TzRvf for <qemu-riscv@nongnu.org>;
 Thu, 31 Mar 2022 17:19:15 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV14b2hw9z1Rvlx;
 Thu, 31 Mar 2022 17:19:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH] hw/riscv: Enable TPM backends
Date: Fri,  1 Apr 2022 10:19:04 +1000
Message-Id: <20220401001904.415226-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=083ec5d20=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Fri, 01 Apr 2022 00:19:27 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Imply the TPM sysbus devices. This allows users to add TPM devices to
the RISC-V virt board.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c4..fccc14ca0b 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
--=20
2.35.1


