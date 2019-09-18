Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsV-0007CC-0h
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsP-00074O-Ve
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsO-0006nD-L9
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:17 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:32809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsO-0006mZ-CW
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:16 -0400
Received: by mail-pf1-f181.google.com with SMTP id q10so229640pfl.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0zhLpxGbfvJYXKDT6JDUoSPfFak+q70sNluuZCqQPHw=;
 b=tDYWeGlqm/tplVFBiANw3aPdntduYfzfaiCPX5xjxEwSqVhL6S0X4cWd6I0PLZY9iS
 UXOpcxFdPkkl3sb6Ci+fPjbuRlp9JudwgNsVGia0FJqP0qXwEeO/wFvMVdZst4s95Vhu
 LLi3CK9NPBVX65YHCMYaT75Ib1XYp9DPDR3fI3pE36J6jzY7QKpTBN271LB64NFnAlag
 O95nBoUeJtPw53pSSZn6XLK73ugN7DaxY5Z1+tUXlPoqPcB/x46J3VmSeuPDCVnKh5Q5
 px5sQ2WRPLNx3f6wZvieShMLP86UlAl2s2sCCXam6Ys6ZJ079FfT9OSltZx1i0DI5snI
 raow==
X-Gm-Message-State: APjAAAVWUpF74JVLu+Xq/sYObvV84AR4fsBRfyTWYTL/kkp+xFsC8dd2
 hwEEV8y7Gt9HbU68R2G5FC46EdtU3qE=
X-Google-Smtp-Source: APXvYqx8ajtS3KPqIVO6RFPZoVwoWoaFGkzftQs0B4mggERLuOWo/9GwVttFWHfMKI+VsHN/QQNKUg==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr4497385pgs.445.1568820494753; 
 Wed, 18 Sep 2019 08:28:14 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f22sm5512651pgb.4.2019.09.18.08.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:13 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:13 -0700
Message-Id: <20190918145640.17349-22-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.181
Subject: [Qemu-riscv] [PULL 21/48] riscv: roms: Remove executable attribute
 of opensbi images
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:21 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Like other binary files, the executable attribute of opensbi images
should not be set.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
old mode 100755
new mode 100644
-- 
2.21.0


