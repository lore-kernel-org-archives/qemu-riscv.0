Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4miG-0007qJ-IE
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:17:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4miD-0007oI-Sg
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4miC-0007C8-Mo
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:17:25 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34024)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
	id 1h4miB-0007Aw-Vi
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:17:24 -0400
Received: by mail-pf1-x442.google.com with SMTP id v64so6353253pfb.1
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kh3hZ916BvJK6TZhqXwrFRSh4R537v+bY9nx6+CiXoU=;
	b=JWcbyhMKOoT8Cyh8RsjwCnxW7ka9jvgTxFszvIGET/jnKRCM0+7U73gjBWmhzigKlY
	byIoZlMaCRqgw9c8OZ4olOZbC0JmSkhU6Dy7Fk78diWMJTMGMIr1xZcCaQNBCVY8itNz
	IiFsK7dT7f/Vy4mpb6JIXYqoWxdIwlaIopVH70Zcm0gvyUWOI05kxOD551z0+EseUaii
	iwuK0A17uiaNLemZltem4XHw0OYaOSX/gtqW9WwGLCF1T1I7QYNKOIhag/l7Lb5+KUEb
	sA55NbAB3hXZf9gFjcow0j1RT34pWv52K0dSMlv57gbvmG9BIqPCHPO90VJPzvOQcjON
	qzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kh3hZ916BvJK6TZhqXwrFRSh4R537v+bY9nx6+CiXoU=;
	b=Bc0+jxjSuTF7G4Ni+yK52YJsYVJnV1hRKJpLLKN2AEM4SqTM9d+lkMe/kbNfzxF/T5
	oGP2OANTAkIix3LiIFdpVkIQmWmViGwcXTQBOdpnEvgMYcenAyuzkNm0bXJw24Nvu1aj
	V/8GGhPMmWNKw0J8eO4LL8x0n4CY27eW584xfBviNAJ+obKugnjRksKqN+hV8U1OyYB7
	QroM3ClYpsZ57/+MqP92N18vq80igi8i2oNhk80Wure4tXbOf/xU75HSBxMxgrFTU479
	IN2lzP3zKrHE3IvrevZ+WsE3v6WbY0csTTRpQ/7OZD9/UdPB7NWNTBTTiWolk598zOSk
	1d7A==
X-Gm-Message-State: APjAAAV8/VSDIav6sSrJ97t+Tsc6K9fGn6xSzh7gP/3Rvi0Ou9w/oMv2
	5TmkmvkO2JbSZ90pzucRkBuTQ8F8dAegXA==
X-Google-Smtp-Source: APXvYqwYNdq6Ol+AEBtRZ+X/l+t/yhjEhfevpquT555BviU6oC550FleFi1IOdwil5H3VCmuOJuTPg==
X-Received: by 2002:a17:902:7202:: with SMTP id
	ba2mr3352160plb.147.1552645658879; 
	Fri, 15 Mar 2019 03:27:38 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
	by smtp.gmail.com with ESMTPSA id
	f15sm2225401pfa.11.2019.03.15.03.27.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:27:38 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Chih-Min Chao <chihmin.chao@sifive.com>
Date: Fri, 15 Mar 2019 03:26:54 -0700
Message-Id: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH v5 0/5] RISC-V: Add gdb xml files and gdbstub
 support
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
X-List-Received-Date: Fri, 15 Mar 2019 13:17:27 -0000

This is the 5th version of the patch set, based on the Jim's previous work,
     http://lists.nongnu.org/archive/html/qemu-riscv/2019-02/msg00059.html

    v4 -> v5:
       - rebase 7074ab1
       - update the register xml files to gdb 8.3 
       - refine the fpu control registers, fflags/frm/fcsr index calculation
       - fix the csr offset calculcation because of tne regnum field in fpu
         xml file introducing one useless number

Jim Wilson (5):
  RISC-V: Add 32-bit gdb xml files.
  RISC-V: Add 64-bit gdb xml files.
  RISC-V: Fixes to CSR_* register macros.
  RISC-V: Add debug support for accessing CSRs.
  RISC-V: Add hooks to use the gdb xml files.

 configure                   |   2 +
 gdb-xml/riscv-32bit-cpu.xml |  47 ++++++
 gdb-xml/riscv-32bit-csr.xml | 250 +++++++++++++++++++++++++++++++
 gdb-xml/riscv-32bit-fpu.xml |  50 +++++++
 gdb-xml/riscv-64bit-cpu.xml |  47 ++++++
 gdb-xml/riscv-64bit-csr.xml | 250 +++++++++++++++++++++++++++++++
 gdb-xml/riscv-64bit-fpu.xml |  56 +++++++
 target/riscv/cpu.c          |   9 +-
 target/riscv/cpu.h          |   7 +
 target/riscv/cpu_bits.h     |  35 ++++-
 target/riscv/csr.c          |  32 +++-
 target/riscv/gdbstub.c      | 350 ++++++++++++++++++++++++++++++++++++++++++--
 12 files changed, 1114 insertions(+), 21 deletions(-)
 create mode 100644 gdb-xml/riscv-32bit-cpu.xml
 create mode 100644 gdb-xml/riscv-32bit-csr.xml
 create mode 100644 gdb-xml/riscv-32bit-fpu.xml
 create mode 100644 gdb-xml/riscv-64bit-cpu.xml
 create mode 100644 gdb-xml/riscv-64bit-csr.xml
 create mode 100644 gdb-xml/riscv-64bit-fpu.xml

-- 
2.7.4


