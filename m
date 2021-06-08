Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqlSX-00036C-JQ
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 19:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlSW-00034l-4H; Tue, 08 Jun 2021 19:48:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqlST-0000xq-5O; Tue, 08 Jun 2021 19:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623196111; x=1654732111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GcyOmcyUyYtAFAQn+mHz8q94tUbA/0BablwS4vSzrww=;
 b=Elidumzh77BC8scp0CN3G1m1jEiZ9fe8eATjN+e1rsHBlBJkHkz5zzNE
 X3Rgt0RsV77L4VofruE8NwWa8pvyouC2nuLiouk18emk1WvNhQHu7OTUe
 LBUVQ/ANluyMUFSEB34jvbCzir6DYb1Ca8O+RpY55w1i23kcUNg+tw/6I
 nfkqPL0ExNdqtUg/7iOmdy9hm+kOO4Tc85hW3MPgEIXMwvdtMvu1u8IyR
 nyIpu7XzH/smQzH9UjaXTeNCLuwkV2R2nXov9Cwv8xN1zFV/Jc4dvZq3N
 qT/GEOGelcqUApyAwS2FQnWKZbvwl1ky3a6VxDFXm4vz7YNbLZJZG8pSy A==;
IronPort-SDR: vrPP8UCc0yFnpPvNQP4v8le3AogwyJCGh22T6yfgg+bGMdSdakWfYodfIGS+nN3K29PGqGa02a
 Gv3Zxx6jp4tUAptx0bhV89KzreSlDqUB3qGiJga+635HI7ZywPQw+xDpc0xrihJGd/lIMCmen8
 g1VGXrZSG8BrLkXLzlSWOPRRRmG3mnB4zTUx71ZBBc1zAM4GrIPzgIu26PO1xsKR7UY7NT8Wyp
 YjxE8jmPDTtPXBad7VUb208GxTB3bCO6V0doR5Cd7d6pGQrAjnU9aRcT/E9E0ON8GbcQd8xnOI
 6Xs=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; d="scan'208";a="171223689"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 07:48:27 +0800
IronPort-SDR: /IpdisHaSsYIHCCsSYeVST2ly0hQDAmamk8LWi7nm2VtekJP24WeneYbIioME8eI4rjXr3kuJQ
 axbzH+1at0pmydCKNvIlIHK3TQNg+c+6mEIPksyksZEE5Qj4xeQ/nB2vWx7OWIHLtZwgBLf4Al
 ukPgy12Mg+B7e/gHW3KwXx3dKG1fkdV/ewiPBqQJlh8KedtdqRhGQVi8idYyLt/X2HFB5dC+pU
 mnqe1oPKj/seo3Le6KcgxIoJf37DlnNvcqRa2mmacAIa42r15PGsnRqYFbE/DOf5fxtvBKUBlt
 xd2a+/eW1O2qZ4E3pdS4VDSv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 16:27:34 -0700
IronPort-SDR: Bvtii+OKKWAtGUWSzsBT3Q3D5f6nHt4UPrcxhbLHUp9Vxre2tPvZjxFzRZY0mKuuTSTOnL2q75
 xqCef2lTgvbBIFNooGsdOAfDIwuftfr4ze41jREFJdaCclSEKiq3hFirljo0zNTVtYtvQNx4HY
 YkE9oDvtWSAeH2Xkwd46Xf0h1gZvO0PhiG0DUYxiK2ZmNHjx6K/KhsyOOjySZSWfZDnRtS2nL2
 g4G50cETDajCxn/GOvESSTd0crjrPsrizqaEr39Lr4ObIxllYTUN7A77YvteW+wbkmzuD8GD+Y
 lLQ=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.83])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jun 2021 16:48:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/3] hw/riscv: OpenTitan: Add support for the RISC-V timer
Date: Wed,  9 Jun 2021 09:48:10 +1000
Message-Id: <cover.1623196022.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 08 Jun 2021 23:48:36 -0000

v2:
 - Address review comments


Alistair Francis (3):
  hw/char/ibex_uart: Make the register layout private
  hw/timer: Initial commit of Ibex Timer
  hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer

 include/hw/char/ibex_uart.h   |  37 -----
 include/hw/riscv/opentitan.h  |   5 +-
 include/hw/timer/ibex_timer.h |  52 ++++++
 hw/char/ibex_uart.c           |  37 +++++
 hw/riscv/opentitan.c          |  14 +-
 hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   6 +-
 hw/timer/meson.build          |   1 +
 8 files changed, 412 insertions(+), 45 deletions(-)
 create mode 100644 include/hw/timer/ibex_timer.h
 create mode 100644 hw/timer/ibex_timer.c

-- 
2.31.1


