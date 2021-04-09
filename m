Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUq9f-0000hH-Dj
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9N-0000fC-FJ; Fri, 09 Apr 2021 08:22:17 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9I-0000cp-8C; Fri, 09 Apr 2021 08:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970928; x=1649506928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P0HH0I7vqymAcU1hwkq6Pxohs1jeKiqWD1HrLDTYfIs=;
 b=Al0V1ZR6uXXd4tPxLZpBjnKoqEfaIxcB2YmQcNFf19jP9vW3r43IKvWd
 BiKubj+sLcc2NMZscenS3+qCjJmFLoioXpY6Gejs/5MUOdzGB6V7DspUr
 0BBkFyp52GNJ9s+LT9RozSsQIq/DcTgfAE8DLw6kyScBNyGtvvW9gJi/j
 FdC3ami4XHknwc6IkBwQxWABpNSv/+J99CRs+yf270Vzeyhn8K7ec/efy
 UWoq8IGEHdna6vvo/TRf9kIX5VMWmbPIC85oogGZiB3Vaz7u4CGUorWs2
 pjdSA6UkQH3jvM0USL3jKJ9GoioPS5oc/jP3y3QYQQNz0zLVZA3kCSWwu A==;
IronPort-SDR: 1sfKtlnXpFrbyI8aqnHlIwxMloKoE5hs4OQA8W2vJmtoeYlckG4GD6sKdr57F9EZ1LPb5RQn8C
 6d+8GCUO6hqn1vTJdqMDlSKpbs4aXgEjYRYAjYMluWWhfHulydznWUjlQ3eXgAzB7kIUoCa2Sd
 +wZzu6a/9Fw/Up6pj3hB/R8XZd9E2SpaxywfBmLfAynVs35XLA6KdZYNqFQa+ZvAqEufBlJ3tm
 uvtgvPDOl4sNeDsT/HH8iAaYt5jow2sG6pEX8rkga5TM7uv01p/8YKZbTUjqmAdRssuylYVagL
 SOs=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="164302794"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:21:49 +0800
IronPort-SDR: /SvUdBxRmL+NRb2zqiEImNVk5JmwXd5+IkWAN6+LjZ3O+mEe+cN+xWynoyvHgawfRWaVSRK2nH
 lo+mJvsNOtHEXC3Q5sKU0siADj+nLtxiEdqVJs+i+PTaZqs/a83GHqx3n7OV9TG0ruTMZ6Kdhl
 +4/IM7ihYa2wu4fImYDwlDHoKJGH9YH61I+FJ80eCj4QrHIe8PaJQGzyiC011n99WdNS/2WvVA
 FhZ/+yz7s1+2/bBQ6riB2bU0rPYzQ6ipsdLIyfOogYhYVyDaeodmXlFgvVXH/X5vEFn4c8y7I0
 B5PK+eHo7AxfeZeEKmIp9VOZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:01:25 -0700
IronPort-SDR: fz/dAUEfBF4UmTNY+s8YtUTlzpgU+P5aSZBOhzfq3jrSLrEpk6i/LpWxrI/G50w97J40HPJuNX
 U4ZcRItZsxsph9MDxLIRJ3FktgdKJNF2xH1jAhELNt3hf1WLwYF5+jG+shREmWQ9mDfY9DV27e
 plQjgyjoqEQlWuz99zt2ntWmzIEV5JZ95jpXQFySxMneFkkr3eAyUF4ShZfGWcdK0c64Lv/dg1
 MEanQxkavHzPit1Cds14f+9cZ4IIjAYPHJ1j6v2OpFsqEZvLwDXK7wbDl4zXg/bxknb2MZPdmd
 0KA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:21:48 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/8]  RISC-V: Add support for ePMP v0.9.1
Date: Fri,  9 Apr 2021 08:19:47 -0400
Message-Id: <cover.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:22 -0000

This series adds support for ePMP v0.9.1 to the QEMU RISC-V target.

This is based on previous patches, but has been rebased on the latest
master and updated for the latest spec.

The spec is avaliable at: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

This was tested by running Tock on the OpenTitan board.

This is based on the original work by:
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
 Hou Weiying <weiying_hou@outlook.com>
 Myriad-Dreamin <camiyoru@gmail.com>

v2:
 - Rebase on the RISC-V tree

Alistair Francis (4):
  target/riscv: Fix the PMP is locked check when using TOR
  target/riscv: Add the ePMP feature
  target/riscv/pmp: Remove outdated comment
  target/riscv: Add ePMP support for the Ibex CPU

Hou Weiying (4):
  target/riscv: Define ePMP mseccfg
  target/riscv: Add ePMP CSR access functions
  target/riscv: Implementation of enhanced PMP (ePMP)
  target/riscv: Add a config option for ePMP

 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/pmp.h        |  14 +++
 target/riscv/cpu.c        |  11 ++
 target/riscv/csr.c        |  24 ++++
 target/riscv/pmp.c        | 229 +++++++++++++++++++++++++++++++++-----
 target/riscv/trace-events |   3 +
 7 files changed, 261 insertions(+), 26 deletions(-)

-- 
2.31.0


