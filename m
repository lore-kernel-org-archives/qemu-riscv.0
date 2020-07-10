Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtlE5-0004ta-6p
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 01:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtlE2-0004mI-Gz; Fri, 10 Jul 2020 01:05:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtlE1-0006KN-0v; Fri, 10 Jul 2020 01:05:30 -0400
Received: by mail-pl1-x644.google.com with SMTP id o1so1773066plk.1;
 Thu, 09 Jul 2020 22:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j+udS6smruZZnJUBuw/LVlrj3jLg62lb2FZOqluq88M=;
 b=EqoSyAnZ6mcdCHQEmpadgX5UrK6dfHStecNw9g/crSNJV+HmHT0j+9C6A+axxliUgh
 QqSfXc44Q7JuPrA9toDxWaVMksXtnADMTiA7zPWlV6dtLnkqc+E83mJBjJxrzJSZZaMH
 hjQaO/BFesAt1+dmZSr5KiLyz6rZr8/7XqLFOLvgqP5INbVQVpdN4uPNC4fhhE2TkU6X
 GBYFpbp3k6jSZzJMuPP+66UkpQIkdkC1xz2lIR2tqDIDYjI/SJ+tGzrvb5EKybsTXBt+
 JyUtAkE7MYB/uSlubu2pzo9QqOyCAG6pmyaND6/MMcHj9uzhBiXPIJBS27XxFIhPQ90t
 8QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j+udS6smruZZnJUBuw/LVlrj3jLg62lb2FZOqluq88M=;
 b=k0+9PdXIIYEBhaVbPahytWtePI9eY3UhD81W9RdF7aKejKf1omzgGxoohj6XXpldtj
 XNqMWGT6jTMgrQWG6AmGU7EU90qr71Nm+KNG0od5T2YlTdsIcpjQI2g7UFAzy74Eo6ri
 lMj79Wresy70e+hBX8q3CjtkJG3Fc8TqSj/0J+WuqEnNsMm3KqUzidCUZQmz4op/s1wf
 iomAkRXWhysndtJhPk6Hg9lD/Vr/uYrnklRQdvO+WDCPLmZ09BPf4vHZ90hZa9iYr2LH
 y/yim4WdF6nd2GvfNWhVOnz0PGOw8S2/dxnHK7yEPumNh7e2NLx9mhvpdQy1nqPd4CEF
 0uFQ==
X-Gm-Message-State: AOAM533Bo+EvGfaGlZEdlbe4cVKeL2bcjrjJsdkKM0dh07G2D47d8xK4
 4qprWiOo95FBZjXAatov0/Q=
X-Google-Smtp-Source: ABdhPJwHyGByNx9LpPNvLGAqkEwOT/cP6mAJTEzMyHZ0Xvc6i0332B479Phmr2QdKdWjWrYwdH1Cjw==
X-Received: by 2002:a17:90a:764c:: with SMTP id
 s12mr3715887pjl.201.1594357527303; 
 Thu, 09 Jul 2020 22:05:27 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id g30sm4659175pfq.189.2020.07.09.22.05.26
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 09 Jul 2020 22:05:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 7/7] Makefile: Ship the generic platform bios images for
 RISC-V
Date: Thu,  9 Jul 2020 22:04:59 -0700
Message-Id: <1594357499-29068-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
References: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 10 Jul 2020 05:05:31 -0000

From: Bin Meng <bin.meng@windriver.com>

Update the install blob list to include the generic platform
fw_dynamic bios images.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v3)

Changes in v3:
- change fw_jump to fw_dynamic in the Makefile

Changes in v2:
- new patch: Makefile: Ship the generic platform bios images for RISC-V

 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f06b3ae..05e05bb 100644
--- a/Makefile
+++ b/Makefile
@@ -840,7 +840,9 @@ palcode-clipper \
 u-boot.e500 u-boot-sam460-20100605.bin \
 qemu_vga.ndrv \
 edk2-licenses.txt \
-hppa-firmware.img
+hppa-firmware.img \
+opensbi-riscv32-generic-fw_dynamic.bin opensbi-riscv32-generic-fw_dynamic.elf \
+opensbi-riscv64-generic-fw_dynamic.bin opensbi-riscv64-generic-fw_dynamic.elf
 
 
 DESCS=50-edk2-i386-secure.json 50-edk2-x86_64-secure.json \
-- 
2.7.4


