Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUiTA-00011G-Q9
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 23:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUiT9-00010t-NR
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 23:37:51 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUiT7-0005qN-Hy
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 23:37:51 -0400
Received: by mail-pl1-x641.google.com with SMTP id r10so260956plx.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 20:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ZH52s4LoHThXm6aIFtR0f0FaXqffjPFa8rABq7nj/Uk=;
 b=cS0Ktl5TWXmMWZVvaYn5n2sDutfxVZhlLZ2czC4Zkppu112IpRP6k0dG26E611d4br
 bqfRYr1+/HO9Wn5MGqoHq3CVVLf7mvPixTVmzj/1ssak+A+/47zHceaA5Q4I1aiDvOPY
 hjOH7BoZkvkySPgRdflIxGhFavhYufS1lsAt5roRJZj/ErFgzdOMEC6sm4M04S1Pg/5s
 9taX/W6pE6lFCONrpbf8gKKP5WuWHlDP8bjkDP/Ci5X65+h7DjGs9otbOKPqgeLP3imf
 vJ/KKOtIvaN8XH19ifWAAS9dXikOWFbl0aFqvtjyqfVggtYTlYITnvi69uwjqSNu3PxY
 V4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZH52s4LoHThXm6aIFtR0f0FaXqffjPFa8rABq7nj/Uk=;
 b=EwuzMHCWoLll4X8phXPf+3OdQ3ok846v8Z8f3Wd/fZW2SvTMxAmDl3nDdCejCTEp31
 iht323fo8639vmJUD20tsuiZjYNrDEjzg2tOoAKAlizlagicS74n9xUVtyYMa7O5Kh82
 Daz5uP4X4lebrBnGTq8BRIJs8hxKaa+WJaF9zebeSMIGp5OAzU+ZfAHGSngV6w5P63B8
 PHzbZxbfT79uddusdMZ6WxZdGFp1o9RUSWUZABZzkfRr0FADD68GNqg//fRXQJl+HQgU
 y+jMdnrlM28NOPspjuIt4mWRtPc0AFML9SMUhpA6uCuM+Ppp0JOaGBfhzeosEnJHN08o
 Luxw==
X-Gm-Message-State: AOAM533n+V6ufJaZ3RxP7a2S1vtb6vgbgXoIWM/JUChvmOmpu/EgqLYG
 UP8IL15DOl9wBgpkJbDFujJmFA==
X-Google-Smtp-Source: ABdhPJxboW/xRRdIPx9Ir3v6PW2AUYjj3duKHKeSh3Q/wv8Ebp1w1LEYQhjz6EPczTeBLA6ZHSCKSQ==
X-Received: by 2002:a17:90a:2e06:: with SMTP id
 q6mr1035674pjd.46.1603165068043; 
 Mon, 19 Oct 2020 20:37:48 -0700 (PDT)
Received: from localhost.localdomain (111-243-184-51.dynamic-ip.hinet.net.
 [111.243.184.51])
 by smtp.gmail.com with ESMTPSA id gd14sm260489pjb.31.2020.10.19.20.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 20:37:47 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, green.wan@sifive.com
Subject: [PATCH v8 0/2] Add file-backed and write-once features to OTP
Date: Tue, 20 Oct 2020 11:37:30 +0800
Message-Id: <20201020033732.12921-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=green.wan@sifive.com; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Tue, 20 Oct 2020 03:37:51 -0000

patch [1/2] - add write function and wrire-once feature
patch [2/2] - add file backend support

Test Steps: (should work even only 1/2 is applied)
 1) Follow instructions to prepare fw_payload - https://github.com/riscv/opensbi/blob/master/docs/platform/sifive_fu540.md
    a) build 1-round opensbi
       $ cd opensbi
       $ OBJCOPY=riscv64-buildroot-linux-gnu-objcopy \
       LD=riscv64-buildroot-linux-gnu-ld \
       CC=riscv64-buildroot-linux-gnu-gcc \
       make PLATFORM=sifive/fu540
    b) build u-boot
       # Make sure the 'CONFIG_SIFIVE_OTP=y' is set
       $ cd u-boot
       $ OPENSBI=/xxx/opensbi/build/platform/sifive/fu540/firmware/fw_dynamic.bin \
       ARCH=riscv \
       CROSS_COMPILE=riscv64-buildroot-linux-gnu- \
       make
    c) generate fw_payload.elf
       $ cd opensbi
       $ OBJCOPY=riscv64-buildroot-linux-gnu-objcopy \
       LD=riscv64-buildroot-linux-gnu-ld \
       CC=riscv64-buildroot-linux-gnu-gcc \
       make PLATFORM=sifive/fu540 FW_PAYLOAD_PATH=/xxx/u-boot/u-boot.bin
 2) Apply uboot test patch - http://patchwork.ozlabs.org/project/uboot/patch/1602657292-82815-1-git-send-email-bmeng.cn@gmail.com/
    Rebuild u-boot and fw_payload.elf
 3) Generate empty otp image. (skip this if only 1/2 is applied.)
    $ dd if=/dev/zero of=./otp.img bs=1k count=16
 4) run qemu with fw_payload.elf
    $ qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none \
      -kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf \
      -d guest_errors -drive if=none,format=raw,file=otp.img 
 5) (uboot otp driver should do some read/write already) Run read/write in u-boot

# dump mem before test
=> md 80200000 10
80200000: 84ae822a 00061297 7642b283 10529073    *.........Bvs.R.
80200010: 10401073 031b52c1 13134010 71330153    s.@..R...@..S.3q
80200020: 850a0053 28c0b0ef 812a81aa 00062297    S......(..*.."..
80200030: 94c2b283 a92f4905 16630862 22970209    .....I/.b.c...."
=> md 80400000 10
80400000: 00000000 00000000 00000000 00000000    ................
80400010: 00000000 00000000 00000000 00000000    ................
80400020: 00000000 00000000 00000000 00000000    ................
80400030: 00000000 00000000 00000000 00000000    ................

# check read function and see if serial is set
=> misc read  otp@10070000 3f0 80400000 10
=> md 80400000 10
80400000: 00000001 fffffffe 00000000 00000000    ................
80400010: 00000000 00000000 00000000 00000000    ................
80400020: 00000000 00000000 00000000 00000000    ................
80400030: 00000000 00000000 00000000 00000000    ................

# check write function
=> misc write otp@10070000 0 80200000 10
=> misc read  otp@10070000 0 80400000 10
=> md 80400000 10
80400000: 84ae822a 00061297 7642b283 10529073    *.........Bvs.R.
80400010: 00000000 00000000 00000000 00000000    ................
80400020: 00000000 00000000 00000000 00000000    ................
80400030: 00000000 00000000 00000000 00000000    ................
=>

Changelogs:
v6 to v7:
 - Rebase to the latest and move debug message patch
   from patch [2/2] to [1/2]
 - Remove RFC tag and add credit

v6 to v7:
 - Fix bug in MACRO, SET_FUSEARRAY_BIT.
 - Add serial initialization in sifive_u_otp_reset().
 - revise write-once error message.

v5 to v6:
 - Rebase to latest. (sifive_u_otp.* are moved to hw/misc)
 - Put the example command to commit message.
 - Refine errp handle when check backend drive.
 - Remove unnecessary debug message.

v4 to v5:
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
  hw/misc/sifive_u_otp: Add write function and write-once protection
  hw/misc/sifive_u_otp: Add backend drive support

 hw/misc/sifive_u_otp.c         | 95 +++++++++++++++++++++++++++++++++-
 include/hw/misc/sifive_u_otp.h |  5 ++
 2 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.17.1


