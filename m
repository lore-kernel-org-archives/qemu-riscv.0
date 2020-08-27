Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBCcg-0000OY-LY
	for mharc-qemu-riscv@gnu.org; Thu, 27 Aug 2020 03:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kBCcf-0000OI-E0
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2020 03:47:01 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kBCcd-0008GW-Du
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2020 03:47:00 -0400
Received: by mail-pg1-x544.google.com with SMTP id 31so2743445pgy.13
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2020 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tCr3MMz6st5pg7fucz/AcR5Oj9EdPXcjCi4JOTZ6F2Q=;
 b=bj0PEdpxz/nWbCxiAeul7HQ1/lsUfuD8QpatFHPyBv6Zn2cpRFNJZ4XBJ0hKyNMdzN
 NjOmwsSqYaQgtvsmUPKzjAmUFDOelxaUJFqYMRXcIdGwC+tJO+DTVFIFV66nnDFCD35X
 yIGvgZU2BS0ENXv1OPlxq7JayQPXyXYFcRWfjZboIFoOiCTjERCpFQvrxoD1540tGPj6
 T8cDBNrIrXoTFzbsQlybNpGlEjSXMxAhoTnnz7gG2dZJp7coFuReS768FytrR7JKTpYo
 28JDaLAa3C6s2sdXoksqhUHFBIYeFk81PCn4OL4dCEl1gBsLFjQ/K/DJicvuO99LOfEz
 cbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tCr3MMz6st5pg7fucz/AcR5Oj9EdPXcjCi4JOTZ6F2Q=;
 b=ts5UeJtMaPGGaVFvBNkkWviR8W00v6Tl6N0Vy7M0L9o6wmRiAP5J3DeGnE8UWZGzsg
 MLzky3jZ3ZGi5ZFStkKGYYsmleYuYp+Y7T6JiGu0mBpI+CMWlqCOoE+kQkFKF1Mwwt2a
 9OvCWmi3ZRoGp00Y0EDXBjEPuGixNAiM52bYB/J5J85RR10RM/UsCgt472BomSIfuxDx
 8Pc1S5BF0BUAZoZdVSlsye5DjUGbumxgiwRxqxOgLX7Kcx4Vjs9gpe/kYAG/Q1GzDQPC
 SO9AsW7YXqF+3kHirnFhXlixP86/eUp8LyIowIj4YFctt6JtDiiUcNtmNsnjA/rL9EG8
 uC1w==
X-Gm-Message-State: AOAM533igA5bspSKhmsPyee+pi69rq3sy3m3omy8WNgiorqqT3uVUeJK
 NSPBkuuoSHei9hOWUvuE9+dA4A==
X-Google-Smtp-Source: ABdhPJz5szXl7s00S2z+aa2/eIJyKmsaLkhDM4obxn1GIcxgyWIAxE7sfhIWOyZi7X/dYAhjYXvfWg==
X-Received: by 2002:a17:902:a50d:: with SMTP id
 s13mr15108246plq.135.1598514417375; 
 Thu, 27 Aug 2020 00:46:57 -0700 (PDT)
Received: from localhost.localdomain (111-241-121-209.dynamic-ip.hinet.net.
 [111.241.121.209])
 by smtp.gmail.com with ESMTPSA id k17sm431032pfg.99.2020.08.27.00.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 00:46:56 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v4 0/2] Add file-backed and write-once features to OTP
Date: Thu, 27 Aug 2020 15:46:36 +0800
Message-Id: <20200827074638.21451-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=green.wan@sifive.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 27 Aug 2020 07:47:01 -0000

Based RFC v3 to fix:
 - Fix all nits-related
 - Use blk for blk_by_legacy_dinfo(dinfo) 
 - Move SET_WRITTEN_BIT out from else branch

Summary of Patches
 - First patch is to add file-backed implementation to allow users to use
   '-drive' to assign an OTP raw image file. OTP image file must be bigger
   than 16K.

       For example, '-drive if=none,format=raw,file=otp.img'

 - Second patch is to add 'write-once' feature to block second write to
   the OTP memory. Only keep the 'written' state for non-control register
   range from 0x38 to 16KB.

Testing
 - Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add backend drive support
  hw/riscv: sifive_u: Add write-once protection

 hw/riscv/sifive_u_otp.c         | 71 +++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  3 ++
 2 files changed, 74 insertions(+)

-- 
2.17.1


