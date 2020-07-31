Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1L5P-0001HM-3W
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 22:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5N-0001GT-M6
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 22:47:53 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k1L5I-0003ok-9Y
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 22:47:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p1so16032596pls.4
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 19:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+Ve18ryrBZm3ej+tqfAtVJOqiNP/aMp/Y358iAXxN+0=;
 b=dEGoLJVSbnDcPNFN3SXrM/uIqIoTDom1kH8qo1a6HDcmgkakZv/yaoWwzSi0Tr9ytF
 ixgDBXopgFSDTw3BqPA/kK0rKvyatR40EThaFbKsvwtBReL6ls6iqsSiD5gVmaoIDjYr
 KpaAHRTtC1S0mf2ESlT0jNuFU1+SCJAprsaSiBTEvuemERtXkrmVdcbyi6NvwSSGR3OX
 eRjPh+nRqI3RuryUawhFKkybaeYK1QVOK9VEpdTKFv33QLM9NB/t1w15D/xqwsA/u/7K
 9hcgOGZ499jjSyBa7wgFpLyEgK8rvkI/2Ki3erXBgtQzmapHpOXWTZ+2c8IvQ72PMkfJ
 0VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+Ve18ryrBZm3ej+tqfAtVJOqiNP/aMp/Y358iAXxN+0=;
 b=nGHmHwmAYUP7iLg6fJdxGAm9R0FUEUrbIm9VGyiuTzSK3rKTOVRwuLrT2K1gSp3ZRV
 QUL2hqG8MLF5+bfRyZorPCVR9O0nqw4xKasWwPCsn+6d3KuKQW6e6vlvI9U7OBnwDBjc
 QUCSGNibyzfW2i8ij3zwfm7ZCS0fOKqpyto544UG12zRU1TJkoJL1HoL9Nsc/fIcVKsj
 ulcftpVnDCyo7sDywwhDz5KgtcMYwQzu4+z8vXppno8joB7zl+/GTa7nO7iiVdqD3EBh
 qphWeTTQQBDdCKq8IRaGz1LI7kOUhMX77M0g5Ezdfdj7P+nF0rAMothXeeCkwrLH5omp
 kyLA==
X-Gm-Message-State: AOAM533U6TvJVRQOfX8cWrEqhhEGkU/0tWhWSyZN8e3Yucdn9URf7eYr
 TibAR/kydv5oeoGt9Z+qURGzig==
X-Google-Smtp-Source: ABdhPJxlZirf0thx/sT37MRy0KAh5NyqL2F1ZtoVTK+20RG/ztp7QoYvSW5TLCQKuDYUGI0i6EPGpw==
X-Received: by 2002:aa7:83cf:: with SMTP id j15mr1643425pfn.251.1596163666047; 
 Thu, 30 Jul 2020 19:47:46 -0700 (PDT)
Received: from localhost.localdomain (111-243-189-249.dynamic-ip.hinet.net.
 [111.243.189.249])
 by smtp.gmail.com with ESMTPSA id c27sm7578483pfj.163.2020.07.30.19.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 19:47:45 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/2] Add write-once and file-backed features to OTP
Date: Fri, 31 Jul 2020 10:47:06 +0800
Message-Id: <20200731024708.32725-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 31 Jul 2020 02:47:53 -0000

First patch is to add file-backed implementation to allow users to assign
an OTP image file to machine. Users can assign the property, "otp-file",
to machine to enable it. File-backed feature is set to "NULL" string in
default. Any filename other than "NULL" is used as OTP image file.

For example, '-M sifive_u,otp-file="otp.img"'

To keep data up-to-date due to an unexpected crash or CTRL+a-x exit, every
read/write command to OTP memory involves file open, mmap and close
operation to the image file.

Second patch is to add 'write-once' feature to block second write to the
OTP memory. Only keep the 'written' state for non-control register range
from 0x38 to 16KB.

Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add file-backed OTP.
  hw/riscv: sifive_u: Add write-once protection.

 hw/riscv/sifive_u.c             |  26 ++++++++
 hw/riscv/sifive_u_otp.c         | 103 ++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u.h     |   2 +
 include/hw/riscv/sifive_u_otp.h |   2 +
 4 files changed, 133 insertions(+)

-- 
2.17.1


