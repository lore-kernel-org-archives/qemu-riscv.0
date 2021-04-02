Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJBF-00057A-8y
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJBD-00052w-5u; Fri, 02 Apr 2021 08:45:39 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:3183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJBA-0002WB-C8; Fri, 02 Apr 2021 08:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367536; x=1648903536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=th/ByoKAePqmqK7gINyhAjXf7UG6AZl2IluLG7AOHro=;
 b=Zck0ddKHZ0lqf1Js9XTk+aJn8N8CpVj7CAKbuRi64yZC91QpZ6Hh4DS9
 TNEjuKcZPPPrK7X2XVPKNa5njw68Q78qsV36XmuYa74jGbhkq7G74OfUg
 EJNCjrFDpAqZ9ES9yKOm9LaotfA0jzoTBYqowQhpluBwAYjYkk2GJnTmF
 kmFarHS/Eg2rQ7tyZYXPoqxb5WUiCe5nRflfpZPOzxxRNfR6gZdSHovko
 9m+WcBESrBHd31Fg0/3z1Fz6WK3z3pUxV0dtQuRz0+rXZ2HHzRPXaJ6eL
 byOw7aorazn4CUsqE/d1iEaT+vrJg61gpiZxgKVkudf0FUZXl+CbGYu5t Q==;
IronPort-SDR: nn8ixb2O1EhR+0JZNTNS5qC6tIU6eNpZ6nz6rmnV3YaEPQsttoUA/RFECbbysimw6z9uIOo4Rd
 VqIR29fhIVNdBHjbrvEC6WjdVJ0KWViG8AZ7ml8GR+sfoHmXIzyqH4Py3kl1sfVrQL8dKhGMsw
 5N2BQdQVPKNheqWhAMJWXI9lTgzgMxOptAAQSWsl3b/XApis3tXOxdoDU2SLDYjMlXgwYjpTCX
 GyS5wrpnUVZVfFgWQC2/2WPR4voQcpQJSeWoBxRzqG0serTnK6UARsu7T15ilAMsnnJJo7bRo1
 ak4=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="274494969"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:45:33 +0800
IronPort-SDR: 7mF5EHKCzhianx9i5DHn3cOQBPO0Wwrdyhvsn/pU4uKujFfpcij4lnPSTs8FiClrChXWFYX5RH
 aifZl6jpcXIX5ImGK9iY6z/4Q9H/sSmdIf0rpnAYj0XyP72Fib0X9op2SKTtcDhVZN4gU5EeKJ
 QR0pulwnJ/dMYPDIOG83cdhLxvJyP0uuNbUcShbNYvRRDP1FjXaqrlgeSpYgDxaAs1zaS54Tzg
 SUcaHfEqAZdWRE+n+ajZH7gAEWXvMtjFQWGMPXpUxWrKjfgPKrW7l1cmKIGZ30OhZbxaRpubW8
 NPpujZ17712yYBznEIabGJnI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:27:14 -0700
IronPort-SDR: JxOci2IMKI/1mUydmsz8G4SYccg0fJV2EyvJ8ziYkJK1RQ3ugZU2/6gOQ262yjXXU1O/XXgPJl
 xuMUXlS3QTExoXyWxklGnVa6oIH89GCAiWptn7ETuUZ520gAiLXjqpdSeAzSWsanY87tnexptY
 OhmRXq9xrd2Se+UsE4glZHK9UiO0MuMY97x4GSe4FzcXMxLbhsFHG/2B7TT1pwH+7M0WfHXQRA
 RS3SgjEgnc4CzDPSpZmGY6kc/aNx2FCGVWQ46doS+yeNjWb/Bs/AgRB9byvwmUFgPqFPMf5Xt5
 BJ4=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:45:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, jrestivo@draper.com, aclifford@draper.com,
 astrnad@draper.com
Subject: [PATCH v1 0/2]  Add the SiFive PWM device
Date: Fri,  2 Apr 2021 08:43:38 -0400
Message-Id: <cover.1617367359.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 12:45:39 -0000

This series adds a the SiFive PWM device and connects it to the
sifive_u machine. This has been tested as a timer with seL4.

Alistair Francis (2):
  sifive_u_pwm: Initial commit
  sifive_u: Connect the SiFive PWM device

 include/hw/dma/sifive_pdma.h    |   2 +-
 include/hw/riscv/sifive_u.h     |  14 +-
 include/hw/timer/sifive_u_pwm.h |  62 ++++
 hw/riscv/sifive_u.c             |  23 +-
 hw/timer/sifive_u_pwm.c         | 483 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/riscv/Kconfig                |   1 +
 hw/timer/Kconfig                |   3 +
 hw/timer/meson.build            |   1 +
 9 files changed, 588 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/timer/sifive_u_pwm.h
 create mode 100644 hw/timer/sifive_u_pwm.c

-- 
2.31.0


