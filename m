Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1joo72-00013b-7K
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jun 2020 09:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1joo71-00013M-1z
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2020 09:09:47 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1joo6z-0005oE-FE
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2020 09:09:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id q5so9444719wru.6
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2020 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=Lzo8DF7L2AGCx7xKZv/HuEOUiEGp1DIK+PvRtQEFOt8=;
 b=RBZt9Afj807Cc5HkgzxYiqe8C5WIqAysBMjL/HhhGFPHSHUfGEX21ndTAmiUjdHz7H
 xRVwzEsCFpMUnJAQbYoaK5hqtKZbJ+7wYiaVpKVrH7MSuK2wSszq8O6qERGhRjOpnkp3
 ALJMYLWSVptczqKPdaMjZBQOYPb2Z6TL0d5nC34F4MuW22XJOezCQP5GEQe8OOV8Dkhx
 yU+PKJrqPyzKAJoVO8HGiAKRDVDMdvn0GR7oF5s4OslWG4vaWnlTTdBJn673J4m/ZSwv
 9BDi9OgeBTY5UCUdgE+Lvvc4sHXMF9KundRZBs00JOE2FuZPb2szxERsBFSA1NFKV/xN
 lKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=Lzo8DF7L2AGCx7xKZv/HuEOUiEGp1DIK+PvRtQEFOt8=;
 b=UZVCeCAT2tRVDmWdm3ebXPSvPzfQrk8zXlxKBOKDYQs27RgDNuCW7yCFNcOhGR8wUw
 Ju7YNfWwSUk3I4ncgN42jnczaP20Y32G4u2XFiw4Ozl0cn2pokbddk0VcPZRuVNEj+7k
 IEReKy19Tw3BqPKAJX0MHddpFG7KOeRr1ZKAJJF/SXDkmZTNLNJXUBMqmOe1RlmdVx83
 fnu10WhrtHprwTom9sW2cknH0CT3SCMGc/HDkWX6sHiD9d0O0kmipRXfqvTIH3yvt+0s
 A9TWY/atRQPof1HQLwAR5pNGvLELVmaeZmNThlKfwah8KO1j7XQCJ5heTbcAaMnUOpjm
 ymbw==
X-Gm-Message-State: AOAM532NrZIem2CTJlyDhRhXd3OuEvVUYJHWaZNJ9P3rGXR2OAV95sfk
 A5sUhWztpBY9g9jE/lZ++es=
X-Google-Smtp-Source: ABdhPJyBg4sNgrZYmDHM82xfbgHqUwZEpj0RbFS5z6fTbg6wg3/LmOVAyl3uuK04LuS8ibNPa228OA==
X-Received: by 2002:adf:f984:: with SMTP id f4mr3666834wrr.221.1593176983857; 
 Fri, 26 Jun 2020 06:09:43 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 185sm17590332wmz.22.2020.06.26.06.09.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 26 Jun 2020 06:09:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
Subject: [PATCH] MAINTAINERS: Add an entry for OpenSBI firmware
Date: Fri, 26 Jun 2020 06:09:33 -0700
Message-Id: <1593176973-27858-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x441.google.com
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
X-List-Received-Date: Fri, 26 Jun 2020 13:09:47 -0000

List me as the maintainer for OpenSBI firmware related files.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b40446..b0e2dd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2609,6 +2609,13 @@ F: tests/uefi-test-tools/
 F: .gitlab-ci.d/edk2.yml
 F: .gitlab-ci.d/edk2/
 
+OpenSBI Firmware
+M: Bin Meng <bmeng.cn@gmail.com>
+S: Supported
+F: pc-bios/opensbi-*
+F: .gitlab-ci.d/opensbi.yml
+F: .gitlab-ci.d/opensbi/
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.7.4


