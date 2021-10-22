Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdnct-0005Kn-0h
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 02:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdncr-0005IX-0V
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:01:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdnco-0008Po-P7
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882514; x=1666418514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CVf48zXDfzu9hCGPn6p0LxWxBuviOD/JLb8idXiH+PM=;
 b=L30CseCv7JYCW7Gd/JlIwH03jvqUZjNxhBfn4WKqzJvkX4/DE8qcDjHm
 k0mIEKEOOW4dhI2uhv5tvUfyvgnWrB0e6eMP0a9RzuhGP+4SVhIILNxoJ
 v597s2zX+sdd+McB/pKHQnGreFJhd2KI4f0hwAmIeh2QG17VvfJGCX9Yr
 ZCqypERVLYuajw+O3rw09hYorh24LI/Llly87DYGuw2/MBwC/GV9VAcNP
 C7uI3B1BahTWkWNP9WZ2we/slQoh/4sm2C7eD2lhm3qVlgDIeeLAz0k7b
 SIO0dVCRe1hPM9/p8Oo583ar3eGiG+/iwvo0UomyboJk3Jn4xXYBWHL0S Q==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="287463423"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:01:47 +0800
IronPort-SDR: JD2O+/TltJ8ggSVWWKFrqPffMJifNcGS+NjkRLzJaCOVHLC229rVF6OGaxGQ8Pq1XukBhACuWo
 g1r7lk1nMX9DQdWJWhaIh+sIEHKovpVAt6Ug9xQAYwf155BzwKK/WatDok1Zu1W41MYvMdMFxf
 n8GlVHz+sD2aJlCyYmk1/dtbX3jYBXWahWBGetmbmEGC5MwBqz7pQD16uyKgayduuHJBAuSGca
 BinSH4UBrgZARNf8gRLCUh9rbsDtMy1GsyGcz7D+GwZvwn1tTyLw3Savnspkq9Tf5PZBjLSOX1
 a0bqvc11sihjwsrmsCaTPPsU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:37:23 -0700
IronPort-SDR: jT0QjyjdP4N4zLkb3mQOi6sWZf3BgdrAVaBhoS3YTNii3TFroxaGl9i0RTr3Hk7FIl3FK0+fLL
 AiBRZ63HSlzxNNqiO7cFoEpCyv+NHLcjAApAD8984lUGF50tV40TrCBREjlDggMSJRSfbjiUNT
 2UYy6PtBUggTCA61LMFFjX6jBfJkl6/3O+29FQfKkCHB2Jp4A8Ii/TTsUUL5ZTwwcFRL1+bD11
 X1oiyhCXCNvSJFve+vywBBlFRDg7iwCCTj9jjVJmXQ67Ys67wx/hnUTMeDAwxrGamJFrFaBwfq
 XmY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:01:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJC1YP3z1RtVw
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 23:01:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634882506;
 x=1637474507; bh=CVf48zXDfzu9hCGPn6p0LxWxBuviOD/JLb8idXiH+PM=; b=
 V06zzsr5MZaML+YEduMGu6zVcrGHDvu/LZAGDtNZQYFbNvsYO8XOBskO2IzhPq+6
 Pz2HdSeF4aYNREPsa7x5I+MPR+ZSEL1p2z8ZRhWorxgt/yjFxDxPLMTCshQA3HCE
 OMrVLldqTIUpgplKwaLsFAU/M6qHe35QFCYBu7wuZc20tK99Oz6GjYbifJV0YtYV
 74YBXmvRv8oia/kfkRqiXbK61e2OV6+JBecaKJl8DcIdkn4dwq4UWFOo8vfty29I
 A3iCabPZgRVagKQZkVX2t1IavWACuvqPuZ5zsHdn+UwGFMN2vm9ksGEUZc6+W6cw
 d4A9XsjfdJXXyYofAeO5Wg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id N9IhUqBLJMXZ for <qemu-riscv@nongnu.org>;
 Thu, 21 Oct 2021 23:01:46 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJ46xLLz1RtVl;
 Thu, 21 Oct 2021 23:01:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 1/5] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Date: Fri, 22 Oct 2021 16:01:29 +1000
Message-Id: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 22 Oct 2021 06:01:57 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Using a macro for the PLIC configuration doesn't make the code any
easier to read. Instead it makes it harder to figure out what is going
on, so let's remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/hw/riscv/virt.h | 1 -
 hw/riscv/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index d9105c1886..b8ef99f348 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -73,7 +73,6 @@ enum {
     VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
-#define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
 #define VIRT_PLIC_PRIORITY_BASE 0x04
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c..2d3a8ec405 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -758,7 +758,7 @@ static char *plic_hart_config_string(int hart_count)
     int i;
=20
     for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D VIRT_PLIC_HART_CONFIG;
+        vals[i] =3D "MS";
     }
     vals[i] =3D NULL;
=20
--=20
2.31.1


