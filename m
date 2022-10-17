Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okJ1M-0004fN-M1
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 01:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ1L-0004cL-40
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:50:39 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ1J-0002DO-6l
 for qemu-riscv@nongnu.org; Mon, 17 Oct 2022 01:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665985837; x=1697521837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gEa1XWL3Yu2VGlCN50EFgUunW1wW+ROV5F6mSaE0/Fk=;
 b=T8VLe9UjolJl+Fpr++fdw7xJOl2cs0EIGFqYXwn39Z8pMoYl4uXosuJN
 6hhQltTTKhDi2GTHb+seE5bREpnSTn/vJUmZiENl1CY4omo1OBnL/Ng9h
 WfWENRtD+oPzmQLyTJTuIHBwuU3K+UA569KE3KaDOj8MB8RYSdriZMMTe
 pRddB8aik9KYOtNbbGSkdzJmzyyErti9lbrwWgSsa9uLIURArLdESfZyP
 hxlKQfExqefm/B97hx6N3p5txhE8HXeDUMOPGvoQslrKIeBPL2GGYo3N+
 e83Xf/BSjU/fr+aZYfq3W6QZ+vFRgXI7deeps4g0HQScvS9T5S3n8t+hq w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219145799"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:50:15 +0800
IronPort-SDR: dbnweSKbwy0igfDXO95YiqoZ/3ky33d+Dmd0o7Xw49z0WPBxjDPXiBnmRKO2iR3oXXBjBE+Wd2
 IuYvDOwFxJawi4j1SABMzu3XHtT3zm7hEQCIDb9fFAFE25ji7EvXi1/Tu1KduaWW9Orct2myGm
 8lQiVenEQyQpGZJJQfOPEbCd9POYbURN8WOEYzDRt6p8oOwQVlvSOsN6KfBWI1X0+I7fNunYdY
 izl4D8HdYpGg6wl9cXeSeD5Yf3/eg7RUTSsTWXVkNJ9yejHVF0BDamHLoRxneepBgWUeEDIuat
 +1VL/WeO/Qz9NsW740haClNK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:09:48 -0700
IronPort-SDR: 91M5fpgp78rzsW9hZWgcUi3UViP5kG3vHioCFg1eUvu8d41FN2ZcY/oZZ2H5n31Opj44y6OcV7
 P7SjgBgybquc+cd/JqFo4LUY6Syd2F7fJnYXNGu7neX7TO5GVHHU8OLYdxnnyxzuN5CxEkwvV1
 A9inKsuFxEJ2CLKOK6kBwDl9CrbgZJZNp2YWaAaNjOZxh0uQ5/lP7pUN3lygzJCxJmnY1o/8tK
 bHt8w2vgGsB9WkdgQOC7RgpzAESl/bXSnOP7jl2BNgPa/rJShB1YhTmgtTzO9VHBlcVp2FbDag
 6qw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:50:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrR0k5GcMz1RwqL
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 22:50:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665985814;
 x=1668577815; bh=gEa1XWL3Yu2VGlCN50EFgUunW1wW+ROV5F6mSaE0/Fk=; b=
 UEcN3d631J9ToiSBEO+NOjXRPpAN+WQ3uXpsNEyTA7aZqa8YhJNrZOUS/5LClTSb
 v3AqgR8NAfO/8SHE8vBmTo0FB3ZCWlaNKBolAnfKDXyH9GDoRcncF/ItXEjcorRr
 ydWZ2yAmQNM2GYLgmeBhM7a/5zLiPUYmanKuyj26NDQTdeVfbNp3jln7dCZ8VY3K
 ovnsnxvR4aoh+s+lxuPkG7kDdRZ2K1JJ0rQETsTVuQT1roAlkQ/qVinc00oVxHde
 vlKYAKXepJMEmR4x3bhM2mr4LzpZwBzp7OlQFczT0OpoRdrYOtAYuzmGRUQqVwI0
 qwUJs0YCcp7tFjFDf7Ur8w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id V3hRyeQUl_HH for <qemu-riscv@nongnu.org>;
 Sun, 16 Oct 2022 22:50:14 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.69])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrR0g74mbz1RvLy;
 Sun, 16 Oct 2022 22:50:11 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/2] implement `FIELDx_1CLEAR() macro
Date: Mon, 17 Oct 2022 15:49:49 +1000
Message-Id: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282226d84=wilfred.mallawa@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 17 Oct 2022 05:50:39 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch series implements a `FIELDx_1CLEAR()` macro and implements it
in the `hw/ssi/ibex_spi.c` model.

		    *** Changelog ***
Since v2:
	- change the macro arguments name to match
	  the existing macros.
	 (reg_val, reg, field) -> (storage, reg, field)
=09
	- Add the use of this macro to `ibex_spi`

Since v1:=20
	- Instead of needing all field bits to be set=20
	  we clear the field if any are set.
	  If the field is 0/clear then no change.

Wilfred Mallawa (2):
  hw/registerfields: add `FIELDx_1CLEAR()` macro
  hw/ssi/ibex_spi:  implement `FIELD32_1CLEAR` macro

 hw/ssi/ibex_spi_host.c      | 21 +++++++++------------
 include/hw/registerfields.h | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 12 deletions(-)

--=20
2.37.3


