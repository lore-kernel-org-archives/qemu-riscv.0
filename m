Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMiSu-0003SF-19
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 18:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSr-0003Rd-58
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gMiSj-0006Vp-6e
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:24 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gMiSi-0006Uo-Ne
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 18:51:17 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z10so6456158pgp.7
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 15:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=AxWN8Qplcd2YOTtl4ih2cfRqU5arnKW6U66ILx92bLY=;
	b=Udns5JdaLHOdzXRlKmb9C6ahfH6LGDzrGrAfLhKUMtMPdhM7Q313HijnMCWGnfXR0x
	Ash1Xu3/emGZ1gCrmSbPVxP2blGwvRfbYMHeXSj8UmqlKdR0fR4iEu5rC2DvPiDlwpyc
	FqW20rmEkDGz2qvX2b1P3BKnN4hmeYrEGsNulVCCNfHSgnZQFswly6A/CWgV02GhDOIS
	fMMiyyMM54coIJl9Ja7to2SlTHwTZdd11wB2MN3Jo8/ffanfvWMNefLbjjBLBH/L2x6o
	0AQnYp5B26xwx1bC9CwIdZd23Wc2kJN/eqiBFRbGFt7+9E71Z+SgwoSIJ3ck9AYZaVbx
	GEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=AxWN8Qplcd2YOTtl4ih2cfRqU5arnKW6U66ILx92bLY=;
	b=EuI+dpaQ55y5Q1sA7V6WrTXh5RytAy9d4BuLehUC1Du+0kk8AaO5u/7P43sXVsKHo2
	vlNggMV4G0UJqpTAiB/J3Z2ADI/4koJnE1d6EEvZUXNSg9QPxbFVB69G6WKj7xFItGI0
	cIGsd3oPN7h6dHXZ9EJYfN6zj9gyXk1rKDd597X5MopBySg2q8pG1v/3qe7UIa8lit66
	zzsSs3mLkhbpZ47PEeRjdopXqvlTCUSXNBCJYe3CHVPJYM/A69xAHTsy8V77fRWqdxtG
	HZg32qSXAfafOGiYpL8y9hKJMJFHriapISW0X3SeamfaaeoASvg1DIe6kP24N+EiGc1J
	IlbA==
X-Gm-Message-State: AGRZ1gJBT6wQis734sV4qbwesXthUe1KaFba1PVi0sZnCJmC7gUtRjI1
	J6b0HQ6iVCiH32ncUtobWWONfl9EgPrHaA==
X-Google-Smtp-Source: AJdET5ePw9bkjoKdgEx0OR3wbY/ijiHDIgvdC+zZy4x8SFfaUYIZKhu+NaoecB77HhL23b+ospMIdQ==
X-Received: by 2002:a62:34c5:: with SMTP id
	b188-v6mr7532925pfa.65.1542153074204; 
	Tue, 13 Nov 2018 15:51:14 -0800 (PST)
Received: from localhost ([64.114.255.114]) by smtp.gmail.com with ESMTPSA id
	p38sm11634059pgm.40.2018.11.13.15.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 15:51:13 -0800 (PST)
Date: Tue, 13 Nov 2018 15:50:41 -0800
Message-Id: <20181113235045.14155-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: [Qemu-riscv] [PR RFC] RISC-V Patches for 3.1-rc2
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 23:51:26 -0000

The following changes since commit cb968d275c145467c8b385a3618a207ec111eab1:

  Update version for v3.1.0-rc1 release (2018-11-13 18:16:14 +0000)

are available in the Git repository at:

  git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc2

for you to fetch changes up to 3502dc824a7b0218abb49f4350e80a49829748cf:

  RISC-V: Respect fences for user-only emulators (2018-11-13 15:12:15 -0800)

----------------------------------------------------------------
RISC-V Patches for 3.1-rc2

This pull request contains four patches that aren't really related to
each other aside from all being bug fixes that I think should go in for
3.1.0:

* The second half of Alistair's memory leak patch set that I missed last
  week.
* A fix to make fclass.d availiable only on RV64IFD systems (without
  this it's availiable on RV32IFD systems, truncating the result).
* A fix to make sfence.vm availiable only in priv-1.9.1, and sfence.vma
  only availiable in priv-1.10.
* A change to respect fences in user-mode emulators, which were
  previously treated as NOPs.

As usual, this builds and boot Linux for me.  I don't think I have
anything else planned for 3.1.0, but I may be wrong as things are a bit
hectic this week.

----------------------------------------------------------------
Alistair Francis (1):
      hw/riscv/virt: Free the test device tree node name

Bastian Koppelmann (2):
      target/riscv: Fix FCLASS_D being treated as RV64 only
      target/riscv: Fix sfence.vm/a both available in any priv version

Palmer Dabbelt (1):
      RISC-V: Respect fences for user-only emulators

 hw/riscv/virt.c          |  1 +
 target/riscv/translate.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)


