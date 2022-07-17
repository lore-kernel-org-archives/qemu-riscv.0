Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oD1Jk-0000aQ-9n
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 06:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1oD1Ja-0000Tt-7H; Sun, 17 Jul 2022 06:15:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1oD1JY-00031E-Rz; Sun, 17 Jul 2022 06:15:53 -0400
Received: by mail-ed1-x52d.google.com with SMTP id y8so11694756eda.3;
 Sun, 17 Jul 2022 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hw+mvHDpYJcTlOtg6FeFGsqdN8Va6xPaad2AgEpijDY=;
 b=RxOfIIBcghwUIldZxV2vDClAu6LJLtPBgrK2oukQEdsFiuINMA5bfm0hox92gBeEC7
 dHINIqPebXWrIRKb0aeFHquqS3ydModTlXbQ385HHSVsjE5PJ2r2kmaUSqoyjlsa3rdG
 bXBpwZTNL34ThVD2urAb4rbZpw8AsSLuss3Y36wa9/rX9iNgX9UjIZQHXdh7vxFTUzX/
 yvhnK/AF4Jayaady9i7ElCK7e147mciqG5Cg08UDVW3IBEWUx3m5iNN1yiFYgV4WyCGE
 WRph6ej2kmKU4A+CgOMAGYFvVbAvTfVu7BWQe1Y8rSBwUwkPYm4v02RDlH21IB3mNQS8
 QqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hw+mvHDpYJcTlOtg6FeFGsqdN8Va6xPaad2AgEpijDY=;
 b=FB4arJ5K1v6HQHOSoAdO9uvVcGi98Le5eambcXcNpiwQuw2mtMC8JITbp029cv2cmo
 EPu+zGyK7NtHVFYJBJ/LZqfYtblQwfnnatqtjc2gmtRkarVbXLqszzhkTsGvRAb65PFy
 w3OyGr8d9g+7KZa1tnjO7Fihlb7inuPudm6gXSuSjAe/m3hdRVBxYs5AWGetwuhpFiSj
 ZqvDCQRwsatPu1EQURKAijLao1j8Yt/cV1kQzMQrCwtNKvgy+HYW0GGELt8TCKBuoTsq
 pDox7o81VylOB6MvqWX15IHnDQKzivl/53bZs+xlxvVLdhsWuBED90zoiWSLgt4odZ5F
 mpvQ==
X-Gm-Message-State: AJIora/URXE4FOzZ8VwRLXhTA3+HsluC8fi/hGh32eOIUcjAQU6RMzqn
 qYLoSiee0Mw+abJE3ckK0y8=
X-Google-Smtp-Source: AGRyM1sDn/52eyhAH38SHqCDD5o2CM/V48EFis1rR0LjTOzK4zKAalEF/wnKh8FPLS7gx0l9kfMryQ==
X-Received: by 2002:a05:6402:3705:b0:43a:214b:5f40 with SMTP id
 ek5-20020a056402370500b0043a214b5f40mr29930616edb.83.1658052949240; 
 Sun, 17 Jul 2022 03:15:49 -0700 (PDT)
Received: from neptune.lab ([81.200.11.194])
 by smtp.googlemail.com with ESMTPSA id
 g21-20020a1709061e1500b00722f8d02928sm4249421ejj.174.2022.07.17.03.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 03:15:47 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 0/1] Fix pointer masking functionality for RISC-V
Date: Sun, 17 Jul 2022 13:15:42 +0300
Message-Id: <20220717101543.478533-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jul 2022 10:15:55 -0000

From: Alexey Baturo <baturo.alexey@gmail.com>

Hi,

This patch fixes a typo which leads to broken pointer masking functionality for RISC-V.
Thanks.

Alexey Baturo (1):
  target/riscv: Fix typo and restore Pointer Masking functionality for
    RISC-V

 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2


