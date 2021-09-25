Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU7or-0005cn-UZ
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 09:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7om-0005c7-5F; Sat, 25 Sep 2021 09:34:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7oh-000074-GJ; Sat, 25 Sep 2021 09:34:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id t8so36107015wrq.4;
 Sat, 25 Sep 2021 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxIvN1sm/QOHD81rd2JwPq3WboHg6osLV6cY3/MSovY=;
 b=WlRCqNgyw3t0Yd0/qYbu7m1MrWC7f23ms++c6WClgjq6dv++SSkIOgBfuGiMkv/r5s
 7BM2SIwwyzmyxZocEbtqWdWZaXMyvDXJtQYaCohoqBGDRIh3dkdHx+kw5jVBHgCKXJUK
 UCLgKyI0BaTNjBrdoD0ErRHZnAv5zVUkQOp0D6xv6sUCG2ijK5pf+IH/cb1R/9kmDDpI
 x6jTfCaZFAhTKo1TmojWcqxWQXmQxbwn1/5YR9+7nAhsbekj970YZrQmWKFsz+3dJllv
 TyFXWHd72mJUR1sI6h3AA24OB2VG4Rxuz1c1xYZI8BB1U/g9o+kQ5CwemSq4KOL+Yzr4
 2feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TxIvN1sm/QOHD81rd2JwPq3WboHg6osLV6cY3/MSovY=;
 b=PFVGIywjk7mS4VulsUKCcJsSwL0MKX7roid876zaq/fuV6Asq2aDkJ6BnUkBf5/rQN
 aSSlDKNAPx/xIbn7qpXGh+hExO8e4JSRDx5/Ch8xx/+lDtmuau+Q6BO3CbN2Rz69C5E+
 A4roFnluU0vq1O1gl9U4KRrd+W18fPsXOR0/AsZIcRPcsGW0j0IjpObemnkbLGMzuq5c
 2u8Tg9wcy/otTQSX9VYFe13Ul1tpUbD6fzd/+WWi+37rvwaF39zAmBsIzMoHGUWaWNpL
 l3qWgsmbujvLh0ls9EMslc7WyGVOWoVgH8Ng0rk30dE2hK7dYm+FpLgS8aLpysuHjQtG
 +jiw==
X-Gm-Message-State: AOAM531h+IHu5D7XbnjocNvCkilyRkaQSyRaUVJpwn17hPWGKIFSz11k
 Z8KGImXDufFFvLVrRTjBr9zf8FpFKdY=
X-Google-Smtp-Source: ABdhPJxm6OMzvwFohXjd2XvUsUYj11D0cnFq9y+sS899ao4rmyjebld0rlCQhPH4EV61IAdhuwOmiA==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr16891359wrt.57.1632576849303; 
 Sat, 25 Sep 2021 06:34:09 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k17sm11221212wrq.7.2021.09.25.06.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 06:34:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/3] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Date: Sat, 25 Sep 2021 15:34:04 +0200
Message-Id: <20210925133407.1259392-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Sep 2021 13:34:19 -0000

Hi,=0D
=0D
This series QOM'ify the PolarFire UART (the project=0D
would get ride of non-QOM devices).=0D
=0D
Since v1:=0D
- Simplify MCHP_PFSOC_MMUART_REG_SIZE=0D
- Use MemoryRegion container=0D
- Mention qdev_set_legacy_instance_id() is not needed (Bin)=0D
- Properly map the 16550 (Bin)=0D
- Add DeviceReset() method (Peter)=0D
- Add migration state (Peter)=0D
=0D
Tested with U-Boot v2021.07 following documentation in=0D
docs/system/riscv/microchip-icicle-kit.rst.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/char/mchp_pfsoc_mmuart: Simplify MCHP_PFSOC_MMUART_REG definition=0D
  hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion container=0D
  hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART=0D
=0D
 include/hw/char/mchp_pfsoc_mmuart.h |  17 ++--=0D
 hw/char/mchp_pfsoc_mmuart.c         | 126 ++++++++++++++++++++++------=0D
 2 files changed, 114 insertions(+), 29 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

