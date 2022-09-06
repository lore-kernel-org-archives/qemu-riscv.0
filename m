Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVZqA-0003tY-1Q
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 10:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oVZq5-0003pc-UE
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 10:46:11 -0400
Received: from netc0.host.rs.currently.online ([2a03:4000:58:d86::1]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1oVZq1-0006Zs-7C
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 10:46:09 -0400
Received: from carbon.srv.schuermann.io (unknown [IPv6:fdcb:20e8:f36d:3::1])
 by netc0.host.rs.currently.online (Postfix) with ESMTPS id F08B5C1AC;
 Tue,  6 Sep 2022 14:45:56 +0000 (UTC)
From: Leon Schuermann <leon@is.currently.online>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=is.currently.online;
 s=carbon; t=1662475552;
 bh=MAmOM79Y5hqWlN9Bqwtg1aY8Yq840zkzk5L8I19eRBM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=i9r+55jaaswPwgocWRnNv4fA30qaQ8W9s/H6UC3TPQfSMf3iX8mW4JHKElUq+9TPS
 5zhKP5zAKW9gK1Ej1c9zmSSUp2ZPbZqyBb1hcNSE++O9DWRP4iRykTsy1ZEHuWsxGW
 UWQu2RS2R7aE5SJ2/r/tejrKZQHiz4clpxLIdjo4=
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>
Subject: Re: [PATCH] target/riscv/pmp: fix non-translated page size address
 checks w/ MPU
In-Reply-To: <20220904192907.1056740-1-leon@is.currently.online>
References: <20220904192907.1056740-1-leon@is.currently.online>
Date: Tue, 06 Sep 2022 10:45:46 -0400
Message-ID: <87k06ga7dx.fsf@silicon.host.schuermann.io>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a03:4000:58:d86::1;
 envelope-from=leon@is.currently.online; helo=netc0.host.rs.currently.online
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.5, PDS_OTHER_BAD_TLD=1.999,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 14:46:11 -0000

leon@is.currently.online writes:
> While there possibly are other unhandled edge cases in which
> page-granularity access checks might not be appropriate, this commit
> appears to be a strict improvement over the current implementation's
> behavior.

One particular example of an additional edge case might be a hart
operating in M-mode. Given that virtual memory through
{Sv32,Sv39,Sv48,Sv57} is only supported for S-mode and U-mode
respectively, enabling virtual memory in the satp CSR should not have
any effect on the behavior of memory accesses w.r.t. PMP checks for
harts operating in M-mode.

I'm going to defer adding this additional check, as I'd appreciate some
feedback as to whether my reasoning is correct here at all first.

Thanks!

-Leon

