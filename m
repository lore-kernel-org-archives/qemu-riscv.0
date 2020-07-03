Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrCDT-0007qZ-5Z
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 23:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDQ-0007nK-Rh; Thu, 02 Jul 2020 23:18:16 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDP-0005wj-As; Thu, 02 Jul 2020 23:18:16 -0400
Received: by mail-pj1-x1042.google.com with SMTP id l6so10192200pjq.1;
 Thu, 02 Jul 2020 20:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MR/gWgAj3pL+P4w5ojuXdVPBdgjs03S97yv0YUeQIvI=;
 b=TuzzTyLKq/5BSk0uPC76K16HyUgc3uEmyX969zGj77KhnNsKrGiVKJw22keWIIgMy3
 gyhyEG6+oqToedJUA1dyGEIrY913mQqK8GEuyh8NJWRQfM6js6zM/3mPgLLU1hWqslCg
 ER+eZvfzhImGedFsvuHp5V+2BMEhVmSvuhJC4o9kwP3wRVFsxPwKWS/RfJA/Kg2SI08I
 /BpOVVHMxHF+hz7Ws+ILot6qYdOmsv3nCHYQCeNb0UonnDQP5Tf35lGptbGZroZPYN3y
 BNQ+ZZ4R19nnMgBTlL/p97YuZosoCv+tKdEIDzP95q53KUDsHCn2z5vIzuSaM6cLPXht
 R80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MR/gWgAj3pL+P4w5ojuXdVPBdgjs03S97yv0YUeQIvI=;
 b=EOymcStPDD/NDtoA1oRT3TwMiAfK8h0x9bzDVJ3oSpdpDpi7E3ewcaDiRCdZ25SlyR
 1/XzqotfhSFJY9yYeQwINNMAmecQbIZl9XNm0TpCPAulbie3f+ll5s/mxjoX+FMpnfwV
 9Bfx/hxZ/cocQpM/LM3dNa3aOXtKijvfevSOiGdzRYAoZrF5iSrLOzeqwAL3ptXYgUEa
 c5r40tzZLz6UsR6L2VixhlHV490bUryl0cieSjyjwskYBh8Lat1wUdm/JB+ah/9aFwjb
 PUcie8XiE4LUI+5y31DiUmFWGKXYdLsICiL2B0UWbEtijrV+XVyGZ/+q6vQazLEdYIjA
 0jgw==
X-Gm-Message-State: AOAM533barn6e64ddKniA0vhCx/Nux6KgOJByVmkxlbU2k4wRkEWskrG
 GvGZz2qm27frFEvcMvFzb6XJExrg
X-Google-Smtp-Source: ABdhPJwWzVB7WdRcva4mR/F9k40b+arrIk5L/8c/8vQ1klNn0g3yguD2ZgU8k7OLJ5I541Wq02iLmw==
X-Received: by 2002:a17:902:bd46:: with SMTP id
 b6mr29180837plx.287.1593746293852; 
 Thu, 02 Jul 2020 20:18:13 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id c12sm10165745pfn.162.2020.07.02.20.18.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 02 Jul 2020 20:18:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup@brainfault.org>,
	Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 1/7] configure: Create symbolic links for pc-bios/*.elf
 files
Date: Thu,  2 Jul 2020 20:18:01 -0700
Message-Id: <1593746287-19251-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 03 Jul 2020 03:18:17 -0000

From: Bin Meng <bin.meng@windriver.com>

Now we need to ship the OpenSBI fw_dynamic.elf image for the
RISC-V Spike machine, it requires us to create symbolic links
for pc-bios/*.elf files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
- new patch: configure: Create symbolic links for pc-bios/*.elf files

 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 8a65240..75b855d 100755
--- a/configure
+++ b/configure
@@ -8501,6 +8501,7 @@ LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 for bios_file in \
     $source_path/pc-bios/*.bin \
+    $source_path/pc-bios/*.elf \
     $source_path/pc-bios/*.lid \
     $source_path/pc-bios/*.rom \
     $source_path/pc-bios/*.dtb \
-- 
2.7.4


