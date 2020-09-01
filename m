Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD8Vb-0002B3-Ak
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 11:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD8VZ-00026J-4G
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 11:47:41 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD8VX-00026F-31
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 11:47:40 -0400
Received: by mail-pl1-x642.google.com with SMTP id h2so738523plr.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2020 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ZDsCNyj6WhZAOI4rsJioOTLR6n+cb2uPbSrQX9rvh4Y=;
 b=Rq+2qMsY7ox6cgTOMCLe8fsuOhoyDlCEdJodfaSg8cuI+uG1QAlrDFT9RqKiIqncgH
 AWIQPN2F48bvC18Yjm8EXKKttd1VPuzf/Bn4Dcqo0CkyglpbyTjuNob42L8oIuWPOql/
 9fnbQAOdfp+MXL36LkbtPBXLf9TtV1ttdd2ClmbTlZe2Q+pDNyMyx3czw6z+La7RrHuj
 1e2vcodwpIoLipygFrd68Zo89U5nn3eJ2YcCO3t4ocpx0FQxnwPuU1ehZRUwSclF9Pey
 X1t7Gows7fcEU8qqFCGa/8MPrMecvSdPP5Xrfutx6svZD6h7csDmnHHpBOl9YEfFHUBi
 s19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZDsCNyj6WhZAOI4rsJioOTLR6n+cb2uPbSrQX9rvh4Y=;
 b=VKu5HBQjkVvQ2S9YC5iXiFXrWdLjMHORfrnpdrqPezvLgDiF1Leqqu0+VjkUs27lAH
 aeFHDTh4JpcZC/bAhvTCondorzquTcNQOagf9yBiWE8vHVADjCx3vU3xGYD6wbIYlh8v
 te+bkI0nA0+pX8toNszRMQztEJZELY9f43YENahneU4InA7DTG2n/iDbHazYI4KaBYse
 DEhOZNiqgFwgAVzObRuk0OgCuM/D3mWIWOYfiRT1I7qsFeYgReK7udLjuCPS5LblDJZk
 0K1CMKVpSxhGMLCUCuERbjmrXdnvrOtQfULpaXqTSwVnorKNrwUiTmLgC0s6KZmQxR0E
 egFw==
X-Gm-Message-State: AOAM533LQdwoJOfMmuIDOOrBX0i9pZ4oBJhHtK7Ze/2n/y5H8zPY/d2A
 1nRegiNpvsSXo1E7R9osq6jN6A==
X-Google-Smtp-Source: ABdhPJwpxAj4plms/efop/+9Zf8UwUqvxO8y9Diwu3+gsjM0KlBvjIm6imUgbmkBZAjTL7D+QXbC+A==
X-Received: by 2002:a17:90b:34e:: with SMTP id
 fh14mr2196202pjb.186.1598975257318; 
 Tue, 01 Sep 2020 08:47:37 -0700 (PDT)
Received: from localhost.localdomain (111-241-104-82.dynamic-ip.hinet.net.
 [111.241.104.82])
 by smtp.gmail.com with ESMTPSA id e17sm2485344pfm.60.2020.09.01.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:47:36 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v5 0/2] Add file-backed and write-once features to OTP
Date: Tue,  1 Sep 2020 23:47:09 +0800
Message-Id: <20200901154711.18457-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 01 Sep 2020 15:47:41 -0000

Based RFC v4 to fix:
 - Change the patch order
 - Add write operation to update pdin to fuse[] bit by bit 
 - Fix wrong protection for offset 0x0~0x38
 - Add SIFIVE_U_OTP_PWE_EN definition
 - Refine access macro for fuse[] and fuse_wo[]

Summary of Patches 
 - First patch is to add write opertion to update pdin data to fuse[] bit
   by bit. Add 'write-once' feature to block second write to same bit of
   the OTP memory.

 - Second patch is to add file-backed implementation to allow users to use
   '-drive' to assign an OTP raw image file. OTP image file must be bigger
   than 16K.

       For example, '-drive if=none,format=raw,file=otp.img'

Testing
 - Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add write operation and write-once protection
  hw/riscv: sifive_u: Add backend drive support

 hw/riscv/sifive_u_otp.c         | 80 ++++++++++++++++++++++++++++++++-
 include/hw/riscv/sifive_u_otp.h |  5 +++
 2 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.17.1


